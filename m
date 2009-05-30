Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=teyla.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MATFq-0001mS-5K
	for linux-mtd@lists.infradead.org; Sat, 30 May 2009 18:26:06 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [MTD] [NAND] S3C2410: Deal with unaligned lengths in S3C2440 buffer
	read/write
Date: Sat, 30 May 2009 18:41:37 +0100
Message-Id: <1243705298-21814-11-git-send-email-ben-linux@fluff.org>
In-Reply-To: <1243705298-21814-10-git-send-email-ben-linux@fluff.org>
References: <1243705298-21814-1-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-2-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-3-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-4-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-5-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-6-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-7-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-8-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-9-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-10-git-send-email-ben-linux@fluff.org>
Cc: Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add code to deal with fractional lengths, as reported by
Werner Almesberger. Re-work of his original patch.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/mtd/nand/s3c2410.c |   22 ++++++++++++++++++++--
 1 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index d315b51..8a7f960 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -584,7 +584,16 @@ static void s3c2410_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 static void s3c2440_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
 	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
-	readsl(info->regs + S3C2440_NFDATA, buf, len / 4);
+
+	readsl(info->regs + S3C2440_NFDATA, buf, len >> 2);
+
+	/* cleanup if we've got less than a word to do */
+	if (len & 3) {
+		buf += len & ~3;
+
+		for (; len & 3; len--)
+			*buf++ = readb(info->regs + S3C2440_NFDATA);
+	}
 }
 
 static void s3c2410_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
@@ -596,7 +605,16 @@ static void s3c2410_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int
 static void s3c2440_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 {
 	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
-	writesl(info->regs + S3C2440_NFDATA, buf, len / 4);
+
+	writesl(info->regs + S3C2440_NFDATA, buf, len >> 2);
+
+	/* cleanup any fractional write */
+	if (len & 3) {
+		buf += len & ~3;
+
+		for (; len & 3; len--, buf++)
+			writeb(*buf, info->regs + S3C2440_NFDATA);
+	}
 }
 
 /* cpufreq driver support */
-- 
1.5.6.5
