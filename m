Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MAlgf-0003yI-0S
	for linux-mtd@lists.infradead.org; Sun, 31 May 2009 14:07:03 +0000
Subject: Re: [PATCH] 3/3 ubi notification API Re: [PATCH] [UBI] [1/3] ubi
	notifications API
From: Artem Bityutskiy <dedekind@infradead.org>
To: dpervushin@embeddedalley.com
In-Reply-To: <1243625251.4067.29.camel@hp.diimka.lan>
References: <1241018978.20184.33.camel@hp.diimka.lan>
	<1242660138.3238.5.camel@localhost.localdomain>
	<1242661167.3238.10.camel@localhost.localdomain>
	<1243625251.4067.29.camel@hp.diimka.lan>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 31 May 2009 17:06:42 +0300
Message-Id: <1243778802.11172.140.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-05-29 at 23:27 +0400, dmitry pervushin wrote:
> On Mon, 2009-05-18 at 18:39 +0300, Artem Bityutskiy wrote:
> > On Mon, 2009-05-18 at 18:22 +0300, Artem Bityutskiy wrote:
> > > Dmitry,
> > > 
> > > I've re-work the first patch of yours. I think the locking should
> > > be correct now. The commit message shortly list the changes I've
> > > done.
> > > 
> > > I also send the second patch. The only thing I fixed there was
> > > the spelling of your name - I made it start with a capital letter.
> > > I hope you do not mind.
> > > 
> > > Please, provide the third patch. You should not try to open an
> > > UBI volume from within a notifier, because it won't work. I
> > > think you simply did not test your patches before sending.
> > > Neither did I. But please, this time, do test the patches.
> > > It is very easy to do with nansim.
> > > 
> > > I'll send the patches as 2 follow-up e-mail for your review.
> > 
> > I've also created an "experimental" branch in the ubi-2.6.git
> > tree for your convenience:
> > 
> > http://git.infradead.org/ubi-2.6.git?a=shortlog;h=refs/heads/experimental
> > git://git.infradead.org/ubi-2.6.git experimental
> Sorry for late response; I reviewed your changes, and although
> prohibiting of using ubi api from within notifiers does not look very
> amazing to me... but it seems that it is the only robust way. The 3rd
> patch from the serie is inlined below (tested on the stmp378x board as
> well as on nandsim)

Well. I assume that:

1. when gluebi is notified, it creates its data structures without
   opening the UBI volume;
2. when a gluebi /dev/mtdX device is being opened, the the corresponding
   UBI volume is opened as well.

At least for gluebi's purposes it seems to be enough. Recursions are
painful and I would keep things simple, unless we have more complex
use-cases where we would have to invent something trickier.

But anyway, AFAIR I re-named many constants and strictures in your
original patces to make them a bit more consistent/shorter. But your new
patch N.3 does not seem to be against those 2 patches I sent you (and
also put to the "experimental" branch).

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
