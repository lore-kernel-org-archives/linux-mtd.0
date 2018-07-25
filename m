Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiEEv-0001xo-51
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 07:29:43 +0000
Date: Wed, 25 Jul 2018 09:29:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marcel Ziswiler <marcel@ziswiler.com>,
 linux-mtd@lists.infradead.org, Marcel Ziswiler
 <marcel.ziswiler@toradex.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, H Hartley Sweeten
 <hsweeten@visionengravers.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH] mtd: nand: fix spelling in driver api documentation
Message-ID: <20180725092928.243bf07f@xps13>
In-Reply-To: <20180723181915.5f35f668@bbrezillon>
References: <20180720075334.24254-1-marcel@ziswiler.com>
 <20180723093924.04af0e2f@lwn.net>
 <20180723181915.5f35f668@bbrezillon>
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

Hi Jonathan,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Mon, 23 Jul 2018
18:19:15 +0200:

> Hi Jonathan,
>=20
> On Mon, 23 Jul 2018 09:39:24 -0600
> Jonathan Corbet <corbet@lwn.net> wrote:
>=20
> > On Fri, 20 Jul 2018 09:53:33 +0200
> > Marcel Ziswiler <marcel@ziswiler.com> wrote:
> >  =20
> > > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > >=20
> > > This fixes some spelling mistakes.   =20
> >=20
> > So I hate to complain about a documentation improvement, but...
> >  =20
> > >=20
> > > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > >=20
> > > ---
> > >=20
> > >  Documentation/driver-api/mtdnand.rst | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/Documentation/driver-api/mtdnand.rst b/Documentation/dri=
ver-api/mtdnand.rst
> > > index dcd63599f700..c55a6034c397 100644
> > > --- a/Documentation/driver-api/mtdnand.rst
> > > +++ b/Documentation/driver-api/mtdnand.rst
> > > @@ -374,7 +374,7 @@ The nand driver supports three different types of=
 hardware ECC.
> > > =20
> > >  -  NAND_ECC_HW8_512
> > > =20
> > > -   Hardware ECC generator providing 6 bytes ECC per 512 byte.
> > > +   Hardware ECC generator providing 8 bytes ECC per 512 byte.   =20
> >=20
> > That's not a spelling mistake, that's a factual change.  I'll apply the
> > patch since it appears to be correct, but will be tweaking the changelo=
g. =20
>=20
> I think Miquel had planned to apply this patch to the NAND tree, but we
> don't seem to have conflicting changes on this file, so feel free to
> take it in the doc tree.
>=20
> Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>

Can you confirm you will take this patch?

Thanks,
Miqu=C3=A8l
