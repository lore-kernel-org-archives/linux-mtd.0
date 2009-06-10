Received: from mail171.messagelabs.com ([216.82.253.243])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MELS6-0006ZU-8J
	for linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 10:54:49 +0000
To: linux-mtd@lists.infradead.org
Subject: Problem with jffs2 on linux 2.6.23 
MIME-Version: 1.0
Message-ID: <OFF8EC77B8.713027F5-ON652575D1.003C5F9B-652575D1.003BDAD6@lntemsys.com>
From: Rupesh Kumar <Rupesh.Kumar@Lntemsys.com>
Date: Wed, 10 Jun 2009 16:33:31 +0530
Content-Type: text/plain; charset="US-ASCII"
Cc: Virupax SS <Virupax.SS@Lntemsys.com>
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

The same file system is working fine with the linux 2.6.20 kernel.

I am not able to understand the cause of this error. Please help me in 
fixing this error.

Thanks
Rupesh
 
