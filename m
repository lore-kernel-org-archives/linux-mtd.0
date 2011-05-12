Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKQzw-0000DG-0A
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 08:11:56 +0000
Received: by ewy3 with SMTP id 3so418804ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 01:11:50 -0700 (PDT)
Subject: Re: [RFC PATCH 4/9] nand/denali: split the generic driver and PCI
	layer
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <1304692143-22432-5-git-send-email-jamie@jamieiles.com>
References: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
	<1304692143-22432-5-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 11:08:30 +0300
Message-ID: <1305187710.2713.61.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	chuanxiao.dong@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-06 at 15:28 +0100, Jamie Iles wrote:
> The Denali controller can also be found in SoC devices attached to a
> simple bus.  Move the PCI specific parts into denali_pci so that we can
> add a denali_mmio that uses the same driver but for a platform_device
> instead of a PCI based device.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>
> ---
>  drivers/mtd/nand/Kconfig      |   11 +++-
>  drivers/mtd/nand/Makefile     |    1 +
>  drivers/mtd/nand/denali.c     |  153 +++++------------------------------------
>  drivers/mtd/nand/denali.h     |    4 +
>  drivers/mtd/nand/denali_pci.c |  145 ++++++++++++++++++++++++++++++++++++++
>  5 files changed, 178 insertions(+), 136 deletions(-)
>  create mode 100644 drivers/mtd/nand/denali_pci.c
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index edec457..d629b68 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -66,8 +66,15 @@ config MTD_NAND_AUTCPU12
>  	  access the SmartMediaCard.
>  
>  config MTD_NAND_DENALI
> -       depends on PCI
> +        tristate "Support Denali NAND controller"
> +        help
> +	  Enable support for the Denali NAND controller.  This should be
> +	  combined with either the PCI or platform drivers to provide device
> +	  registration.
> +
> +config MTD_NAND_DENALI_PCI
>          tristate "Support Denali NAND controller on Intel Moorestown"
> +	depends on PCI && MTD_NAND_DENALI
>          help
>            Enable the driver for NAND flash on Intel Moorestown, using the
>            Denali NAND controller core.
> @@ -75,7 +82,7 @@ config MTD_NAND_DENALI
>  config MTD_NAND_DENALI_SCRATCH_REG_ADDR
>          hex "Denali NAND size scratch register address"
>          default "0xFF108018"
> -        depends on MTD_NAND_DENALI
> +        depends on MTD_NAND_DENALI_PCI
>          help

I do not know for sure, but I bet there is a way to avoid adding another
config option. In general - the Linux kernel is overloaded with config
options and we try to avoid adding new ones.

Can this be done the following way? - you check if there is a PCI bus,
if no - try mmio. If yes, try to discover the device in PCI.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
