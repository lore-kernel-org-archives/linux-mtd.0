Received: from fk-out-0910.google.com ([209.85.128.186])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M7ATH-00038y-6R
	for linux-mtd@lists.infradead.org; Thu, 21 May 2009 15:46:21 +0000
Received: by fk-out-0910.google.com with SMTP id z22so497200fkz.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 May 2009 08:46:12 -0700 (PDT)
Date: Thu, 21 May 2009 17:46:11 +0200
From: Alberto Panizzo <maramaopercheseimorto@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: ARM: MTD: mxc_nand: Question on NAND Flash support for mxc
Message-ID: <20090521174611.5a18ea3a@Marramao-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all!

I am trying to give support for NAND flash device to Atmark Armadillo 500
developing board.
This board has an iMX31 processor and is shipped with an ST Micro NAND 256MiB 3,3V 8-bit Flash.
Atmark support this board with an old 2.6.26 kernel with some modification.
For this NAND Flash Atmark installed the old Freescale mxc_nd driver brought up by
Sascha Hauer in the on tree mxc_nand.

Now the problem:
With the old driver kernel message is as follow:
--
MXC MTD nand Driver 2.0
NAND device: Manufacturer ID: 0x20, Chip ID: 0xda (ST Micro NAND 256MiB 3,3V 8-bit)
Scanning device for bad blocks
Bad eraseblock 592 at 0x04a00000
Creating 4 MTD partitions on "NAND 256MiB 3,3V 8-bit":
--

With the new in tree driver i get:
--
NAND device: Manufacturer ID: 0x20, Chip ID: 0xda (ST Micro NAND 256MiB 3,3V 8-bit)
Scanning device for bad blocks
Bad eraseblock 0 at 0x000000000000
Bad eraseblock 1 at 0x000000020000
Bad eraseblock 2 at 0x000000040000
Bad eraseblock 3 at 0x000000060000
Bad eraseblock 4 at 0x000000080000
Bad eraseblock 5 at 0x0000000a0000
Bad eraseblock 6 at 0x0000000c0000
Bad eraseblock 7 at 0x0000000e0000
.... all blocks ...
Bad eraseblock 2045 at 0x00000ffa0000
Bad eraseblock 2046 at 0x00000ffc0000
Bad eraseblock 2047 at 0x00000ffe0000
RedBoot partition parsing not available
Registering mxc_nand as whole device
--

All blocks are recognized as Bad eraseblocks! 

Digging the problem I switch off bbt scanning  and Bad eraseblock check in flash_eraseall (mtd utils 1.2.0)
running this utility results  in a mixture of:
--
Erasing 128 Kibyte @ 2e60000 -- 18 % complete.
flash_eraseall: /dev/mtd4: MTD Erase failure: Input/output error

Erasing 128 Kibyte @ 2ea0000 -- 18 % nand_erase: attempt to erase a bad block at page 0x00005e40
--

Thanks for any suggestions.

Alberto!
