Received: from mx3.acantho.net ([213.174.182.196])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M7PmT-00023D-SQ
	for linux-mtd@lists.infradead.org; Fri, 22 May 2009 08:07:12 +0000
Received: (from root@localhost)
	by mx3.acantho.net (8.13.4/8.13.4/Debian-3sarge1) id n4M86u7w007402
	for <linux-mtd@lists.infradead.org>; Fri, 22 May 2009 10:06:56 +0200
Message-ID: <4A165D15.2030404@eptar.com>
Date: Fri, 22 May 2009 10:06:45 +0200
From: Claudio Lanconelli <lanconelli.claudio@eptar.com>
MIME-Version: 1.0
To: Alberto Panizzo <maramaopercheseimorto@gmail.com>
Subject: Re: ARM: MTD: mxc_nand: Question on NAND Flash support for mxc
References: <20090521174611.5a18ea3a@Marramao-laptop>
In-Reply-To: <20090521174611.5a18ea3a@Marramao-laptop>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alberto Panizzo ha scritto:
> Hi all!
> 
> I am trying to give support for NAND flash device to Atmark Armadillo 500
> developing board.
> This board has an iMX31 processor and is shipped with an ST Micro NAND 256MiB 3,3V 8-bit Flash.
> Atmark support this board with an old 2.6.26 kernel with some modification.
> For this NAND Flash Atmark installed the old Freescale mxc_nd driver brought up by
> Sascha Hauer in the on tree mxc_nand.
> 
> Now the problem:
> With the old driver kernel message is as follow:
> --
> MXC MTD nand Driver 2.0
> NAND device: Manufacturer ID: 0x20, Chip ID: 0xda (ST Micro NAND 256MiB 3,3V 8-bit)
> Scanning device for bad blocks
> Bad eraseblock 592 at 0x04a00000
> Creating 4 MTD partitions on "NAND 256MiB 3,3V 8-bit":
> --
> 
> With the new in tree driver i get:
> --
> NAND device: Manufacturer ID: 0x20, Chip ID: 0xda (ST Micro NAND 256MiB 3,3V 8-bit)
> Scanning device for bad blocks
> Bad eraseblock 0 at 0x000000000000
> Bad eraseblock 1 at 0x000000020000
> Bad eraseblock 2 at 0x000000040000
> Bad eraseblock 3 at 0x000000060000
> Bad eraseblock 4 at 0x000000080000
> Bad eraseblock 5 at 0x0000000a0000
> Bad eraseblock 6 at 0x0000000c0000
> Bad eraseblock 7 at 0x0000000e0000
> .... all blocks ...
> Bad eraseblock 2045 at 0x00000ffa0000
> Bad eraseblock 2046 at 0x00000ffc0000
> Bad eraseblock 2047 at 0x00000ffe0000
> RedBoot partition parsing not available
> Registering mxc_nand as whole device
> --
> 
> All blocks are recognized as Bad eraseblocks! 

Hi Alberto,

The problem is that mx nand controller doesn't use standard oob layout for large page nand, instead it uses the same layout of the small page nand, some sort of concatenation of four small pages oob.

AFAIK you need at least two changes to use large page nand.

The first one is to use a correct oob layout (especially if you plan to use YAFFS):

+static struct nand_ecclayout nand_hw_eccoob_2k = {
+	.eccbytes = 20,
+	.eccpos = {6, 7, 8, 9, 10, 22, 23, 24, 25, 26,
+		   38, 39, 40, 41, 42, 54, 55, 56, 57, 58},
+	.oobfree = {
+		    {.offset = 0,
+		     .length = 5},
+
+		    {.offset = 11,
+		     .length = 10},
+
+		    {.offset = 27,
+		     .length = 10},
+
+		    {.offset = 43,
+		     .length = 10},
+
+		    {.offset = 59,
+		     .length = 5}
+		    }
+};
+

The second one is to look for bad block descriptor on location 5 instead of 0. Location 5 is the standard for small page devices. You also need to check that the nand flash you use is shipped with both 0 and 5 locations marked for bad blocks.

+	if (!this->badblock_pattern) {
+		if (mtd->writesize == 2048)
+			this->badblock_pattern = &smallpage_memorybased;
+		else
+			this->badblock_pattern = (mtd->writesize > 512) ?
+			    &largepage_memorybased : &smallpage_memorybased;
+	}

Give a look at Freescale patches to find all the changes needed.
Probably there is a better way to solve the problem, any suggestion by MTD gurus?

Cheers,
Claudio Lanconelli
