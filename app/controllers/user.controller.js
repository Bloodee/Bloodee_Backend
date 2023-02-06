const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient({
    log: ['query', 'info', 'warn', 'error'],
})

exports.userdataGet = async (req, res) => {
    const id = req.user_id ? req.user_id : 0;
    const user = await prisma.user.findFirst({
        where: {
            id: id
        }
    })
    if (!user) {
        return res.status(200).send({ status: false, message: "User not found" });
    }
    else {
        const userdata = await prisma.userdata.findFirst({
            where: {
                id: user.user_id ? user.user_id : 0
            },
            // get province id
            include: {
                subdistricts: {
                    include: {
                        districts: {
                            include: {
                                provinces: true
                            }
                        }
                    }
                }
            }
        })
        if (!userdata) {
            return res.status(200).send({ status: false, message: "No User data" });
        }
        res.status(200).send({
            status: true,
            message: "User data found",
            userdata: userdata
        })
    }
}

exports.userdataUpdate = async (req, res) => {
    // search by user.id
    const id = req.user_id;
    const {
        czid,
        bdid,
        main_node,
        fname,
        mname,
        sname,
        dob,
        weight,
        subdistrict_id,
        addr,
        tel,
        sex,
        mobile,
        email,
        occupation,
        old_fname,
        old_sname,
        old_mname,
        img_profile,
    } = req.body;
    const user = await prisma.user.findFirst({
        where: {
            id: id
        }
    })
    if (!user) {
        return res.status(200).send({ status: false, message: "User not found" });
    } else {
        prisma.userdata.update({
            where: {
                id: user.user_id
            },
            data: {
                czid: czid,
                bdid: bdid,
                main_node: main_node,
                fname: fname,
                mname: mname,
                sname: sname,
                dob: dob,
                weight: weight,
                subdistrict_id: subdistrict_id,
                addr: addr,
                sex: parseInt(sex),
                tel: tel,
                mobile: mobile,
                email: email,
                occupation: occupation,
                old_fname: old_fname,
                old_sname: old_sname,
                old_mname: old_mname,
                img_profile: img_profile,
            }
        }).then((data) => {
            res.status(200).send({
                status: true,
                message: "Userdata updated successfully",
                userdata: data
            })
        }).catch((err) => {
            res.status(200).send({
                status: false,
                message: "Userdata update failed",
                error: err
            })
        })
    }
}

exports.reserveCreate = async (req, res) => {
    const id = req.user_id;

    const {
        czid,
        bdid,
        main_node,
        pname,
        fname,
        mname,
        sname,
        dob,
        weight,
        subdistrict_id,
        addr,
        tel,
        sex,
        mobile,
        email,
        occupation,
        old_pname,
        old_fname,
        old_sname,
        old_mname,
        q1,
        q2,
        q3,
        q4,
        q5,
        q6,
        q7,
        q8,
        q9,
        q10,
        q11,
        q12,
        q13,
        q14,
        q15,
        q16,
        q17,
        q18,
        q19,
        q20,
        q21,
        q22,
        q23,
        q24,
        q25,
        q26,
        q27,
        q28,
        q29,
        q30,
        q31,
        q32,
        q33,
        q34,
        q35,
        q36,
        q37,
        q_5_detail,
        q_7_detail,
    } = req.body;
    const user = await prisma.user.findFirst({
        where: {
            id: id
        }
    })
    if (!user) {
        return res.status(200).send({ status: false, message: "User not found" });
    }
    else {
        if (user.user_id) {
            // update userdata
            const userdate = await prisma.userdata.update({
                where: {
                    id: user.user_id
                },
                data: {
                    czid: czid,
                    bdid: bdid,
                    main_node: main_node,
                    pname: pname,
                    fname: fname,
                    mname: mname,
                    sname: sname,
                    dob: dob,
                    weight: weight,
                    subdistrict_id: parseInt(subdistrict_id),
                    addr: addr,
                    sex: sex ? parseInt(sex) : 0,
                    tel: tel,
                    mobile: mobile,
                    email: email,
                    occupation: occupation,
                    old_pname: old_pname,
                    old_fname: old_fname,
                    old_sname: old_sname,
                    old_mname: old_mname,
                }
            })
        } else {
            // create userdata
            const userdate = await prisma.userdata.create({
                data: {
                    czid: czid,
                    bdid: bdid,
                    main_node: main_node,
                    pname: pname,
                    fname: fname,
                    mname: mname,
                    sname: sname,
                    dob: dob,
                    weight: weight,
                    subdistrict_id: parseInt(subdistrict_id),
                    addr: addr,
                    sex: parseInt(sex),
                    tel: tel,
                    mobile: mobile,
                    email: email,
                    occupation: occupation,
                    old_pname: old_pname,
                    old_fname: old_fname,
                    old_sname: old_sname,
                    old_mname: old_mname,
                }
            })
            // update user.user_id
            const user = await prisma.user.update({
                where: {
                    id: id
                },
                data: {
                    user_id: userdate.id
                }
            })
        }
        // create reserve
        const reserve = await prisma.reserve_id.create({
            data: {
                user_id: user.user_id,
                q1: q1 ? 1 : 0,
                q2: q2 ? 1 : 0,
                q3: q3 ? 1 : 0,
                q4: q4 ? 1 : 0,
                q5: q5 ? 1 : 0,
                q6: q6 ? 1 : 0,
                q7: q7 ? 1 : 0,
                q8: q8 ? 1 : 0,
                q9: q9 ? 1 : 0,
                q10: q10 ? 1 : 0,
                q11: q11 ? 1 : 0,
                q12: q12 ? 1 : 0,
                q13: q13 ? 1 : 0,
                q14: q14 ? 1 : 0,
                q15: q15 ? 1 : 0,
                q16: q16 ? 1 : 0,
                q17: q17 ? 1 : 0,
                q18: q18 ? 1 : 0,
                q19: q19 ? 1 : 0,
                q20: q20 ? 1 : 0,
                q21: q21 ? 1 : 0,
                q22: q22 ? 1 : 0,
                q23: q23 ? 1 : 0,
                q24: q24 ? 1 : 0,
                q25: q25 ? 1 : 0,
                q26: q26 ? 1 : 0,
                q27: q27 ? 1 : 0,
                q28: q28 ? 1 : 0,
                q29: q29 ? 1 : 0,
                q30: q30 ? 1 : 0,
                q31: q31 ? 1 : 0,
                q32: q32 ? 1 : 0,
                q33: q33 ? 1 : 0,
                q34: q34 ? 1 : 0,
                q35: q35 ? 1 : 0,
                q36: q36 ? 1 : 0,
                q37: q37 ? 1 : 0,
                q_5_detail: q_5_detail,
                q_7_detail: q_7_detail,
                created_at: new Date(),
            }
        })

        if (!reserve) {
            return res.status(200).send({ status: false, message: "Reserve create failed" });
        }
        else {
            res.status(200).send({
                status: true,
                message: "Reserve create success",
            })
        }
    }
}

