Received: from mail87.messagelabs.com ([216.82.250.19])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MRSRS-00044c-Ca
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 15:00:21 +0000
To: linux-mtd@lists.infradead.org
Subject: ECC & Magic bitmask errors with JFFS2 file system on 6.23 kernel for
	powerpc
MIME-Version: 1.0
Message-ID: <OFCCF65728.700286E7-ON652575F5.00531F58-652575F5.00522500@lntemsys.com>
From: Rupesh Kumar <Rupesh.Kumar@Lntemsys.com>
Date: Thu, 16 Jul 2009 20:39:14 +0530
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

We are using Linux kernel 2.6.23 from freescale LTIB 
(MPC8313E_RDB_K26_20081226-LTIB.iso) on our custom board. 
JFFS2 is used as RFS and  nand write.jffs2 utility in the u-boot is used 
to burn the image on to the nand flash. 

When we boot for the first time everything seems to be OK. On subsequent 
reboots we are seeing following error messages reported by kernel on 
bootup. 
In addition we also see Magic bitmask errors being reported. 

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

We verified erase size passed as an argument for creating jffs2 file 
system (initial googling on the issue).
After contacting freescale we came to know that, it is a known issue and 
they dont have planned to work on this in near future. :(
Please give your valuable suggestions so that we can fix this problem and 
make our board running properly.

Thanks
Rupesh
 
