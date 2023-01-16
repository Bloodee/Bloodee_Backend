const { PrismaClient } = require('@prisma/client')
const config = require("../config/auth.config");
const prisma = new PrismaClient()

var jwt = require("jsonwebtoken");
var bcrypt = require("bcryptjs");

// signup body :{
//     "username": "Tests",
//     "password": "123456789",
// }


exports.signup = (req, res) => {
    // check if username already exist
    prisma.users.findFirst({
        where: {
            username: req.body.username
        },
    }).then((user) => {
        if (user) {
            res.status(400).send({
                status: false,
                message: "Username already exist"
            })
        } else {
            var password = bcrypt.hashSync(req.body.password, 12);
            prisma.users.create({
                data: {
                    username: req.body.username,
                    password: password,
                    account_status: "active",
                }
            }).then((user) => {
                res.send({ user: user, status: true, message: "User created successfully" })
            })
        }
    })
}


// signin body :{
//     "username": "Tests",
//     "password" : "123456789"
// }
exports.signin = (req, res) => {
    // check if username already exist
    prisma.users.findFirst({
        select: {
            user_id: true,
            username: true,
            account_status: true,
            password: true,
            org_email: true,
            users_roles: {
                select: {
                    roles_lists: {
                        select: {
                            roles_permission: {
                                select: {
                                    permission_lists: {
                                        select: {
                                            permission_name: true
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        },
        where: {
            username: req.body.username
        },
    }).then((user) => {
        if (!user) {
            return res.status(200).send({ status: false, message: "User Not found." });
        }

        var passwordIsValid = bcrypt.compareSync(
            req.body.password,
            user.password
        );

        if (!passwordIsValid) {
            return res.status(200).send({
                status: false,
                message: "Invalid Password!",
            });
        }

        var token = jwt.sign({ id: user.user_id }, config.secret, {
            expiresIn: 604800, // 7 days
        });

        delete user.password;

        // join all user.users_roles.roles_lists.roles_permission.permission_lists
        var permission = [];
        user.users_roles.map((user_roles) => {
            user_roles.roles_lists.roles_permission.map((roles_permission) => {
                permission.push(roles_permission.permission_lists.permission_name)
            })
        })
        // remove duplicate permission
        permission = [...new Set(permission)];
        user.permission_list = permission;
        delete user.users_roles;

        res.status(200).send({
            status: true,
            message: "Login Success",
            token: token,
            user: user
        });
    })
}


