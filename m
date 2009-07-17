Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRoTk-0006Ug-G0
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 14:32:08 +0000
From: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
To: Troy Kisky <troy.kisky@boundarydevices.com>
Date: Fri, 17 Jul 2009 09:31:38 -0500
Subject: RE: [PATCH v3 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for
	large page NAND chips
Message-ID: <7A436F7769CA33409C6B44B358BFFF0C011E71797D@dlee02.ent.ti.com>
References: <1247781590-11323-1-git-send-email-nsnehaprabha@ti.com>
	<4A5FBE35.1030908@boundarydevices.com>
In-Reply-To: <4A5FBE35.1030908@boundarydevices.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>, "Paulraj,
	Sandeep" <s-paulraj@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
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
> Sent: Thursday, July 16, 2009 7:57 PM
> To: Narnakaje, Snehaprabha
> Cc: linux-mtd@lists.infradead.org; davinci-linux-open-
> source@linux.davincidsp.com; dwmw2@infradead.org; tglx@linutronix.de;
> akpm@linux-foundation.org; Paulraj, Sandeep
> Subject: Re: [PATCH v3 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for
> large page NAND chips
>=20
> nsnehaprabha@ti.com wrote:
> > +/* An ECC layout for using 4-bit ECC with large-page (2048bytes) flash=
,
> > + * storing ten ECC bytes plus the manufacturer's bad block marker byte=
,
> > + * and not overlapping the default BBT markers.
> > + */
> > +static struct nand_ecclayout hwecc4_2048 __initconst =3D {
> > +	.eccbytes =3D 40,
> > +	.eccpos =3D {
> > +		/* at the end of spare sector */
> > +		24, 25, 26, 27, 28, 29,	30, 31, 32, 33,
> > +		34, 35, 36, 37, 38, 39,	40, 41, 42, 43,
> > +		44, 45, 46, 47, 48, 49, 50, 51, 52, 53,
> > +		54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
> > +		},
> > +	.oobfree =3D {
> > +		/* 1 byte at offset 0 holds manufacturer badblock marker */
> > +		{.offset =3D 1, .length =3D 23, },
> > +		/* 5 bytes at offset 8 hold BBT markers */
> > +		/* 8 bytes at offset 16 hold JFFS2 clean markers */
> > +	},
> > +};
>=20
> I hate to sound like a broken record, but
>=20
> If the bad block marker is only 1 byte. Don't you need to override
>=20
> static struct nand_bbt_descr largepage_flashbased =3D {
> 	.options =3D NAND_BBT_SCAN2NDPAGE,
> 	.offs =3D 0,
> 	.len =3D 2,
> 	.pattern =3D scan_ff_pattern
> };
>=20
> I think it is easier just to leave it as 2 bytes. That may
> allow substituting a different manufacturers chip too.

Yes, it is better to leave it as 2 bytes.

Thanks
Sneha
=20
>=20
>=20
