Received: from dns1.vpop.net ([216.193.240.2] helo=mail.vpop.net)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IigH5-0000fy-DQ
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2007 02:03:42 +0100
From: Matt Reimer <mattjreimer@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: fix s3c2410 error correction
Date: Thu, 18 Oct 2007 18:02:43 -0700
Message-Id: <1192755764-26269-1-git-send-email-mattjreimer@gmail.com>
Cc: Matt Reimer <mreimer@vpop.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Matt Reimer <mreimer@vpop.net>

The single-bit error correction was, well, incorrect. For determing which
bit to correct it was using P1' P2' P4' P8' instead of P1 P2 P4 P8, and
it was using P16' P32' P64' P128' P256' P512' P1024' P2048' instead of
P16 P32 P64 P128 P256 P512 P1024 P2048.

Signed-off-by: Matt Reimer <mreimer@vpop.net>
---
 drivers/mtd/nand/s3c2410.c |   26 ++++++++++++--------------
 1 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 903db18..077fdcc 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -364,23 +364,21 @@ static int s3c2410_nand_correct_data(struct mtd_info *mtd, u_char *dat,
 	    ((diff2 ^ (diff2 >> 1)) & 0x55) == 0x55) {
 		/* calculate the bit position of the error */
 
-		bit  = (diff2 >> 2) & 1;
-		bit |= (diff2 >> 3) & 2;
-		bit |= (diff2 >> 4) & 4;
+		bit  = ((diff2 >> 3) & 1) |
+		       ((diff2 >> 4) & 2) |
+		       ((diff2 >> 5) & 4);
 
 		/* calculate the byte position of the error */
 
-		byte  = (diff1 << 1) & 0x80;
-		byte |= (diff1 << 2) & 0x40;
-		byte |= (diff1 << 3) & 0x20;
-		byte |= (diff1 << 4) & 0x10;
-
-		byte |= (diff0 >> 3) & 0x08;
-		byte |= (diff0 >> 2) & 0x04;
-		byte |= (diff0 >> 1) & 0x02;
-		byte |= (diff0 >> 0) & 0x01;
-
-		byte |= (diff2 << 8) & 0x100;
+		byte = ((diff2 << 7) & 0x100) |
+		       ((diff1 << 0) & 0x80)  |
+		       ((diff1 << 1) & 0x40)  |
+		       ((diff1 << 2) & 0x20)  |
+		       ((diff1 << 3) & 0x10)  |
+		       ((diff0 >> 4) & 0x08)  |
+		       ((diff0 >> 3) & 0x04)  |
+		       ((diff0 >> 2) & 0x02)  |
+		       ((diff0 >> 1) & 0x01);
 
 		dev_dbg(info->device, "correcting error bit %d, byte %d\n",
 			bit, byte);
-- 
1.5.3.2
