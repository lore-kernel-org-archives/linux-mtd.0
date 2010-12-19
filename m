Received: from smtp.falooley.org ([66.180.170.91])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PUObT-0007Mk-Ke
	for linux-mtd@lists.infradead.org; Sun, 19 Dec 2010 19:07:32 +0000
Date: Sun, 19 Dec 2010 14:07:20 -0500
From: Jason Lunz <lunz@acm.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: mtd: fix CONFIG_MTD_COMPLEX_MAPPINGS=n compile
Message-ID: <20101219190720.GA16710@falooley.org>
References: <20071227181524.GA19051@falooley.org>
	<20071228174853.GA4252@uranus.ravnborg.org>
	<20101207072919.GA8511@falooley.org>
	<AANLkTineLxHdcDKZEUGiqVNAauSX_xyQrs49kKaqhiWo@mail.gmail.com>
	<20101207182012.GA10546@falooley.org>
	<1292343878.2538.80.camel@localhost>
	<20101214195124.GA6010@falooley.org> <20101216230110.65156c55@wker>
	<20101217042759.GA3148@falooley.org>
	<1292777276.2140.1.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1292777276.2140.1.camel@koala>
Content-Transfer-Encoding: quoted-printable
Cc: Anatolij Gustschin <agust@denx.de>, linux-mtd@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


You should also drop the changes that
7bc3265a9e9a09d6a9a3cfaaf53ccf3af5271a93 made to drivers/mtd/mtdchar.c -
there's no point changing that when mtdchar is disabled on ARCH=3Dum.

Jason

On Sun, Dec 19, 2010 at 06:47:56PM +0200, Artem Bityutskiy wrote:
> On Thu, 2010-12-16 at 20:27 -0800, Jason Lunz wrote:
> > On Thu, Dec 16, 2010 at 11:01:10PM +0100, Anatolij Gustschin wrote:
> > > This change breaks compiling when CONFIG_MTD_COMPLEX_MAPPINGS is no=
t
> > > defined in the kernel configuration. Please fix!
> >=20
> > Sorry, sloppy of me. This reverts all changes to mtd.h while keeping =
the
> > ability to compile mtd on ARCH=3Dum, with the exception mtdchar.
>=20
> Merged with the previous patch, thanks.
>=20
> --=20
> Best Regards,
> Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
>=20
>=20
