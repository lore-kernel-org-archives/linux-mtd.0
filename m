Received: from mail-bn1blp0190.outbound.protection.outlook.com
 ([207.46.163.190] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCLLE-0005Me-Ue
 for linux-mtd@lists.infradead.org; Wed, 30 Jul 2014 04:18:17 +0000
From: Priyanka Jain <Priyanka.Jain@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: RE: [PATCH] mtd: spi-nor: Correct device-id for n25q512a device
Date: Wed, 30 Jul 2014 04:17:51 +0000
Message-ID: <40bf530c679d46a4a0a73d3d22484f7c@CY1PR0301MB0857.namprd03.prod.outlook.com>
References: <1404795285-2929-1-git-send-email-Priyanka.Jain@freescale.com>
 <CAMuHMdV52qwThCezu=4NCpVBwbM2AjSK4cKXA+BdO=v_Yy2sBQ@mail.gmail.com>
 <20140730041431.GD11952@brian-ubuntu>
In-Reply-To: <20140730041431.GD11952@brian-ubuntu>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian,

Should I send another patch which just add
> > > +       { "n25q512a",    INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K) =
},
And let the original one as it is ?


Regards
Priyanka


> -----Original Message-----
> From: Brian Norris [mailto:computersforpeace@gmail.com]
> Sent: Wednesday, July 30, 2014 9:45 AM
> To: Geert Uytterhoeven
> Cc: Jain Priyanka-B32167; MTD Maling List; linux-spi
> Subject: Re: [PATCH] mtd: spi-nor: Correct device-id for n25q512a device
>=20
> Hi Priyanka,
>=20
> On Tue, Jul 08, 2014 at 09:38:19AM +0200, Geert Uytterhoeven wrote:
> > CC linux-mtd
>=20
> (Thanks for forwarding, Geert)
>=20
> > On Tue, Jul 8, 2014 at 6:54 AM, Priyanka Jain
> > <Priyanka.Jain@freescale.com> wrote:
> > > Signed-off-by: Priyanka Jain <Priyanka.Jain@freescale.com>
> > > ---
> > >  drivers/mtd/spi-nor/spi-nor.c |    2 +-
> > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > >
> > > diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > > b/drivers/mtd/spi-nor/spi-nor.c index c713c86..148bb51d 100644
> > > --- a/drivers/mtd/spi-nor/spi-nor.c
> > > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > > @@ -487,7 +487,7 @@ const struct spi_device_id spi_nor_ids[] =3D {
> > >         { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, 0) },
> > >         { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
> > >         { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) =
},
> > > -       { "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) =
},
> > > +       { "n25q512a",    INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K) =
},
>=20
> We can't just change the ID, as this would break other devices.
> Apparently there are multiple similar devices with at least two different=
 IDs.
> And we already have this patch queued up in l2-mtd.git (also in linux-nex=
t):
>=20
> commit c14deddec1fbd8c9757c53a49dbfd2dc83265f21
> Author: grmoore@altera.com <grmoore@altera.com>
> Date:   Tue Apr 29 10:29:51 2014 -0500
>=20
>     mtd: spi-nor: add support for flag status register on Micron chips
>=20
> Feel free to test!
>=20
> > >
> > >         /* PMC */
> > >         { "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_P=
MC) },
>=20
> Brian
