Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dVa85-0008EP-O0
 for linux-mtd@lists.infradead.org; Thu, 13 Jul 2017 09:09:52 +0000
Date: Thu, 13 Jul 2017 11:09:11 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse
 <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>
Subject: Re: [PULL v2] mtd: nand: Changes for 4.13
Message-ID: <20170713110911.3774b96f@bbrezillon>
In-Reply-To: <20170713014433.GJ55942@google.com>
References: <20170703134609.0ea9cd63@bbrezillon>
 <20170712010115.GI55942@google.com>
 <20170712091919.3e4ea9d0@bbrezillon>
 <20170713014433.GJ55942@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 Jul 2017 18:44:33 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi,
>=20
> On Wed, Jul 12, 2017 at 09:19:19AM +0200, Boris Brezillon wrote:
> > Le Tue, 11 Jul 2017 18:01:15 -0700,
> > Brian Norris <computersforpeace@gmail.com> a =C3=A9crit :
> >  =20
> > > + Thomas, as I don't really want to dig up the original patch to revi=
ew
> > > right now
> > >=20
> > > On Mon, Jul 03, 2017 at 01:46:09PM +0200, Boris Brezillon wrote: =20
> > > > Hi,
> > > >=20
> > > > Here's my PR for 4.13. This v2 includes Dan's fix ("mtd: nand: mtk:
> > > > release lock on error path").
> > > >=20
> > > > As usual, let me know if you see any problem.
> > > >=20
> > > > Thanks,
> > > >=20
> > > > Boris
> > > >=20
> > > > The following changes since commit 2ea659a9ef488125eb46da6eb571de5e=
ae5c43f6:
> > > >=20
> > > >   Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)
> > > >=20
> > > > are available in the git repository at:
> > > >=20
> > > >   ssh://git.infradead.org/srv/git/l2-mtd.git tags/nand/for-4.13   =
=20
> > >=20
> > > I happen to have SSH access to that repository :) but a
> > > publicly-readable link is usually a better idea, in the highly unlike=
ly
> > > case that someone else wants to review your pull request. =20
> >=20
> > My bad. I have 2 remotes for l2-mtd (l2-mtd and l2-mtd-pub), just passed
> > the wrong one to 'git request-pull' :-/.
> >  =20
> > >  =20
> > > > for you to fetch changes up to 81667e9c8ad827365f2d1e8b924caf062a19=
c593:
> > > >=20
> > > >   mtd: nand: mtk: release lock on error path (2017-07-03 13:39:09 +=
0200)
> > > >=20
> > > > ----------------------------------------------------------------
> > > > This pull request contains the following core changes:
> > > >=20
> > > > * addition of on-ecc support to Micron driver   =20
> > >=20
> > > This still works by overriding chip->ecc.{read,write}_page{,_raw}()
> > > callbacks... I never liked that, and there have been multiple
> > > submissions that tried this already, IIRC. It's for sure not going to
> > > work with at least one in-tree driver (brcmnand); I suspect others
> > > (qcom_nand? mtk_nand?). =20
> >=20
> > Yes, I know it doesn't work with all drivers, but given that those
> > drivers are already not supporting ECC_NONE or ECC_SW, I don't think
> > it's a real program.  =20
>=20
> I'll take 's/program/problem/' as a fun typo? :D

Hehe. Yep, it's a typo.

>=20
> I suppose that's mostly fine reasoning (though ECC_NONE is a pretty
> stupid mode).

I don't want to debate the usefulness of ECC_NONE here, but I don't
find it stupid, just not so useful in real-life :-P.

> And I see that the "unsupported drivers" are mostly going
> to be resilient to this anyway, as noted below.

I'm more optimistic here. Of course, it requires reworking the logic in
most of them, and a few might never be able to support on-die ECC
because of hardcoded logic in the NAND controller IP preventing one
from disabling the ECC engine.

