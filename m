From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Sun, 16 Jan 2011 17:50:54 +0200
Subject: [PATCH] mtd: mtdpart: disallow reading OOB past the end of the partition
Message-ID: <mailman.119.1295193522.1530.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

This patch fixes the mtdpart bug which allows users reading OOB past the
end of the partition. This happens because 'part_read_oob()' allows reading
multiple OOB areas in one go, and mtdparts does not validate the OOB
length in the request.

Although there is such check in 'nand_do_read_oob()' in nand_base.c, but
it checks that we do not read past the flash chip, not the partition,
because in nand_base.c we work with the whole chip (e.g., mtd->size
in nand_base.c is the size of the whole chip). So this check cannot
be done correctly in nand_base.c and should be instead done in mtdparts.c.

This problem was reported by Jason Liu <r64343@freescale.com> and reproduced
with nandsim:

$ modprobe nandsim first_id_byte=0x20 second_id_byte=0xaa third_id_byte=0x00 \
                   fourth_id_byte=0x15 parts=0x400,0x400
$ modprobe nandsim mtd_oobtest.ko dev=0
$ dmesg
= snip =
mtd_oobtest: attempting to read past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error: read past end of device
= snip =
mtd_oobtest: finished with 2 errors

Reported-by: Jason Liu <liu.h.jason@gmail.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/mtdpart.c |   19 ++++++++++++++++++-
 1 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 79e3689..d2b932f 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -120,8 +120,25 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
 		return -EINVAL;
 	if (ops->datbuf && from + ops->len > mtd->size)
 		return -EINVAL;
-	res = part->master->read_oob(part->master, from + part->offset, ops);
 
+	/*
+	 * If OOB is also requested, make sure that we do not read past the end
+	 * of this partition.
+	 */
+	if (ops->oobbuf) {
+		size_t len, pages;
+
+		if (ops->mode == MTD_OOB_AUTO)
+			len = mtd->oobavail;
+		else
+			len = mtd->oobsize;
+		pages = mtd_div_by_ws(mtd->size, mtd);
+		pages -= mtd_div_by_ws(from, mtd);
+		if (ops->ooboffs + ops->ooblen > pages * len)
+			return -EINVAL;
+	}
+
+	res = part->master->read_oob(part->master, from + part->offset, ops);
 	if (unlikely(res)) {
 		if (res == -EUCLEAN)
 			mtd->ecc_stats.corrected++;
-- 
1.7.3.4

-- 
Best Regards,
Artem Bityutskiy (???????????????? ??????????)
