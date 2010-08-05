Date: Thu, 05 Aug 2010 15:15:04 +0900
From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] S5PC110: Add OneNAND interrupt number
In-reply-to: <AANLkTikV8ypbpainB7toPPeq7n6Q1P7ZDwL4Uf89q9dP@mail.gmail.com>
To: 'Kyungmin Park' <kmpark@infradead.org>, dedekind1@gmail.com
Message-id: <009301cb3465$8df1b3c0$a9d51b40$%kim@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-language: ko
Content-transfer-encoding: quoted-printable
References: <20100727103937.GA1247@july>
	<1280982776.4363.18.camel@localhost.localdomain>
	<AANLkTikV8ypbpainB7toPPeq7n6Q1P7ZDwL4Uf89q9dP@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	m.szyprowski@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kyungmin Park wrote:
>=20
> On Thu, Aug 5, 2010 at 1:32 PM, Artem Bityutskiy <dedekind1@gmail.com>
wrote:
> > On Tue, 2010-07-27 at 19:39 +0900, Kyungmin Park wrote:
> >> To use OneNAND interrupt at drivers, also extend DMA address to =
cover
fully.
> >>
> >> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> >> ---
> >> diff --git a/arch/arm/mach-s5pv210/dev-onenand.c b/arch/arm/mach-
> s5pv210/dev-onenand.c
> >> index 34997b7..f8ede33 100644
> >> --- a/arch/arm/mach-s5pv210/dev-onenand.c
> >> +++ b/arch/arm/mach-s5pv210/dev-onenand.c
> >> @@ -27,9 +27,14 @@ static struct resource =
s5pc110_onenand_resources[] =3D
{
> >> =A0 =A0 =A0 },
> >> =A0 =A0 =A0 [1] =3D {
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5PC110_PA_ONENAND_DMA,
> >> - =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5PC110_PA_ONENAND_DMA + =
SZ_2K - 1,
> >> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5PC110_PA_ONENAND_DMA + =
SZ_8K - 1,
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
> >> =A0 =A0 =A0 },
> >> + =A0 =A0 [2] =3D {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_ONENAND_AUDI,
> >> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_ONENAND_AUDI,
> >> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
> >> + =A0 =A0 },
> >> =A0};
> >
> > You do not expect this to go through the MTD tree, right?
>=20
> After this patch, I did a lot of works but failed to persuade the =
Kukjin.

Maybe I missed this single patch...looks ok itself.

> At this time. it's okay only this patch to mtd tree.
>=20
I think, it's better this patch is going to upstream through ARM tree.

Artem, I will apply in my tree. Thanks.

> Kukjin, are you okay?
> Since It's only affect the c110.
>=20

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
