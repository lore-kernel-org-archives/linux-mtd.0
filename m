Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUhae-0000iz-Fb
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 15:56:13 +0000
Received: by eyh6 with SMTP id 6so727037eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 08:56:09 -0700 (PDT)
Subject: Re: [Ubiattach] "vtbl_check: too large reserved_pebs"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Wagner <david.wagner@free-electrons.com>
In-Reply-To: <4DF0EBE1.9000903@free-electrons.com>
References: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>
	<4DF0B36E.2020605@free-electrons.com>
	<7.0.1.0.2.20110609135430.06967d28@free.fr>
	<4DF0BFA0.4030402@free-electrons.com>
	<e2p1v6tlj2gka1lq4q2bd0mk5al776ivms@4ax.com>
	<4DF0EBE1.9000903@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 18:51:50 +0300
Message-ID: <1307634710.7374.126.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Gilles <gilles.ganault@free.fr>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-09 at 17:50 +0200, David Wagner wrote:
> >> Oops, sorry, the formula is
> >> ((Subpage_size + Page_size)) / Page_size) * Page_size
> >> That is, subpage+page truncated to page.
> > 
> > Thanks, but I must have misunderstood the formula, as I find the same
> > number:
> > 
> > PEB_size - ((Subpage_size + Page_size)) / Page_size) * Page_size =
> > LEB_size
> > 
> > 131.072 - ((512 + 2048 ) / 2048) * 2048) = 128.512
> 
> I should have mentionned that every sub-result has to be considered an
> integer, here, sorry.
> 512+2048 = 2560
> 2560 / 2048 = 1 // That's where it is important that the result be
>                 // an integer.
> 1 * 2048 = 2048
> 131072 - 2048 = 129024

An improvement patch to the mtd web-site is welcome - it is very simple
to change:

http://git.infradead.org/mtd-www.git

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
