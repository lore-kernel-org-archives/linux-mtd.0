Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fipoX-0003dZ-Id
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 23:36:59 +0000
Date: Fri, 27 Jul 2018 01:36:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Josh Wu
 <rainyfeeling@outlook.com>, linux-kernel@vger.kernel.org, Nicolas Ferre
 <nicolas.ferre@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: drop Wenyou Yang from Atmel NAND driver
 support
Message-ID: <20180727013634.74f87455@xps13>
In-Reply-To: <20180725192805.GF3539@piout.net>
References: <20180725145628.6625-1-miquel.raynal@bootlin.com>
 <20180725203823.19a56d23@bbrezillon>
 <20180725192805.GF3539@piout.net>
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

Hi Alexandre,

Alexandre Belloni <alexandre.belloni@bootlin.com> wrote on Wed, 25 Jul
2018 21:28:05 +0200:

> On 25/07/2018 20:38:23+0200, Boris Brezillon wrote:
> > On Wed, 25 Jul 2018 16:56:28 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >  =20
> > > Mails to wenyou.yang@microchip.com are not deliverable.
> > > Drop him as Microchip/Atmel NAND controller driver maintainer.
> > >=20
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  MAINTAINERS | 1 -
> > >  1 file changed, 1 deletion(-)
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 07d1576fc766..1e7bbd5843f1 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -9345,7 +9345,6 @@ F:	drivers/media/platform/atmel/atmel-isc-regs.h
> > >  F:	devicetree/bindings/media/atmel-isc.txt
> > > =20
> > >  MICROCHIP / ATMEL NAND DRIVER
> > > -M:	Wenyou Yang <wenyou.yang@microchip.com>
> > >  M:	Josh Wu <rainyfeeling@outlook.com> =20
> >=20
> > Hm, actually you can remove the entry completely. I doubt Josh will
> > keep maintaining this driver since he's no longer working at Microchip.
> >  =20
>=20
> I think Nicolas' plan is to replace Wenyou so the entry may stay

Patch applied to nand/next to avoid receiving delivery errors.

We'll wait for Nicolas' input to replace Josh.

Thanks,
Miqu=C3=A8l
