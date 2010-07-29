Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OeNwg-0005g0-E4
	for linux-mtd@lists.infradead.org; Thu, 29 Jul 2010 07:54:27 +0000
Message-ID: <4C5133AC.5010009@parrot.com>
Date: Thu, 29 Jul 2010 09:54:20 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Florian Fainelli <ffainelli@freebox.fr>
Subject: Re: [PATCH] NAND: add support for reading ONFI parameters from NAND
	device
References: <201007290047.06394.ffainelli@freebox.fr>
In-Reply-To: <201007290047.06394.ffainelli@freebox.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>, Maxime Bizon <mbizon@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Florian Fainelli a écrit :
> A nand_chip which has valid ONFI parameters gets its options field updated
> with the NAND_ONFI flag. In that case both the ONFI version (in BCD format)
> as well as the complete page parameters is available in the struct nand_chip.
> This allows for better detection of some new devices, as well as fine tuning of
> NAND driver timings. This patch only adds support for ONFI 1.0 parameters.
> 
> Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
> Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
> ---
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 4a7b864..c255cec 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2773,6 +2773,83 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
>  }
>  

> +
> +/*
> + * Check whether flash support ONFI and read ONFI parameters in that
> + * case
> + */
> +static void nand_read_onfi(struct mtd_info *mtd, struct nand_chip *chip)
> +{
> +	struct nand_onfi_params *p;
> +	uint8_t sig[4];
> +	uint16_t val;
> +
> +	if (!chip->cmdfunc || !chip->read_buf)
> +		return;
> +
> +	/* read ONFI signature */
> +	chip->cmdfunc(mtd, NAND_CMD_READID, NAND_ADDR_ONFI_ID, -1);
> +	chip->read_buf(mtd, sig, sizeof(sig));
> +
> +	if (memcmp(sig, "ONFI", sizeof(sig)))
> +		return;
> +
> +	/* ONFI seems supported */
> +	chip->cmdfunc(mtd, NAND_CMD_READ_ONFI_PARAMS, 0, -1);
> +	p = &chip->onfi_params;
> +	chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
> +
> +	/* recheck signature */
> +	if (memcmp(p->sig, "ONFI", sizeof(p->sig))) {
> +		printk(KERN_INFO "%s: bad ONFI params signature\n", __func__);
> +		return;
> +	}
You need to check crc. onfi param can be corrupted (bitflip ?) and 
should try at least 3 page.


Also you don't handle endianness (integer are little endian) for value 
in nand_onfi_params.

Also I am not sure it is worth to export all the onfi param. Fill the 
mtd param for page, erase, oob size and other stuff.
After all rev info and features block, manufacturer information block, 
memory organization block should only be used by mtd layer.
Only electrical parameter block can interest driver for fine tunning.


>   * Get the flash and manufacturer id and lookup if the type is supported
>   */
>  static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
> @@ -2958,10 +3035,19 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
>  		chip->cmdfunc = nand_command_lp;
>  
> +	nand_read_onfi(mtd, chip);
> +
>  	printk(KERN_INFO "NAND device: Manufacturer ID:"
>  	       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, dev_id,
>  	       nand_manuf_ids[maf_idx].name, type->name);
>  
> +	if (chip->options & NAND_ONFI)
> +		printk(KERN_INFO "NAND is ONFI %d.%d compliant "
> +		       "(man:%s model:%s)\n",
> +		       chip->onfi_version / 10, chip->onfi_version % 10,
> +		       chip->onfi_params.manufacturer,
> +		       chip->onfi_params.model);
> +
>  	return type;
>  }
>  
This won't work this unknown nand, and not work with some LP nand that 
doesn't provide additional id bytes.


Matthieu
