Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEWdN-0008I6-Ft
 for linux-mtd@lists.infradead.org; Mon, 22 Oct 2018 09:36:27 +0000
Date: Mon, 22 Oct 2018 11:36:03 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/3] mtd: Move Redboot partition parser
Message-ID: <20181022113603.730c5f84@bbrezillon>
In-Reply-To: <20181019070622.26661-1-linus.walleij@linaro.org>
References: <20181019070622.26661-1-linus.walleij@linaro.org>
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

+Rafal 

On Fri, 19 Oct 2018 09:06:20 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> This moves the Redboot partition parser down to the parsers
> subdirectory.

Rafal, could you have a look at this patchset and maybe add your R-b if
you're okay with it?

Thanks,

Boris

> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mtd/Kconfig                 | 50 -----------------------------
>  drivers/mtd/Makefile                |  1 -
>  drivers/mtd/parsers/Kconfig         | 50 +++++++++++++++++++++++++++++
>  drivers/mtd/parsers/Makefile        |  1 +
>  drivers/mtd/{ => parsers}/redboot.c |  0
>  5 files changed, 51 insertions(+), 51 deletions(-)
>  rename drivers/mtd/{ => parsers}/redboot.c (100%)
> 
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index c77f537323ec..4523c875f29a 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -22,56 +22,6 @@ config MTD_TESTS
>  	  WARNING: some of the tests will ERASE entire MTD device which they
>  	  test. Do not use these tests unless you really know what you do.
>  
> -config MTD_REDBOOT_PARTS
> -	tristate "RedBoot partition table parsing"
> -	help
> -	  RedBoot is a ROM monitor and bootloader which deals with multiple
> -	  'images' in flash devices by putting a table one of the erase
> -	  blocks on the device, similar to a partition table, which gives
> -	  the offsets, lengths and names of all the images stored in the
> -	  flash.
> -
> -	  If you need code which can detect and parse this table, and register
> -	  MTD 'partitions' corresponding to each image in the table, enable
> -	  this option.
> -
> -	  You will still need the parsing functions to be called by the driver
> -	  for your particular device. It won't happen automatically. The
> -	  SA1100 map driver (CONFIG_MTD_SA1100) has an option for this, for
> -	  example.
> -
> -if MTD_REDBOOT_PARTS
> -
> -config MTD_REDBOOT_DIRECTORY_BLOCK
> -	int "Location of RedBoot partition table"
> -	default "-1"
> -	help
> -	  This option is the Linux counterpart to the
> -	  CYGNUM_REDBOOT_FIS_DIRECTORY_BLOCK RedBoot compile time
> -	  option.
> -
> -	  The option specifies which Flash sectors holds the RedBoot
> -	  partition table.  A zero or positive value gives an absolute
> -	  erase block number. A negative value specifies a number of
> -	  sectors before the end of the device.
> -
> -	  For example "2" means block number 2, "-1" means the last
> -	  block and "-2" means the penultimate block.
> -
> -config MTD_REDBOOT_PARTS_UNALLOCATED
> -	bool "Include unallocated flash regions"
> -	help
> -	  If you need to register each unallocated flash region as a MTD
> -	  'partition', enable this option.
> -
> -config MTD_REDBOOT_PARTS_READONLY
> -	bool "Force read-only for RedBoot system images"
> -	help
> -	  If you need to force read-only for 'RedBoot', 'RedBoot Config' and
> -	  'FIS directory' images, enable this option.
> -
> -endif # MTD_REDBOOT_PARTS
> -
>  config MTD_CMDLINE_PARTS
>  	tristate "Command line partition table parsing"
>  	depends on MTD
> diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
> index 93473d215a38..58fc327a5276 100644
> --- a/drivers/mtd/Makefile
> +++ b/drivers/mtd/Makefile
> @@ -8,7 +8,6 @@ obj-$(CONFIG_MTD)		+= mtd.o
>  mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o mtdchar.o
>  
>  obj-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
> -obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
>  obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
>  obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
>  obj-$(CONFIG_MTD_AR7_PARTS)	+= ar7part.o
> diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
> index ee5ab994132f..fccf1950e92d 100644
> --- a/drivers/mtd/parsers/Kconfig
> +++ b/drivers/mtd/parsers/Kconfig
> @@ -14,3 +14,53 @@ config MTD_SHARPSL_PARTS
>  	  This provides the read-only FTL logic necessary to read the partition
>  	  table from the NAND flash of Sharp SL Series (Zaurus) and the MTD
>  	  partition parser using this code.
> +
> +config MTD_REDBOOT_PARTS
> +	tristate "RedBoot partition table parsing"
> +	help
> +	  RedBoot is a ROM monitor and bootloader which deals with multiple
> +	  'images' in flash devices by putting a table one of the erase
> +	  blocks on the device, similar to a partition table, which gives
> +	  the offsets, lengths and names of all the images stored in the
> +	  flash.
> +
> +	  If you need code which can detect and parse this table, and register
> +	  MTD 'partitions' corresponding to each image in the table, enable
> +	  this option.
> +
> +	  You will still need the parsing functions to be called by the driver
> +	  for your particular device. It won't happen automatically. The
> +	  SA1100 map driver (CONFIG_MTD_SA1100) has an option for this, for
> +	  example.
> +
> +if MTD_REDBOOT_PARTS
> +
> +config MTD_REDBOOT_DIRECTORY_BLOCK
> +	int "Location of RedBoot partition table"
> +	default "-1"
> +	help
> +	  This option is the Linux counterpart to the
> +	  CYGNUM_REDBOOT_FIS_DIRECTORY_BLOCK RedBoot compile time
> +	  option.
> +
> +	  The option specifies which Flash sectors holds the RedBoot
> +	  partition table.  A zero or positive value gives an absolute
> +	  erase block number. A negative value specifies a number of
> +	  sectors before the end of the device.
> +
> +	  For example "2" means block number 2, "-1" means the last
> +	  block and "-2" means the penultimate block.
> +
> +config MTD_REDBOOT_PARTS_UNALLOCATED
> +	bool "Include unallocated flash regions"
> +	help
> +	  If you need to register each unallocated flash region as a MTD
> +	  'partition', enable this option.
> +
> +config MTD_REDBOOT_PARTS_READONLY
> +	bool "Force read-only for RedBoot system images"
> +	help
> +	  If you need to force read-only for 'RedBoot', 'RedBoot Config' and
> +	  'FIS directory' images, enable this option.
> +
> +endif # MTD_REDBOOT_PARTS
> diff --git a/drivers/mtd/parsers/Makefile b/drivers/mtd/parsers/Makefile
> index 5b1bcc3d90d9..d8418bf6804a 100644
> --- a/drivers/mtd/parsers/Makefile
> +++ b/drivers/mtd/parsers/Makefile
> @@ -1,2 +1,3 @@
>  obj-$(CONFIG_MTD_PARSER_TRX)		+= parser_trx.o
>  obj-$(CONFIG_MTD_SHARPSL_PARTS)		+= sharpslpart.o
> +obj-$(CONFIG_MTD_REDBOOT_PARTS)		+= redboot.o
> diff --git a/drivers/mtd/redboot.c b/drivers/mtd/parsers/redboot.c
> similarity index 100%
> rename from drivers/mtd/redboot.c
> rename to drivers/mtd/parsers/redboot.c
