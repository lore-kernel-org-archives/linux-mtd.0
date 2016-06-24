Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGSPf-0001w5-EI
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 14:48:56 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, "dedekind1@gmail.com" <dedekind1@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "alex@nextthing.co" <alex@nextthing.co>, "goliath@sigma-star.at"
 <goliath@sigma-star.at>
Subject: RE: [RFC] UBI: MLC Support v0
Date: Fri, 24 Jun 2016 14:48:23 +0000
Message-ID: <035e65dc714b468c9f59e430263204b7@SIWEX5A.sing.micron.com>
References: <1464609874-15488-1-git-send-email-richard@nod.at>
 <20160603144054.685b3079@bbrezillon>
In-Reply-To: <20160603144054.685b3079@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Mon, 30 May 2016 14:04:21 +0200
> Richard Weinberger <richard@nod.at> wrote:
>=20
> > as announced in [1] I'd like to submit the very first patch series to
> > have MLC support in UBI (and therefore also UBIFS).
> > The code has not changed much since the announcement but now the
> > patches are in a more reviewable shape. Still not mainline ready but be=
tter.
> > I'm sending this now as I'm on vacation until June 15th and hope that
> > we get some reviews on the concept.
> > The series consists of three parts:
> > 	a) Generic UBI rework to make the MLC implementation possible.
> > 	b) SLC emulation mode to access only lower pages on MLC NAND.
> > 	c) LEB consolidation to exploit MLC NAND's higher pages.
> >
> > [1]
> > http://lists.infradead.org/pipermail/linux-mtd/2016-April/067322.html
>=20
> Artem, I know you're quite busy, but that would be great to have your
> feedback. Not asking for a detailed review, but at least some comments on
> the general approach.
>=20
> Bean, I'd like to have your feedback too. You proposed a solution to addr=
ess
> the same problem a while ago, and your feedback on this solution would be
> valuable.
>=20
Boris=20
Sorry later reply for this. this month, I am busy for my immigration.
Now I am working in Munich, today I am just having a f2f meeting with Richa=
rd.
To be honest, I really interested in this solution. from this week, I will =
have more free time
And do some testing and review. Thanks.=20

> Thanks,
>=20
> Boris
>=20
> >
> > Thanks,
> > //richard
> >
> > ---
> >
> > David Gstir (1):
> >       ubi: Add debugfs knob to force LEB consolidation
> >
> > Richard Weinberger (12):
> >       ubi: Undo "UBI: modify ubi_wl_flush function to clear work queue =
for a
> lnum"
> >       ubi: Rework UBI worker
> >       ubi: auto re-size after UBI thread is ready
> >       ubi: Kill ubi->alc_mutex
> >       ubi: Get rid of __schedule_ubi_work()
> >       ubi: Remove tst_disable_bgt debugfs knob
> >       ubi: Move work related functions to work.c
> >       ubi: Remove lnum and vol_id from erase work
> >       ubi: Remove usless debug info from wear_leveling_worker()
> >       ubi: SLC mode
> >       ubi: LEB consolidation
> >       ubi: Add debugfs knob to trigger LEB consolidation
> >
> >  drivers/mtd/ubi/Kconfig       |   4 +
> >  drivers/mtd/ubi/Makefile      |   3 +-
> >  drivers/mtd/ubi/attach.c      | 407 ++++++++++++++++++--------------
> >  drivers/mtd/ubi/build.c       |  41 ++--
> >  drivers/mtd/ubi/cdev.c        |  14 +-
> >  drivers/mtd/ubi/consolidate.c | 516
> ++++++++++++++++++++++++++++++++++++++++
> >  drivers/mtd/ubi/debug.c       |  49 ++--
> >  drivers/mtd/ubi/debug.h       |  19 +-
> >  drivers/mtd/ubi/eba.c         | 429 ++++++++++++++++++++++++++++------
> >  drivers/mtd/ubi/fastmap-wl.c  |  33 ++-
> >  drivers/mtd/ubi/fastmap.c     | 265 ++++++++++++++-------
> >  drivers/mtd/ubi/io.c          | 426 +++++++++++++++++++++++++--------
> >  drivers/mtd/ubi/kapi.c        |  43 +---
> >  drivers/mtd/ubi/ubi-media.h   |  18 +-
> >  drivers/mtd/ubi/ubi.h         | 221 ++++++++++++++----
> >  drivers/mtd/ubi/upd.c         |   7 +-
> >  drivers/mtd/ubi/vmt.c         | 106 +++++----
> >  drivers/mtd/ubi/vtbl.c        |  87 ++++---
> >  drivers/mtd/ubi/wl.c          | 531 +++++++++++++++-------------------=
--------
> >  drivers/mtd/ubi/work.c        | 332 ++++++++++++++++++++++++++
> >  include/linux/mtd/ubi.h       |   1 -
> >  21 files changed, 2554 insertions(+), 998 deletions(-)
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
>=20
>=20
> --
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
