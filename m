Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zz7J5-00018O-AF
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2015 18:18:12 +0000
Received: by pabfh17 with SMTP id fh17so53985482pab.0
 for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2015 10:17:50 -0800 (PST)
Date: Wed, 18 Nov 2015 10:17:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Frank de Brabander <debrabander@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: orion_nand: support selecting ECC mode via the
 device tree
Message-ID: <20151118181747.GC140057@google.com>
References: <1447848452-2972-1-git-send-email-debrabander@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447848452-2972-1-git-send-email-debrabander@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Nov 18, 2015 at 01:07:32PM +0100, Frank de Brabander wrote:
> Currently the Orion NAND ECC mode is hardcoded to NAND_ECC_SOFT, it does not
> allow selecting any other ECC mode. This change makes it possible to use the
> device tree to select other ECC modes. It still defaults to the original
> mode NAND_ECC_SOFT.
> 
> This makes the driver more in line with other mtd nand drivers, that already
> support similar ways to select the ECC mode.
> 
> Signed-off-by: Frank de Brabander <debrabander@gmail.com>
> ---
>  Documentation/devicetree/bindings/mtd/orion-nand.txt | 3 +++
>  drivers/mtd/nand/orion_nand.c                        | 6 +++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/orion-nand.txt b/Documentation/devicetree/bindings/mtd/orion-nand.txt
> index 2d6ab66..129ce77 100644
> --- a/Documentation/devicetree/bindings/mtd/orion-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/orion-nand.txt
> @@ -11,6 +11,8 @@ Optional properties:
>  - bank-width : Width in bytes of the device. Default is 1
>  - chip-delay : Chip dependent delay for transferring data from array to read
>                 registers in usecs
> +- nand-ecc-mode : String, operation mode of the NAND ecc mode, soft by default.
> +  Supported values are: "none", "soft", and "soft_bch".

How about nand-ecc-strength and nand-ecc-size?

(Reasoning: For a HW description, it's important to specify how much
correction is needed, even if Linux happens to have decent defaults for
what you want. Also, it's good to note that these are, in fact,
controllable in the device tree.)

You can probably point to nand.txt for most of the description, except
for the listing of the ECC modes and property names.

> 
>  The device tree may optionally contain sub-nodes describing partitions of the
>  address space. See partition.txt for more detail.
> @@ -26,6 +28,7 @@ nand@f4000000 {
>  	chip-delay = <25>;
>  	compatible = "marvell,orion-nand";
>  	reg = <0xf4000000 0x400>;
> +	nand-ecc-mode = "soft_bch";
> 
>  	partition@0 {
>  		label = "u-boot";
> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index ee83749..004562a 100644
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -14,6 +14,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
> +#include <linux/of_mtd.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/nand.h>
>  #include <linux/mtd/partitions.h>
> @@ -84,6 +85,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>  	void __iomem *io_base;
>  	int ret = 0;
>  	u32 val = 0;
> +	int ecc_mode = 0;
> 
>  	nc = devm_kzalloc(&pdev->dev,
>  			sizeof(struct nand_chip) + sizeof(struct mtd_info),
> @@ -130,7 +132,9 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>  	nc->IO_ADDR_R = nc->IO_ADDR_W = io_base;
>  	nc->cmd_ctrl = orion_nand_cmd_ctrl;
>  	nc->read_buf = orion_nand_read_buf;
> -	nc->ecc.mode = NAND_ECC_SOFT;
> +
> +	ecc_mode = of_get_nand_ecc_mode(pdev->dev.of_node);
> +	nc->ecc.mode = ecc_mode < 0 ? NAND_ECC_SOFT : ecc_mode;

I don't think you should need any driver changes now, actually. If you
look at nand_dt_init(), you'll see it does this stuff for you, as long
as you set nand_chip->flash_node. And since this commit:

a61ae81a1907 ("mtd: nand: drop unnecessary partition parser data")

orion_nand.c now calls:

	nand_set_flash_node(nc, pdev->dev.of_node);

Please, test it out and send just the updated documentation!

Brian

> 
>  	if (board->chip_delay)
>  		nc->chip_delay = board->chip_delay;
> --
> 1.9.1
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
