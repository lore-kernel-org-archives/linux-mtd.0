Received: from mail160.messagelabs.com ([216.82.253.99])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QggWp-00036j-T6
	for linux-mtd@lists.infradead.org; Tue, 12 Jul 2011 17:13:52 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: Arnd Bergmann <arnd@arndb.de>, =?iso-8859-15?Q?Uwe_Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Date: Tue, 12 Jul 2011 12:13:08 -0500
Subject: RE: [PATCH] new helper to define common struct resource constructs
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F383D6DAD4@AUSP01VMBX24.collaborationhost.net>
References: <14C4E31473AF7E4B98176CB73615181C19FBD3@039-SN1MPN1-006.039d.mgd.msft.net>
	<201107072304.05626.arnd@arndb.de>
	<E1QgHeh-0004k8-2m@octopus.hi.pengutronix.de>
	<201107121529.17611.arnd@arndb.de>
In-Reply-To: <201107121529.17611.arnd@arndb.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Wolfram Sang <w.sang@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"thierry.nolf.barco@gmail.com" <thierry.nolf.barco@gmail.com>,
	Huang Shijie <b32955@freescale.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?iso-8859-15?Q?Lothar_Wa=DFmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, July 12, 2011 6:29 AM, Arnd Bergmann wrote:
> On Monday 11 July 2011, Uwe Kleine-K=F6nig wrote:
>> resource definitions that just define start, end and flags =3D IORESOURC=
E_MEM
>> or IORESOURCE_IRQ (with start=3Dend) are quite common. So introduce a sh=
ortcut
>> for them. Also make available a macro to specify named resources of both
>> types which are less common.
>>=20
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> What do others think, is this worthwhile?

Assuming I found the correct patch in the archives, +1 from me.  Not sure w=
hat
the correct sign-off should be, possibly:

Reviewed-by: H Hartley Sweeten <hsweeten@visionengravers.com>

> Should we also define macros for IORESOURCE_IO and IORESOURCE_DMA?

As a gross check, on linux-next I see:

$ git grep IORESOURCE_MEM | wc -l
3989
$ git grep IORESOURCE_IRQ | wc -l
2309
$ git grep IORESOURCE_IO | wc -l
687
$ git grep IORESOURCE_DMA | wc -l
521

The *_MEM and *_IRQ macros are going to have the largest impact on reducing
the lines of code.  But, for completeness it might be nice to have the *_IO
and *_DMA ones also.

If this patch is accepted there are a couple private macros in various plac=
es
that should probably be replaced or updated.

For instance in mach-nomadik/board-nhk8815.c and mach-nomadik/cpu-8815.c th=
ere
are these:

#define __MEM_4K_RESOURCE(x) \
	.res =3D {.start =3D (x), .end =3D (x) + SZ_4K - 1, .flags =3D IORESOURCE_=
MEM}

And plat-omap/i2c.c has this:

#define I2C_RESOURCE_BUILDER(base, irq)			\
	{						\
		.start	=3D (base),			\
		.end	=3D (base) + OMAP_I2C_SIZE,	\
		.flags	=3D IORESOURCE_MEM,		\
	},						\
	{						\
		.start	=3D (irq),			\
		.flags	=3D IORESOURCE_IRQ,		\
	},

I seem to recall seeing others but can't remember exactly where.

Regards,
Hartley=
