Received: from exhub015-4.exch015.msoutlookonline.net ([207.5.72.96])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MYr2b-0004Ch-O4
	for linux-mtd@lists.infradead.org; Thu, 06 Aug 2009 00:41:14 +0000
Message-ID: <4A7A26A4.6060803@orb.com>
Date: Wed, 5 Aug 2009 17:41:08 -0700
From: Jehan Bing <jehan@orb.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/5 v3] [MTD-UTILS] Unified reading from standard input and
	from file
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix incorrect use of errno.

Signed-off-by: Jehan Bing <jehan@orb.com>

--- a/nandwrite.c	2009-08-04 17:10:59.000000000 -0700
+++ b/nandwrite.c	2009-08-04 17:11:03.000000000 -0700
@@ -626,8 +626,8 @@ int main(int argc, char * const argv[])
 		if (pwrite(fd, writebuf, meminfo.writesize, mtdoffset) != meminfo.writesize) {
 			erase_info_t erase;
 
-			perror ("pwrite");
 			if (errno != EIO) {
+				perror("pwrite");
 				goto closeall;
 			}
 
@@ -639,8 +639,9 @@ int main(int argc, char * const argv[])
 			fprintf(stderr, "Erasing failed write from %08lx-%08lx\n",
 				(long)erase.start, (long)erase.start+erase.length-1);
 			if (ioctl(fd, MEMERASE, &erase) != 0) {
+				int errno_tmp = errno;
 				perror("MEMERASE");
-				if (errno != EIO) {
+				if (errno_tmp != EIO) {
 					goto closeall;
 				}
 			}
