Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEopC-0000C1-I2
	for linux-mtd@lists.infradead.org; Thu, 11 Jun 2009 18:16:37 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MEopA-0003AR-L1
	for linux-mtd@lists.infradead.org; Thu, 11 Jun 2009 18:16:28 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jun 2009 18:16:28 +0000
Received: from jehan by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jun 2009 18:16:28 +0000
To: linux-mtd@lists.infradead.org
From: Jehan Bing <jehan@orb.com>
Subject: [PATCH] [MTD-UTILS] Fix for perror modifying errno in nandwrite
Date: Thu, 11 Jun 2009 11:16:12 -0700
Message-ID: <4A3149EC.5030705@orb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since perror returns void, I assumed it wouldn't modify errno. I was 
wrong. And since the change was so simple, I didn't test it. Mea culpa. :(

This patch fixes it.
I don't use perror if pwrite fails with EIO because it's not useful. The 
failure of lseek or the message "Erasing failed write ..." implicitly 
says so since it's the only way to reach that code.
There is not such additional message for the MEMERASE error so I use a 
temporary variable instead.


Signed-off-by: Jehan Bing <jehan@orb.com>

--- a/nandwrite.c
+++ b/nandwrite.c
@@ -585,8 +585,8 @@ int main(int argc, char * const argv[])
 			off_t rewind_bytes;
 			erase_info_t erase;
 
-			perror ("pwrite");
 			if (errno != EIO) {
+				perror("pwrite");
 				goto closeall;
 			}
 
@@ -605,8 +605,9 @@ int main(int argc, char * const argv[])
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
