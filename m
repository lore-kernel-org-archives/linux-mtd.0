Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cB21D-00039r-7L
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2016 16:09:32 +0000
Date: Sun, 27 Nov 2016 17:09:07 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 17/39] mtd: nand: denali: support HW_ECC_FIXUP capability
Message-ID: <20161127170907.002e6ab4@bbrezillon>
In-Reply-To: <1480183585-592-18-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-18-git-send-email-yamada.masahiro@socionext.com>
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

On Sun, 27 Nov 2016 03:06:03 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Some old versions of the Denali IP (perhaps used only for Intel?)
> detects ECC errors and provides correct data via a register, but
> does not touch the transferred data.  So, the software must fixup
> the data in the buffer according to the provided ECC correction
> information.
> 
> Newer versions perform ECC correction before transferring the data.
> No more software intervention is needed.  The ECC_ERROR_ADDRESS and
> ECC_CORRECTION_INFO registers were deprecated.  Instead, the number
> of corrected bit-flips can be read from the ECC_COR_INFO register.
> When an uncorrectable ECC error happens, a status flag is set to the
> INTR_STATUS and ECC_COR_INFO registers.
> 
> As is often the case with this IP, the register view of INTR_STATUS
> had broken compatibility.
> 
> For older versions (SW ECC fixup):
>   bit 0:  ECC_TRANSACTION_DONE
>   bit 1:  ECC_ERR
> 
> For newer versions (HW ECC fixup):
>   bit 0:  ECC_UNCOR_ERR
>   bit 1:  Reserved
> 
> Due to this difference, the irq_mask must be fixed too.  The comment
> block in the denali_sw_ecc_fixup() has been moved to the common part
> because the comment applies to both cases.
> 
> The U-Boot port of this driver already supports the HW ECC fixup.  I
> borrowed the comment "Some versions of ..." in denali.h from U-Boot.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/mtd/nand/denali.c | 44 ++++++++++++++++++++++++++++++++++----------
>  drivers/mtd/nand/denali.h | 14 ++++++++++++++
>  2 files changed, 48 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 271b41a..c101e7f 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -894,6 +894,25 @@ static bool is_erased(u8 *buf, int len)
>  			return false;
>  	return true;
>  }
> +
> +static bool denali_hw_ecc_fixup(struct denali_nand_info *denali,
> +				unsigned int *max_bitflips)
> +{
> +	int bank = denali->flash_bank;
> +	u32 ecc_cor;
> +
> +	ecc_cor = ioread32(denali->flash_reg + ECC_COR_INFO(bank));
> +	ecc_cor >>= ECC_COR_INFO_SHIFT(bank);
> +
> +	if (ecc_cor & ECC_COR_INFO__UNCOR_ERR) {
> +		*max_bitflips = 0;
> +		return true;
> +	}
> +
> +	*max_bitflips = ecc_cor & ECC_COR_INFO__MAX_ERRORS;
> +	return false;
> +}
> +
>  #define ECC_SECTOR_SIZE 512
>  
>  #define ECC_SECTOR(x)	(((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
> @@ -949,11 +968,6 @@ static bool denali_sw_ecc_fixup(struct denali_nand_info *denali, u8 *buf,
>  				bitflips++;
>  			}
>  		} else {
> -			/*
> -			 * if the error is not correctable, need to look at the
> -			 * page to see if it is an erased page. if so, then
> -			 * it's not a real ECC error
> -			 */
>  			check_erased_page = true;
>  		}
>  	} while (!ECC_LAST_ERR(err_correction_info));
> @@ -1109,12 +1123,12 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  {
>  	unsigned int max_bitflips;
>  	struct denali_nand_info *denali = mtd_to_denali(mtd);
> -
>  	dma_addr_t addr = denali->buf.dma_buf;
>  	size_t size = mtd->writesize + mtd->oobsize;
> -
>  	u32 irq_status;
> -	u32 irq_mask = INTR_STATUS__ECC_TRANSACTION_DONE | INTR_STATUS__ECC_ERR;
> +	u32 irq_mask = denali->caps & DENALI_CAPS_HW_ECC_FIXUP ?
> +		INTR_STATUS__DMA_CMD_COMP | INTR_STATUS__ECC_UNCOR_ERR :
> +		INTR_STATUS__ECC_TRANSACTION_DONE | INTR_STATUS__ECC_ERR;
>  	bool check_erased_page = false;
>  
>  	if (page != denali->page) {
> @@ -1139,11 +1153,21 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  
>  	memcpy(buf, denali->buf.buf, mtd->writesize);
>  
> -	check_erased_page = denali_sw_ecc_fixup(denali, buf, irq_status,
> -						&max_bitflips);
> +	if (denali->caps & DENALI_CAPS_HW_ECC_FIXUP)
> +		check_erased_page = denali_hw_ecc_fixup(denali, &max_bitflips);
> +	else
> +		check_erased_page = denali_sw_ecc_fixup(denali, buf, irq_status,
> +							&max_bitflips);

Okay, so you currently have two ways of handling ECC errors. What if a
new revision introduces yet another way to do it?

How about making denali_caps a structure where you have one (or several)
function pointers to implement operations differently depending on the
IP revision?

struct denali_caps {
	u32 feature_flags; /* If needed. */
	bool (*handle_ecc)(...);
	...
};

> +
>  	denali_enable_dma(denali, false);
>  
>  	if (check_erased_page) {
> +		/*
> +		 * If the error is not correctable, need to look at the page to
> +		 * see if it is an erased page. If so, then it's not a real ECC
> +		 * error.
> +		 */
> +
>  		read_oob_data(mtd, chip->oob_poi, denali->page);
>  
>  		/* check ECC failures that may have occurred on erased pages */
> diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
> index 69314d0..beadc8a 100644
> --- a/drivers/mtd/nand/denali.h
> +++ b/drivers/mtd/nand/denali.h
> @@ -20,6 +20,7 @@
>  #ifndef __DENALI_H__
>  #define __DENALI_H__
>  
> +#include <linux/bitops.h>
>  #include <linux/mtd/nand.h>
>  
>  #define DEVICE_RESET				0x0
> @@ -219,6 +220,13 @@
>  #define INTR_STATUS(__bank)	(0x410 + ((__bank) * 0x50))
>  #define INTR_EN(__bank)		(0x420 + ((__bank) * 0x50))
>  
> +/*
> + * Some versions of the IP have the ECC fixup handled in hardware.  In this
> + * configuration we only get interrupted when the error is uncorrectable.
> + * Unfortunately this bit replaces INTR_STATUS__ECC_TRANSACTION_DONE from the
> + * old IP.
> + */
> +#define     INTR_STATUS__ECC_UNCOR_ERR			0x0001
>  #define     INTR_STATUS__ECC_TRANSACTION_DONE		0x0001
>  #define     INTR_STATUS__ECC_ERR			0x0002
>  #define     INTR_STATUS__DMA_CMD_COMP			0x0004
> @@ -297,6 +305,11 @@
>  #define     ERR_CORRECTION_INFO__ERROR_TYPE		0x4000
>  #define     ERR_CORRECTION_INFO__LAST_ERR_INFO		0x8000
>  
> +#define ECC_COR_INFO(__bank)	(0x650 + (__bank) / 2 * 0x10)
> +#define ECC_COR_INFO_SHIFT(__bank)	((__bank) % 2 * 8)
> +#define     ECC_COR_INFO__MAX_ERRORS			0x007f
> +#define     ECC_COR_INFO__UNCOR_ERR			0x0080
> +
>  #define DMA_ENABLE				0x700
>  #define     DMA_ENABLE__FLAG				0x0001
>  
> @@ -421,6 +434,7 @@ struct denali_nand_info {
>  	u32 bbtskipbytes;
>  	u32 max_banks;
>  	unsigned int caps;
> +#define DENALI_CAPS_HW_ECC_FIXUP		BIT(0)
>  };
>  
>  extern int denali_init(struct denali_nand_info *denali);
