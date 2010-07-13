Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYaoz-0007HC-EY
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 08:26:34 +0000
Subject: Re: [PATCH 2] mtd/nand, BB detect: factory marker in page 1, 2,
	last and byte 1 or 6
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1277501791-3146-1-git-send-email-norris@broadcom.com>
References: <1277325362-13326-1-git-send-email-norris@broadcom.com>
	<1277501791-3146-1-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 11:21:32 +0300
Message-ID: <1279009292.30765.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-06-25 at 14:36 -0700, Brian Norris wrote:
> @@ -2920,9 +2920,13 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  		chip->chip_shift = ffs((unsigned)(chip->chipsize >> 32)) + 32 - 1;
>  
>  	/* Set the bad block position */
> -	chip->badblockpos = mtd->writesize > 512 ?
> -		NAND_LARGE_BADBLOCK_POS : NAND_SMALL_BADBLOCK_POS;
> -	chip->badblockbits = 8;
> +	chip->badblockpos = (!(busw & NAND_BUSWIDTH_16) &&
> +			(*maf_id == NAND_MFR_STMICRO ||
> +			 (*maf_id == NAND_MFR_SAMSUNG &&
> +			  mtd->writesize == 512) ||
> +			 *maf_id == NAND_MFR_AMD))
> +		? NAND_SMALL_BADBLOCK_POS : NAND_LARGE_BADBLOCK_POS;

I'd prefer if () else, ? : is not appropriate for such huge conditions.

Nevertheless, you patch looks indeed like a step in the right direction,
but I cannot really test it and do not have time to review.

But could you please re-send it without trailing white-spaces - I'll put
it to my l2 tree then? You can do a 'git am' to your own patches - it'll
check for trailing white-spaces for you.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
