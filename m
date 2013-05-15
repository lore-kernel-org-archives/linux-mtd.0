Received: from mail-da0-x229.google.com ([2607:f8b0:400e:c00::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ucf1w-0005on-My
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 16:58:21 +0000
Received: by mail-da0-f41.google.com with SMTP id y19so1100693dan.14
 for <linux-mtd@lists.infradead.org>; Wed, 15 May 2013 09:57:59 -0700 (PDT)
Message-ID: <5193BE8F.6010807@gmail.com>
Date: Wed, 15 May 2013 22:27:51 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v5 06/11] mtd: get the ECC info from the Extended Parameter
 Page
References: <1368607232-2210-1-git-send-email-b32955@freescale.com>
 <1368607232-2210-7-git-send-email-b32955@freescale.com>
In-Reply-To: <1368607232-2210-7-git-send-email-b32955@freescale.com>
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

On 5/15/2013 2:10 PM, Huang Shijie wrote:
> Since the ONFI 2.1, the onfi spec adds the Extended Parameter Page
> to store the ECC info.
>
> The onfi spec tells us that if the nand chip's recommended ECC codeword
> size is not 512 bytes, then the @ecc_bits is 0xff. The host _SHOULD_ then

Section 3.4.2 also says,
"If a value of 0 is reported then this ECC Information Block is invalid 
and should not be used".

Is this taken care anywhere?

> read the Extended ECC information that is part of the extended parameter
> page to retrieve the ECC requirements for this device.
>
> This patch implement the reading of the Extended Parameter Page, and parses
> the sections for ECC type, and get the ECC info from the ECC section.
>
> Tested this patch with Micron MT29F64G08CBABAWP.
>
> Acked-by: Pekon Gupta <pekon@ti.com>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>   drivers/mtd/nand/nand_base.c |   77 ++++++++++++++++++++++++++++++++++++++++++
>   1 files changed, 77 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 15630ef..e98ea69 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2835,6 +2835,68 @@ static u16 onfi_crc16(u16 crc, u8 const *p, size_t len)
>   	return crc;
>   }
>
> +/* Parse the Extended Parameter Page. */
> +static int nand_flash_detect_ext_param_page(struct mtd_info *mtd,
> +		struct nand_chip *chip, struct nand_onfi_params *p)
> +{
> +	struct onfi_ext_param_page *ep;
> +	struct onfi_ext_section *s;
> +	struct onfi_ext_ecc_info *ecc;
> +	uint8_t *cursor;
> +	int len;
> +	int ret;
> +	int i;
> +
> +	len = le16_to_cpu(p->ext_param_page_length) * 16;
> +	ep = kmalloc(len, GFP_KERNEL);
> +	if (!ep) {
> +		ret = -ENOMEM;
> +		goto ext_out;

Just return -ENOMEM.
Why do you free the memory when it is not allocated? (Though it doesn't 
cause any harm)

> +	}
> +
> +	/* Send our own NAND_CMD_PARAM. */
> +	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
> +
> +	/* Use the Change Read Column command to skip the ONFI param pages. */
> +	chip->cmdfunc(mtd, NAND_CMD_RNDOUT,
> +			sizeof(*p) * p->num_of_param_pages , -1);
> +
> +	/* Read out the Extended Parameter Page. */
> +	chip->read_buf(mtd, (uint8_t *)ep, len);
> +	if ((onfi_crc16(ONFI_CRC_BASE, ((uint8_t *)ep) + 2, len - 2)
> +		!= le16_to_cpu(ep->crc)) || strncmp(ep->sig, "EPPS", 4)) {
> +		pr_debug("fail in the CRC.\n");
> +		ret = -EINVAL;
> +		goto ext_out;
> +	}
> +
> +	/* find the ECC section. */
> +	cursor = (uint8_t *)(ep + 1);
> +	for (i = 0; i < ONFI_EXT_SECTION_MAX; i++) {
> +		s = ep->sections + i;
> +		if (s->type == ONFI_SECTION_TYPE_2)
> +			break;
> +		cursor += s->length * 16;
> +	}
> +	if (i == ONFI_EXT_SECTION_MAX) {
> +		pr_debug("We can not find the ECC section.\n");
> +		ret = -EINVAL;
> +		goto ext_out;
> +	}
> +
> +	/* get the info we want. */
> +	ecc = (struct onfi_ext_ecc_info *)cursor;
> +	chip->ecc_strength = ecc->ecc_bits;
> +	chip->ecc_step = 1 << ecc->codeword_size;
> +
> +	pr_info("ONFI extended param page detected.\n");
> +	return 0;
> +
> +ext_out:
> +	kfree(ep);
> +	return ret;
> +}
> +

~Vikram
