Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuSZH-0003lS-LS
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 17:09:18 +0000
Received: by yic13 with SMTP id 13so2670104yic.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 10:09:14 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 10/10] nanddump: kill usages of MEMSETOOBSEL ioctl
Date: Fri, 19 Aug 2011 10:07:56 -0700
Message-Id: <1313773676-12879-11-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
References: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ioctl MEMSETOOBSEL hasn't existed for a long time. Using it as a
backup to MTDFILEMODE is pointless, so just remove every time it is
used.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |   43 +++----------------------------------------
 1 files changed, 3 insertions(+), 40 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 0b931db..7a24c0d 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -34,10 +34,6 @@
 #include "common.h"
 #include <libmtd.h>
 
-static struct nand_oobinfo none_oobinfo = {
-	.useecc = MTD_NANDECC_OFF,
-};
-
 static void display_help(void)
 {
 	printf(
@@ -309,11 +305,10 @@ int main(int argc, char * const argv[])
 {
 	long long ofs, end_addr = 0;
 	long long blockstart = 1;
-	int ret, i, fd, ofd = 0, bs, badblock = 0;
+	int i, fd, ofd = 0, bs, badblock = 0;
 	struct mtd_dev_info mtd;
 	char pretty_buf[PRETTY_BUF_LEN];
-	int oobinfochanged = 0, firstblock = 1;
-	struct nand_oobinfo old_oobinfo;
+	int firstblock = 1;
 	struct mtd_ecc_stats stat1, stat2;
 	bool eccstats = false;
 	unsigned char *readbuf = NULL, *oobbuf = NULL;
@@ -341,26 +336,9 @@ int main(int argc, char * const argv[])
 	readbuf = xmalloc(sizeof(readbuf) * mtd.min_io_size);
 
 	if (noecc)  {
-		ret = ioctl(fd, MTDFILEMODE, MTD_MODE_RAW);
-		if (ret == 0) {
-			oobinfochanged = 2;
-		} else {
-			switch (errno) {
-			case ENOTTY:
-				if (ioctl(fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
-					perror("MEMGETOOBSEL");
-					goto closeall;
-				}
-				if (ioctl(fd, MEMSETOOBSEL, &none_oobinfo) != 0) {
-					perror("MEMSETOOBSEL");
-					goto closeall;
-				}
-				oobinfochanged = 1;
-				break;
-			default:
+		if (ioctl(fd, MTDFILEMODE, MTD_MODE_RAW) != 0) {
 				perror("MTDFILEMODE");
 				goto closeall;
-			}
 		}
 	} else {
 		/* check if we can read ecc stats */
@@ -498,15 +476,6 @@ int main(int argc, char * const argv[])
 			write(ofd, oobbuf, mtd.oob_size);
 	}
 
-	/* reset oobinfo */
-	if (oobinfochanged == 1) {
-		if (ioctl(fd, MEMSETOOBSEL, &old_oobinfo) != 0) {
-			perror("MEMSETOOBSEL");
-			close(fd);
-			close(ofd);
-			return EXIT_FAILURE;
-		}
-	}
 	/* Close the output file and MTD device, free memory */
 	close(fd);
 	close(ofd);
@@ -517,12 +486,6 @@ int main(int argc, char * const argv[])
 	return EXIT_SUCCESS;
 
 closeall:
-	/* The new mode change is per file descriptor ! */
-	if (oobinfochanged == 1) {
-		if (ioctl(fd, MEMSETOOBSEL, &old_oobinfo) != 0)  {
-			perror("MEMSETOOBSEL");
-		}
-	}
 	close(fd);
 	close(ofd);
 	free(oobbuf);
-- 
1.7.6
