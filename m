Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OpgY6-0000Sk-BZ
	for linux-mtd@lists.infradead.org; Sun, 29 Aug 2010 11:59:47 +0000
Received: by gwb10 with SMTP id 10so2075083gwb.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 29 Aug 2010 04:59:45 -0700 (PDT)
Subject: Re: Pull request: i.MX nand driver updates
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20100827105538.GB1473@pengutronix.de>
References: <20100823064024.GP27749@pengutronix.de>
	<1282865865.29421.47.camel@localhost>
	<20100827105538.GB1473@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 29 Aug 2010 14:59:39 +0300
Message-ID: <1283083179.2131.33.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	John Ogness <john.ogness@linutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-08-27 at 12:55 +0200, Sascha Hauer wrote:
> > > are available in the git repository at:
> > >   git://git.pengutronix.de/git/imx/linux-2.6.git mtd-imx-nand
> > > 
> > > John Ogness (2):
> > >       mxc_nand: Do not do byte accesses to the NFC buffer.
> > >       mxc_nand: remove unused variables.
> > > 
> > > Sascha Hauer (10):
> > >       mxc_nand: remove 0xe00 offset from registers
> > >       mxc_nand: rework get_dev_status
> > >       mxc_nand: make some internally used functions overwriteable
> > >       mxc_nand: factor out a check_int function
> > >       mxc_nand: add V1_V2 namespace to registers
> > >       mxc_nand: support 8bit ecc
> > >       mxc_nand: fix correct_data function
> > >       mxc_nand: Add v3 (i.MX51) Support
> > >       mxc_nand: do not depend on disabling the irq in the interrupt handler
> > >       mxc_nand: configure pages per block for v2 controller
> > 
> > Um, that repo seems to be based on something earlier than 2.6.36-rc1.
> > And the real -rc1 already contains most of those commits.
> > 
> > I think there are four commits which aren't already included. Of those,
> > at least one looks like a bug fix which needs to go into 2.6.36. What
> > about the others?
> 
> The patch from John Ogness is a bug fix. 'configure pages per block for
> v2 controller' can be considered a bug fix since before this patch we
> relied on some register bits being set correctly by the bootloader.
> One patch can wait for the next merge window I think.
> I updated the branch to contain the following:

Not sure if David is confused or not, but I'm confused. Could you please
sent 2 separate pull requests: one pull request with stuff you want to
go to 2.6.36 (important fixes) and one request with 2.6.37 material.
Please, base both on the mtd-2.6.git tree. And make it clear in the
subject and the e-mail body which request contains what. This will make
things easier and will probably speed them up. And do not forget to
refresh the patches and add all Acks, if any :-)

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
