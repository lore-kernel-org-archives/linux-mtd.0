Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OwWHF-0003Vy-1m
	for linux-mtd@lists.infradead.org; Fri, 17 Sep 2010 08:26:37 +0000
Received: by bwz19 with SMTP id 19so3401057bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Sep 2010 01:26:33 -0700 (PDT)
Subject: Re: [PATCH] nanddump: Rename --nobad to --noskipbad
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <20100917075411.GA3119@pengutronix.de>
References: <1284359070.27765.155.camel@localhost>
	<1284362113-26737-1-git-send-email-w.sang@pengutronix.de>
	<1284704420.2373.60.camel@localhost>
	<20100917075411.GA3119@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Sep 2010 11:24:39 +0300
Message-ID: <1284711879.2373.61.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mike Frysinger <vapier@gentoo.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-09-17 at 09:54 +0200, Wolfram Sang wrote:
> On Fri, Sep 17, 2010 at 09:20:20AM +0300, Artem Bityutskiy wrote:
> > On Mon, 2010-09-13 at 09:15 +0200, Wolfram Sang wrote:
> > > "nobad" might lead to the assumption that bad blocks are skipped, but this
> > > option does exactly the opposite. Use a more descriptive name.
> > > 
> > > Reported-by: Jon Povey <Jon.Povey@racelogic.co.uk>
> > > Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> > > Cc: Mike Frysinger <vapier@gentoo.org>
> > 
> > It does not apply to the latest mtd-utils tree. Would you please re-send
> > an updated version?
> 
> Ehrm, it still applies on top of Mike's original patch (it just seems
> that the latter is not pushed yet despite your mail saying so). Or do
> you want me to fold those two?

Indeed forgot to push it out, sorry. No, I'll sort this out, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
