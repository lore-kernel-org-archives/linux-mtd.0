Received: from mail94.messagelabs.com ([216.82.241.179])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MG8Ae-0002cy-Ta
	for linux-mtd@lists.infradead.org; Mon, 15 Jun 2009 09:08:11 +0000
To: linux-mtd@lists.infradead.org
Subject: Problem with jffs2 on linux 2.6.23 
MIME-Version: 1.0
Message-ID: <OFA28454EB.D09A6F01-ON652575D6.002DC4B1-652575D6.0031F5DB@lntemsys.com>
From: Rupesh Kumar <Rupesh.Kumar@Lntemsys.com>
Date: Mon, 15 Jun 2009 14:46:22 +0530
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
We are using jffs2 RFS for our board with linux 2.6.23 . we are suing nand 
write.jffs2 utility in the u-boot to burn the image on to the 
nand flash, 

Our problem is
Booting First time with the RFS seems to be fine. As system run and we do 
reboot system it prints following messages and boots up.
///////////////////////////
mtd->read(0x400 bytes from 0x1b00000) returned ECC error
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01b001d0: 
0xfffe instead
mtd->read(0x400 bytes from 0x2500000) returned ECC error
mtd->read(0x400 bytes from 0x27c0000) returned ECC error
mtd->read(0x400 bytes from 0x2c20000) returned ECC error
mtd->read(0x400 bytes from 0x2cc0000) returned ECC error
mtd->read(0x400 bytes from 0x2d00000) returned ECC error
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x02d00074: 
0xfffe instead
Empty flash at 0x02d00078 ends at 0x02d003e4
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x02d003e4: 
0xffef instead
Empty flash at 0x02d003e8 ends at 0x02d00780
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x02d00780: 
0xfffb instead
mtd->read(0x400 bytes from 0x3320000) returned ECC error
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x03320190: 
0xffff instead
Empty flash at 0x03320194 ends at 0x0332047c
////////////////////////////
During run time also it prints these messages.

I am not able to understand the cause of this error. Please help me in 
fixing this error.

The same file system is working fine with the linux 2.6.20 kernel.
Thanks
