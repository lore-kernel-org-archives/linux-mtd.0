Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Ga9aw-0001iO-2o
	for linux-mtd@lists.infradead.org; Wed, 18 Oct 2006 07:28:30 -0400
Subject: Re: Reading less than page size from NAND ok?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0610181315170.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610181315170.25906@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 18 Oct 2006 14:28:17 +0300
Message-Id: <1161170898.3260.125.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-10-18 at 13:22 +0200, Ricard Wanderlof wrote:
> In the NAND boot code for U-Boot 1.4.4 (which use MTD (albeit an old=20
> version)), there is a note that when reading from NAND flash via the mtd=20
> layer (i.e. eventually ending up in nand_do_read_ecc()), one should start=
=20
> reading on a page boundary and read at least one page of data, in order t=
o=20
> get proper ECC behavior.
>=20
> However, when looking at the latest mtd code, it appears that this no=20
> longer is the case - when reading bursts of data less than one page, the=20
> data is internally buffered and a complete page read so that ECC is alway=
s=20
> applied properly. Is this in fact the case, or have I missed something=20
> vital here? (Was there such a limitation once?)
>=20

I am not sure about the past, but now you can read from any offset and
any number of bytes using MTD interface, even though you read from NAND
flash which has minimal I/O unit =3D 1 NAND page. MTD takes care of this.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
