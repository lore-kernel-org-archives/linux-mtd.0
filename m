Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HRTQo-0005fB-VB
	for linux-mtd@lists.infradead.org; Wed, 14 Mar 2007 13:22:23 +0000
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e1.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l2EDHAs8009859
	for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2007 09:17:10 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l2EDHAPv037206
	for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2007 09:17:10 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l2EDHAAm031850
	for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2007 09:17:10 -0400
Subject: [PATCH] [MTD] MTD-Utils: fix handling of ioctl return value in
	nand-utils
From: Frank Haverkamp <haver@vnet.ibm.com>
To: Josh Boyer <jwboyer@gmail.com>
Content-Type: text/plain
Date: Wed, 14 Mar 2007 14:17:07 +0100
Message-Id: <1173878228.4048.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	MTD Mailinglist <linux-mtd@lists.infradead.org>,
	Frank Haverkamp <haver@vnet.ibm.com>
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Older kernel do not implement the MTDFILEMODE ioctl. In this case
nandwrite and nanddump should have used MEMGETOOBSEL in combination
with MEMSETOOBSEL. Unfortunately the return value of the unsucessfull
ioctl is not -ENOTTY, but -1 and errno contains ENOTTY. This change
fixes this issue. I have not tested all cornercases. Would be
good if someone could do more careful testing than I did, or maybe
reviewing is sufficient in this case.

Signed-off-by: Frank Haverkamp <haver@vnet.ibm.com>
---
 nanddump.c  |   16 ++++++++--------
 nandwrite.c |   14 +++++++-------
 2 files changed, 15 insertions(+), 15 deletions(-)

--- mtd-utils.git.orig/nandwrite.c
+++ mtd-utils.git/nandwrite.c
@@ -271,9 +271,12 @@ int main(int argc, char **argv)
 	}
 
 	if (noecc)  {
-		switch (ioctl(fd, MTDFILEMODE, (void *) MTD_MODE_RAW)) {
-
-			case -ENOTTY:
+		ret = ioctl(fd, MTDFILEMODE, (void *) MTD_MODE_RAW);
+		if (ret == 0) {
+			oobinfochanged = 2;
+		} else {
+			switch (errno) {
+			case ENOTTY:
 				if (ioctl (fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
 					perror ("MEMGETOOBSEL");
 					close (fd);
@@ -286,14 +289,11 @@ int main(int argc, char **argv)
 				}
 				oobinfochanged = 1;
 				break;
-
-			case 0:
-				oobinfochanged = 2;
-				break;
 			default:
 				perror ("MTDFILEMODE");
 				close (fd);
 				exit (1);
+			}
 		}
 	}
 
--- mtd-utils.git.orig/nanddump.c
+++ mtd-utils.git/nanddump.c
@@ -170,7 +170,7 @@ int main(int argc, char **argv)
 {
 	unsigned long ofs, end_addr = 0;
 	unsigned long long blockstart = 1;
-	int i, fd, ofd, bs, badblock = 0;
+	int ret, i, fd, ofd, bs, badblock = 0;
 	struct mtd_oob_buf oob = {0, 16, oobbuf};
 	mtd_info_t meminfo;
 	char pretty_buf[80];
@@ -206,9 +206,12 @@ int main(int argc, char **argv)
 	oob.length = meminfo.oobsize;
 
 	if (noecc)  {
-		switch (ioctl(fd, MTDFILEMODE, (void *) MTD_MODE_RAW)) {
-
-			case -ENOTTY:
+		ret = ioctl(fd, MTDFILEMODE, (void *) MTD_MODE_RAW);
+		if (ret == 0) {
+			oobinfochanged = 2;
+		} else {
+			switch (errno) {
+			case ENOTTY:
 				if (ioctl (fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
 					perror ("MEMGETOOBSEL");
 					close (fd);
@@ -221,14 +224,11 @@ int main(int argc, char **argv)
 				}
 				oobinfochanged = 1;
 				break;
-
-			case 0:
-				oobinfochanged = 2;
-				break;
 			default:
 				perror ("MTDFILEMODE");
 				close (fd);
 				exit (1);
+			}
 		}
 	} else {
 
