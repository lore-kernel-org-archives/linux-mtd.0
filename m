Received: from cl-1816.ham-01.de.sixxs.net ([2001:6f8:900:717::2]
	helo=ds10.mine.nu)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJGcz-0007xh-PX
	for linux-mtd@lists.infradead.org; Mon, 19 Feb 2007 17:05:00 -0500
Received: from e177163028.adsl.alicedsl.de ([85.177.163.28]
	helo=[192.168.16.246])
	by ds10.mine.nu with esmtpsa (TLS-1.0:RSA_ARCFOUR_MD5:16) (Exim 4.50)
	id 1HJG4x-00041F-AB
	for linux-mtd@lists.infradead.org; Mon, 19 Feb 2007 22:29:47 +0100
Subject: [PATCH] block2mtd oops in erase function.
From: Felix Fietkau <nbd@openwrt.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 19 Feb 2007 22:29:39 +0100
Message-Id: <1171920579.4996.8.camel@celeron>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I have a small fix for a crash that happened when I was using jffs2
in combination with block2mtd.c

In the erase function when checking the block to see if it's already
erased, the limit is to be set to the page_address(page) + PAGE_SIZE,
but because the variable has the type (ulong *), it gets set to
PAGE_SIZE*sizeof(ulong), which makes the kernel oops when the page is
very close to the end of RAM.

Signed-off-by: Felix Fietkau <nbd@openwrt.org>

--- linux.dev/drivers/mtd/devices/block2mtd.c.old	2007-02-18 14:08:59.519952312 +0100
+++ linux.dev/drivers/mtd/devices/block2mtd.c	2007-02-18 14:09:04.219237912 +0100
@@ -111,7 +111,7 @@
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
-		max = (u_long*)page_address(page) + PAGE_SIZE;
+		max = (u_long*) ((u8 *) page_address(page) + PAGE_SIZE);
 		for (p=(u_long*)page_address(page); p<max; p++)
 			if (*p != -1UL) {
 				lock_page(page);
