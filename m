Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cB1TU-0001VF-KT
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2016 15:34:42 +0000
Date: Sun, 27 Nov 2016 16:34:19 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 15/39] mtd: nand: denali: improve readability of
 handle_ecc()
Message-ID: <20161127163419.556a3307@bbrezillon>
In-Reply-To: <1480183585-592-16-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-16-git-send-email-yamada.masahiro@socionext.com>
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

On Sun, 27 Nov 2016 03:06:01 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> This function is unreadable due to the deep nesting.  Note this
> function does a job only when INTR_STATUS__ECC_ERR is set.
> So, if the flag is not set, let it bail-out.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/mtd/nand/denali.c | 119 +++++++++++++++++++++++-----------------------
>  1 file changed, 59 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index a7dc692..b577560 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -908,69 +908,68 @@ static bool handle_ecc(struct denali_nand_info *denali, u8 *buf,
>  {
>  	bool check_erased_page = false;
>  	unsigned int bitflips = 0;
> +	u32 err_address, err_correction_info, err_byte, err_sector, err_device,
> +	    err_correction_value;

Please use single line definitions for local variables:

	u32 err_address, err_correction_info, err_byte, err_sector;
	u32 err_device, err_correction_value;

Also, maybe you should use shorter names to avoid 80 chars wrapping as
much as possible.

>  
> -	if (irq_status & INTR_STATUS__ECC_ERR) {
> -		/* read the ECC errors. we'll ignore them for now */
> -		u32 err_address, err_correction_info, err_byte,
> -			err_sector, err_device, err_correction_value;
> -		denali_set_intr_modes(denali, false);
> -
> -		do {
> -			err_address = ioread32(denali->flash_reg +
> -						ECC_ERROR_ADDRESS);
> -			err_sector = ECC_SECTOR(err_address);
> -			err_byte = ECC_BYTE(err_address);
> -
> -			err_correction_info = ioread32(denali->flash_reg +
> -						ERR_CORRECTION_INFO);
> -			err_correction_value =
> +	if (!(irq_status & INTR_STATUS__ECC_ERR))
> +		goto out;
> +
> +	/* read the ECC errors. we'll ignore them for now */
> +	denali_set_intr_modes(denali, false);
> +
> +	do {
> +		err_address = ioread32(denali->flash_reg + ECC_ERROR_ADDRESS);
> +		err_sector = ECC_SECTOR(err_address);
> +		err_byte = ECC_BYTE(err_address);
> +
> +		err_correction_info = ioread32(denali->flash_reg +
> +					       ERR_CORRECTION_INFO);
> +		err_correction_value =
>  				ECC_CORRECTION_VALUE(err_correction_info);
> -			err_device = ECC_ERR_DEVICE(err_correction_info);
> -
> -			if (ECC_ERROR_CORRECTABLE(err_correction_info)) {
> -				/*
> -				 * If err_byte is larger than ECC_SECTOR_SIZE,
> -				 * means error happened in OOB, so we ignore
> -				 * it. It's no need for us to correct it
> -				 * err_device is represented the NAND error
> -				 * bits are happened in if there are more
> -				 * than one NAND connected.
> -				 */
> -				if (err_byte < ECC_SECTOR_SIZE) {
> -					struct mtd_info *mtd =
> -						nand_to_mtd(&denali->nand);
> -					int offset;
> -
> -					offset = (err_sector *
> -							ECC_SECTOR_SIZE +
> -							err_byte) *
> -							denali->devnum +
> -							err_device;
> -					/* correct the ECC error */
> -					buf[offset] ^= err_correction_value;
> -					mtd->ecc_stats.corrected++;
> -					bitflips++;
> -				}
> -			} else {
> -				/*
> -				 * if the error is not correctable, need to
> -				 * look at the page to see if it is an erased
> -				 * page. if so, then it's not a real ECC error
> -				 */
> -				check_erased_page = true;
> +		err_device = ECC_ERR_DEVICE(err_correction_info);
> +
> +		if (ECC_ERROR_CORRECTABLE(err_correction_info)) {
> +			/*
> +			 * If err_byte is larger than ECC_SECTOR_SIZE, means error
> +			 * happened in OOB, so we ignore it. It's no need for
> +			 * us to correct it err_device is represented the NAND
> +			 * error bits are happened in if there are more than
> +			 * one NAND connected.
> +			 */
> +			if (err_byte < ECC_SECTOR_SIZE) {
> +				struct mtd_info *mtd =
> +					nand_to_mtd(&denali->nand);
> +				int offset;
> +
> +				offset = (err_sector * ECC_SECTOR_SIZE + err_byte) *
> +					denali->devnum + err_device;
> +				/* correct the ECC error */
> +				buf[offset] ^= err_correction_value;
> +				mtd->ecc_stats.corrected++;
> +				bitflips++;
>  			}
> -		} while (!ECC_LAST_ERR(err_correction_info));
> -		/*
> -		 * Once handle all ecc errors, controller will triger
> -		 * a ECC_TRANSACTION_DONE interrupt, so here just wait
> -		 * for a while for this interrupt
> -		 */
> -		while (!(read_interrupt_status(denali) &
> -				INTR_STATUS__ECC_TRANSACTION_DONE))
> -			cpu_relax();
> -		clear_interrupts(denali);
> -		denali_set_intr_modes(denali, true);
> -	}
> +		} else {
> +			/*
> +			 * if the error is not correctable, need to look at the
> +			 * page to see if it is an erased page. if so, then
> +			 * it's not a real ECC error
> +			 */
> +			check_erased_page = true;
> +		}
> +	} while (!ECC_LAST_ERR(err_correction_info));
> +
> +	/*
> +	 * Once handle all ecc errors, controller will triger a
> +	 * ECC_TRANSACTION_DONE interrupt, so here just wait for
> +	 * a while for this interrupt
> +	 */
> +	while (!(read_interrupt_status(denali) &
> +		 INTR_STATUS__ECC_TRANSACTION_DONE))
> +		cpu_relax();
> +	clear_interrupts(denali);
> +	denali_set_intr_modes(denali, true);
> +
> + out:
>  	*max_bitflips = bitflips;
>  	return check_erased_page;
>  }
