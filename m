Received: from mail-pd0-f169.google.com ([209.85.192.169])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcecK-000598-QF
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 16:31:53 +0000
Received: by mail-pd0-f169.google.com with SMTP id y10so773082pdj.14
 for <linux-mtd@lists.infradead.org>; Wed, 15 May 2013 09:31:30 -0700 (PDT)
Message-ID: <5193B854.1030707@gmail.com>
Date: Wed, 15 May 2013 22:01:16 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v5 11/11] mtd: gpmi: set the BCH's geometry with the ecc
 info
References: <1368607232-2210-1-git-send-email-b32955@freescale.com>
 <1368608042-9558-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1368608042-9558-2-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Huang,

On 5/15/2013 2:24 PM, Huang Shijie wrote:
> If the nand chip provides us the ECC info, we can use it firstly.
> The set_geometry_by_ecc_info() will use the ECC info, and
> calculate the parameters we need.
>
> Rename the old code to lagacy_set_geometry() which will takes effect

Couple of nitpicks.
Thorough out the code and in comments.
s/lagacy/legacy/

> when there is no ECC info from the nand chip or we fails in the ECC info case.
>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>   drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  128 +++++++++++++++++++++++++++++++-
>   1 files changed, 127 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 25ecfa1..53180da 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -112,7 +112,128 @@ static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
>   	return true;
>   }
>
> -int common_nfc_set_geometry(struct gpmi_nand_data *this)
> +/*
> + * If we can get the ECC information from the nand chip, we do not
> + * need to calculate them ourselves.
> + *
> + * We may have available oob space in this case.
> + */
> +static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
> +{
> +	struct bch_geometry *geo = &this->bch_geometry;
> +	struct mtd_info *mtd = &this->mtd;
> +	struct nand_chip *chip = mtd->priv;
> +	struct nand_oobfree *of = gpmi_hw_ecclayout.oobfree;
> +	unsigned int block_mark_bit_offset;
> +
> +	if (!(chip->ecc_strength > 0 && chip->ecc_step > 0))
> +		return false;
> +
> +	switch (chip->ecc_step) {
> +	case SZ_512:
> +		geo->gf_len = 13;
> +		break;
> +	case SZ_1K:
> +		geo->gf_len = 14;
> +		break;
> +	default:
> +		dev_err(this->dev,
> +			"unsupported nand chip. ecc bits : %d, ecc size : %d\n",
> +			chip->ecc_strength, chip->ecc_step);
> +		return false;
> +	}
> +	geo->ecc_chunk_size = chip->ecc_step;
> +	geo->ecc_strength = round_up(chip->ecc_strength, 2);
> +	if (!gpmi_check_ecc(this))
> +		return false;
> +
> +	/* Keep the C >= O */
> +	if (geo->ecc_chunk_size < mtd->oobsize) {
> +		dev_err(this->dev,
> +			"unsupported nand chip. ecc size: %d, oob size : %d\n",
> +			chip->ecc_step, mtd->oobsize);
> +		return false;
> +	}
> +
> +	/* The default value, see comment in the lagacy_set_geometry(). */
> +	geo->metadata_size = 10;

If this not gonna change, would it be better to keep it as a macro?

> +
> +	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunk_size;
> +
> +	/*
> +	 * Now, the NAND chip with 2K page(data chunk is 512byte) shows below:
> +	 *
> +	 *    |                          P                            |
> +	 *    |<----------------------------------------------------->|
> +	 *    |                                                       |
> +	 *    |                                        (Block Mark)   |
> +	 *    |                      P'                      |      | |     |
> +	 *    |<-------------------------------------------->|  D   | |  O' |
> +	 *    |                                              |<---->| |<--->|
> +	 *    V                                              V      V V     V
> +	 *    +---+----------+-+----------+-+----------+-+----------+-+-----+
> +	 *    | M |   data   |E|   data   |E|   data   |E|   data   |E|     |
> +	 *    +---+----------+-+----------+-+----------+-+----------+-+-----+
> +	 *
> +	 *	P : the page size for BCH module.
> +	 *	E : The ECC strength.
> +	 *	G : the length of Galois Field.
> +	 *	N : The chunk count of per page.
> +	 *	M : the metasize of per page.
> +	 *	C : the ecc chunk size, aka the "data" above.
> +	 *	P': the nand chip's page size.
> +	 *	O : the nand chip's oob size.

I am not sure if my eyes have gone bad. But I couldn't spot the 'O' in 
the above NAND page diagram.
I think 's/D/O'.

Regards,
Vikram
