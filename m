Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZjdU-0003j1-1o
 for linux-mtd@lists.infradead.org; Thu, 11 Jan 2018 20:39:42 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH] mtd: mtd_oobtest: Handle bitflips during reads
Date: Thu, 11 Jan 2018 21:39:20 +0100
Message-Id: <20180111203920.8136-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Reads from NAND devices usually trigger bitflips, this is an expected
behavior. While bitflips are under a given threshold, the MTD core
returns 0. However, when the number of corrected bitflips is above this
same threshold, -EUCLEAN is returned to inform the upper layer that this
block is slightly dying and soon the ECC engine will be overtaken so
actions should be taken to move the data out of it.

This particular condition should not be treated like an error and the
test should continue.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/tests/oobtest.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
index 1cb3f7758fb6..766b2c385682 100644
--- a/drivers/mtd/tests/oobtest.c
+++ b/drivers/mtd/tests/oobtest.c
@@ -193,6 +193,9 @@ static int verify_eraseblock(int ebnum)
 		ops.datbuf    = NULL;
 		ops.oobbuf    = readbuf;
 		err = mtd_read_oob(mtd, addr, &ops);
+		if (mtd_is_bitflip(err))
+			err = 0;
+
 		if (err || ops.oobretlen != use_len) {
 			pr_err("error: readoob failed at %#llx\n",
 			       (long long)addr);
@@ -227,6 +230,9 @@ static int verify_eraseblock(int ebnum)
 			ops.datbuf    = NULL;
 			ops.oobbuf    = readbuf;
 			err = mtd_read_oob(mtd, addr, &ops);
+			if (mtd_is_bitflip(err))
+				err = 0;
+
 			if (err || ops.oobretlen != mtd->oobavail) {
 				pr_err("error: readoob failed at %#llx\n",
 						(long long)addr);
@@ -286,6 +292,9 @@ static int verify_eraseblock_in_one_go(int ebnum)
 
 	/* read entire block's OOB at one go */
 	err = mtd_read_oob(mtd, addr, &ops);
+	if (mtd_is_bitflip(err))
+		err = 0;
+
 	if (err || ops.oobretlen != len) {
 		pr_err("error: readoob failed at %#llx\n",
 		       (long long)addr);
@@ -527,6 +536,9 @@ static int __init mtd_oobtest_init(void)
 	pr_info("attempting to start read past end of OOB\n");
 	pr_info("an error is expected...\n");
 	err = mtd_read_oob(mtd, addr0, &ops);
+	if (mtd_is_bitflip(err))
+		err = 0;
+
 	if (err) {
 		pr_info("error occurred as expected\n");
 		err = 0;
@@ -571,6 +583,9 @@ static int __init mtd_oobtest_init(void)
 		pr_info("attempting to read past end of device\n");
 		pr_info("an error is expected...\n");
 		err = mtd_read_oob(mtd, mtd->size - mtd->writesize, &ops);
+		if (mtd_is_bitflip(err))
+			err = 0;
+
 		if (err) {
 			pr_info("error occurred as expected\n");
 			err = 0;
@@ -615,6 +630,9 @@ static int __init mtd_oobtest_init(void)
 		pr_info("attempting to read past end of device\n");
 		pr_info("an error is expected...\n");
 		err = mtd_read_oob(mtd, mtd->size - mtd->writesize, &ops);
+		if (mtd_is_bitflip(err))
+			err = 0;
+
 		if (err) {
 			pr_info("error occurred as expected\n");
 			err = 0;
@@ -684,6 +702,9 @@ static int __init mtd_oobtest_init(void)
 		ops.datbuf    = NULL;
 		ops.oobbuf    = readbuf;
 		err = mtd_read_oob(mtd, addr, &ops);
+		if (mtd_is_bitflip(err))
+			err = 0;
+
 		if (err)
 			goto out;
 		if (memcmpshow(addr, readbuf, writebuf,
-- 
2.11.0
