Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDBMQ-0007hW-MA
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 08:05:07 +0000
Received: by eyh6 with SMTP id 6so137781eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Apr 2011 01:05:04 -0700 (PDT)
Subject: Re: [RFC] mtd: nand: separate chip options / bbt_options
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1303283589-14415-1-git-send-email-computersforpeace@gmail.com>
References: <1301903526.2760.38.camel@localhost>
	<1303283589-14415-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 22 Apr 2011 11:02:09 +0300
Message-ID: <1303459329.2757.40.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Kevin Cernekee <cernekee@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Wed, 2011-04-20 at 00:13 -0700, Brian Norris wrote:
> This RFC begins to handle the conflicts we've been having with using
> conflicting flags from nand.h and bbm.h in the same nand_chip.options
> field. We should try to separate these two spaces a little more
> clearly, and so I have added a bbt_options field to nand_chip.

Sounds good.

> Important notes about nand_chip fields:
> * bbt_options field should contain ONLY flags from bbm.h. They should
>   be able to pass safely to a nand_bbt_descr data structure.
> * options field should contian ONLY flags from nand.h. Ideally, they
>   should not be involved in any BBT related options.

Sounds good. I'd add the following:

* NAND chip option flags start with the: NAND_ prefix
* BBT options start with BBT_ prefix.

You may choose different prefixes, e.g., NAND_BBT_ for BBT options, but
the separation is needed, I think. Also, the renaming of the options
should be a separate patch or set of patches.

I'd also add:
* Every flag should have a nice comment explaining what the flag is.

This is optional, but would be nice :-)

> Other things to consider (not yet implemented):
> * Is it safe to move NAND_CREATE_EMPTY_BBT to bbm.h and require it to be
>   put in bbt_options? It seems not to be used by any in-kernel drivers
>   so it's only likely to mess with independent drivers...

What exactly this option mean and how could it be used?

> 
> * Consider the following three flags:
>   (1) NAND_USE_FLASH_BBT (nand.h)
>   (2) NAND_USE_FLASH_BBT_NO_OOB (nand.h)
>   (3) NAND_BBT_NO_OOB (bbm.h)
> 
>   These flags are all related, yet they are in different headers. Also,
>   flag (2) is simply the combination of (1) and (3) and seemingly can be
>   eliminated. Is it safe to move (1) and (3) to bbm.h and remove (2)
>   altogether? (with appropriate code adjustments of course)

Yes, I think so.

> Regarding Artem's suggestion of bit-fields:
> If we turn all the flags into bit-fields in nand_chip, we still need to
> add these fields to the bbt_descr, right? That seems like too much
> duplication of information and would just be messier.

Let's for get about this for now, then. We can look at this idea at the
end of the clean-up then, again, may be.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
