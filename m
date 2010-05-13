Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCd8R-0005Rj-Ie
	for linux-mtd@lists.infradead.org; Thu, 13 May 2010 18:27:52 +0000
Date: Thu, 13 May 2010 14:27:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: simplifying the linux MTD Kconfig/Makefile structure
In-Reply-To: <1272024346.6917.10.camel@localhost>
Message-ID: <alpine.DEB.2.00.1005131427050.6672@lynx>
References: <alpine.LFD.2.00.1003300824320.6061@localhost>
	<1272024346.6917.10.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 Apr 2010, Artem Bityutskiy wrote:

> On Tue, 2010-03-30 at 08:29 -0400, Robert P. J. Day wrote:
> > it seems like the various Kconfigs and Makefiles related to MTD
> > could be tightened up a bit.  for instance, in drivers/mtd/Makefile:
> >
> >   obj-$(CONFIG_MTD_UBI)           += ubi/
> >
> > but given that selection, it's kind of redundant to then have
> > drivers/mtd/ubi/Makefile start with:
> >
> >   obj-$(CONFIG_MTD_UBI) += ubi.o
> >
> > is it not?  why not just "obj-y"?
> >
> >   along those lines, again from drivers/mtd/Makefile:
> >
> > obj-y           += chips/ lpddr/ maps/ devices/ nand/ onenand/ tests/
> >
> > obj-$(CONFIG_MTD_UBI)           += ubi/
> >
> >   why not be consistent and have:
> >
> > obj-y           += chips/ lpddr/ maps/ devices/ nand/ onenand/
> >
> > obj-$(CONFIG_MTD_UBI)           += ubi/
> > obj-$(CONFIG_MTD_TESTS)         += tests/
> >
> > which would *massively* simplify drivers/mtd/tests/Makefile, would it
> > not?
> >
> >   i can submit some patches if there's any interest.  i suspect some
> > of the other directories could be similarly tidied up.
>
> Sounds like a reasonable clean-up to me.

  sorry for the delay, either i or a local buddy will take care of
this and submit patches to the list.

rday

-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================
