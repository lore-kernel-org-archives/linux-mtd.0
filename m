Date: Thu, 14 Nov 2013 14:40:56 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v5 12/14] mtd: nand: pxa3xx: Introduce multiple page
 I/O support
Message-ID: <20131114224056.GU9468@ld-irv-0074.broadcom.com>
References: <1384464339-6817-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1384464339-6817-13-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384464339-6817-13-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 14, 2013 at 06:25:37PM -0300, Ezequiel Garcia wrote:
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1151,7 +1288,28 @@ static int armada370_ecc_init(struct pxa3xx_nand_info *info,
>  			      struct nand_ecc_ctrl *ecc,
>  			      int strength, int page_size)
>  {
> -	/* Unimplemented yet */
> +	if (strength == 4 && page_size == 4096) {

I still think this sort of check can be improved just a bit. Can you
comment on my additional diff, pasted below? (Not even compile-tested)

> +		info->ecc_bch = 1;
> +		info->chunk_size = 2048;
> +		info->spare_size = 32;
> +		info->ecc_size = 32;
> +		ecc->mode = NAND_ECC_HW;
> +		ecc->size = info->chunk_size;
> +		ecc->layout = &ecc_layout_4KB_bch4bit;
> +		ecc->strength = 16;
> +		return 1;
> +
> +	} else if (strength == 8 && page_size == 4096) {
> +		info->ecc_bch = 1;
> +		info->chunk_size = 1024;
> +		info->spare_size = 0;
> +		info->ecc_size = 32;
> +		ecc->mode = NAND_ECC_HW;
> +		ecc->size = info->chunk_size;
> +		ecc->layout = &ecc_layout_4KB_bch8bit;
> +		ecc->strength = 16;
> +		return 1;
> +	}
>  	return 0;
>  }
>  

Brian

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 8cb6640..e219d75 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1363,9 +1363,13 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 
 static int armada370_ecc_init(struct pxa3xx_nand_info *info,
 			      struct nand_ecc_ctrl *ecc,
-			      int strength, int page_size)
+			      int strength, int ecc_stepsize, int page_size)
 {
-	if (strength == 4 && page_size == 4096) {
+	/*
+	 * Required ECC: 4-bit correction per 512 bytes
+	 * Select: 16-bit correction per 2048 bytes
+	 */
+	if (strength == 4 && ecc_stepsize == 512 && page_size == 4096) {
 		info->ecc_bch = 1;
 		info->chunk_size = 2048;
 		info->spare_size = 32;
@@ -1376,7 +1380,11 @@ static int armada370_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->strength = 16;
 		return 1;
 
-	} else if (strength == 8 && page_size == 4096) {
+	/*
+	 * Required ECC: 8-bit correction per 512 bytes
+	 * Select: 16-bit correction per 1024 bytes
+	 */
+	} else if (strength == 8 && ecc_stepsize == 512 && page_size == 4096) {
 		info->ecc_bch = 1;
 		info->chunk_size = 1024;
 		info->spare_size = 0;
@@ -1484,6 +1492,7 @@ KEEP_CONFIG:
 	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
 		ret = armada370_ecc_init(info, &chip->ecc,
 				   chip->ecc_strength_ds,
+				   chip->ecc_step_ds,
 				   mtd->writesize);
 	else
 		ret = pxa_ecc_init(info, &chip->ecc,
