Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vtu2o-0000Pr-J2
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 06:58:47 +0000
Received: by mail-pd0-f180.google.com with SMTP id q10so2146969pdj.25
 for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2013 22:58:24 -0800 (PST)
Date: Thu, 19 Dec 2013 22:58:20 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: nand: parse the Hynix nand which uses <26nm
 technology
Message-ID: <20131220065820.GB16475@norris-Latitude-E6410>
References: <1385974906-29891-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385974906-29891-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Mon, Dec 02, 2013 at 05:01:46PM +0800, Huang Shijie wrote:
> The Hynix uses different ID parsing rules for <26nm technology.
> We should check the id_data[5] for Hynix nand now.
> 
> This patch adds the parsing code for the Hynix nand which use <26nm technology,
> and it also parses out the datasheet's minimum required ECC.
> 
> Tested with H27UBG8T2CTR(8192 + 640).

I don't actually have a datasheet for the < 26nm generation yet. Are
there any publicly available? Or do I need to track down one myself? Not
sure if I have any contacts at Hynix...

> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3162,7 +3162,7 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
>  			(((extid >> 1) & 0x04) | (extid & 0x03));
>  		*busw = 0;
>  	} else if (id_len == 6 && id_data[0] == NAND_MFR_HYNIX &&
> -			!nand_is_slc(chip)) {
> +			!nand_is_slc(chip) && (id_data[5] & 0x7) < 3) {

This should be <= 3, since '3' is for 26nm.

Also, I recommended (on the other patch) that you split Hynix out into
its own function, since it is growing too much and it shares many of the
same checks.

And please add a comment about the 'id_data[5] & 0x7' bitfield
represents in the new Hynix ext_id function, like in the comments near
the top of nand_decode_ext_id() that already describe the two different
kinds of Samsung and the Hynix MLC.

>  		unsigned int tmp;
>  
>  		/* Calc pagesize */
> @@ -3202,6 +3202,69 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
>  		else
>  			mtd->erasesize = (64 * 1024) << tmp;
>  		*busw = 0;
> +	} else if (id_len == 6 && id_data[0] == NAND_MFR_HYNIX &&
> +			!nand_is_slc(chip) && (id_data[5] & 0x7) > 3) {
> +		unsigned int tmp;
> +
> +		/* Calc pagesize */
> +		mtd->writesize = 4096 << (extid & 0x03);
> +		extid >>= 2;
> +		/* Calc oobsize */
> +		switch (((extid >> 2) & 0x04) | (extid & 0x03)) {

If you create a Hynix ext-ID function, the above bitfield calculation
can be shared.

> +		case 0:
> +			mtd->oobsize = 640;
> +			break;
> +		case 1:
> +			mtd->oobsize = 448;
> +			break;
> +		case 2:
> +			mtd->oobsize = 224;
> +			break;
> +		case 3:
> +			mtd->oobsize = 128;
> +			break;
> +		case 4:
> +			mtd->oobsize = 64;
> +			break;
> +		case 5:
> +			mtd->oobsize = 32;
> +			break;
> +		case 6:
> +			mtd->oobsize = 16;
> +			break;
> +		default:
> +			mtd->oobsize = 640;
> +			break;
> +		}
> +		extid >>= 2;
> +		/* Calc blocksize */
> +		tmp = ((extid >> 1) & 0x04) | (extid & 0x03);
> +		if (tmp < 0x03)
> +			mtd->erasesize = (128 * 1024) << tmp;
> +		else if (tmp == 0x03)
> +			mtd->erasesize = 768 * 1024;
> +		else
> +			mtd->erasesize = (64 * 1024) << tmp;

This entire erasesize calculation can be shared with the >=26nm version.

> +
> +		/* ecc info */

s/ecc/ECC/

> +		tmp = (id_data[4] >> 4) & 0x7;
> +
> +		if (tmp < 4) {
> +			chip->ecc_strength_ds = 1 << tmp;
> +			chip->ecc_step_ds = 512;
> +		} else {
> +			chip->ecc_step_ds = 1024;
> +			if (tmp == 4)
> +				chip->ecc_strength_ds = 24;
> +			else if (tmp == 5)
> +				chip->ecc_strength_ds = 32;
> +			else if (tmp == 6)
> +				chip->ecc_strength_ds = 40;
> +			else /* (tmp == 7) */
> +				chip->ecc_strength_ds = 100;
> +		}

My same criticism about parsing ECC info applies here. How can I trust
that this table will be at all maintainable in the future? I'm not
convinced it's actually necessary information to put here, and if it's
low-utility, then it's not worth maintaining, IMO. (Let's keep the ECC
discussion on the patch 2, where I responded in fuller detail though,
please.)

Brian
