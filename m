Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JcF2t-00059n-1q
	for linux-mtd@lists.infradead.org; Thu, 20 Mar 2008 07:18:39 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JcF2m-0004pG-F3
	for linux-mtd@lists.infradead.org; Thu, 20 Mar 2008 07:18:32 +0000
Received: from gateway.scopus.co.il ([62.90.123.5])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2008 07:18:32 +0000
Received: from gxkahn by gateway.scopus.co.il with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2008 07:18:32 +0000
To: linux-mtd@lists.infradead.org
From: gxk <gxkahn@gmail.com>
Subject: jffs2 behaviour
Date: Thu, 20 Mar 2008 09:09:23 -0400
Message-ID: <frt340$mjh$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
Reply-To: gxkahn@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have kernel 2.6.10 with 3 partitions:
offset		size
0		900000
900000		a00000
1300000		1400000

window address is 0xd0000000

In the uboot prompt doing burn for 2nd partition
erase 0xd09000 +a0000
tftp 0x3800000 image
cp 0x3800000 0xd0900000

The system starts well, but follow messages appear
Mounting /mnt/flash: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x00065400: 0xd9d5 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00065404: 0x20a1 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006540c: 0x923f 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00067400: 0x5351 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00067404: 0x7465 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00067408: 0x6f72 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006740c: 0x7420 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00067410: 0x0400 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00067414: 0x0040 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00067464: 0x0500 
instead

They will not appear at 2nd boot.

The workaround for this is to erase 3rd partition after burning the 2nd.

Can somebody can explain how to fix this behavior w/o erasing 3rd partition?

thanks in advance.
