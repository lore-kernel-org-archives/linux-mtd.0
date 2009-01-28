Received: from mail.kernelconcepts.de ([212.60.202.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LS9Xy-0003pL-KK
	for linux-mtd@lists.infradead.org; Wed, 28 Jan 2009 12:29:37 +0000
Message-ID: <49804FA3.7010604@kernelconcepts.de>
Date: Wed, 28 Jan 2009 13:29:23 +0100
From: Nils Faerber <nils.faerber@kernelconcepts.de>
MIME-Version: 1.0
To: Will Wagner <will_wagner@carallon.com>
Subject: Re: NAND and JFFS2 newbie question
References: <497F3CBF.4000309@carallon.com>
In-Reply-To: <497F3CBF.4000309@carallon.com>
Content-Type: text/plain; charset=ISO-8859-1
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

Will Wagner schrieb:
> Hi All,
> 
> I have an arm iMx31 board with 128M of NAND flash. It all appears to be working however I 
> get a lot of error/warning messages and I'd just like to check I am doing things right.
> 
> The NAND chip is a ST NAND01G-B2B used in 8-bit mode which has 2048+64 byte pages and 128k 
> block size. Linux is 2.6.24.7 with Freescale patches for MTD support on the iMx31 chip.
> 
> I am wanting to create a JFFS2 partition on the device. The partition is created using:
> 
> mkfs.jffs2 -s 2 -e 128 -c 12 -o fs.jffs2 -r jffs2_fs

I guess one of the problems will be that the sizes you specified are way
too small. Fomr the man-page of mkfs.jffs2:
"Options that take SIZE arguments can be specified as either decimal
(e.g., 65536), octal (0200000), or hexidecimal (0x1000)"

So for an eraseblocksize of 128kbytes you would specify "-e 131072".

Wrong settings can confuse jffs2 pretty easily.

> Thanks,
> Will
Cheers
  nils faerber

-- 
kernel concepts GbR        Tel: +49-271-771091-12
Sieghuetter Hauptweg 48    Fax: +49-271-771091-19
D-57072 Siegen             Mob: +49-176-21024535
http://www.kernelconcepts.de
