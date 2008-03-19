Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jbu4g-0003VM-Pt
	for linux-mtd@lists.infradead.org; Wed, 19 Mar 2008 08:55:07 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Jbu4c-00024R-Dj
	for linux-mtd@lists.infradead.org; Wed, 19 Mar 2008 08:55:02 +0000
Received: from gateway.scopus.co.il ([62.90.123.5])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Mar 2008 08:55:02 +0000
Received: from gxkahn by gateway.scopus.co.il with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Mar 2008 08:55:02 +0000
To: linux-mtd@lists.infradead.org
From: gxk <gxkahn@gmail.com>
Subject: question > new jffs2 partition 
Date: Wed, 19 Mar 2008 10:38:02 -0400
Message-ID: <frqjtj$ggi$1@ger.gmane.org>
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

Does the kernel format erased flash, defined as partition?

 From the Uboot prompt i erase the space:
erase 0xa0000000 +2800000

Configured my kernel to have 3 partitions.
The 3rd is started at address 0xa0000000 with size 0x2800000.
This partition mounted at system boot:

mount -t jffs22 /dev/mtdblock/2 /mnt

and after simple make dir

mkdir -p /mnt/abcd

Now, when i start the system 1st time, it is taking more time to load
at the `mkdir'. All follow reboots go smooth.

It is look like mtd driver formats the partition. Can anybody confirm this?
When is it happen?

Thanks for help.
