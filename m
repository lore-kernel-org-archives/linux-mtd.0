Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1FFj-0000DH-07
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 09:16:35 +0000
Received: by fxm15 with SMTP id 15so1404643fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Sep 2010 02:16:33 -0700 (PDT)
Subject: Re: [PATCH 3/5] mtd/nand: add support for BBT without OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20100930085111.GA12354@Chamillionaire.breakpoint.cc>
References: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
	<1285782234-32509-4-git-send-email-bigeasy@linutronix.de>
	<1285791064.1776.35.camel@brekeke>
	<20100930085111.GA12354@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 30 Sep 2010 12:14:25 +0300
Message-ID: <1285838065.11684.57.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-mtd@lists.infradead.org, tglx@linutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-09-30 at 10:51 +0200, Sebastian Andrzej Siewior wrote:
> * Artem Bityutskiy | 2010-09-29 23:11:04 [+0300]:
> 
> >Few minor things.
> >
> >First, is it please possible to add more descriptive comment into the
> >code. Something like you put to the patch description, may be even a bit
> >more descriptive. May be to the header of nand_bbt.c?
> We usually don't have description in C code. Usually there is kernel doc
> which describe the function and some description in Documentation/
> which describes how should work. I could add something to the header of
> the file and we move it leater to Doc*/mtd/bbt_hadling.txt ?

My point was that it is better to have a somewhat descriptive comment
in .c file which explains the differences in BBTs and reasons for them
and classifies them. This helps a lot. I mean, .c file comment is better
than no comments.

But a got Doc*/mtd/bbt_hadling.txt would be perfect, if you go that far,
this would be even better.

> >> +		if (marker_len) {
> >> +			/*
> >> +			 * In case the BBT marker is not in the OOB area it
> >> +			 * will be just in the first page
> >> +			 */
> >
> >Yes, this is the right multi-line comment. You may also put a dot at the
> >end. But in other places you used not the right multi-line comments.
> The missing dot is probally easy to fix. Other place where I did not use
> correct multi-line comments are the .h file were I successfully
> attempted to follow the style there. I'm going to fix it as well.

Thanks!

> >> +/* If passed additionally to NAND_USE_FLASH_BBT then BBT code will not touch
> >> + * the OOB area */
> >
> >And this. Yeah, I know this file uses different styles, but you could
> >convert even all of them.
> I would prefer to send a cleanup afterwards and not mixing code changes
> with no changes.

Ok.

> You want someone to keep checkpatch shut for other files as well or just
> this one?

You could do this for this file, but if you do for other files, this is
even better :-) Do as much extra contribution as you feel like!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
