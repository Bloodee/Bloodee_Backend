const jwt = require("jsonwebtoken");
const config = require("../config/auth.config.js");
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient({
  log: ['query', 'info', 'warn', 'error'],
})

verifyToken = (req, res, next) => {
  let token = req.headers["access-token"];

  if (!token) {
    return res.status(403).send({
      message: "No Token provided!"
    });
  }

  jwt.verify(token, config.secret, async (err, decoded) => {
    if (err) {
      return res.status(401).send({
        message: "Unauthorized!"
      });
    }
    req.user_id = decoded.id;
    userdata_id = await prisma.user.findFirst({
      where: {
        id: req.user_id
      }
    })
    req.userdata_id = userdata_id.user_id;
    next();
  });
};

const authJwt = {
  verifyToken: verifyToken,
};
module.exports = authJwt;