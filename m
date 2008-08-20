Date: Wed, 20 Aug 2008 12:32:14 +0200
From: Sebastian Siewior <bigeasy@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd-utils: add support for 4k pages.
Message-ID: <20080820103214.GA21091@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Thomas Gleixner <tglx@linutronix.de>

Add support for 4K pages in nanddump & nandwrite.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Siewior <bigeasy@linutronix.de>
---
Original patch was done by tglx, I just made sure it still applies and
works on latest git.

 nanddump.c  |    7 ++++---
 nandwrite.c |    7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 9e10de4..be40287 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -159,8 +159,8 @@ void process_options (int argc, char *argv[])
 /*
  * Buffers for reading data from flash
  */
-unsigned char readbuf[2048];
-unsigned char oobbuf[64];
+unsigned char readbuf[4096];
+unsigned char oobbuf[128];
 
 /*
  * Main program
@@ -194,7 +194,8 @@ int main(int argc, char **argv)
 	}
 
 	/* Make sure device page sizes are valid */
-	if (!(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
+	if (!(meminfo.oobsize == 128 && meminfo.writesize == 4096) &&
+			!(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
 			!(meminfo.oobsize == 32 && meminfo.writesize == 1024) &&
 			!(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
 			!(meminfo.oobsize == 8 && meminfo.writesize == 256)) {
diff --git a/nandwrite.c b/nandwrite.c
index a5462ae..e745fba 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -39,8 +39,8 @@
 #define PROGRAM "nandwrite"
 #define VERSION "$Revision: 1.32 $"
 
-#define MAX_PAGE_SIZE	2048
-#define MAX_OOB_SIZE	64
+#define MAX_PAGE_SIZE	4096
+#define MAX_OOB_SIZE	128
 
 /*
  * Buffer array used for writing data
@@ -248,7 +248,8 @@ int main(int argc, char **argv)
 	/* Make sure device page sizes are valid */
 	if (!(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
 			!(meminfo.oobsize == 8 && meminfo.writesize == 256) &&
-			!(meminfo.oobsize == 64 && meminfo.writesize == 2048)) {
+			!(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
+			!(meminfo.oobsize == 128 && meminfo.writesize == 4096)) {
 		fprintf(stderr, "Unknown flash (not normal NAND)\n");
 		close(fd);
 		exit(1);
-- 
1.5.5.2
