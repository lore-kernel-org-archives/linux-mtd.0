Received: from us2.outbound.mailhostbox.com ([162.210.70.52])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJC4F-0006zS-LE
 for linux-mtd@lists.infradead.org; Thu, 05 Feb 2015 02:21:20 +0000
Message-ID: <54D2D36A.4030800@pek-sem.com>
Date: Thu, 05 Feb 2015 07:50:26 +0530
From: pekon <pekon@pek-sem.com>
MIME-Version: 1.0
To: Nicholas Mc Guire <hofrat@osadl.org>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2] mtd: nand: omap: drop condition with no effect
References: <1423070646-12906-1-git-send-email-hofrat@osadl.org>
In-Reply-To: <1423070646-12906-1-git-send-email-hofrat@osadl.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: pekon gupta <pekon@ti.com>, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, Rostislav Lisovy <lisovy@gmail.com>,
 linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Brian Norris <computersforpeace@gmail.com>, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 04 February 2015 10:54 PM, Nicholas Mc Guire wrote:
> The if and the else branch code are identical - so the condition has no
> effect on the effective code. This patch removes the condition and the
> duplicated code and updates the documentation as suggested by
> Roger Quadros <rogerq@ti.com>.
>
> Acked-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
>
> v2: Confirmation of proposed patch and update of the related documentation
>      as provided by Roger Quadros <rogerq@ti.com>
>
> The conditions in the OMAP_ECC_BCH8_CODE_HW_DETECTION_SW and
> OMAP_ECC_BCH4_CODE_HW_DETECTION_SW case have no effect and can
> be removed.
>
> Patch was only compile tested with arm-linux-gnueabi-4.7-, current
> crosstool-ng did not seem to build omap2 properly.
> Config is omap2plus_defconfig which implies CONFIG_MTD_NAND_OMAP2=y.
>
> Patch is against 3.19.0-rc7 (localversion-next is -next-20150204)
>
>   drivers/mtd/nand/omap2.c |   31 +++++++++----------------------
>   1 file changed, 9 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 63f858e..60fa899 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1048,10 +1048,9 @@ static int omap_dev_ready(struct mtd_info *mtd)
>    * @mtd: MTD device structure
>    * @mode: Read/Write mode
>    *
> - * When using BCH, sector size is hardcoded to 512 bytes.
> - * Using wrapping mode 6 both for reading and writing if ELM module not uses
> - * for error correction.
> - * On writing,
> + * When using BCH with SW correction (i.e. no ELM), sector size is set
> + * to 512 bytes and we use BCH_WRAPMODE_6 wrapping mode
> + * for both reading and writing with:
>    * eccsize0 = 0  (no additional protected byte in spare area)
>    * eccsize1 = 32 (skip 32 nibbles = 16 bytes per sector in spare area)
>    */
> @@ -1071,15 +1070,9 @@ static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
>   	case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
>   		bch_type = 0;
>   		nsectors = 1;
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
>   		break;
>   	case OMAP_ECC_BCH4_CODE_HW:
>   		bch_type = 0;
> @@ -1097,15 +1090,9 @@ static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
>   	case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
>   		bch_type = 1;
>   		nsectors = 1;
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
>   		break;
>   	case OMAP_ECC_BCH8_CODE_HW:
>   		bch_type = 1;
>
Thanks for the clean-up ..
Reviewed-by: Pekon Gupta <pekon@pek-sem.com>

with regards, pekon

------------------------
Powered by BigRock.com
