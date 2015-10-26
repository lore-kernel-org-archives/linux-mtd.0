Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqoGL-0002z2-5k
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 20:21:01 +0000
Received: by pacfv9 with SMTP id fv9so206661614pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 13:20:40 -0700 (PDT)
Date: Mon, 26 Oct 2015 13:20:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Stefan Roese <sr@denx.de>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/3 v3] mtd: nand: fsmc: Add BCH4 SW ECC support for
 SPEAr600
Message-ID: <20151026202038.GG13239@google.com>
References: <1443782422-4515-3-git-send-email-sr@denx.de>
 <1445236813-26013-1-git-send-email-sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445236813-26013-1-git-send-email-sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stefan,

On Mon, Oct 19, 2015 at 08:40:13AM +0200, Stefan Roese wrote:
> This patch adds support for 4-bit ECC BCH4 for the SPEAr600 SoC. This can
> be used by boards equipped with a NAND chip that requires 4-bit ECC
> strength. The SPEAr600 HW ECC only supports 1-bit ECC strength.
> 
> To enable SW BCH4, you need to specify this in your nand controller
> DT node:
> 
> 	nand-ecc-mode = "soft_bch";
> 	nand-ecc-strength = <4>;
> 	nand-ecc-step-size = <512>;
> 
> Tested on a custom SPEAr600 board.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> ---

Looks good. Applied to l2-mtd.git with a small addition.

> v3:
> - Rebased on top of l2-mtd.git
> - Changed "dn" to "flash_node"
> 
> v2:
> - Used nand_dt_init() to parse the ECC properties
> - Added optional ECC bindings documentation
> - Removed whitespace change from this patch, moved to a separate patch
> - Removed setting of nand_bch_calculate_ecc / nand_bch_correct_data as its
>   already done in nand_scan_tail()
> - Moved ECC checking after nand_scan_ident()
> - Removed addition of ecc_mode to platform_data as its not needed anymore
> 
>  .../devicetree/bindings/mtd/fsmc-nand.txt          |  3 ++
>  drivers/mtd/nand/fsmc_nand.c                       | 57 ++++++++++++++++------
>  2 files changed, 44 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
> index 5235cbc..f861178 100644
> --- a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
> @@ -30,6 +30,9 @@ Optional properties:
>                   command is asserted. Zero means one cycle, 255 means 256
>                   cycles.
>  - bank: default NAND bank to use (0-3 are valid, 0 is the default).
> +- nand-ecc-mode      : see nand.txt
> +- nand-ecc-strength  : see nand.txt
> +- nand-ecc-step-size : see nand.txt

nand.txt provides more latitude than some controllers/drivers do. It's
nice to specify which sort of modes are supported. I added a note aboute
HW and soft BCH support here.

>  
>  Example:
>  
> diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
> index 9e4fd0f..b50be0d 100644
> --- a/drivers/mtd/nand/fsmc_nand.c
> +++ b/drivers/mtd/nand/fsmc_nand.c
> @@ -1023,12 +1023,17 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>  	nand->cmd_ctrl = fsmc_cmd_ctrl;
>  	nand->chip_delay = 30;
>  
> +	/*
> +	 * Setup default ECC mode. nand_dt_init() called from nand_scan_init()

s/nand_scan_init/nand_scan_ident/

> +	 * can overwrite this value if the DT provides a different value.
> +	 */
>  	nand->ecc.mode = NAND_ECC_HW;
>  	nand->ecc.hwctl = fsmc_enable_hwecc;
>  	nand->ecc.size = 512;
>  	nand->options = pdata->options;
>  	nand->select_chip = fsmc_select_chip;
>  	nand->badblockbits = 7;
> +	nand->flash_node = np;
>  
>  	if (pdata->width == FSMC_NAND_BW16)
>  		nand->options |= NAND_BUSWIDTH_16;
[snip]

I squashed in the following change.

diff --git a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
index f861178fe69f..32636eb77304 100644
--- a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
@@ -34,6 +34,9 @@ Optional properties:
 - nand-ecc-strength  : see nand.txt
 - nand-ecc-step-size : see nand.txt
 
+Can support 1-bit HW ECC (default) or if stronger correction is required,
+software-based BCH.
+
 Example:
 
 	fsmc: flash@d1800000 {
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index b50be0ddeadc..07af3dc7a4d2 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1024,7 +1024,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	nand->chip_delay = 30;
 
 	/*
-	 * Setup default ECC mode. nand_dt_init() called from nand_scan_init()
+	 * Setup default ECC mode. nand_dt_init() called from nand_scan_ident()
 	 * can overwrite this value if the DT provides a different value.
 	 */
 	nand->ecc.mode = NAND_ECC_HW;
