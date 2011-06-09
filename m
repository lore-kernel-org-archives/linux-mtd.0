Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUZSR-0001Ji-JD
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 07:15:12 +0000
Received: by ewy3 with SMTP id 3so539777ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 00:15:08 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] mtd: nand: define pr_fmt() to include __func__
	in debug output
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1307557708-31376-1-git-send-email-computersforpeace@gmail.com>
References: <BANLkTi=7Xivud_V=uMadL1BA-1ZC7V9RYw@mail.gmail.com>
	<1307557708-31376-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 10:10:49 +0300
Message-ID: <1307603449.7374.22.camel@localhost>
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

On Wed, 2011-06-08 at 11:28 -0700, Brian Norris wrote:
> Also fix some capitalization that went along with the affected lines.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Thinking about this some more, I do not think it is good idea to
automatically prefix all messages with function name. In many cases this
just makes the kernel binary size larger without a real need.

> -				pr_info("nand_bbt: Error reading bad block table\n");
> +				pr_info("error reading bad block table\n");

Is nand_bbt: really needed here? May be this is not obvious, but isn't
this message unique anyway?

Well, this should be  pr_err(), because this is an error message :-) A
separate pass via all pr_* WRT this aspect would be nice.

>  				return res;
>  			}
> -			pr_warn("nand_bbt: ECC error while reading bad block table\n");
> +			pr_warn("ECC error while reading bad block table\n");

Is nand_bbt: really needed here?

>  		}
>  
>  		/* Analyse data */
> @@ -219,13 +221,13 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
>  				if (tmp == msk)
>  					continue;
>  				if (reserved_block_code && (tmp == reserved_block_code)) {
> -					pr_debug("nand_read_bbt: Reserved block at 0x%012llx\n",
> +					pr_debug("reserved block at 0x%012llx\n",
>  					       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);

OK, I turned this to pr_info, because this is not a debugging message.
And I do not think the function prefix is needed, I can grep the kernel
to find  it.

And really, in most places the function prefix is not needed.

In general, I think the function prefix is only needed in debugging
messages - dev_dbg() ones. All the other places should not require it in
most of the cases.

I'd do the following clean-ups instead:

1. Go through all messages and see if they are of proper level
(info/error/warning).
2. Go through all messages and thing if the function name prefix brings
   any value or only makes the kernel binary size larger.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
