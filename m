Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgGGY-0003Mn-Lx
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 21:15:17 +0000
Date: Thu, 19 Jul 2018 23:14:52 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: Make Kconfig formatting consistent
Message-ID: <20180719231452.15e999ad@bbrezillon>
In-Reply-To: <20180718150952.3497-1-boris.brezillon@bootlin.com>
References: <20180718150952.3497-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 18 Jul 2018 17:09:52 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Fix indentation and replace '---help---' by 'help' to make things
> consistent.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Applied.

> ---
>  drivers/mtd/Kconfig         | 24 ++++++++++++------------
>  drivers/mtd/chips/Kconfig   |  2 +-
>  drivers/mtd/devices/Kconfig |  4 ++--
>  drivers/mtd/lpddr/Kconfig   |  8 ++++----
>  drivers/mtd/maps/Kconfig    | 24 ++++++++++++------------
>  5 files changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 46ab7feec6b6..c77f537323ec 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -24,7 +24,7 @@ config MTD_TESTS
>  
>  config MTD_REDBOOT_PARTS
>  	tristate "RedBoot partition table parsing"
> -	---help---
> +	help
>  	  RedBoot is a ROM monitor and bootloader which deals with multiple
>  	  'images' in flash devices by putting a table one of the erase
>  	  blocks on the device, similar to a partition table, which gives
> @@ -45,7 +45,7 @@ if MTD_REDBOOT_PARTS
>  config MTD_REDBOOT_DIRECTORY_BLOCK
>  	int "Location of RedBoot partition table"
>  	default "-1"
> -	---help---
> +	help
>  	  This option is the Linux counterpart to the
>  	  CYGNUM_REDBOOT_FIS_DIRECTORY_BLOCK RedBoot compile time
>  	  option.
> @@ -75,7 +75,7 @@ endif # MTD_REDBOOT_PARTS
>  config MTD_CMDLINE_PARTS
>  	tristate "Command line partition table parsing"
>  	depends on MTD
> -	---help---
> +	help
>  	  Allow generic configuration of the MTD partition tables via the kernel
>  	  command line. Multiple flash resources are supported for hardware where
>  	  different kinds of flash memory are available.
> @@ -112,7 +112,7 @@ config MTD_CMDLINE_PARTS
>  config MTD_AFS_PARTS
>  	tristate "ARM Firmware Suite partition parsing"
>  	depends on (ARM || ARM64)
> -	---help---
> +	help
>  	  The ARM Firmware Suite allows the user to divide flash devices into
>  	  multiple 'images'. Each such image has a header containing its name
>  	  and offset/size etc.
> @@ -136,7 +136,7 @@ config MTD_OF_PARTS
>  
>  config MTD_AR7_PARTS
>  	tristate "TI AR7 partitioning support"
> -	---help---
> +	help
>  	  TI AR7 partitioning support
>  
>  config MTD_BCM63XX_PARTS
> @@ -170,7 +170,7 @@ config MTD_BLOCK
>  	tristate "Caching block device access to MTD devices"
>  	depends on BLOCK
>  	select MTD_BLKDEVS
> -	---help---
> +	help
>  	  Although most flash chips have an erase size too large to be useful
>  	  as block devices, it is possible to use MTD devices which are based
>  	  on RAM chips in this manner. This block device is a user of MTD
> @@ -205,7 +205,7 @@ config FTL
>  	tristate "FTL (Flash Translation Layer) support"
>  	depends on BLOCK
>  	select MTD_BLKDEVS
> -	---help---
> +	help
>  	  This provides support for the original Flash Translation Layer which
>  	  is part of the PCMCIA specification. It uses a kind of pseudo-
>  	  file system on a flash device to emulate a block device with
> @@ -222,7 +222,7 @@ config NFTL
>  	tristate "NFTL (NAND Flash Translation Layer) support"
>  	depends on BLOCK
>  	select MTD_BLKDEVS
> -	---help---
> +	help
>  	  This provides support for the NAND Flash Translation Layer which is
>  	  used on M-Systems' DiskOnChip devices. It uses a kind of pseudo-
>  	  file system on a flash device to emulate a block device with
> @@ -246,7 +246,7 @@ config INFTL
>  	tristate "INFTL (Inverse NAND Flash Translation Layer) support"
>  	depends on BLOCK
>  	select MTD_BLKDEVS
> -	---help---
> +	help
>  	  This provides support for the Inverse NAND Flash Translation
>  	  Layer which is used on M-Systems' newer DiskOnChip devices. It
>  	  uses a kind of pseudo-file system on a flash device to emulate
> @@ -261,10 +261,10 @@ config INFTL
>  	  not use it.
>  
>  config RFD_FTL
> -        tristate "Resident Flash Disk (Flash Translation Layer) support"
> +	tristate "Resident Flash Disk (Flash Translation Layer) support"
>  	depends on BLOCK
>  	select MTD_BLKDEVS
> -	---help---
> +	help
>  	  This provides support for the flash translation layer known
>  	  as the Resident Flash Disk (RFD), as used by the Embedded BIOS
>  	  of General Software. There is a blurb at:
> @@ -308,7 +308,7 @@ config MTD_SWAP
>  	select MTD_BLKDEVS
>  	help
>  	  Provides volatile block device driver on top of mtd partition
> -          suitable for swapping.  The mapping of written blocks is not saved.
> +	  suitable for swapping.  The mapping of written blocks is not saved.
>  	  The driver provides wear leveling by storing erase counter into the
>  	  OOB.
>  
> diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
> index bbfa1f129266..39ec32a29051 100644
> --- a/drivers/mtd/chips/Kconfig
> +++ b/drivers/mtd/chips/Kconfig
> @@ -44,7 +44,7 @@ choice
>  	prompt "Flash cmd/query data swapping"
>  	depends on MTD_CFI_ADV_OPTIONS
>  	default MTD_CFI_NOSWAP
> -	---help---
> +	help
>  	  This option defines the way in which the CPU attempts to arrange
>  	  data bits when writing the 'magic' commands to the chips. Saying
>  	  'NO', which is the default when CONFIG_MTD_CFI_ADV_OPTIONS isn't
> diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> index 57b02c4b3f63..e514d57a0419 100644
> --- a/drivers/mtd/devices/Kconfig
> +++ b/drivers/mtd/devices/Kconfig
> @@ -5,7 +5,7 @@ menu "Self-contained MTD device drivers"
>  config MTD_PMC551
>  	tristate "Ramix PMC551 PCI Mezzanine RAM card support"
>  	depends on PCI
> -	---help---
> +	help
>  	  This provides a MTD device driver for the Ramix PMC551 RAM PCI card
>  	  from Ramix Inc. <http://www.ramix.com/products/memory/pmc551.html>.
>  	  These devices come in memory configurations from 32M - 1G.  If you
> @@ -209,7 +209,7 @@ config MTD_DOCG3
>  	select BCH
>  	select BCH_CONST_PARAMS
>  	select BITREVERSE
> -	---help---
> +	help
>  	  This provides an MTD device driver for the M-Systems DiskOnChip
>  	  G3 devices.
>  
> diff --git a/drivers/mtd/lpddr/Kconfig b/drivers/mtd/lpddr/Kconfig
> index 3a19cbee24d7..a5a332fbd593 100644
> --- a/drivers/mtd/lpddr/Kconfig
> +++ b/drivers/mtd/lpddr/Kconfig
> @@ -13,10 +13,10 @@ config MTD_QINFO_PROBE
>  	depends on MTD_LPDDR
>  	tristate "Detect flash chips by QINFO probe"
>  	help
> -	    Device Information for LPDDR chips is offered through the Overlay
> -	    Window QINFO interface, permits software to be used for entire
> -	    families of devices. This serves similar purpose of CFI on legacy
> -	    Flash products
> +	  Device Information for LPDDR chips is offered through the Overlay
> +	  Window QINFO interface, permits software to be used for entire
> +	  families of devices. This serves similar purpose of CFI on legacy
> +	  Flash products
>  
>  config MTD_LPDDR2_NVM
>  	# ARM dependency is only for writel_relaxed()
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index bdc1283f30fb..afb36bff13a7 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -207,13 +207,13 @@ config MTD_ICHXROM
>  	  BE VERY CAREFUL.
>  
>  config MTD_ESB2ROM
> -        tristate "BIOS flash chip on Intel ESB Controller Hub 2"
> -        depends on X86 && MTD_JEDECPROBE && PCI
> -        help
> -          Support for treating the BIOS flash chip on ESB2 motherboards
> -          as an MTD device - with this you can reprogram your BIOS.
> +	tristate "BIOS flash chip on Intel ESB Controller Hub 2"
> +	depends on X86 && MTD_JEDECPROBE && PCI
> +	help
> +	  Support for treating the BIOS flash chip on ESB2 motherboards
> +	  as an MTD device - with this you can reprogram your BIOS.
>  
> -          BE VERY CAREFUL.
> +	  BE VERY CAREFUL.
>  
>  config MTD_CK804XROM
>  	tristate "BIOS flash chip on Nvidia CK804"
> @@ -401,12 +401,12 @@ config MTD_PISMO
>  	  When built as a module, it will be called pismo.ko
>  
>  config MTD_LATCH_ADDR
> -        tristate "Latch-assisted Flash Chip Support"
> -        depends on MTD_COMPLEX_MAPPINGS
> -        help
> -          Map driver which allows flashes to be partially physically addressed
> -          and have the upper address lines set by a board specific code.
> +	tristate "Latch-assisted Flash Chip Support"
> +	depends on MTD_COMPLEX_MAPPINGS
> +	help
> +	  Map driver which allows flashes to be partially physically addressed
> +	  and have the upper address lines set by a board specific code.
>  
> -          If compiled as a module, it will be called latch-addr-flash.
> +	  If compiled as a module, it will be called latch-addr-flash.
>  
>  endmenu
