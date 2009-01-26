Received: from web63005.mail.re1.yahoo.com ([69.147.96.216])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LRRCZ-0004ic-7H
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2009 13:08:34 +0000
Date: Mon, 26 Jan 2009 05:08:29 -0800 (PST)
From: syed riyaz <forriyaz@yahoo.com>
Subject: mtd nand issue
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <15731.47945.qm@web63005.mail.re1.yahoo.com>
Reply-To: forriyaz@yahoo.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi I use a 2K page size 1 GB nand chip on a mx31 ads basd board. At redboot level, read and write happpen perfectly. Even in kernel, flash_eraseall is fine. Then i did nanddump -p and saw 0xff on all addresses. So i believe the nand driver is fine.I am trying to use a nand partition as my rootfilesystem. I have partioned nand into 4 mtd blocks. 60 MB for the first 3 and and the remaining 820 in the 4th block. I created a 8 MB jffs2 file system named rootfs.jffs2 with the proper erase size. Wrote to mtd block 6 usingnandwrite /dev/mtd/6 rootfs.jffs2When linux mounted this block, i went in fine for the first time. But subsequent booting returned lot of CRC errors until the file system was hopelessly currupted. Any help appreciated.The messages are likemtd->read:0x100 bytes from block 0 CRC error.I read somewhere that the factory information about bad blocks is stores in first block and if erased will lead to errors. Pleas elaborate if you know.Please
 answer my queries so i understand things a litle better.1) Is it ok to flash a 8 MB image on a 60 MB partion. Are the errors because the remaining partition doesnt match?2) If i specify "root=/dev/mtdblock6" while booting, does the kernel see only mtd7 as available space or will mtd5 and mtd7 and mtd8 will also be available as user space.3)What does nandwrite -a -p mean?

 Thanking you


      
