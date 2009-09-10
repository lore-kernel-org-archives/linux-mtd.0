Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mlhkb-0002vv-TZ
	for linux-mtd@lists.infradead.org; Thu, 10 Sep 2009 11:23:45 +0000
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1Mlhka-0002eu-JL
	for linux-mtd@lists.infradead.org; Thu, 10 Sep 2009 07:23:41 -0400
Date: Thu, 10 Sep 2009 07:23:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: unused Kconfig variable MTD_NAND_ATMEL_ECC_SOFT
Message-ID: <alpine.LFD.2.00.0909100721160.19387@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


  just an observation that that Kconfig variable appears to be
entirely unused.  from drivers/mtd/nand/Kconfig:

config MTD_NAND_ATMEL_ECC_SOFT
        bool "Software ECC"
        help
          Use software ECC.

          NB : hardware and software ECC schemes are incompatible.
          If you switch from one to another, you'll have to erase your
          mtd partition.


  however,

$ grep -r MTD_NAND_ATMEL_ECC_SOFT *
arch/arm/configs/kb9202_defconfig:CONFIG_MTD_NAND_ATMEL_ECC_SOFT=y
arch/arm/configs/usb-a9260_defconfig:CONFIG_MTD_NAND_ATMEL_ECC_SOFT=y
arch/arm/configs/qil-a9260_defconfig:CONFIG_MTD_NAND_ATMEL_ECC_SOFT=y
arch/arm/configs/afeb9260_defconfig:CONFIG_MTD_NAND_ATMEL_ECC_SOFT=y
arch/arm/configs/usb-a9263_defconfig:CONFIG_MTD_NAND_ATMEL_ECC_SOFT=y
arch/arm/configs/neocore926_defconfig:# CONFIG_MTD_NAND_ATMEL_ECC_SOFT is not set
arch/arm/configs/at91sam9g20ek_defconfig:CONFIG_MTD_NAND_ATMEL_ECC_SOFT=y
arch/arm/configs/cam60_defconfig:# CONFIG_MTD_NAND_ATMEL_ECC_SOFT is not set
arch/avr32/configs/atstk1006_defconfig:# CONFIG_MTD_NAND_ATMEL_ECC_SOFT is not set
drivers/mtd/nand/Kconfig:config MTD_NAND_ATMEL_ECC_SOFT
$

  no, i don't have a patch for that as i have no idea what a
resolution is, although it's clearly not a problem, just an unused
variable.  but if someone wants to suggest a fix, i can quickly whip
up a patch.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================
