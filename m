Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dVBw1-0007zw-6D
 for linux-mtd@lists.infradead.org; Wed, 12 Jul 2017 07:19:47 +0000
Date: Wed, 12 Jul 2017 09:19:19 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse
 <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>
Subject: Re: [PULL v2] mtd: nand: Changes for 4.13
Message-ID: <20170712091919.3e4ea9d0@bbrezillon>
In-Reply-To: <20170712010115.GI55942@google.com>
References: <20170703134609.0ea9cd63@bbrezillon>
 <20170712010115.GI55942@google.com>
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

Le Tue, 11 Jul 2017 18:01:15 -0700,
Brian Norris <computersforpeace@gmail.com> a =C3=A9crit :

> + Thomas, as I don't really want to dig up the original patch to review
> right now
>=20
> On Mon, Jul 03, 2017 at 01:46:09PM +0200, Boris Brezillon wrote:
> > Hi,
> >=20
> > Here's my PR for 4.13. This v2 includes Dan's fix ("mtd: nand: mtk:
> > release lock on error path").
> >=20
> > As usual, let me know if you see any problem.
> >=20
> > Thanks,
> >=20
> > Boris
> >=20
> > The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c=
43f6:
> >=20
> >   Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)
> >=20
> > are available in the git repository at:
> >=20
> >   ssh://git.infradead.org/srv/git/l2-mtd.git tags/nand/for-4.13 =20
>=20
> I happen to have SSH access to that repository :) but a
> publicly-readable link is usually a better idea, in the highly unlikely
> case that someone else wants to review your pull request.

My bad. I have 2 remotes for l2-mtd (l2-mtd and l2-mtd-pub), just passed
the wrong one to 'git request-pull' :-/.

>=20
> > for you to fetch changes up to 81667e9c8ad827365f2d1e8b924caf062a19c593:
> >=20
> >   mtd: nand: mtk: release lock on error path (2017-07-03 13:39:09 +0200)
> >=20
> > ----------------------------------------------------------------
> > This pull request contains the following core changes:
> >=20
> > * addition of on-ecc support to Micron driver =20
>=20
> This still works by overriding chip->ecc.{read,write}_page{,_raw}()
> callbacks... I never liked that, and there have been multiple
> submissions that tried this already, IIRC. It's for sure not going to
> work with at least one in-tree driver (brcmnand); I suspect others
> (qcom_nand? mtk_nand?).

Yes, I know it doesn't work with all drivers, but given that those
drivers are already not supporting ECC_NONE or ECC_SW, I don't think
it's a real program.=20

> Can this be improved to either bail out when
> this clobbers a controller's existing callback, or even better, to
> utilize a controller's existing _raw() implementation, instead of
> assuming it can use the nand_base defaults?

IMO, if there's something to fix it's the NAND controller drivers that
are only partially complying with core expectations. I mean,
'->cmdfunc(READ0) + ->read_buf()' is a valid sequence and should work
with all NAND controllers, but for some (good?) reasons, some drivers
are taking liberties with this semantic.

Note that we are working on improving the situation with the
->exec_op() approach [4], which should provide NAND controller drivers
with all the information they need to execute a NAND operation
(CMD, ADDR, DATA, WAIT cycles), which, AFAIU was one blocking
aspect with '->cmdfunc()/->cmd_ctrl() + ->read/write_buf/byte/word()'.=20

It will also let drivers return -ENOTSUPP to report when they simply
don't support a specific NAND operation (for example, when the
CMD+ADDR+DATA+WAIT sequence is not supported).

>=20
> The latter seems difficult to do in time for this merge, but maybe the
> former can be done within the release?
>=20
> I'm still tempted to pull this, since at least it does require somebody
> to opt in via the device tree binding. So they should probably make sure
> it works with their driver before using it.

There really no risk with this new feature because:

1/ the option has to be opted-in by the NAND controller driver (or
   through a DT property)
2/ even if it's enabled by mistake on one of these controllers, they
   either check ecc->mode [1][2] or simply override chip->ecc content
   unconditionally [3]

If one NAND controller driver is not doing #2, the driver should be
fixed not the on-die ECC logic.

>=20
> > * addition of helpers to help drivers choose most appropriate ECC
> >   settings
> > * deletion of dead-code (cached programming and ->errstat() hook)
> > * make sure drivers that do not support the SET/GET FEATURES command
> >   return ENOTSUPP use a dummy ->set/get_features implementation
> >   returning -ENOTSUPP (required for Micron on-die ECC)
> > * change the semantic of ecc->write_page() for drivers setting the
> >   NAND_ECC_CUSTOM_PAGE_ACCESS flag
> > * support exiting 'GET STATUS' command in default ->cmdfunc()
> >   implementations
> > * change the prototype of ->setup_data_interface()
> >=20
> > A bunch of driver related changes:
> >=20
> > * various cleanup, fixes and improvements of the MTK driver
> > * OMAP DT bindings fixes
> > * support for ->setup_data_interface() in the fsmc driver
> > * support for imx7 in the gpmi driver
> > * finalization of the denali driver rework (thanks to Masahiro for the
> >   work he's done on this driver)
> > * fix "bitflips in erased pages" handling in the ifc driver
> > * addition of PM ops and dynamic timing configuration to the atmel
> >   driver
> >=20
> > And as usual we also have a few minor cleanup/fixes/improvements
> > patches across the subsystem.
> >  =20
>=20
> Brian

[1]http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/nand/br=
cmnand/brcmnand.c#L2121
[2]http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/nand/mt=
k_nand.c#L1171
[3]http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/nand/qc=
om_nandc.c#L1840
[4]https://github.com/linux-nand/linux/commits/nand/exec_op
