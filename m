Received: from web50809.mail.re2.yahoo.com ([206.190.38.252])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JTuBk-0003Zd-1O
	for linux-mtd@lists.infradead.org; Tue, 26 Feb 2008 07:25:20 +0000
Date: Mon, 25 Feb 2008 23:18:38 -0800 (PST)
From: Mangesh Edake <m_edake@yahoo.com>
Subject: Re: JFFS2 as rootfs on DataFlash
To: michael <trimarchi@gandalf.sssup.it>
In-Reply-To: <47BDC7EF.5060603@gandalf.sssup.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <813562.16599.qm@web50809.mail.re2.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Michel,

> No,
> using in linux flash_eraseall to clean your
> partition. Maybe start from 
> a ramdisk.
In this case flash_eraseall will demand for write_oob
which is absent in my dataflash kernel driver. 

> It is the only partinion? If no, you must remember
> to align it at a 
> block size.
> Example my partionin start from 0x131400
My partition starts at 0x14a000, which is a multiple
of block size 0x2100.

> 
> setenv bootargs console=ttyS0,115200 mem=8M
> rootfstype=jffs2 
> root=/dev/mtdblock1
> rw
>
mtdparts=spi0.1-AT45DB321x:1221k(ARMboot)ro,-@1221k(root)
I'm already creating mtd partitons statically in my
driver and would not prefer to create through
commandline.

> For the creation use:
> mkfs.jffs2 -d romfs -l -p -e 0x2100 -v -n -o
> images/ramdisk.img > log.txt
> 
Doing same!

Please tell me for my dataflash, does the behaviour of
creating image, writing image and reading-writing to
flash should look like exactly as nand-flash or so..?
Incase of Nandflash, data and oob is treated
separately, means normal read-write functions are for
512 bytes and oob functions for 16-byte oob. Even I
think, image creation for nand is mostly done with
eraseblock size in multiples of 512 (0x200) bytes.
e.g mkfs.jffs2 -e 0x4000 etc   
So should I do the same?

--
Thanks and Regards,
Mangesh Edake.



      ____________________________________________________________________________________
Looking for last minute shopping deals?  
Find them fast with Yahoo! Search.  http://tools.search.yahoo.com/newsearch/category.php?category=shopping
