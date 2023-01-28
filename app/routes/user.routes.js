const controller = require('../controllers/user.controller');
const { authJwt } = require("../middleware");
module.exports = function (app) {
    app.use(function (req, res, next) {
        res.header(
            "Access-Control-Allow-Headers",
            "x-access-token, Origin, Content-Type, Accept"
        );
        next();
    })

    app.post("/api/user/update", [authJwt.verifyToken], controller.userdataUpdate);
    app.get('/api/user/get', [authJwt.verifyToken], controller.userdataGet);
    app.get("/api/province/get", controller.ProvinceGet);
    app.get("/api/district/get/:id", controller.DistrictGet);
    app.get("/api/subdistrict/get/:id", controller.SubdistrictGet);
    app.get('/api/node/get', controller.nodeGet);
    app.post("/api/reserve/create", [authJwt.verifyToken], controller.reserveCreate);
    
}