Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKUWR-0002a6-PF
	for linux-mtd@lists.infradead.org; Sun, 30 Oct 2011 12:29:56 +0000
Received: by bkat2 with SMTP id t2so130710bka.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Oct 2011 05:29:54 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: mark tests EXPERIMENTAL
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Sun, 30 Oct 2011 14:29:50 +0200
In-Reply-To: <20111029204037.GB26851@pengutronix.de>
References: <1319533791-32605-1-git-send-email-w.sang@pengutronix.de>
	<1319533791-32605-2-git-send-email-w.sang@pengutronix.de>
	<1319920207.2126.19.camel@koala>
	<20111029204037.GB26851@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1319977792.2126.30.camel@koala>
Mime-Version: 1.0
Cc: Roland Kletzing <devzero@web.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2011-10-29 at 22:40 +0200, Wolfram Sang wrote:
> > > diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> > > index 4be8373..81d9b92 100644
> > > --- a/drivers/mtd/Kconfig
> > > +++ b/drivers/mtd/Kconfig
> > > @@ -27,12 +27,15 @@ config MTD_DEBUG_VERBOSE
> > >  
> > >  config MTD_TESTS
> > >  	tristate "MTD tests support"
> > > -	depends on m
> > > +	depends on m && EXPERIMENTAL
> > 
> > I am OK with this close, but I am not sure about the EXPERIMENTAL. I
> > though this is used for the code which is considered to be "not ready"
> > for real use, while the tests work well.
> 
> Well, yeah, it is not perfect, but the closest I could come up with
> (EXPERT is a lot worse). My reasoning went a bit in the direction of
> "you usually need the tests for experimental drivers".

I see, but I think that this is not what EXPERIMENTAL mean. It is better
to add "(DANGEROUS)" to the title as it is recommended in
Documentation/CodyngStyle.

Artem.
