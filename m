Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U5fv1-0000KG-6A
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2013 17:14:51 +0000
Received: by mail-ie0-f176.google.com with SMTP id k13so1991117iea.21
 for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2013 09:14:48 -0800 (PST)
Message-ID: <511BC9FD.1040600@gmail.com>
Date: Wed, 13 Feb 2013 22:44:37 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: katsuki.uwatoko@toshiba.co.jp
Subject: Re: [PATCH] mtd: nand: support BENAND (Built-in ECC NAND)
References: <F3B6523425E7914AA6214ED358D820AF25D9879D@TGXML316.toshiba.local>
In-Reply-To: <F3B6523425E7914AA6214ED358D820AF25D9879D@TGXML316.toshiba.local>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/12/2013 5:55 AM, katsuki.uwatoko@toshiba.co.jp wrote:
> This enables support for BENAND, which is an SLC NAND flash solution
> with embedded error correction code (ECC), currently supports only
> 128bytes OOB type.
>
> In the read sequence, "status read command" is executed to check the
> ECC status after read data. If bitflips occur, these are
> automatically corrected by BENAND and the status indicates the result.
>
> The write sequence is the same as raw write and the ECC data are
> automatically written to OOB by BENAND.

Couple of comments. Not related to the functionality though :)

> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 1a03b7f..2b0c178 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -43,6 +43,7 @@
>   #include <linux/mtd/nand.h>
>   #include <linux/mtd/nand_ecc.h>
>   #include <linux/mtd/nand_bch.h>
> +#include <linux/mtd/nand_benand.h>
>   #include <linux/interrupt.h>
>   #include <linux/bitops.h>
>   #include <linux/leds.h>
> @@ -3076,6 +3077,11 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
>   		extid >>= 2;
>   		/* Get buswidth information */
>   		*busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
> +
> +		/* check BENAND (embedded ECC) */
> +		if (id_data[0] == NAND_MFR_TOSHIBA &&
> +		    (id_data[4] & 1 << 7))

Can the (1 << 7) be made as some macro, with an understandable name?

> +			nand_benand_setupecc(mtd, &(chip->ecc.mode));
>   	}
>   }
>
> @@ -3530,6 +3536,25 @@ int nand_scan_tail(struct mtd_info *mtd)
>   			chip->ecc.bytes * 8 / fls(8 * chip->ecc.size);
>   		break;
>
> +	case NAND_ECC_BENAND:
> +		if (!mtd_nand_has_benand()) {

Can IS_ENABLED be used here instead?

> +			pr_warn("CONFIG_MTD_BENAND not enabled\n");
> +			BUG();

Should you really BUG here?

> +		}
> +
> +		chip->ecc.read_page = nand_read_page_benand;
> +		chip->ecc.write_page = nand_write_page_raw;
> +		chip->ecc.read_page_raw = nand_read_page_raw;
> +		chip->ecc.write_page_raw = nand_write_page_raw;
> +		chip->ecc.read_oob = nand_read_oob_std;
> +		chip->ecc.write_oob = nand_write_oob_std;
> +
> +		if (nand_benand_init(mtd)) {
> +			pr_warn("BENAND initialization failed!\n");
> +			BUG();
> +		}
> +		break;
> +
>   	case NAND_ECC_NONE:
>   		pr_warn("NAND_ECC_NONE selected by board driver. "
>   			   "This is not recommended!\n");
<snip>
> diff --git a/include/linux/mtd/nand_benand.h b/include/linux/mtd/nand_benand.h
> new file mode 100644
> index 0000000..ac043e5
> --- /dev/null
> +++ b/include/linux/mtd/nand_benand.h
> @@ -0,0 +1,47 @@
> +/*
> + * (C) Copyright TOSHIBA CORPORATION 2013
> + * All Rights Reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This file is the header for the NAND BENAND implementation.
> + */
> +
> +#ifndef __MTD_NAND_BENAND_H__
> +#define __MTD_NAND_BENAND_H__
> +
> +#if defined(CONFIG_MTD_NAND_BENAND)
> +
> +static inline int mtd_nand_has_benand(void) { return 1; }

If IS_ENABLED is used, the above would go off.

~Vikram
