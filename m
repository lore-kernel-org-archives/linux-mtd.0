Received: from mail.linuxfoundation.org ([140.211.169.12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOyIB-0002h6-K2
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 23:14:48 +0000
Date: Wed, 25 Sep 2013 16:14:25 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Kamlakant Patel <kamlakant.patel@broadcom.com>
Subject: Re: [PATCH] Staging: MTD: Micron SPINAND Driver support
Message-ID: <20130925231425.GA21682@kroah.com>
References: <1378128136-23699-1-git-send-email-kamlakant.patel@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1378128136-23699-1-git-send-email-kamlakant.patel@broadcom.com>
Cc: linux-mtd@lists.infradead.org, manonuevo@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 02, 2013 at 06:52:16PM +0530, Kamlakant Patel wrote:
> This patch adds support for Micron SPINAND via MTD.
> 
> Signed-off-by: Mona Anonuevo <manonuevo@micron.com>
> Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
> ---
> This patch has to be merged via staging tree.
>   
> This is a driver from Micron for MT29F1G01ZACH4 SPI based NAND chips. This driver had
> been posted multiple times to the mtd list.
> 1. http://lists.infradead.org/pipermail/linux-mtd/2010-May/031975.html
> 2. http://lists.infradead.org/pipermail/linux-mtd/2010-April/029523.html
> 3. patchwork.ozlabs.org/patch/258697/
> This has not been merged into the main kernel yet.
> 
> I have cleaned and updated it for current kernel. Since there are many users for
> this driver, it may be useful to add it to the staging tree, where further fixes and
> cleanups can be done. Once it reaches to the standard will be moved to the mtd.
> 
> This driver has been tested with Micron SPINAND MT29F1G01ZACH4 chip on kernel 3.11 on 
> the Netlogic XLP platform.
>  
> Mona Anonuevo, I have retained your sign-offs from the original patch.
> 
>  drivers/staging/Kconfig                       |   2 +
>  drivers/staging/Makefile                      |   1 +
>  drivers/staging/mt29f_spinand/Kconfig         |  16 +
>  drivers/staging/mt29f_spinand/Makefile        |   1 +
>  drivers/staging/mt29f_spinand/TODO            |  13 +
>  drivers/staging/mt29f_spinand/mt29f_spinand.c | 917 ++++++++++++++++++++++++++
>  drivers/staging/mt29f_spinand/mt29f_spinand.h | 109 +++
>  7 files changed, 1059 insertions(+)
>  create mode 100644 drivers/staging/mt29f_spinand/Kconfig
>  create mode 100644 drivers/staging/mt29f_spinand/Makefile
>  create mode 100644 drivers/staging/mt29f_spinand/TODO
>  create mode 100644 drivers/staging/mt29f_spinand/mt29f_spinand.c
>  create mode 100644 drivers/staging/mt29f_spinand/mt29f_spinand.h
> 
> diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
> index 57d8b34..8846a92 100644
> --- a/drivers/staging/Kconfig
> +++ b/drivers/staging/Kconfig
> @@ -136,6 +136,8 @@ source "drivers/staging/goldfish/Kconfig"
>  
>  source "drivers/staging/netlogic/Kconfig"
>  
> +source "drivers/staging/mt29f_spinand/Kconfig"
> +
>  source "drivers/staging/dwc2/Kconfig"
>  
>  source "drivers/staging/lustre/Kconfig"
> diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
> index 429321f..1b7b060 100644
> --- a/drivers/staging/Makefile
> +++ b/drivers/staging/Makefile
> @@ -63,3 +63,4 @@ obj-$(CONFIG_GOLDFISH)		+= goldfish/
>  obj-$(CONFIG_XILLYBUS)		+= xillybus/
>  obj-$(CONFIG_DGNC)			+= dgnc/
>  obj-$(CONFIG_DGAP)			+= dgap/
> +obj-$(CONFIG_MTD_SPINAND_MT29F)	+= mt29f_spinand/
> diff --git a/drivers/staging/mt29f_spinand/Kconfig b/drivers/staging/mt29f_spinand/Kconfig
> new file mode 100644
> index 0000000..07dd535
> --- /dev/null
> +++ b/drivers/staging/mt29f_spinand/Kconfig
> @@ -0,0 +1,16 @@
> +config MTD_SPINAND_MT29F
> +	tristate "SPINAND Device Support for Micron"
> +	depends on MTD
> +	help
> +	  This enables support for accessing Micron SPI NAND flash
> +	  devices.
> +	  If you have Micron SPI NAND chip say yes.
> +
> +	  If unsure, say no here.
> +
> +config MTD_SPINAND_ONDIEECC
> +	bool "Use SPINAND internal ECC"

This needs to depend on MTD_SPINAND_MT29F in order to make any sense,
right?

Can you please send a follow-on patch for it?

thanks,

greg k-h
