Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JV0x7-0007NL-Na
	for linux-mtd@lists.infradead.org; Fri, 29 Feb 2008 08:50:50 +0000
Subject: Re: Writing JFFS2 to Samsung K9F1208U0B NAND on AMCC PPC405EX/r
	Kilauea/Haleakala
From: =?ISO-8859-1?Q?Schl=E4gl?= "Manfred jun." <manfred.schlaegl@gmx.at>
To: Grant Erickson <gerickson@nuovations.com>
In-Reply-To: <C3EC922E.DAF1%gerickson@nuovations.com>
References: <C3EC922E.DAF1%gerickson@nuovations.com>
Content-Type: text/plain
Date: Fri, 29 Feb 2008 09:50:29 +0100
Message-Id: <1204275029.3408.31.camel@lisa.alm.archives.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, den 28.02.2008, 16:30 -0800 schrieb Grant Erickson:
> I am attempting to create and write a JFFS2 file system to the Samsung
> K9F1208U0B NAND part on an AMCC PPC405EXr "Haleakala" board and seem to be
> running into a hurdle or two.
> 
> Given the Samsung K9F1208U0B's 16 KiB erase block and 512 B page sizes, I
> invoked mkfs.jffs2 with:
> 
> % mkfs.jffs2 -n -b -s 512 -e 16 KiB -d /export/haleakala -o haleakala.img

> I then erase the device with 'flash_eraseall' using the '-j' option:
> 
> # flash_eraseall -j /dev/mtd9
> Erasing 16 Kibyte @ 3f94000 -- 99 % complete. Cleanmarker written at
> 3f94000.
> 
> However, when I attempt to lay down the file system image with nandwrite
> (again, using the '-j' option), I get a driver error:
> 
> # nandwrite -j /dev/mtd9 haleakala.img
> MEMSETOOBSEL: Inappropriate ioctl for device
> 
> Eliding the '-j' option, I get errors about page alignment:
> 
> # nandwrite /dev/mtd9 haleakala.img
> Input file is not page aligned
> Data was only partially written due to error: Success
> 
> The output from 'mtd_debug':
> 
> # mtd_debug info /dev/mtd9
> mtd.type = MTD_NANDFLASH
> mtd.flags = MTD_CAP_NANDFLASH
> mtd.size = 66682880 (63M)
> mtd.erasesize = 16384 (16K)
> mtd.writesize = 512
> mtd.oobsize = 16 
> regions = 0
> 
> The version of mtd-utils is 1.1.0 from the MTD FTP site.
> 
> This occurs with either hand-built kernels using the GIT repo or
> 'git://www.denx.de/git/linux-2.6-denx.git' the latest pre-built kernel
> posted to the AMCC-partner (DENX) site:
> 
>     ftp://ftp.denx.de/pub/linux/images/amcc/kilauea/uImage-g8adfc2c
> 
> # uname -a
> Linux haleakala 2.6.25-rc2-00492-g8adfc2c #1 Sat Feb 23 23:10:15 CET 2008
> ppc unknown
> 
> Anyone have success with writing a JFFS2 file system on these boards or have
> any insight into the errors above?
> 
> Regards,
> 
> Grant Erickson
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

You have to pad(-p) your image, so that it's size is a multiple of page
size
% mkfs.jffs2 -n -b -s 512 -p 512 -e 16 KiB -d /export/haleakala -o
haleakala.img

Then you should be able to write it with:
% nandwrite /dev/mtd9 haleakala.img

greetings
	manfred