>=20
> > > Can this be improved to either bail out when
> > > this clobbers a controller's existing callback, or even better, to
> > > utilize a controller's existing _raw() implementation, instead of
> > > assuming it can use the nand_base defaults? =20
> >=20
> > IMO, if there's something to fix it's the NAND controller drivers that
> > are only partially complying with core expectations. I mean,
> > '->cmdfunc(READ0) + ->read_buf()' is a valid sequence and should work
> > with all NAND controllers, but for some (good?) reasons, some drivers
> > are taking liberties with this semantic. =20
>=20
> How is that supposed to communicate things like "read with ECC" vs. "read
> without ECC"?

It's not supposed to.

> Overall, that command semantic looked designed mostly for
> stupid controllers that integrated very little, and I completely
> understand why many vendors went with drivers that sidestepped that and
> implemented operations differently. (Disclosure: I implemented one.)

Well, that's where most of the misunderstanding comes from. People
tend to mix the ECC engine and NAND controller concepts, simply because
it's most of the time embedded in the same HW block.

Let me explain my understanding of the NAND framework. You have 3
different concepts:

 1/ the NAND chip (struct nand_chip)
 2/ the NAND controller (struct nand_hw_ctrl)
 3/ the ECC engine (struct nand_ecc_ctrl)

The NAND chip and NAND controller are pretty easy to identify and
separate, and you don't have a choice here.

It's a bit more complicated for the ECC engine, because it may be in
the placed in the NAND controller, directly on the chip or handled
completely in SW.

ecc->read/write_page[_raw]() methods are here to let the ECC engine
take the appropriate action based on the required operation, but those
functions have to be implemented by the block taking care of ECC:

- on-die ECC: NAND vendor driver sends a command to disable/enable ECC
  before launching the read/prog page operation, and check for errors
  with another NAND command (only for READ page operations).
- ECC engine embedded in NAND controllers: NAND controller driver sets
  the ECC_EN bit before trigerring the NAND read/prog operation and
  check for errors when the read is done

>=20
> If you expect cmdfunc(READ0) + ->read_buf() to always give you raw data,
> then why should any controller driver be allowed to implement
> ecc.read_page_raw()?

Because ECC engine might have to be disabled before you launch the
cmdfunc(READ0) + ->read_buf() sequence, and only the ECC controller can
do that. For ECC engines embedded in NAND controllers it's usually about
setting the ECC_EN bit to 0 and skipping ECC correction step. For
on-die ECC, it may require sending an extra NAND command.
If you let the NAND controller override ecc->read_page_raw() and still
want to use on-die ECC, then you're screwed, because on-die ECC logic
embedded in the NAND might stay enabled even when ecc->read_page_raw()
is called.

>=20
> Or conversely, if there are good reasons to allow controllers to
> override ecc.read_page_raw(), then why should the on-die *flash*
> implementation circumvent that? Flash support should be orthogonal to
> controller support.

The only case where on-die ECC logic should override NAND controller
hooks is when ecc->mode is set to ONDIE_ECC. But that also means that,
when on-die ECC is selected by the NAND controller driver (at probe/init
time), it should make sure that the ECC engine embedded in the NAND
controller is disabled when this particular NAND chip is accessed (can
be done in ->select_chip() for instance, or it can be disabled at
probe time assuming you only have one NAND chip connected to the NAND
controller).

>=20
> > Note that we are working on improving the situation with the =20
> > ->exec_op() approach [4], which should provide NAND controller drivers =
=20
> > with all the information they need to execute a NAND operation
> > (CMD, ADDR, DATA, WAIT cycles), which, AFAIU was one blocking
> > aspect with '->cmdfunc()/->cmd_ctrl() + ->read/write_buf/byte/word()'.=
=20
> >=20
> > It will also let drivers return -ENOTSUPP to report when they simply
> > don't support a specific NAND operation (for example, when the
> > CMD+ADDR+DATA+WAIT sequence is not supported). =20
>=20
> I'm pretty sure that won't cover why several of the drivers I pointed at
> don't implement the "semantics" you expect.

