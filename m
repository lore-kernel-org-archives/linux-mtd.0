Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dVTBa-0002HM-Rh
 for linux-mtd@lists.infradead.org; Thu, 13 Jul 2017 01:45:01 +0000
Received: by mail-pf0-x229.google.com with SMTP id c73so21368350pfk.2
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 18:44:37 -0700 (PDT)
Date: Wed, 12 Jul 2017 18:44:33 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PULL v2] mtd: nand: Changes for 4.13
Message-ID: <20170713014433.GJ55942@google.com>
References: <20170703134609.0ea9cd63@bbrezillon>
 <20170712010115.GI55942@google.com>
 <20170712091919.3e4ea9d0@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170712091919.3e4ea9d0@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Jul 12, 2017 at 09:19:19AM +0200, Boris Brezillon wrote:
> Le Tue, 11 Jul 2017 18:01:15 -0700,
> Brian Norris <computersforpeace@gmail.com> a écrit :
> 
> > + Thomas, as I don't really want to dig up the original patch to review
> > right now
> > 
> > On Mon, Jul 03, 2017 at 01:46:09PM +0200, Boris Brezillon wrote:
> > > Hi,
> > > 
> > > Here's my PR for 4.13. This v2 includes Dan's fix ("mtd: nand: mtk:
> > > release lock on error path").
> > > 
> > > As usual, let me know if you see any problem.
> > > 
> > > Thanks,
> > > 
> > > Boris
> > > 
> > > The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:
> > > 
> > >   Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)
> > > 
> > > are available in the git repository at:
> > > 
> > >   ssh://git.infradead.org/srv/git/l2-mtd.git tags/nand/for-4.13  
> > 
> > I happen to have SSH access to that repository :) but a
> > publicly-readable link is usually a better idea, in the highly unlikely
> > case that someone else wants to review your pull request.
> 
> My bad. I have 2 remotes for l2-mtd (l2-mtd and l2-mtd-pub), just passed
> the wrong one to 'git request-pull' :-/.
> 
> > 
> > > for you to fetch changes up to 81667e9c8ad827365f2d1e8b924caf062a19c593:
> > > 
> > >   mtd: nand: mtk: release lock on error path (2017-07-03 13:39:09 +0200)
> > > 
> > > ----------------------------------------------------------------
> > > This pull request contains the following core changes:
> > > 
> > > * addition of on-ecc support to Micron driver  
> > 
> > This still works by overriding chip->ecc.{read,write}_page{,_raw}()
> > callbacks... I never liked that, and there have been multiple
> > submissions that tried this already, IIRC. It's for sure not going to
> > work with at least one in-tree driver (brcmnand); I suspect others
> > (qcom_nand? mtk_nand?).
> 
> Yes, I know it doesn't work with all drivers, but given that those
> drivers are already not supporting ECC_NONE or ECC_SW, I don't think
> it's a real program. 

I'll take 's/program/problem/' as a fun typo? :D

I suppose that's mostly fine reasoning (though ECC_NONE is a pretty
stupid mode). And I see that the "unsupported drivers" are mostly going
to be resilient to this anyway, as noted below.

> > Can this be improved to either bail out when
> > this clobbers a controller's existing callback, or even better, to
> > utilize a controller's existing _raw() implementation, instead of
> > assuming it can use the nand_base defaults?
> 
> IMO, if there's something to fix it's the NAND controller drivers that
> are only partially complying with core expectations. I mean,
> '->cmdfunc(READ0) + ->read_buf()' is a valid sequence and should work
> with all NAND controllers, but for some (good?) reasons, some drivers
> are taking liberties with this semantic.

How is that supposed to communicate things like "read with ECC" vs. "read
without ECC"? Overall, that command semantic looked designed mostly for
stupid controllers that integrated very little, and I completely
understand why many vendors went with drivers that sidestepped that and
implemented operations differently. (Disclosure: I implemented one.)

If you expect cmdfunc(READ0) + ->read_buf() to always give you raw data,
then why should any controller driver be allowed to implement
ecc.read_page_raw()?

Or conversely, if there are good reasons to allow controllers to
override ecc.read_page_raw(), then why should the on-die *flash*
implementation circumvent that? Flash support should be orthogonal to
controller support.

