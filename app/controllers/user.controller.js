const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

exports.addtable = (req, res) => {
    prisma.table.create({
        data: {
            table_name: req.body.table_name,
            sub_room_id: req.body.sub_room_id,
        }
    }).then(async (table) => {
        for (let i = 0; i < req.body.seat_size; i++) {
            await prisma.seat.create({
                data: {
                    table_id: table.id,
                    seat: (i + 1).toString(),
                }
            })
        }
        res.status(200).send({
            status: true,
            message: "Table created successfully",
            table: table
        })
    })
}

