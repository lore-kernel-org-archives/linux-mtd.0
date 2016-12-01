Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCWRL-0003JL-A9
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 18:50:41 +0000
Received: by mail-pf0-x242.google.com with SMTP id y68so12295835pfb.1
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 10:50:18 -0800 (PST)
Date: Thu, 1 Dec 2016 10:50:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [GIT PULL] mtd: spi-nor: updates for 4.10
Message-ID: <20161201185015.GA69517@google.com>
References: <2bdf6239-d998-825c-cd22-db6ac09d3391@atmel.com>
 <20161201022238.GA3973@google.com>
 <a16b5d6e-2fcf-be61-f41d-788a08c23177@denx.de>
 <20161201174156.GA66143@google.com>
 <0914d553-20e2-b7e5-f16d-fb562601a4aa@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0914d553-20e2-b7e5-f16d-fb562601a4aa@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 01, 2016 at 07:06:38PM +0100, Marek Vasut wrote:
> On 12/01/2016 06:41 PM, Brian Norris wrote:
> > On Thu, Dec 01, 2016 at 03:36:35PM +0100, Marek Vasut wrote:
> >> On 12/01/2016 03:22 AM, Brian Norris wrote:
> >>> BTW, does Marek have access to your repo, or are you planning on doing
> >>> all the merging?
> >>
> >> I'm not a big github fan, but I have access, yep.
> > 
> > Not even as a dumb git server? I can understand not appreciating the
> > web interface.
> 
> Well, it doesn't really feel right to keep kernel stuff outside of
> kernel.org , or is that OK now ? And I don't really like the EULA
> they have.

There's nothing magical about kernel.org. I see 63 github entries and 7
infradead entries in MAINTAINERS, and 12 github trees and 14 infradead
trees in linux-next.git, to name a few. There's also stuff at
freedesktop.org and probably other places. As with anything
kernel-related, it's a very distributed process, and the key is just to
have some kind of chain of trust, regardless of the storage location.

> > Anyway, nothing (except MAINTAINERS, which can be changed) requires we
> > use github. We could probably set up a shared infradead.org repo or
> > maybe even kernel.org if you'd prefer.
> 
> I have a k.org account, but then, I also don't want to cause too much fuss.

I mean, a shared one between all SPI NOR maintainers. i.e., Cyrille
would need access. I don't really know anything about kernel.org access
permissions, but if he can get on there, then by all means.

I won't bug much more about this either, but if you would rather pick
something like infradead.org, I'm sure David can help us out.

Brian