> Note that we are working on improving the situation with the
> ->exec_op() approach [4], which should provide NAND controller drivers
> with all the information they need to execute a NAND operation
> (CMD, ADDR, DATA, WAIT cycles), which, AFAIU was one blocking
> aspect with '->cmdfunc()/->cmd_ctrl() + ->read/write_buf/byte/word()'. 
> 
> It will also let drivers return -ENOTSUPP to report when they simply
> don't support a specific NAND operation (for example, when the
> CMD+ADDR+DATA+WAIT sequence is not supported).

I'm pretty sure that won't cover why several of the drivers I pointed at
don't implement the "semantics" you expect.

> > 
> > The latter seems difficult to do in time for this merge, but maybe the
> > former can be done within the release?
> > 
> > I'm still tempted to pull this, since at least it does require somebody
> > to opt in via the device tree binding. So they should probably make sure
> > it works with their driver before using it.
> 
> There really no risk with this new feature because:

The following reasons are OK, but I object to the "no risk" assessment.
There's a reason this approach was rejected before; it's setting a
precedent of supporting new flash features with a "works for me", but
without regard for some drivers that don't use the same approach. Yes,
sometimes controller drivers need to be reworked or updated, but at the
same time, there are perfectly reasonable ways to implement this while
seamlessly supporting these drivers -- namely, *wrap* the existing
ecc->{read,write}_page_raw() instead of replacing them.

> 1/ the option has to be opted-in by the NAND controller driver (or
>    through a DT property)

I noted that already, which is why I'm not necessarily rejecting the
pull request.

> 2/ even if it's enabled by mistake on one of these controllers, they
>    either check ecc->mode [1][2]

Right, thanks for pointing those out. That helps a bit more.

> or simply override chip->ecc content
>    unconditionally [3]

Really? That seems a little error prone to have two different setters
trying to clobber each other. Before this patch set, at least we mostly
just respect the controller driver (see all the 'if (!ecc->foo)' in
nand_scan_tail()); the only clobbering was on the 'mode' field, because
it can be read from the device tree, in nand_scan_ident().

> If one NAND controller driver is not doing #2, the driver should be
> fixed not the on-die ECC logic.

I'm not sure those are mutually exclusive. The (new) on-die ECC logic
can easily recognize that ecc.foo is already configured, and skip
clobbering it. As noted above, nand_scan_tail() already does this for
most other similar features.

If I don't see someone else fix this up soon, I'll look at doing it
myself.

> > 
> > > * addition of helpers to help drivers choose most appropriate ECC
> > >   settings
> > > * deletion of dead-code (cached programming and ->errstat() hook)
> > > * make sure drivers that do not support the SET/GET FEATURES command
> > >   return ENOTSUPP use a dummy ->set/get_features implementation
> > >   returning -ENOTSUPP (required for Micron on-die ECC)
> > > * change the semantic of ecc->write_page() for drivers setting the
> > >   NAND_ECC_CUSTOM_PAGE_ACCESS flag
> > > * support exiting 'GET STATUS' command in default ->cmdfunc()
> > >   implementations
> > > * change the prototype of ->setup_data_interface()
> > > 
> > > A bunch of driver related changes:
> > > 
> > > * various cleanup, fixes and improvements of the MTK driver
> > > * OMAP DT bindings fixes
> > > * support for ->setup_data_interface() in the fsmc driver
> > > * support for imx7 in the gpmi driver
> > > * finalization of the denali driver rework (thanks to Masahiro for the
> > >   work he's done on this driver)
> > > * fix "bitflips in erased pages" handling in the ifc driver
> > > * addition of PM ops and dynamic timing configuration to the atmel
> > >   driver
> > > 
> > > And as usual we also have a few minor cleanup/fixes/improvements
> > > patches across the subsystem.

Anyway, I think I'm satisfied enough that we're OK for now. I've pulled
the set.

Brian

> [1]http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/nand/brcmnand/brcmnand.c#L2121
> [2]http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/nand/mtk_nand.c#L1171
> [3]http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/nand/qcom_nandc.c#L1840
> [4]https://github.com/linux-nand/linux/commits/nand/exec_op
