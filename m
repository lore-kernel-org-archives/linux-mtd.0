Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUK3H-0005qO-Im
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 14:48:12 +0000
Received: by gxk2 with SMTP id 2so255664gxk.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 07:48:08 -0700 (PDT)
Subject: Re: [PATCH 2/4] mtd: nand: convert printk() to pr_*()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1307487717-25402-3-git-send-email-computersforpeace@gmail.com>
References: <1307487717-25402-1-git-send-email-computersforpeace@gmail.com>
	<1307487717-25402-3-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 17:43:47 +0300
Message-ID: <1307544227.31223.115.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian, thanks for the patch, it certainly makes the code nicer and a bit
more readable. But I have few requests.

On Tue, 2011-06-07 at 16:01 -0700, Brian Norris wrote:
> -		printk(KERN_NOTICE "%s: Attempt to write not "
> +		pr_notice("%s: Attempt to write not "
>  				"page aligned data\n", __func__);

OK, so with this change the string becomes shorter and you do not have
to split it any more. You should make it look like this:

               pr_notice("%s: attempt to write not page aligned data\n",
                          __func__);
 
This is more readable and preferable - no string split. Please, do this
for other messages too.

Also, while on it, may be you could unify the messages and make them:

1. start with small letter if there is a function name prerix -
   currently some start with small and some start with capital.
2. if there is a dot at the end - remove it.


> @@ -2561,7 +2561,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
>  		/* Heck if we have a bad block, we do not erase bad blocks! */
>  		if (nand_block_checkbad(mtd, ((loff_t) page) <<
>  					chip->page_shift, 0, allowbbt)) {
> -			printk(KERN_WARNING "%s: attempt to erase a bad block "
> +			pr_warning("%s: attempt to erase a bad block "
>  					"at page 0x%08x\n", __func__, page);

Since you now have more space, I think it is a bit better to re-wrap the
message, i.e., make it like this:

                       pr_warning("%s: attempt to erase a bad block at page "
                                  "0x%08x\n", __func__, page);

or, if you prefer, even like this:

                       pr_warning("%s: attempt to erase a bad block at page 0x%08x\n",
                                   __func__, page);
 
because the coding style does allow strings longer than 80 characters if
"exceeding 80 columns significantly increases readability".

Ditto for the rest. With this, your clean-up will make the code even
cleaner :-)

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
