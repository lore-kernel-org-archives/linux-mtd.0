Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6ukE-0003dV-LH
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 00:35:31 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/3] mtd-utils: nanddump: Dynamic buffer, increase
	pagesize/oobsize
Date: Fri, 15 Oct 2010 17:35:31 -0700
Message-ID: <1287189331-9475-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <AANLkTi%3DXdvN2vGu7Z5M7jj%3Dz_qrx%3D9F93WiDnPYkcDgY@mail.gmail.com>
References: <AANLkTi%3DXdvN2vGu7Z5M7jj%3Dz_qrx%3D9F93WiDnPYkcDgY@mail.gmail.com>
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

The buffers used for dumping page and OOB data needed dynamic
allocation to help eliminate burdens for updating (i.e., every
time there's a new OOB size we don't have to increase the sizes).

Also, there is no need to check flash chips for "standard sizes."
With recent changes to the printing codebase, we should be able to
handle arbitrary sizes with no problem.

More exit operations are now necessary on program failure, so
"goto closeall" is used more liberally.

Also, common.h is included for the use of xmalloc.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   56 +++++++++++++++++++++-----------------------------------
 1 files changed, 21 insertions(+), 35 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 00762a5..3e7692f 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -32,6 +32,7 @@
 
 #include <asm/types.h>
 #include <mtd/mtd-user.h>
+#include "common.h"
 
 static struct nand_oobinfo none_oobinfo = {
 	.useecc = MTD_NANDECC_OFF,
@@ -265,28 +266,21 @@ nil:
 }
 
 /*
- * Buffers for reading data from flash
- */
-#define NAND_MAX_PAGESIZE 4096
-#define NAND_MAX_OOBSIZE 256
-static unsigned char readbuf[NAND_MAX_PAGESIZE];
-static unsigned char oobbuf[NAND_MAX_OOBSIZE];
-
-/*
  * Main program
  */
 int main(int argc, char * const argv[])
 {
 	unsigned long ofs, end_addr = 0;
 	unsigned long long blockstart = 1;
-	int ret, i, fd, ofd, bs, badblock = 0;
-	struct mtd_oob_buf oob = {0, 16, oobbuf};
+	int ret, i, fd, ofd = 0, bs, badblock = 0;
+	struct mtd_oob_buf oob;
 	mtd_info_t meminfo;
 	char pretty_buf[PRETTY_BUF_LEN];
 	int oobinfochanged = 0 ;
 	struct nand_oobinfo old_oobinfo;
 	struct mtd_ecc_stats stat1, stat2;
 	bool eccstats = false;
+	unsigned char *readbuf = NULL, *oobbuf = NULL;
 
 	process_options(argc, argv);
 
@@ -303,21 +297,14 @@ int main(int argc, char * const argv[])
 		exit(EXIT_FAILURE);
 	}
 
-	/* Make sure device page sizes are valid */
-	if (!(meminfo.oobsize == 224 && meminfo.writesize == 4096) &&
-			!(meminfo.oobsize == 218 && meminfo.writesize == 4096) &&
-			!(meminfo.oobsize == 128 && meminfo.writesize == 4096) &&
-			!(meminfo.oobsize == 64 && meminfo.writesize == 4096) &&
-			!(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
-			!(meminfo.oobsize == 32 && meminfo.writesize == 1024) &&
-			!(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
-			!(meminfo.oobsize == 8 && meminfo.writesize == 256)) {
-		fprintf(stderr, "Unknown flash (not normal NAND)\n");
-		close(fd);
-		exit(EXIT_FAILURE);
-	}
-	/* Read the real oob length */
+	/* Allocate buffers */
+	oobbuf = xmalloc(sizeof(oobbuf) * meminfo.oobsize);
+	readbuf = xmalloc(sizeof(readbuf) * meminfo.writesize);
+
+	/* Fill in oob info */
+	oob.start = 0;
 	oob.length = meminfo.oobsize;
+	oob.ptr = oobbuf;
 
 	if (noecc)  {
 		ret = ioctl(fd, MTDFILEMODE, (void *)MTD_MODE_RAW);
@@ -328,20 +315,17 @@ int main(int argc, char * const argv[])
 			case ENOTTY:
 				if (ioctl(fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
 					perror("MEMGETOOBSEL");
-					close(fd);
-					exit(EXIT_FAILURE);
+					goto closeall;
 				}
 				if (ioctl(fd, MEMSETOOBSEL, &none_oobinfo) != 0) {
 					perror("MEMSETOOBSEL");
-					close(fd);
-					exit(EXIT_FAILURE);
+					goto closeall;
 				}
 				oobinfochanged = 1;
 				break;
 			default:
 				perror("MTDFILEMODE");
-				close(fd);
-				exit(EXIT_FAILURE);
+				goto closeall;
 			}
 		}
 	} else {
@@ -364,15 +348,13 @@ int main(int argc, char * const argv[])
 		ofd = STDOUT_FILENO;
 	} else if ((ofd = open(dumpfile, O_WRONLY | O_TRUNC | O_CREAT, 0644)) == -1) {
 		perror(dumpfile);
-		close(fd);
-		exit(EXIT_FAILURE);
+		goto closeall;
 	}
 
 	if (!pretty_print && !forcebinary && isatty(ofd)) {
 		fprintf(stderr, "Not printing binary garbage to tty. Use '-a'\n"
 				"or '--forcebinary' to override.\n");
-		close(fd);
-		exit(EXIT_FAILURE);
+		goto closeall;
 	}
 
 	/* Initialize start/end addresses and block size */
@@ -478,9 +460,11 @@ int main(int argc, char * const argv[])
 			return EXIT_FAILURE;
 		}
 	}
-	/* Close the output file and MTD device */
+	/* Close the output file and MTD device, free memory */
 	close(fd);
 	close(ofd);
+	free(oobbuf);
+	free(readbuf);
 
 	/* Exit happy */
 	return EXIT_SUCCESS;
@@ -494,5 +478,7 @@ closeall:
 	}
 	close(fd);
 	close(ofd);
+	free(oobbuf);
+	free(readbuf);
 	exit(EXIT_FAILURE);
 }
-- 
1.7.0.4
