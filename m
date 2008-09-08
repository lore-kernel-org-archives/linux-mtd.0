Received: from relay00.pair.com ([209.68.5.9])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KcYJC-0006Pb-Qv
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 04:25:03 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/6] [MTD-UTILS] nandwrite: Qualifier Clean-up
Date: Sun,  7 Sep 2008 21:24:54 -0700
Message-Id: <1220847899-22189-1-git-send-email-gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Static-qualified all globals except 'main' because they have no use
beyond file scope.
Constant-qualified MTD device and input positional parameter globals.
Constant-qualified argv array.

Signed-off-by: Grant Erickson <gerickson@nuovations.com>
---
 nandwrite.c |   48 ++++++++++++++++++++++++------------------------
 1 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index e745fba..8e0609d 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -45,32 +45,32 @@
 /*
  * Buffer array used for writing data
  */
-unsigned char writebuf[MAX_PAGE_SIZE];
-unsigned char oobbuf[MAX_OOB_SIZE];
-unsigned char oobreadbuf[MAX_OOB_SIZE];
+static unsigned char writebuf[MAX_PAGE_SIZE];
+static unsigned char oobbuf[MAX_OOB_SIZE];
+static unsigned char oobreadbuf[MAX_OOB_SIZE];
 
 // oob layouts to pass into the kernel as default
-struct nand_oobinfo none_oobinfo = {
+static struct nand_oobinfo none_oobinfo = {
 	.useecc = MTD_NANDECC_OFF,
 };
 
-struct nand_oobinfo jffs2_oobinfo = {
+static struct nand_oobinfo jffs2_oobinfo = {
 	.useecc = MTD_NANDECC_PLACE,
 	.eccbytes = 6,
 	.eccpos = { 0, 1, 2, 3, 6, 7 }
 };
 
-struct nand_oobinfo yaffs_oobinfo = {
+static struct nand_oobinfo yaffs_oobinfo = {
 	.useecc = MTD_NANDECC_PLACE,
 	.eccbytes = 6,
 	.eccpos = { 8, 9, 10, 13, 14, 15}
 };
 
-struct nand_oobinfo autoplace_oobinfo = {
+static struct nand_oobinfo autoplace_oobinfo = {
 	.useecc = MTD_NANDECC_AUTOPLACE
 };
 
-void display_help (void)
+static void display_help (void)
 {
 	printf("Usage: nandwrite [OPTION] MTD_DEVICE INPUTFILE\n"
 			"Writes to the specified MTD device.\n"
@@ -91,7 +91,7 @@ void display_help (void)
 	exit(0);
 }
 
-void display_version (void)
+static void display_version (void)
 {
 	printf(PROGRAM " " VERSION "\n"
 			"\n"
@@ -106,20 +106,20 @@ void display_version (void)
 	exit(0);
 }
 
-char	*mtd_device, *img;
-int	mtdoffset = 0;
-int	quiet = 0;
-int	writeoob = 0;
-int	markbad = 0;
-int	autoplace = 0;
-int	forcejffs2 = 0;
-int	forceyaffs = 0;
-int	forcelegacy = 0;
-int	noecc = 0;
-int	pad = 0;
-int	blockalign = 1; /*default to using 16K block size */
-
-void process_options (int argc, char *argv[])
+static const char	*mtd_device, *img;
+static int		mtdoffset = 0;
+static int		quiet = 0;
+static int		writeoob = 0;
+static int		markbad = 0;
+static int		autoplace = 0;
+static int		forcejffs2 = 0;
+static int		forceyaffs = 0;
+static int		forcelegacy = 0;
+static int		noecc = 0;
+static int		pad = 0;
+static int		blockalign = 1; /*default to using 16K block size */
+
+static void process_options (int argc, char * const argv[])
 {
 	int error = 0;
 
@@ -209,7 +209,7 @@ void process_options (int argc, char *argv[])
 /*
  * Main program
  */
-int main(int argc, char **argv)
+int main(int argc, char * const argv[])
 {
 	int cnt, fd, ifd, imglen = 0, pagelen, baderaseblock, blockstart = -1;
 	struct mtd_info_user meminfo;
-- 
1.6.0.1
