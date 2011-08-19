Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuSm1-0004KC-U2
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 17:22:26 +0000
Received: by yic13 with SMTP id 13so2681364yic.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 10:22:24 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 06/10] nandwrite: kill more MEMSETOOBSEL
Date: Fri, 19 Aug 2011 10:07:52 -0700
Message-Id: <1313773676-12879-7-git-send-email-computersforpeace@gmail.com>
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

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |   26 +-------------------------
 1 files changed, 1 insertions(+), 25 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 2700975..22e9b7f 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -44,10 +44,6 @@
 #include <libmtd.h>
 
 // oob layouts to pass into the kernel as default
-static struct nand_oobinfo none_oobinfo = {
-	.useecc = MTD_NANDECC_OFF,
-};
-
 static struct nand_oobinfo jffs2_oobinfo = {
 	.useecc = MTD_NANDECC_PLACE,
 	.eccbytes = 6,
@@ -318,18 +314,7 @@ int main(int argc, char * const argv[])
 		} else {
 			switch (errno) {
 			case ENOTTY:
-				if (ioctl(fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
-					perror("MEMGETOOBSEL");
-					close(fd);
-					exit(EXIT_FAILURE);
-				}
-				if (ioctl(fd, MEMSETOOBSEL, &none_oobinfo) != 0) {
-					perror("MEMSETOOBSEL");
-					close(fd);
-					exit(EXIT_FAILURE);
-				}
-				oobinfochanged = 1;
-				break;
+				errmsg_die("ioctl MTDFILEMODE is missing");
 			default:
 				perror("MTDFILEMODE");
 				close(fd);
@@ -670,15 +655,6 @@ restoreoob:
 	libmtd_close(mtd_desc);
 	free(filebuf);
 	free(oobbuf);
-
-	if (oobinfochanged == 1) {
-		if (ioctl(fd, MEMSETOOBSEL, &old_oobinfo) != 0) {
-			perror("MEMSETOOBSEL");
-			close(fd);
-			exit(EXIT_FAILURE);
-		}
-	}
-
 	close(fd);
 
 	if (failed
-- 
1.7.6
