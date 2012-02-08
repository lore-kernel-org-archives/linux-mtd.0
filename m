From: "Manjunathappa, Prakash" <prakash.pm@ti.com>
To: Michael Williamson <michael.williamson@criticallink.com>
Subject: RE: [PATCH v3 3/3] arm:davinci: move NAND and NOR devices as aemif
 MFD slaves
Date: Wed, 8 Feb 2012 04:00:13 +0000
Message-ID: <A73F36158E33644199EB82C5EC81C7BC31761D77@DBDE01.ent.ti.com>
References: <1328627513-30134-1-git-send-email-prakash.pm@ti.com>
 <1328627513-30134-4-git-send-email-prakash.pm@ti.com>
 <4F31552D.9060505@criticallink.com>
In-Reply-To: <4F31552D.9060505@criticallink.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
 <davinci-linux-open-source@linux.davincidsp.com>,
 Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

On Tue, Feb 07, 2012 at 22:15:33, Michael Williamson wrote:
> Hello Prakash,
>=20
> On 2/7/2012 10:11 AM, Manjunathappa, Prakash wrote:
>=20
> > NAND and NOR device are made as aemif device slaves, hence all DaVinci
> > board NAND/NOR device registration achieved via aemif MFD driver.
> >
> > Signed-off-by: Manjunathappa, Prakash <prakash.pm@ti.com>
> > ---
> > Since v2:
> > Make changes for all DaVinci boards in single patch.
>=20
>=20
>=20
> [...]
>=20
> > diff --git a/arch/arm/mach-davinci/board-mityomapl138.c b/arch/arm/mach=
-davinci/board-mityomapl138.c
> > index 672d820..bb29b7a 100644
> > --- a/arch/arm/mach-davinci/board-mityomapl138.c
> > +++ b/arch/arm/mach-davinci/board-mityomapl138.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/etherdevice.h>
> >  #include <linux/spi/spi.h>
> >  #include <linux/spi/flash.h>
> > +#include <linux/mfd/davinci_aemif.h>
> > =20
> >  #include <asm/io.h>
> >  #include <asm/mach-types.h>
> > @@ -414,18 +415,35 @@ static struct resource mityomapl138_nandflash_res=
ource[] =3D {
> >  	},
> >  };
> > =20
> > -static struct platform_device mityomapl138_nandflash_device =3D {
> > -	.name		=3D "davinci_nand",
> > -	.id		=3D 1,
> > -	.dev		=3D {
> > -		.platform_data	=3D &mityomapl138_nandflash_data,
> > +static struct platform_device mityomapl138_emif_devices[] __initdata =
=3D {
> > +	{
> > +		.name		=3D "davinci_nand",
> > +		.id		=3D 0,
>=20
>=20
>=20
> Pretty sure this still needs to be a 1.  The nand is on chip select 3,
> EMA_CS3, which I believe is the same as the da850 EVM.

Yes I could not test on this board. I will make id as 1.

Thanks,
Prakash

>=20
> -Mike
>=20
>=20
>=20
