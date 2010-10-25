Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAI6x-0004xB-K7
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 08:08:56 +0000
Received: by bwz5 with SMTP id 5so2762146bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 01:08:54 -0700 (PDT)
Subject: Re: [RFC] write bad block marker even with BBT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4CC1A5EE.9080605@parrot.com>
References: <4CC1A5EE.9080605@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 Oct 2010 11:05:45 +0300
Message-ID: <1287993945.2224.9.camel@localhost>
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

> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ddffe76..71052d0 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -409,7 +409,10 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
>  	/* Do we have a flash based bad block table ? */
>  	if (chip->options & NAND_USE_FLASH_BBT)
>  		ret = nand_update_bbt(mtd, ofs);
> -	else {
> +	/* put also the bad block marker in case we loose BBT or
> +	   the bootloader doesn't support reading it
> +	 */

Nitpick: please, use kernel commenting style:
/*
 * Multi-line
 * comment
 */

> +	{
>  		nand_get_device(chip, mtd, FL_WRITING);

I think this makes sense, but this may break some setups, so this should
be yet another chip->option.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
