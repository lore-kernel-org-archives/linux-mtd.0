Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OGDcJ-0005qu-Ud
	for linux-mtd@lists.infradead.org; Sun, 23 May 2010 16:01:32 +0000
Received: by fxm15 with SMTP id 15so2028629fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 23 May 2010 09:01:30 -0700 (PDT)
Subject: Re: how to pre-screen patch submissions from a newbie janitor?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
In-Reply-To: <alpine.DEB.2.00.1005190732130.6528@lynx>
References: <alpine.DEB.2.00.1005181936120.3484@lynx>
	<20100519000137.GA18592@pengutronix.de>
	<alpine.DEB.2.00.1005190732130.6528@lynx>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 23 May 2010 19:01:27 +0300
Message-Id: <1274630487.8881.59.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>,
	Wolfram Sang <w.sang@pengutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-19 at 07:40 -0400, Robert P. J. Day wrote:
> On Wed, 19 May 2010, Wolfram Sang wrote:
> 
> > >   however, since he's new to patch creation and submission, i
> > > offered to "vet" his patches first.  i realize that my vetting
> > > carries no weight on the MTD list, but given that i've submitted
> > > lots and lots of patches elsewhere, i can still at least sanity
> > > check what he comes up with before it hits the list.
> > >
> > >   is there a canonical signage for that nowadays?  is it
> > > "Reviewed-By" or something like that?  so that by the time it gets
> > > to the MTD list, he would have done the "Signed-Off-By" and i'd
> > > sign off as a reviewer. is that the way it works?  or is there an
> > > alternative?  thanks.
> >
> > Yes, that sounds like a good case for Reviewed-by. It will surely
> > help these patches knowing there is somebody with experience who
> > already had a look at (and in that case probably build-tested) them.
> >
> > Looking forward to the series,
> 
>   what i'm going to have this trainee(?) do is just simplify the
> config/Kconfig/Makefile combos, which i openly admit is not
> earth-shaking in its complexity.
> 
>   for example. in a number of places elsewhere in the kernel tree,
> i've submitted patches to change things like this in the config menus:
> 
> <M>   OneNAND Device Support  --->
>       LPDDR flash memory drivers  --->
>       UBI - Unsorted block images  --->
> 
>   note how, to select either LPDDR or UBI, you need to *go* to those
> submenus, where you find a top-level selector.  it's simpler to just
> put that selector right on that menu item, as it's done for "OneNAND"
> just above it.  no wasting time.

Yeah, and I assume it is better to be consistent and use the same style
as most of things in the MTD menu have.

>   and another simplification is to cut down the conditional inclusion
> in the makefiles.  for instance, here's tests/Makefile:
> 
> obj-$(CONFIG_MTD_TESTS) += mtd_oobtest.o
> obj-$(CONFIG_MTD_TESTS) += mtd_pagetest.o
> obj-$(CONFIG_MTD_TESTS) += mtd_readtest.o
> ... etc etc ...
> 
>   there's little point having every single line in the Makefile test
> CONFIG_MTD_TESTS when that can all be done with a single test one
> level up that checks whether or not to process the tests/ directory at
> all.

Yeah, sounds good.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
