Received: from smtp.falooley.org ([66.180.170.91])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PQ29Z-0000PX-QN
	for linux-mtd@lists.infradead.org; Tue, 07 Dec 2010 18:20:43 +0000
Date: Tue, 7 Dec 2010 10:20:12 -0800
From: Jason Lunz <lunz@acm.org>
To: richard -rw- weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH] mtd: allow mtd and jffs2 when ARCH=um
Message-ID: <20101207182012.GA10546@falooley.org>
References: <22c797d00709272118i33d32b9dy93d5f5ec8f8edd30@mail.gmail.com>
	<20071024011712.GA3762@falooley.org>
	<1193208689.26096.48.camel@pmac.infradead.org>
	<20071227181524.GA19051@falooley.org>
	<20071228174853.GA4252@uranus.ravnborg.org>
	<20101207072919.GA8511@falooley.org>
	<AANLkTineLxHdcDKZEUGiqVNAauSX_xyQrs49kKaqhiWo@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <AANLkTineLxHdcDKZEUGiqVNAauSX_xyQrs49kKaqhiWo@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Cc: atom ota <atomota@sleepyhammer.com>,
	user-mode-linux-devel@lists.sourceforge.net,
	Sam Ravnborg <sam@ravnborg.org>, Jeff Dike <jdike@addtoit.com>,
	lkml <linux-kernel@vger.kernel.org>,
	linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 07, 2010 at 10:39:41AM +0100, richard -rw- weinberger wrote:
> On Tue, Dec 7, 2010 at 8:29 AM, Jason Lunz <lunz@acm.org> wrote:
> >
> > Allow parts of drivers/mtd to compile on uml by pushing the HAS_IOMEM
> > dependencies down closer to the parts of mtd that actually need it.
> > This allows enough of mtd to build to let jffs2 be used on uml.
> >
> > Signed-off-by: Jason Lunz <lunz@acm.org>
> > ---
> > =A0arch/um/Kconfig.rest =A0 =A0 =A0 =A0| =A0 =A04 +---
> > =A0drivers/mtd/Kconfig =A0 =A0 =A0 =A0 | =A0 =A01 -
> > =A0drivers/mtd/Makefile =A0 =A0 =A0 =A0| =A0 =A03 ++-
> > =A0drivers/mtd/chips/Kconfig =A0 | =A0 =A04 ++++
> > =A0drivers/mtd/devices/Kconfig | =A0 =A08 ++++++++
> > =A0drivers/mtd/maps/Kconfig =A0 =A0| =A0 =A04 ++++
> > =A0drivers/mtd/mtdchar.c =A0 =A0 =A0 | =A0 =A04 ++++
> > =A0drivers/mtd/nand/Kconfig =A0 =A0| =A0 =A03 +++
> > =A0drivers/mtd/onenand/Kconfig | =A0 =A03 +++
> > =A0include/linux/mtd/map.h =A0 =A0 | =A0 =A02 ++
> > =A010 files changed, 31 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/um/Kconfig.rest b/arch/um/Kconfig.rest
> > index 0ccad0f..e34f399 100644
> > --- a/arch/um/Kconfig.rest
> > +++ b/arch/um/Kconfig.rest
> > @@ -28,9 +28,7 @@ source "drivers/scsi/Kconfig"
> >
> > =A0source "drivers/md/Kconfig"
> >
> > -if BROKEN
> > - =A0 =A0 =A0 source "drivers/mtd/Kconfig"
> > -endif
> > +source "drivers/mtd/Kconfig"
>=20
> drivers/mtd was already marked as broken when we moved over to git (2.6=
.12-rc2).
>=20
> Do you exactly know why it was marked and fixes this patch all issues?

I don't know exactly why it was originally marked BROKEN. I imagine it
was because most of the low-level mtd drivers need readb/writeb and
friends, which don't exist on uml. But now that mtd has virtual ram- and
blockdev-backed drivers, that's no longer sufficient reason to omit the
whole subsystem.

I can't claim that this fixes all possible issues of course, but I've
privately been using this patch to run block2mtd under uml for years. My
original motivation was to allow the use of jffs2 in a uml-based test
environment and for that it's worked very well.

Jason
