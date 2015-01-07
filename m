Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8hmQ-0003iP-4C
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 03:59:34 +0000
Date: Wed, 7 Jan 2015 11:57:23 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] mtd: fsl-quadspi: Fix module unbound
Message-ID: <20150107035723.GB1113@shldeISGChi005.sh.intel.com>
References: <1420599927-32385-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420599927-32385-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, shijie8@gmail.com,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 07, 2015 at 01:05:27AM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> When removing the fsl-quadspi module and running 'cat /proc/mtd' afterwards,
> we see garbage data like:
> 
> $ rmmod  fsl-quadspi
> $ cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00000000 00000000 "(null)"
> mtd0: 00000000 00000000 "(null)"
> mtd0: 00000000 00000000 "(null)"
> ...
> mtd0: a22296c6c756e28 00000000 "(null)"
> mtd0: a22296c6c756e28 3064746d "(null)"
> 
> The reason for this is due to the wrong mtd index used in
> mtd_device_unregister() in the remove function. This index mismatch is caused
> by the usage of the 'qspi-has-second-chip' property in the probe function.
> 
> Such property is not really necessary and we can simplify the index logic
> calculation to avoid the'holes'.
> 
> Thanks to Brian Norris for his suggestion.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
> Changes since v1:
> - Instead of adjusting the index in the remove function, let's get rid of
> the 'qspi-has-second-chip' property completely.
> 
>  .../devicetree/bindings/mtd/fsl-quadspi.txt        |  9 --------
>  drivers/mtd/spi-nor/fsl-quadspi.c                  | 24 ++++++++--------------
>  2 files changed, 8 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> index 823d134..b8e96ec 100644
> --- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> @@ -9,15 +9,6 @@ Required properties:
>    - clocks : The clocks needed by the QuadSPI controller
>    - clock-names : the name of the clocks
>  
> -Optional properties:
> -  - fsl,qspi-has-second-chip: The controller has two buses, bus A and bus B.
> -                              Each bus can be connected with two NOR flashes.
> -			      Most of the time, each bus only has one NOR flash
> -			      connected, this is the default case.
> -			      But if there are two NOR flashes connected to the
> -			      bus, you should enable this property.
> -			      (Please check the board's schematic.)
> -
>  Example:
>  
>  qspi0: quadspi@40044000 {
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 39763b9..8cdd73f 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -212,7 +212,7 @@ static struct fsl_qspi_devtype_data imx6sx_data = {
>  	.txfifo = 512
>  };
>  
> -#define FSL_QSPI_MAX_CHIP	4
> +#define FSL_QSPI_MAX_CHIP	2
Thanks for this patch.
Please test it carefully.

The FSL_QSPI_MAX_CHIP should be 4. please see the description:

  - fsl,qspi-has-second-chip: The controller has two buses, bus A and bus B.
                              Each bus can be connected with two NOR flashes.
			      Most of the time, each bus only has one NOR flash
			      connected, this is the default case.
			      But if there are two NOR flashes connected to the
			      bus, you should enable this property.

thanks
Huang Shijie
