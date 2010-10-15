Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6ey9-00079T-6q
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 07:44:51 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd-utils: nanddump: Dynamic buffer, increase
	pagesize/oobsize
Date: Fri, 15 Oct 2010 00:44:24 -0700
Message-ID: <1287128665-6573-2-git-send-email-computersforpeace@gmail.com>
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

The buffers used for dumping page and OOB data needed dynamic
allocation to help eliminate burdens for updating (i.e., every
time there's a new OOB size we don't have to increase the sizes).

Also, there is no need to check flash chips for "standard sizes."
With recent changes to the printing codebase, we should be able to
handle arbitrary sizes with no problem.

More exit operations are now necessary on program failure, so
"goto closeall" is used more liberally.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   71 +++++++++++++++++++++++++++++------------------------------
 1 files changed, 35 insertions(+), 36 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 00762a5..c71c7a6 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -265,28 +265,21 @@ nil:
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
+	static unsigned char *readbuf, *oobbuf;
 
 	process_options(argc, argv);
 
@@ -303,21 +296,22 @@ int main(int argc, char * const argv[])
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
+	/* Allocate buffers */
+	oobbuf = malloc(sizeof(oobbuf) * meminfo.oobsize);
+	if (!oobbuf) {
+		perror("malloc");
+		goto closeall;
 	}
-	/* Read the real oob length */
+	readbuf = malloc(sizeof(readbuf) * meminfo.writesize);
+	if (!readbuf) {
+		perror("malloc");
+		goto closeall;
+	}
+
+	/* Fill in oob info */
+	oob.start = 0;
 	oob.length = meminfo.oobsize;
+	oob.ptr = oobbuf;
 
 	if (noecc)  {
 		ret = ioctl(fd, MTDFILEMODE, (void *)MTD_MODE_RAW);
@@ -328,20 +322,17 @@ int main(int argc, char * const argv[])
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
@@ -364,15 +355,13 @@ int main(int argc, char * const argv[])
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
@@ -478,9 +467,11 @@ int main(int argc, char * const argv[])
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
@@ -492,7 +483,15 @@ closeall:
 			perror("MEMSETOOBSEL");
 		}
 	}
-	close(fd);
-	close(ofd);
+	if (fd) {
+		close(fd);
+		if (ofd) {
+			close(ofd);
+		}
+	}
+	if (oobbuf)
+		free(oobbuf);
+	if (readbuf)
+		free(readbuf);
 	exit(EXIT_FAILURE);
 }
-- 
1.7.0.4
