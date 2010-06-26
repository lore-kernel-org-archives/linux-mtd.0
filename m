Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OSJjn-00054i-4R
	for linux-mtd@lists.infradead.org; Sat, 26 Jun 2010 00:59:16 +0000
From: "Brian Norris" <norris@broadcom.com>
To: "Artem Bityutskiy" <Artem.Bityutskiy@nokia.com>
Subject: [PATCH 2/2] mtd-utils (nandwrite + nanddump): Support 4096+218,
	4096+224 OOB
Date: Fri, 25 Jun 2010 17:58:04 -0700
Message-ID: <1277513884-14715-2-git-send-email-norris@broadcom.com>
In-Reply-To: <1277513884-14715-1-git-send-email-norris@broadcom.com>
References: <1277513884-14715-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Parts of this are a resubmission of this patch:
http://lists.infradead.org/pipermail/linux-mtd/2010-May/029885.html

This was tested with Samsung K9GAG08U0D.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 nanddump.c  |    8 ++++++--
 nandwrite.c |    6 ++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 190a653..b0dd227 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -174,8 +174,12 @@ static void process_options (int argc, char * const argv[])
 /*
  * Buffers for reading data from flash
  */
-static unsigned char readbuf[4096];
-static unsigned char oobbuf[128];
+
+#define NAND_MAX_PAGESIZE 4096
+#define NAND_MAX_OOBSIZE 256
+
+static unsigned char readbuf[NAND_MAX_PAGESIZE];
+static unsigned char oobbuf[NAND_MAX_OOBSIZE];
 
 /*
  * Main program
diff --git a/nandwrite.c b/nandwrite.c
index 1b4ca3d..0d59171 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -43,7 +43,7 @@
 #define VERSION "$Revision: 1.32 $"
 
 #define MAX_PAGE_SIZE	4096
-#define MAX_OOB_SIZE	128
+#define MAX_OOB_SIZE	256
 
 // oob layouts to pass into the kernel as default
 static struct nand_oobinfo none_oobinfo = {
@@ -302,7 +302,9 @@ int main(int argc, char * const argv[])
 			!(meminfo.oobsize == 8 && meminfo.writesize == 256) &&
 			!(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
 			!(meminfo.oobsize == 64 && meminfo.writesize == 4096) &&
-			!(meminfo.oobsize == 128 && meminfo.writesize == 4096)) {
+			!(meminfo.oobsize == 128 && meminfo.writesize == 4096) &&
+			!(meminfo.oobsize == 218 && meminfo.writesize == 4096) &&
+			!(meminfo.oobsize == 224 && meminfo.writesize == 4096)) {
 		fprintf(stderr, "Unknown flash (not normal NAND)\n");
 		close(fd);
 		exit (EXIT_FAILURE);
-- 
1.7.1
