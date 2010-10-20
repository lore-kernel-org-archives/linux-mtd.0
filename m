Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8SPX-0006RH-P7
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 06:44:32 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd-utils: more style fixups
Date: Tue, 19 Oct 2010 23:45:24 -0700
Message-ID: <1287557125-2672-1-git-send-email-computersforpeace@gmail.com>
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

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c  |    7 +++----
 nandwrite.c |    6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index bb649da..6428bc4 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -308,7 +308,7 @@ int main(int argc, char * const argv[])
 	oob.ptr = oobbuf;
 
 	if (noecc)  {
-		ret = ioctl(fd, MTDFILEMODE, (void *) MTD_MODE_RAW);
+		ret = ioctl(fd, MTDFILEMODE, (void *)MTD_MODE_RAW);
 		if (ret == 0) {
 			oobinfochanged = 2;
 		} else {
@@ -330,7 +330,6 @@ int main(int argc, char * const argv[])
 			}
 		}
 	} else {
-
 		/* check if we can read ecc stats */
 		if (!ioctl(fd, ECCGETSTATS, &stat1)) {
 			eccstats = true;
@@ -375,7 +374,6 @@ int main(int argc, char * const argv[])
 	bs = meminfo.writesize;
 
 	/* Print informative message */
-
 	if (!quiet) {
 		fprintf(stderr, "Block size %u, page size %u, OOB size %u\n",
 				meminfo.erasesize, meminfo.writesize, meminfo.oobsize);
@@ -383,6 +381,7 @@ int main(int argc, char * const argv[])
 				"Dumping data starting at 0x%08x and ending at 0x%08x...\n",
 				(unsigned int)start_addr, (unsigned int)end_addr);
 	}
+
 	/* Dump the flash contents */
 	for (ofs = start_addr; ofs < end_addr; ofs += bs) {
 		/* Check for bad block */
@@ -401,7 +400,7 @@ int main(int argc, char * const argv[])
 		if (badblock) {
 			if (omitbad)
 				continue;
-			memset (readbuf, 0xff, bs);
+			memset(readbuf, 0xff, bs);
 		} else {
 			/* Read page data and exit on failure */
 			if (pread(fd, readbuf, bs, ofs) != bs) {
diff --git a/nandwrite.c b/nandwrite.c
index b5745b9..fe03115 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -592,14 +592,14 @@ int main(int argc, char * const argv[])
 				int i, start, len;
 				int tags_pos = 0;
 				/*
-				 *  We use autoplacement and have the oobinfo with the autoplacement
+				 * We use autoplacement and have the oobinfo with the autoplacement
 				 * information from the kernel available
 				 *
 				 * Modified to support out of order oobfree segments,
 				 * such as the layout used by diskonchip.c
 				 */
 				if (!oobinfochanged && (old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE)) {
-					for (i = 0;old_oobinfo.oobfree[i][1]; i++) {
+					for (i = 0; old_oobinfo.oobfree[i][1]; i++) {
 						/* Set the reserved bytes to 0xff */
 						start = old_oobinfo.oobfree[i][0];
 						len = old_oobinfo.oobfree[i][1];
@@ -620,7 +620,7 @@ int main(int argc, char * const argv[])
 							len);
 				}
 			}
-			/* Write OOB data first, as ecc will be placed in there*/
+			/* Write OOB data first, as ecc will be placed in there */
 			oob.start = mtdoffset;
 			if (ioctl(fd, MEMWRITEOOB, &oob) != 0) {
 				perror("ioctl(MEMWRITEOOB)");
-- 
1.7.0.4
