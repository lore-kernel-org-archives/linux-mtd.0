Date: Tue, 15 Jan 2013 13:51:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Stefan Peter <s.peter@mpl.ch>
Subject: Re: [PATCH 3/4] Enable ecc-mode selection in the driver
Message-ID: <20130115125119.GH13482@lunn.ch>
References: <cover.1358242644.git.s.peter@mpl.ch>
 <2d08c4c072fd4922a6056362adb96a455307d583.1358242644.git.s.peter@mpl.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d08c4c072fd4922a6056362adb96a455307d583.1358242644.git.s.peter@mpl.ch>
Cc: andrew@lunn.ch, linux@arm.linux.org.uk, jason@lakedaemon.net, arnd@arndb.de,
 gregkh@linuxfoundation.org, iwamatsu@nigauri.org,
 devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com,
 sebastian.hesselbarth@googlemail.com, linux-kernel@vger.kernel.org,
 rob.herring@calxeda.com, grant.likely@secretlab.ca, wfp5p@virginia.edu,
 linux-mtd@lists.infradead.org, nico@linaro.org, rob@landley.net,
 artem.bityutskiy@linux.intel.com, dwmw2@infradead.org, jm@lentin.co.uk,
 linux-arm-kernel@lists.infradead.org, mchehab@redhat.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 15, 2013 at 01:13:12PM +0100, Stefan Peter wrote:
> In order to be able to use the ecc-mode, add the bch module to the default
> settings for the kirwood boards and enable the activation in orin-nand.c
> 
> Signed-off-by: Stefan Peter <s.peter@mpl.ch>
> ---
> diff --git a/arch/arm/configs/kirkwood_defconfig b/arch/arm/configs/kirkwood_defconfig
> index 93f3794..4a9d3f7 100644
> --- a/arch/arm/configs/kirkwood_defconfig
> +++ b/arch/arm/configs/kirkwood_defconfig
> @@ -84,6 +84,7 @@ CONFIG_MTD_CFI_STAA=y
>  CONFIG_MTD_PHYSMAP=y
>  CONFIG_MTD_M25P80=y
>  CONFIG_MTD_NAND=y
> +CONFIG_MTD_NAND_ECC_BCH=y
>  CONFIG_MTD_NAND_ORION=y
>  CONFIG_BLK_DEV_LOOP=y
>  # CONFIG_SCSI_PROC_FS is not set
> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index cd72b92..1a35257 100644
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
> @@ -130,6 +131,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>  		if (!of_property_read_u32(pdev->dev.of_node,
>  						"chip-delay", &val))
>  			board->chip_delay = (u8)val;
> +		board->ecc_mode = of_get_nand_ecc_mode(pdev->dev.of_node);

>  	} else
>  		board = pdev->dev.platform_data;
>  
> @@ -140,7 +142,8 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>  	nc->IO_ADDR_R = nc->IO_ADDR_W = io_base;
>  	nc->cmd_ctrl = orion_nand_cmd_ctrl;
>  	nc->read_buf = orion_nand_read_buf;
> -	nc->ecc.mode = NAND_ECC_SOFT;
> +	nc->ecc.mode = board->ecc_mode == NAND_ECC_SOFT_BCH ?
> +		NAND_ECC_SOFT_BCH : NAND_ECC_SOFT;

Hi Stefan

What about a user that wants one of the other valid values?
NAND_ECC_OOB_FIRST, NAND_ECC_HW_SYNDROME, etc.

Would:

	if (IS_ERR(board->ecc_mode)) {
		nc->ecc.mode = NAND_ECC_SOFT;
		dev_info(&pdev->dev, "Defaulting to NAND_ECC_SOFT");
	} else
		nc->ecc.mode = board->ecc_mode

be better?

   Andrew
