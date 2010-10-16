Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6wFr-0005AQ-S3
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 02:12:16 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/3] mtd-utils: nandwrite: Large page+oob support
Date: Fri, 15 Oct 2010 19:12:25 -0700
Message-ID: <1287195145-10054-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <AANLkTik2v8=Lx+HKFTQdgh4czjYuz6P5uevThvAOFcAE@mail.gmail.com>
References: <AANLkTik2v8=Lx+HKFTQdgh4czjYuz6P5uevThvAOFcAE@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
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

Included common.h for the use of xmalloc.

Memory freeing should occur on "restoreoob" as well as on
"closeall."

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |   36 +++++++++---------------------------
 1 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index e0f5f44..1403378 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -41,9 +41,7 @@
 
 #include <asm/types.h>
 #include "mtd/mtd-user.h"
-
-#define MAX_PAGE_SIZE	4096
-#define MAX_OOB_SIZE	128
+#include "common.h"
 
 // oob layouts to pass into the kernel as default
 static struct nand_oobinfo none_oobinfo = {
@@ -276,12 +274,10 @@ int main(int argc, char * const argv[])
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
@@ -304,17 +300,6 @@ int main(int argc, char * const argv[])
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
@@ -452,14 +437,12 @@ int main(int argc, char * const argv[])
 
 	// Allocate a buffer big enough to contain all the data (OOB included) for one eraseblock
 	filebuf_max = pagelen * meminfo.erasesize / meminfo.writesize;
-	filebuf = (unsigned char *)malloc(filebuf_max);
-	if (!filebuf) {
-		fprintf(stderr, "Failed to allocate memory for file buffer (%d bytes)\n",
-				pagelen * meminfo.erasesize / meminfo.writesize);
-		goto closeall;
-	}
+	filebuf = xmalloc(filebuf_max);
 	erase_buffer(filebuf, filebuf_max);
 
+	oobbuf = xmalloc(meminfo.oobsize);
+	erase_buffer(oobbuf, meminfo.oobsize);
+
 	/*
 	 * Get data from input and write to the device while there is
 	 * still input to read and we are still within the device
@@ -688,13 +671,12 @@ int main(int argc, char * const argv[])
 	failed = false;
 
 closeall:
-	if (filebuf) {
-		free(filebuf);
-	}
-
 	close(ifd);
 
 restoreoob:
+	free(filebuf);
+	free(oobbuf);
+
 	if (oobinfochanged == 1) {
 		if (ioctl(fd, MEMSETOOBSEL, &old_oobinfo) != 0) {
 			perror("MEMSETOOBSEL");
-- 
1.7.0.4
