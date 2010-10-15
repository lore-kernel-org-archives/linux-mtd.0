Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6ey9-000799-4K
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 07:44:50 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] mtd-utils: nandwrite: Large page+oob support
Date: Fri, 15 Oct 2010 00:44:25 -0700
Message-ID: <1287128665-6573-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1287128665-6573-1-git-send-email-computersforpeace@gmail.com>
References: <1287128665-6573-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dynamic allocation of the oob buffer provides the necessary
support for removing the oob size check. Now, new unknown OOB
sizes can be handled correctly (for example, 8KB page + 448B
OOB).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |   33 +++++++++++++--------------------
 1 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index e0f5f44..2341694 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -42,9 +42,6 @@
 #include <asm/types.h>
 #include "mtd/mtd-user.h"
 
-#define MAX_PAGE_SIZE	4096
-#define MAX_OOB_SIZE	128
-
 // oob layouts to pass into the kernel as default
 static struct nand_oobinfo none_oobinfo = {
 	.useecc = MTD_NANDECC_OFF,
@@ -276,12 +273,10 @@ int main(int argc, char * const argv[])
 	unsigned char *writebuf = NULL;
 	// points to the OOB for the current page in filebuf
 	unsigned char *oobreadbuf = NULL;
-	unsigned char oobbuf[MAX_OOB_SIZE];
+	unsigned char *oobbuf = NULL;
 
 	process_options(argc, argv);
 
-	erase_buffer(oobbuf, sizeof(oobbuf));
-
 	if (pad && writeoob) {
 		fprintf(stderr, "Can't pad when oob data is present.\n");
 		exit(EXIT_FAILURE);
@@ -304,17 +299,6 @@ int main(int argc, char * const argv[])
 	 * (virtual) block size */
 	meminfo.erasesize *= blockalign;
 
-	/* Make sure device page sizes are valid */
-	if (!(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
-			!(meminfo.oobsize == 8 && meminfo.writesize == 256) &&
-			!(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
-			!(meminfo.oobsize == 64 && meminfo.writesize == 4096) &&
-			!(meminfo.oobsize == 128 && meminfo.writesize == 4096)) {
-		fprintf(stderr, "Unknown flash (not normal NAND)\n");
-		close(fd);
-		exit(EXIT_FAILURE);
-	}
-
 	if (mtdoffset & (meminfo.writesize - 1)) {
 		fprintf(stderr, "The start address is not page-aligned !\n"
 				"The pagesize of this NAND Flash is 0x%x.\n",
@@ -455,11 +439,19 @@ int main(int argc, char * const argv[])
 	filebuf = (unsigned char *)malloc(filebuf_max);
 	if (!filebuf) {
 		fprintf(stderr, "Failed to allocate memory for file buffer (%d bytes)\n",
-				pagelen * meminfo.erasesize / meminfo.writesize);
+				filebuf_max);
 		goto closeall;
 	}
 	erase_buffer(filebuf, filebuf_max);
 
+	oobbuf = (unsigned char *)malloc(meminfo.oobsize);
+	if (!oobbuf) {
+		fprintf(stderr, "Failed to allocate memory for oob buffer (%d bytes)\n",
+				meminfo.oobsize);
+		goto closeall;
+	}
+	erase_buffer(oobbuf, meminfo.oobsize);
+
 	/*
 	 * Get data from input and write to the device while there is
 	 * still input to read and we are still within the device
@@ -688,9 +680,10 @@ int main(int argc, char * const argv[])
 	failed = false;
 
 closeall:
-	if (filebuf) {
+	if (filebuf)
 		free(filebuf);
-	}
+	if (oobbuf)
+		free(oobbuf);
 
 	close(ifd);
 
-- 
1.7.0.4
