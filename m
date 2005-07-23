Received: from ns2.iis5.net ([64.239.149.224] helo=matrixtelesol.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DwD8M-0007ST-L4
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2005 02:05:20 -0400
Received: from 192.168.50.95 by matrixindia1 ([192.168.50.100] running VPOP3)
	with SMTP for <linux-mtd@lists.infradead.org>;
	Sat, 23 Jul 2005 11:31:33 +0530
Message-ID: <000f01c58f4c$771860e0$5f32a8c0@MATRIX>
From: "Ashish Chavan" <ashish.chavan@matrixtelesol.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Sat, 23 Jul 2005 11:35:02 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Using fdisk to partition DOC 2000 Millenium
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
    I am building a linux system for ICOP 386 single board computer with 8
MB RAM and 8 MB Disk On Chip Millenium. Till now I have successfully boot
Kernel 2.6.12.2 booting from a ext2 partition on an NFTL device.

Now I want to partition my DOC in to two partitions so that,
 - First partition can be mounted as READ ONLY which contains kernel, boot
loader and other utilities
 - Second partition can be used for data related to my main application;
which need to be rewritten  many times during run time. i.e. I need a
READ/WRITE patition.

After browsing this archieve I came to know that the "docfdisk" utility
which is included in MTD tools works only for INFTL devices and not for NFTL
devices. I want to know that can I use normal fdisk to partition my DOC 2000
Millenium?

Would it be advantageous if I use jffs2 instead of ext2 considering the very
low memory that my board has? Can some one make expert comments?

Any help would be greatly appreciated.

Thanks,

--Ashish
