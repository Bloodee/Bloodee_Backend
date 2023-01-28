const { PrismaClient } = require('@prisma/client')
const config = require("../config/auth.config");
const prisma = new PrismaClient(
    {
        log: ['query', 'info', 'warn', 'error'],
    }
)

var jwt = require("jsonwebtoken");
var bcrypt = require("bcryptjs");

// signup body :{
//     "username": "Tests",
//     "password": "123456789",
// }


exports.signup = async (req, res) => {
    // check if username already exist
    const { username, password } = req.body;
    const user = await prisma.user.findFirst({
        where: {
            username: username
        }
    })

    if (user) {
        return res.status(200).send({ status: false, message: "Username already exist" });
    }
    else {
        // create user
        const user = await prisma.user.create({
            data: {
                username: username,
                password: bcrypt.hashSync(password, 8),
            }
        })
        res.status(200).send({
            status: true,
            message: "User created successfully",
            user: user
        })
    }
}

exports.signin = async (req, res) => {
    // check if username already exist
    const { username, password } = req.body;
    const user = await prisma.user.findFirst({
        where: {
            username: username
        }
    })
    if (user) {
        const passwordIsValid = bcrypt.compareSync(
            password,
            user.password
        );

        if (!passwordIsValid) {
            return res.status(200).send({
                status: false,
                accessToken: null,
                message: "Invalid Password!"
            });
        }

        const token = jwt.sign({ id: user.id }, config.secret, {
            expiresIn: 86400 // 24 hours
        });

        res.status(200).send({
            status: true,
            id: user.id,
            username: user.username,
            accessToken: token
        });
    } else {
        return res.status(200).send({ status: false, message: "User not found" });
    }
}


