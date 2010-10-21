Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P907i-0006ax-7L
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 18:44:22 +0000
Received: by bwz5 with SMTP id 5so329913bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2010 11:43:32 -0700 (PDT)
Subject: Re: ubifs: sync() causes writes even if nothing is changed
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4CC0729B.7060109@parrot.com>
References: <20101013163005.GB1889@silverbox.local>
	<1287581218.9272.67.camel@localhost> <4CBFF865.9010706@linutronix.de>
	<1287649931.2932.3.camel@localhost>  <4CC0729B.7060109@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 21 Oct 2010 21:43:29 +0300
Message-ID: <1287686609.7480.0.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-10-21 at 19:04 +0200, Matthieu CASTET wrote:
> Hi,
> 
> Artem Bityutskiy a écrit :
> > On Thu, 2010-10-21 at 10:23 +0200, Sebastian Andrzej Siewior wrote:
> >> Artem Bityutskiy wrote:
> >>>> From a quick glance at the ubifs code, this might come out of the
> >>>> garbage collector that is triggered on every sync() and writes
> >>>> something even if nothing has changed.
> > 
> > Yeah, the UBIFS must be writing the commit start and commit end nodes,
> > and then erasing the previous log LEB (all this is done in log.c). As
> > soon as I have time I'll look at this, I really do not have time right
> > now. And there is Matthiew's problem which is actually quite big, but
> > for some reasons affects only him :-)
> It could be interesting to know which nand flash are tested.
> 
> On our boards ST 256MB chip work fine, but micron flash got unstable 
> page problem (sorry I don't have the model number ATM).
> 
> And it is getting worse, new SLC flash can now get up to 4 bits error 
> per 512.

It would be great if you sent me a board where unstable pages are easy
to reproduce.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
