Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M2DZ9-0001T9-B8
	for linux-mtd@lists.infradead.org; Fri, 08 May 2009 00:03:57 +0000
From: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
To: Troy Kisky <troy.kisky@boundarydevices.com>, David Brownell
	<david-b@pacbell.net>
Date: Thu, 7 May 2009 19:03:11 -0500
Subject: RE: [PATCH 2/2] NAND on DM355: Add 4-bit ECC support for large page
	NAND chips
Message-ID: <7A436F7769CA33409C6B44B358BFFF0C0112FC7477@dlee02.ent.ti.com>
References: <1241663371-20448-1-git-send-email-nsnehaprabha@ti.com>
	<200905070016.52356.david-b@pacbell.net>
	<7A436F7769CA33409C6B44B358BFFF0C0112FC6CF5@dlee02.ent.ti.com>
	<200905071011.06812.david-b@pacbell.net>
	<4A0362A5.3010101@boundarydevices.com>
In-Reply-To: <4A0362A5.3010101@boundarydevices.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Troy Kisky [mailto:troy.kisky@boundarydevices.com]
> Sent: Thursday, May 07, 2009 6:37 PM
> To: David Brownell
> Cc: Narnakaje, Snehaprabha; dwmw2@infradead.org; davinci-linux-open-
> source@linux.davincidsp.com; linux-mtd@lists.infradead.org;
> tglx@linutronix.de; akpm@linux-foundation.org
> Subject: Re: [PATCH 2/2] NAND on DM355: Add 4-bit ECC support for large
> page NAND chips
>=20
> >>>> +static struct nand_ecclayout hwecc4_2048 __initconst =3D {
> >>>> +       .eccbytes =3D 10,
> >>> Not ".eccbytes =3D 40"?  This is 4 chunks, 10 ecc bytes each...
> >> No, .eccbytes is for each chips->ecc.steps.
> >
> > So it's the same as ecc.bytes, which is not exported to userspace.
> >
> >
> >> And all nand read/write
> >> APIs, we handle ecc.steps (for loop). There is chips->ecc.total that
> >> is initialized as (chips->ecc.steps * chips->ecc.bytes).
> >>
> >> It is strange that .eccbytes is for each chunk, while eccpos[] and
> >> .oobfree[] have to handle/cover all chunks.
>=20
> No, eccbytes should equal ecc.total

Thanks Troy and Dave.

Yes, it should indeed be 40 --> total size. eccbytes in the nand_ecclayout =
is different from chip->ecc.bytes. We do set the chip->ecc.bytes to 10 whic=
h is for each trunk.

I will change this and test it.=20

>=20
>=20
> i.e. from nand_base.c
>=20
> static struct nand_ecclayout nand_oob_64 =3D {
>         .eccbytes =3D 24,
>         .eccpos =3D {
>                    40, 41, 42, 43, 44, 45, 46, 47,
>                    48, 49, 50, 51, 52, 53, 54, 55,
>                    56, 57, 58, 59, 60, 61, 62, 63},
>         .oobfree =3D {
>                 {.offset =3D 2,
>                  .length =3D 38}}
> };
> Troy
>=20
>=20