exports.ProvinceGet = async (req, res) => {
    const province = await prisma.provinces.findMany({
        select: {
            id: true,
            name_th: true,
            name_en: true
        }
    }
    )
    if (!province) {
        return res.status(200).send({ status: false, message: "Province not found" });
    }
    else {
        res.status(200).send({
            status: true,
            message: "Province found",
            province: province
        })
    }
}

exports.DistrictGet = async (req, res) => {
    const district = await prisma.districts.findMany({
        select: {
            id: true,
            name_th: true,
            name_en: true,
        },
        where: {
            province_id: parseInt(req.params.id)
        }
    })
    if (!district) {
        return res.status(200).send({ status: false, message: "District not found" });
    }
    else {
        res.status(200).send({
            status: true,
            message: "District found",
            district: district
        })
    }
}

exports.SubdistrictGet = async (req, res) => {
    const subdistrict = await prisma.subdistricts.findMany({
        select: {
            id: true,
            name_th: true,
            name_en: true,

        },
        where: {
            districts_id: parseInt(req.params.id)
        }
    })
    if (!subdistrict) {
        return res.status(200).send({ status: false, message: "Subdistrict not found" });
    }
    else {
        res.status(200).send({
            status: true,
            message: "Subdistrict found",
            subdistrict: subdistrict
        })
    }
}

exports.nodeGet = async (req, res) => {
    const node = await prisma.node.findMany()
    if (!node) {
        return res.status(200).send({ status: false, message: "Node not found" });
    }
    else {
        res.status(200).send({
            status: true,
            message: "Node found",
            node: node
        })
    }
}

exports.BookingUpdate = async (req, res) => {
    console.log("test");
    const {
        node_id,
        booking_date,
    } = req.body;
    const user_id = req.userdata_id;
    console.log(user_id)
    const check = await prisma.book.findMany({
        where: {
            user_id: user_id,
        }
    })
    // check booking already exist use update booking
    // if not exist use create booking
    if (check.length > 0) {
        const booking = await prisma.book.updateMany({
            where: {
                user_id: user_id,
            },
            data: {
                node_id: node_id,
                booking_date: booking_date,
            }
        })
        if (!booking) {
            return res.status(200).send({ status: false, message: "Booking update failed" });
        }
        else {
            res.status(200).send({
                status: true,
                message: "Booking update success",
            })
        }
    }
    else {
        const booking = await prisma.book.create({
            data: {
                user_id: user_id,
                node_id: node_id,
                booking_date: booking_date,
                type: 0,
            }
        })
        if (!booking) {
            return res.status(200).send({ status: false, message: "Booking create failed" });
        }
        else {
            res.status(200).send({
                status: true,
                message: "Booking create success",
            })
        }
    }

}

exports.BookingGet = async (req, res) => {
    const user_id = req.userdata_id;
    const booking = await prisma.book.findMany({
        select: {
            node_id: true,
            booking_date: true,
            type: true,
            node: {
                select: {
                    location_name: true,
                }
            }
        },
        where: {
            user_id: user_id
        }
    })
    if (!booking) {
        return res.status(200).send({ status: false, message: "Booking not found" });
    }
    else {
        res.status(200).send({
            status: true,
            message: "Booking found",
            booking: booking
        })
    }
}

exports.healthchecklistAvaliability = async (req, res) => {
    console.log("TEST");
    const healthchecklists = await prisma.healthchecklists.findMany({
        select: {
            id: true,
            healthcheck_name: true,
            healthcheck_price: true,
            user_healthcheck_selection: {
                select: {
                    user_id: true,
                    healthchecklist_id: true,
                }
            }
        },
        where: {
            user_healthcheck_selection: {
                some: {
                    user_id: parseInt(req.params.id)
                }
            }
        }
    })
    if (!healthchecklists) {
        return res.status(200).send({ status: false, message: "Healthchecklist not found" });
    }
    else {
        res.status(200).send({
            status: true,
            message: "Healthchecklist found",
            healthchecklists: healthchecklists

        })
    }
}

