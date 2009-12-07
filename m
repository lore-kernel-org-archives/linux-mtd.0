Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NHXaP-0006bs-NG
	for linux-mtd@lists.infradead.org; Mon, 07 Dec 2009 07:00:50 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id
	nB770iD2014665 for <linux-mtd@lists.infradead.org>;
	Mon, 7 Dec 2009 00:00:44 -0700 (MST)
Received: from zmy16exm21.fsl.freescale.net (zmy16exm21.ap.freescale.net
	[10.211.3.25])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id nB774oH0020030
	for <linux-mtd@lists.infradead.org>;
	Mon, 7 Dec 2009 01:04:51 -0600 (CST)
Date: Mon, 7 Dec 2009 15:00:39 +0800
From: "Shaohui Xie" <b21989@freescale.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Subject: Is there a 64-bits version of flash_eraseall for 8GB nand
Message-ID: <200912071500385779149@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
 
I have a Powerpc mpc5125 board, it has a 8GB nand on it. When I use user space tool falsh_eraseall to erase the whole nand chip, I found the tool can not erase the space over 4GB. I did some search and found a patch "use new 64-bit ioctls + sysfs to support >4GiB devices" at http://patchwork.ozlabs.org/patch/25583/, I patched this patch to mtd-utils and rebuilt it, when I run the new flash_eraseall on my board I got error messages:"./flash_eraseall: /dev/mtd0: MTD Erase failure: Inappropriate ioctl for device". Does anybody know whether there is a 64-bits version of flash_eraseall or any other tools can erase 8GB nand or not? Any idea will be appreciated.
 
Here are details of the nand flash and log: 
Page size: 4k+218bytes 
Block size: 1M 

#cat /proc/mtd 
dev:    size   erasesize  name 
mtd0: 1ff300000 00100000 "filesystem-nand"


2009-12-07 

Best Regards,
Shaohui Xie
