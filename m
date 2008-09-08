Received: from relay02.pair.com ([209.68.5.16])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KcaV2-0003Ij-DW
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 06:45:24 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/6] [MTD-UTILS] nanddump: Qualifier Clean-up
Date: Sun,  7 Sep 2008 23:45:21 -0700
Message-Id: <1220856321-22712-1-git-send-email-gerickson@nuovations.com>
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
 nanddump.c |   34 +++++++++++++++++-----------------
 1 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index be40287..e35caf8 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -32,11 +32,11 @@
 #define PROGRAM "nanddump"
 #define VERSION "$Revision: 1.29 $"
 
-struct nand_oobinfo none_oobinfo = {
+static struct nand_oobinfo none_oobinfo = {
 	.useecc = MTD_NANDECC_OFF,
 };
 
-void display_help (void)
+static void display_help (void)
 {
 	printf("Usage: nanddump [OPTIONS] MTD-device\n"
 			"Dumps the contents of a nand mtd partition.\n"
@@ -54,7 +54,7 @@ void display_help (void)
 	exit(0);
 }
 
-void display_version (void)
+static void display_version (void)
 {
 	printf(PROGRAM " " VERSION "\n"
 			"\n"
@@ -69,17 +69,17 @@ void display_version (void)
 
 // Option variables
 
-int	ignoreerrors;		// ignore errors
-int	pretty_print;		// print nice in ascii
-int	noecc;			// don't error correct
-int	omitoob;		// omit oob data
-unsigned long	start_addr;	// start address
-unsigned long	length;		// dump length
-char    *mtddev;		// mtd device name
-char    *dumpfile;		// dump file name
-int	omitbad;
-
-void process_options (int argc, char *argv[])
+static int		ignoreerrors;	// ignore errors
+static int		pretty_print;	// print nice in ascii
+static int		noecc;		// don't error correct
+static int		omitoob;	// omit oob data
+static unsigned long	start_addr;	// start address
+static unsigned long	length;		// dump length
+static const char	*mtddev;	// mtd device name
+static const char	*dumpfile;	// dump file name
+static int		omitbad;
+
+static void process_options (int argc, char * const argv[])
 {
 	int error = 0;
 
@@ -159,13 +159,13 @@ void process_options (int argc, char *argv[])
 /*
  * Buffers for reading data from flash
  */
-unsigned char readbuf[4096];
-unsigned char oobbuf[128];
+static unsigned char readbuf[4096];
+static unsigned char oobbuf[128];
 
 /*
  * Main program
  */
-int main(int argc, char **argv)
+int main(int argc, char * const argv[])
 {
 	unsigned long ofs, end_addr = 0;
 	unsigned long long blockstart = 1;
-- 
1.6.0.1
