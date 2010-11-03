Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDYk0-0007nF-9u
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 08:30:49 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 03/10] mtd-utils: nandwrite: Clarify usage of aligned
	"erasesize"
Date: Wed, 3 Nov 2010 01:27:20 -0700
Message-ID: <1288772847-8120-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
References: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, Jehan Bing <jehan@orb.com>,
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

Due to the presence of the "--block-align" flag, nandwrite uses a
blocksize throughout that, depeding on the execution parameters, may
not be the actual erasesize of the NAND flash. In order to clarify
this situation for the untrained viewer of nandwrite's code, we should
not change the value of "meminfo.erasesize" itself; rather, we can
utilize a separate, calculated "ebsize_aligned". Then, when a user
actually wants to refer to the physical erasesize, it's straightforward.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |   30 +++++++++++++++++-------------
 1 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 3fbfca9..66a9ef7 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -275,6 +275,7 @@ int main(int argc, char * const argv[])
 	// points to the OOB for the current page in filebuf
 	unsigned char *oobreadbuf = NULL;
 	unsigned char *oobbuf = NULL;
+	int ebsize_aligned;
 
 	process_options(argc, argv);
 
@@ -296,9 +297,12 @@ int main(int argc, char * const argv[])
 		exit(EXIT_FAILURE);
 	}
 
-	/* Set erasesize to specified number of blocks - to match jffs2
-	 * (virtual) block size */
-	meminfo.erasesize *= blockalign;
+	/*
+	 * Pretend erasesize is specified number of blocks - to match jffs2
+	 *   (virtual) block size
+	 * Use this value throughout unless otherwise necessary
+	 */
+	ebsize_aligned = meminfo.erasesize * blockalign;
 
 	if (mtdoffset & (meminfo.writesize - 1)) {
 		fprintf(stderr, "The start address is not page-aligned !\n"
@@ -435,7 +439,7 @@ int main(int argc, char * const argv[])
 	}
 
 	// Allocate a buffer big enough to contain all the data (OOB included) for one eraseblock
-	filebuf_max = pagelen * meminfo.erasesize / meminfo.writesize;
+	filebuf_max = pagelen * ebsize_aligned / meminfo.writesize;
 	filebuf = xmalloc(filebuf_max);
 	erase_buffer(filebuf, filebuf_max);
 
@@ -459,8 +463,8 @@ int main(int argc, char * const argv[])
 		 * skipped block(s) is also bad (number of blocks depending on
 		 * the blockalign).
 		 */
-		while (blockstart != (mtdoffset & (~meminfo.erasesize + 1))) {
-			blockstart = mtdoffset & (~meminfo.erasesize + 1);
+		while (blockstart != (mtdoffset & (~ebsize_aligned + 1))) {
+			blockstart = mtdoffset & (~ebsize_aligned + 1);
 			offs = blockstart;
 
 			// if writebuf == filebuf, we are rewinding so we must not
@@ -474,7 +478,7 @@ int main(int argc, char * const argv[])
 			baderaseblock = false;
 			if (!quiet)
 				fprintf(stdout, "Writing data to block %d at offset 0x%x\n",
-						 blockstart / meminfo.erasesize, blockstart);
+						 blockstart / ebsize_aligned, blockstart);
 
 			/* Check all the blocks in an erase block for bad blocks */
 			if (noskipbad)
@@ -492,10 +496,10 @@ int main(int argc, char * const argv[])
 				}
 
 				if (baderaseblock) {
-					mtdoffset = blockstart + meminfo.erasesize;
+					mtdoffset = blockstart + ebsize_aligned;
 				}
-				offs +=  meminfo.erasesize / blockalign;
-			} while (offs < blockstart + meminfo.erasesize);
+				offs +=  ebsize_aligned / blockalign;
+			} while (offs < blockstart + ebsize_aligned);
 
 		}
 
@@ -642,7 +646,7 @@ int main(int argc, char * const argv[])
 			writebuf = filebuf;
 
 			erase.start = blockstart;
-			erase.length = meminfo.erasesize;
+			erase.length = ebsize_aligned;
 			fprintf(stderr, "Erasing failed write from %08lx-%08lx\n",
 				(long)erase.start, (long)erase.start+erase.length-1);
 			if (ioctl(fd, MEMERASE, &erase) != 0) {
@@ -654,14 +658,14 @@ int main(int argc, char * const argv[])
 			}
 
 			if (markbad) {
-				loff_t bad_addr = mtdoffset & (~(meminfo.erasesize / blockalign) + 1);
+				loff_t bad_addr = mtdoffset & (~meminfo.erasesize + 1);
 				fprintf(stderr, "Marking block at %08lx bad\n", (long)bad_addr);
 				if (ioctl(fd, MEMSETBADBLOCK, &bad_addr)) {
 					perror("MEMSETBADBLOCK");
 					goto closeall;
 				}
 			}
-			mtdoffset = blockstart + meminfo.erasesize;
+			mtdoffset = blockstart + ebsize_aligned;
 
 			continue;
 		}
-- 
1.7.0.4
