Received: from rs1.rw-gmbh.net ([213.239.201.58])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PYEpq-0002im-OW
	for linux-mtd@lists.infradead.org; Thu, 30 Dec 2010 09:30:15 +0000
Message-ID: <4D1C5123.4050804@rw-gmbh.de>
Date: Thu, 30 Dec 2010 10:30:11 +0100
From: =?UTF-8?B?UmFsZiBSw7ZzY2g=?= <ralf.roesch@rw-gmbh.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] txx9ndfmc: limit transfer bytes to 512 (ECC provides 6 bytes
	max)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

See commit: c0cbfd0e81d879a950ba6f0df3f75ea30c5ab16e
Using __nand_correct_data() helper function, this driver can read 512
byte (with 6 byte ECC) at a time.

This is correct, but not more:
With NAND chips providing page sizes > 512 Bytes
chip->ecc.bytes are calculated > 6 in txx9ndfmc_nand_scan.
According the data sheet there are (only) 6 bytes ECC available.

After applying the patch a Hynix 512M*8 with 2k page size could be
successfully formatted and used with an ubifs file system.

Signed-off-by: Ralf Roesch <ralf.roesch@rw-gmbh.de>
---
 drivers/mtd/nand/txx9ndfmc.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 054a41c..ca270a4 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -277,8 +277,9 @@ static int txx9ndfmc_nand_scan(struct mtd_info *mtd)
 	ret = nand_scan_ident(mtd, 1, NULL);
 	if (!ret) {
 		if (mtd->writesize >= 512) {
-			chip->ecc.size = mtd->writesize;
-			chip->ecc.bytes = 3 * (mtd->writesize / 256);
+			/* Hardware ECC 6 byte ECC per 512 Byte data */
+			chip->ecc.size = 512;
+			chip->ecc.bytes = 6;
 		}
 		ret = nand_scan_tail(mtd);
 	}
-- 
1.7.2.3
