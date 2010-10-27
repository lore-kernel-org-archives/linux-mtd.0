Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PBAhj-0005uL-5U
	for linux-mtd@lists.infradead.org; Wed, 27 Oct 2010 18:26:31 +0000
Received: by bwz5 with SMTP id 5so912616bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Oct 2010 11:26:28 -0700 (PDT)
Subject: Re: [PATCH] write bad block marker even with BBT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4CC54223.2050401@parrot.com>
References: <4CC54223.2050401@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 27 Oct 2010 21:26:25 +0300
Message-ID: <1288203985.1766.6.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry for being PITA, but

On Mon, 2010-10-25 at 10:38 +0200, Matthieu CASTET wrote:
> +
> +	/* Write the bad block marker if we don't have BBT, or driver
> +	 * request it (in case the bootloader doesn't support reading it
> +	 * or we loose BBT).
> +	 */

Still not proper comment :-)

> +	if (!(chip->options & NAND_USE_FLASH_BBT) || chip->options & NAND_WRITE_BB) {
>  		nand_get_device(chip, mtd, FL_WRITING);
>  
>  		/* Write to first two pages and to byte 1 and 6 if necessary.
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 102e12c..2efd2f9 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -215,6 +215,8 @@ typedef enum {
>  #define NAND_OWN_BUFFERS	0x00040000
>  /* Chip may not exist, so silence any errors in scan */
>  #define NAND_SCAN_SILENT_NODEV	0x00080000
> +/* in case of NAND_USE_FLASH_BBT, write also bad block marker */
> +#define NAND_WRITE_BB	0x00100000

I think the comment should be a bit more descriptive and tell that this
is about using BBT _and_ writing BB marker to OOB area. Use proper
comment style, start with capital letter.

Also, add a BUG_ON to catch misuse cases when NAND_WRITE_BB is used
without NAND_USE_FLASH_BBT - they should go in pair.

And also, how about cases when BBT is updated, but OOB did not because
of a power cut :-)) ?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
