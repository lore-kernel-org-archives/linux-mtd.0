Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P3CYz-0003UM-Dq
	for linux-mtd@lists.infradead.org; Tue, 05 Oct 2010 18:48:34 +0000
Received: by bwz19 with SMTP id 19so6544863bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Oct 2010 11:48:31 -0700 (PDT)
Subject: Re: [PATCH] mtd/nand.h: cleanups
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <20101005182656.GA21067@pengutronix.de>
References: <20101005104101.GA18714@www.tglx.de>
	<20101005182656.GA21067@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Oct 2010 21:48:26 +0300
Message-ID: <1286304506.1797.2.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-10-05 at 20:26 +0200, Wolfram Sang wrote:
> Hi Sebastian,
> 
> just a minor comment.

[Side note: it is much more reader-friendly to avoid citing whole patch
and making the readers search where you put the comment, like this:]

> > @@ -457,24 +492,32 @@ struct nand_chip {
> >  
> >  	uint8_t		(*read_byte)(struct mtd_info *mtd);
> >  	u16		(*read_word)(struct mtd_info *mtd);
> > -	void		(*write_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
> > -	void		(*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
> > -	int		(*verify_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
> > +	void		(*write_buf)(struct mtd_info *mtd, const uint8_t *buf,
> > +			int len);
> 
> It might be more readable to get rid of the tabs after the type and keep the
> arguments in one line?

I agree with this. Sebastian, I'll put your patch to my l2 tree when
git.infradead.org is back. But if you could send a separate follow up
patch which kills these ugly tabs - it would be nice.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
