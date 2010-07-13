Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OYpLc-0000ex-Fy
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 23:57:13 +0000
Message-ID: <4C3CFD4A.3020708@broadcom.com>
Date: Tue, 13 Jul 2010 16:56:58 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] mtd/nand: More BB Detection, dynamic scan options
References: <1279059181-29300-1-git-send-email-norris@broadcom.com>
	<1279059181-29300-3-git-send-email-norris@broadcom.com>
In-Reply-To: <1279059181-29300-3-git-send-email-norris@broadcom.com>
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Brian Norris <norris@broadcom.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a few comments/questions about the following sections.

On 07/13/2010 03:13 PM, Brian Norris wrote:
> Added new flag for scanning of both bytes 1 and 6 of the OOB for
> a BB marker (instead of simply one or the other).

<snip>

> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index ec1700e..474ff66 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c

<snip>

> @@ -447,6 +445,24 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
>   		if (ret<  0)
>   			return ret;
>
> +		/* Check if we need a second scan for the 6th byte
> +		 * Perhaps there is a more efficient way of doing this?
> +		 */
> +		if (!ret&&  bd->options&  NAND_BBT_SCANBYTE1AND6) {
> +			bd->offs = NAND_SMALL_BADBLOCK_POS;
> +			if (bd->options&  NAND_BBT_SCANALLPAGES)
> +				ret = scan_block_full(mtd, bd, from, buf,
> +						readlen, scanlen, len);
> +			else
> +				ret = scan_block_fast(mtd, bd, from, buf, len);
> +
> +			/* Reset offset for future scans */
> +			bd->offs = NAND_LARGE_BADBLOCK_POS;
> +
> +			if (ret<  0)
> +				return ret;
> +		}
> +
>   		if (ret) {
>   			this->bbt[i>>  3] |= 0x03<<  (i&  0x6);
>   			printk(KERN_WARNING "Bad eraseblock %d at 0x%012llx\n",

I realize it's probably not the best practice to just duplicate/modify 
the detection code as I did above. I am trying to find the best place to 
implement the scanning of both bytes 1 and 6 of the OOB. Perhaps 
nand_bbt.c:check_pattern() and check_short_pattern()?

Also, it seems to me that in addition to the main scanning routines, I 
should update the nand_default_block_markbad() function in nand_base.c 
so that it writes its BB marker to the proper bytes in the OOB. Does 
this sound reasonable?

Comments/corrections are appreciated!

Brian
