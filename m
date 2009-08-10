Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MaYkv-0004cC-7J
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 17:34:02 +0000
From: "Scott Branden" <sbranden@broadcom.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Date: Mon, 10 Aug 2009 10:33:42 -0700
Subject: RE: [PATCH v3 26/27] [ARM] [NAND] [bcmring] add bcmring umi
	nand driver support
Message-ID: <9383297B60843144AC17878B479520F1109F1486E7@SJEXCHCCR01.corp.ad.broadcom.com>
In-Reply-To: <4A7E7A59.3080501@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=koi8-r
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <dedekind@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.arm.linux.org.uk"
	<linux-arm-kernel@lists.arm.linux.org.uk>,
	"Leo \(Hao\) Chen" <leochen@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20

> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind1@gmail.com]=20
> Sent: August 9, 2009 12:27 AM
> To: Scott Branden
> Cc: Artem Bityutskiy; Leo (Hao) Chen;=20
> linux-mtd@lists.infradead.org; linux-arm-kernel@lists.arm.linux.org.uk
> Subject: Re: [PATCH v3 26/27] [ARM] [NAND] [bcmring] add=20
> bcmring umi nand driver support
>=20
> On 08/09/2009 10:12 AM, Scott Branden wrote:
> > Hi Artem,
> >
> > Thanks for the comments.
> >
> > This particular code (nand_bcm_umi.h) is shared between=20
> multiple OS's,=20
> > simulation environments, and non-OS's.  As you are aware,=20
> this alone=20
> > presents maintenance challenges.  The simplest approach was=20
> to make an=20
> > include file and wrap that for each particular environment.
> > We will look at splitting this into a C and H file.
>=20
> Well, the idea is that include/linux/mtd the external MTD=20
> interface, so you should put only the stuff which is about=20
> MTD<->other subsystems.
> There are also headers that are about MTD core <-> MTD=20
> drivers interface.
>=20
> So if you need to share something between different parts of=20
> your driver, this should be rather in drivers/mtd/nand/, not=20
> in include/linux/mtd.
>

Understood - it looks like nand_bcm_umi.h is in the incorrect location.  We=
 will move it to drivers/mtd/nand and adjust Makefiles accordingly.

=20
> > The file passes Linux's checkpatch scripts.  I don't see a need for=20
> > any further requirement?  It would be sad if a particular linux=20
> > maintainer was stuck on other stylistic concerns because other=20
> > maintainers are not.  Especially when this code is not specifically=20
> > written for linux and is supported, tested, and maintained by us.
>=20
> I do not have a strong opinion here, and I'm personally fine=20
> with this.
> I mean, I do not mind if you ignore my /**...**/ and=20
> 'WindowsStyleVars'
> comment.
>=20
> --
> Best Regards,
> Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>=20
> =