Of course, this ->exec_op() hook won't magically solve all problems, but
it will help transition to something that is easier to maintain.

As mentioned above, the NAND controller drivers will still be able to
decide whether it supports on-die ECC or not, and when it does, it
should make sure the ECC engine embedded in the controller is disabled
when read/prog accesses are done to this specific chip.

Now, maybe I'm wrong, and ->exec_op() will not fit all controllers.
But in this case, I'd rather add chip->read/write_page() hooks to let
the NAND controller do raw accesses to the NAND rather than abuse the
ecc->read/write_page[_raw]() ones, because we're likely to need a
specific implementation for these methods for some funky on-die ECC
engines (a specific action might be required to disable ECC before a
read/write access).

>=20
> > >=20
> > > The latter seems difficult to do in time for this merge, but maybe the
> > > former can be done within the release?
> > >=20
> > > I'm still tempted to pull this, since at least it does require somebo=
dy
> > > to opt in via the device tree binding. So they should probably make s=
ure
> > > it works with their driver before using it. =20
> >=20
> > There really no risk with this new feature because: =20
>=20
> The following reasons are OK, but I object to the "no risk" assessment.
> There's a reason this approach was rejected before; it's setting a
> precedent of supporting new flash features with a "works for me", but
> without regard for some drivers that don't use the same approach.

But that's not what Thomas did here. The feature has to be explicitly
enabled, and most (all?) drivers check/override ecc->mode before
calling nand_scan_tail(). So, unless someone decides to remove
ecc->mode checks without testing, we should be safe.

> Yes,
> sometimes controller drivers need to be reworked or updated, but at the
> same time, there are perfectly reasonable ways to implement this while
> seamlessly supporting these drivers -- namely, *wrap* the existing
> ecc->{read,write}_page_raw() instead of replacing them.

Then we need to clarify things, and adding chip->read/write_page()
page hooks in nand_chip to do all raw accesses to the NAND is one
solution. By raw, I mean raw from the NAND controller PoV. That is, if
the controller embeds an ECC engine it has to disable it.
Note that we still need the ecc->read/write_page_raw() methods, because
accessing the NAND in raw mode from the NAND controller PoV does not
necessarily mean we've disabled ECC (this is the case when on-die ECC
is in use).

>=20
> > 1/ the option has to be opted-in by the NAND controller driver (or
> >    through a DT property) =20
>=20
> I noted that already, which is why I'm not necessarily rejecting the
> pull request.
>=20
> > 2/ even if it's enabled by mistake on one of these controllers, they
> >    either check ecc->mode [1][2] =20
>=20
> Right, thanks for pointing those out. That helps a bit more.
>=20
> > or simply override chip->ecc content
> >    unconditionally [3] =20
>=20
> Really? That seems a little error prone to have two different setters
> trying to clobber each other. Before this patch set, at least we mostly
> just respect the controller driver (see all the 'if (!ecc->foo)' in
> nand_scan_tail()); the only clobbering was on the 'mode' field, because
> it can be read from the device tree, in nand_scan_ident().
>=20
> > If one NAND controller driver is not doing #2, the driver should be
> > fixed not the on-die ECC logic. =20
>=20
> I'm not sure those are mutually exclusive. The (new) on-die ECC logic
> can easily recognize that ecc.foo is already configured, and skip
> clobbering it. As noted above, nand_scan_tail() already does this for
> most other similar features.
>=20
> If I don't see someone else fix this up soon, I'll look at doing it
> myself.

Actually, this patch [1] should fix the problem. By moving the vendor
init step in nand_scan_tail() we make sure ecc->mode is set to its final
value when Micron's driver decides whether on-die ECC should be
activated or not.

[1]https://patchwork.ozlabs.org/patch/770228/
