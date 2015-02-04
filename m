Message-ID: <54D1FFC5.3030901@ti.com>
Date: Wed, 4 Feb 2015 13:17:25 +0200
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Nicholas Mc Guire <hofrat@osadl.org>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: omap: conditions with no effect
References: <1423042059-22416-1-git-send-email-hofrat@osadl.org>
In-Reply-To: <1423042059-22416-1-git-send-email-hofrat@osadl.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
 pekon <pekon@pek-sem.com>, Rostislav Lisovy <lisovy@gmail.com>,
 linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicholas,

On 04/02/15 11:27, Nicholas Mc Guire wrote:
> The if and the else branch code are identical - so the condition has no
> effect on the effective code - this patch removes the condition and the
> duplicated code.
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
> 
> The conditions in the OMAP_ECC_BCH8_CODE_HW_DETECTION_SW and
> OMAP_ECC_BCH4_CODE_HW_DETECTION_SW case have no effect and can
> be removed. As there are no comments it is not possible to say
> if this is the correct solution or if this is actually a bug and
> the two branches should be different.
> 
> This patch needs a review by someone who knows the details of the driver
> 
> Patch was only compile tested with arm-linux-gnueabi-4.7-, current
> crosstool-ng did no not seem to compile omap2 properly.
> Config is omap2plus_defconfig which implies CONFIG_MTD_NAND_OMAP2=y.
> 
> Patch is against 3.19.0-rc6 (localversion-next is -next-20150203)
> 
>  drivers/mtd/nand/omap2.c |   24 ++++++------------------
>  1 file changed, 6 insertions(+), 18 deletions(-)

Your patch is correct as far as I can tell based on commits 2ef9f3ddec55, 62116e5171e0
and 8d602cf50d3b.

The idea was to use BCH_WRAPMODE_6 for both reads and writes when we're not using the ELM
module for error correction. i.e. BCH4_SW or BCH8_SW.
This is mentioned in the header of omap_enable_hwecc_bch() but it is not very clear.
So let's fix that as well with this patch.

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 63f858e..a133780 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1048,10 +1048,9 @@ static int omap_dev_ready(struct mtd_info *mtd)
  * @mtd: MTD device structure
  * @mode: Read/Write mode
  *
- * When using BCH, sector size is hardcoded to 512 bytes.
- * Using wrapping mode 6 both for reading and writing if ELM module not uses
- * for error correction.
- * On writing,
+ * When using BCH with SW correction (i.e. no ELM), sector size is set
+ * to 512 bytes and we use BCH_WRAPMODE_6 wrapping mode
+ * for both reading and writing with:
  * eccsize0 = 0  (no additional protected byte in spare area)
  * eccsize1 = 32 (skip 32 nibbles = 16 bytes per sector in spare area)
  */

Then you can also add my

Acked-by: Roger Quadros <rogerq@ti.com>

cheers,
-roger

> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 63f858e..5bcdd66 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1071,15 +1071,9 @@ static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
>  	case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
>  		bch_type = 0;
>  		nsectors = 1;
> -		if (mode == NAND_ECC_READ) {
> -			wr_mode	  = BCH_WRAPMODE_6;
> -			ecc_size0 = BCH_ECC_SIZE0;
> -			ecc_size1 = BCH_ECC_SIZE1;
> -		} else {
> -			wr_mode   = BCH_WRAPMODE_6;
> -			ecc_size0 = BCH_ECC_SIZE0;
> -			ecc_size1 = BCH_ECC_SIZE1;
> -		}
> +		wr_mode	  = BCH_WRAPMODE_6;
> +		ecc_size0 = BCH_ECC_SIZE0;
> +		ecc_size1 = BCH_ECC_SIZE1;
>  		break;
>  	case OMAP_ECC_BCH4_CODE_HW:
>  		bch_type = 0;
> @@ -1097,15 +1091,9 @@ static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
>  	case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
>  		bch_type = 1;
>  		nsectors = 1;
> -		if (mode == NAND_ECC_READ) {
> -			wr_mode	  = BCH_WRAPMODE_6;
> -			ecc_size0 = BCH_ECC_SIZE0;
> -			ecc_size1 = BCH_ECC_SIZE1;
> -		} else {
> -			wr_mode   = BCH_WRAPMODE_6;
> -			ecc_size0 = BCH_ECC_SIZE0;
> -			ecc_size1 = BCH_ECC_SIZE1;
> -		}
> +		wr_mode	  = BCH_WRAPMODE_6;
> +		ecc_size0 = BCH_ECC_SIZE0;
> +		ecc_size1 = BCH_ECC_SIZE1;
>  		break;
>  	case OMAP_ECC_BCH8_CODE_HW:
>  		bch_type = 1;
> 
