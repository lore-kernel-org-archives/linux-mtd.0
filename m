Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P12zc-0006ug-DA
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 20:11:09 +0000
Received: by bwz19 with SMTP id 19so1176179bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Sep 2010 13:11:07 -0700 (PDT)
Subject: Re: [PATCH 3/5] mtd/nand: add support for BBT without OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <1285782234-32509-4-git-send-email-bigeasy@linutronix.de>
References: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
	<1285782234-32509-4-git-send-email-bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 29 Sep 2010 23:11:04 +0300
Message-ID: <1285791064.1776.35.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-29 at 19:43 +0200, Sebastian Andrzej Siewior wrote:
> The first (sixt) byte in the OOB area contains vendor's bad block
> information. During identification of the NAND chip this information is
> collected by scanning the complete chip.
> The option NAND_USE_FLASH_BBT is used to store this information in a sector so
> we don't have to scan the complete flash. Unfortunately the code stores
> a marker, in order to recognize the BBT, in the OOB area. This will fail
> if the OOB area is completely used for ECC.
> This patch introduces the option NAND_USE_FLASH_BBT_NO_OOB which has to be
> used with NAND_USE_FLASH_BBT. It will then store BBT on flash without
> touching the OOB area. The BBT format on flash remains same except the
> first page starts with the recognition pattern followed by the no longer
> optional version byte.
> This change was tested in nandsim and on real HW with this issue.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/mtd/nand/nand_bbt.c |  193 ++++++++++++++++++++++++++++++++++++++++---
>  include/linux/mtd/bbm.h     |    2 +
>  include/linux/mtd/nand.h    |    7 +-
>  3 files changed, 189 insertions(+), 13 deletions(-)

Few minor things.

First, is it please possible to add more descriptive comment into the
code. Something like you put to the patch description, may be even a bit
more descriptive. May be to the header of nand_bbt.c?

The idea is that the BBT code is quite difficult to follow, and you make
it even more complex, so a comment describing various flavors of BBT
would be very useful.

And then several stylistic nitpicks.

>  	while (totlen) {
> +
>  		len = min(totlen, (size_t) (1 << this->bbt_erase_shift));

These extra whits spaces are not really needed. Ideally, your patch
should make checkpatch.pl happy.
> +
> +		if (marker_len) {
> +			/*
> +			 * In case the BBT marker is not in the OOB area it
> +			 * will be just in the first page
> +			 */

Yes, this is the right multi-line comment. You may also put a dot at the
end. But in other places you used not the right multi-line comments.

> +		} else if (td->options & NAND_BBT_NO_OOB) {
> +
> +			ooboffs = 0;

Extra blank line.

> +			offs = td->len;
> +			/* the version byte */
> +			if (td->options & NAND_BBT_VERSION)
> +				offs++;
> +			/* Calc length */
> +			len = (size_t) (numblocks >> sft);
> +			len += offs;
> +			/* Make it page aligned ! */
> +			len = ALIGN(len, mtd->writesize);
> +			/* Preset the buffer with 0xff */
> +			memset(buf, 0xff, len);
> +			/* Pattern is located at the begin of first page */
> +			memcpy(buf, td->pattern, td->len);
> +
>  		} else {

And here.

> -/* Use a flash based bad block table. This option is passed to the
> - * default bad block table function. */
> +/* Use a flash based bad block table. OOB identifier is saved in OOB area.
> + * This option is passed to the default bad block table function. */

Would be nice to convert this to the right multi-line comment.

>  #define NAND_USE_FLASH_BBT	0x00010000
>  /* This option skips the bbt scan during initialization. */
>  #define NAND_SKIP_BBTSCAN	0x00020000
> @@ -215,6 +215,9 @@ typedef enum {
>  #define NAND_OWN_BUFFERS	0x00040000
>  /* Chip may not exist, so silence any errors in scan */
>  #define NAND_SCAN_SILENT_NODEV	0x00080000
> +/* If passed additionally to NAND_USE_FLASH_BBT then BBT code will not touch
> + * the OOB area */

And this. Yeah, I know this file uses different styles, but you could
convert even all of them.

> +#define NAND_USE_FLASH_BBT_NO_OOB	0x00100000

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
