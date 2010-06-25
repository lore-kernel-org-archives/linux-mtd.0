Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OS2W1-0001oV-O6
	for linux-mtd@lists.infradead.org; Fri, 25 Jun 2010 06:35:54 +0000
From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Thomas Gleixner <tglx@linutronix.de>
Date: Fri, 25 Jun 2010 12:05:38 +0530
Subject: RE: Reed Solomon FAQ
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B030DF4EC92@dbde02.ent.ti.com>
References: <alpine.LFD.2.00.1006211604160.4290@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.00.1006211604160.4290@localhost.localdomain>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: Thomas Gleixner [mailto:tglx@linutronix.de]
> Sent: Monday, June 21, 2010 8:35 PM
> To: linux-mtd@lists.infradead.org
> Cc: Ghorai, Sukumar
> Subject: Reed Solomon FAQ
>=20
> I got repeatedly questions like the following about Reed Solomon
> codes:
>=20
> > Say we have allocated 8bytes in spare area to store the ECC for 512
> > bytes data. And we have to correct upto 4-bit in 512-byte data. And
> > would you please let me know how to configure the rs-lib for the
> > same? Say we are using the 8-bit data(symbol).
>=20
> It's impossible to use 8bit symbol width for 512 byte data.
>=20
>       m =3D number of bits per symbol
>       n =3D code length in symbols up to 2^(m-1)
>       k =3D original data length in symbols
>       r =3D n - k =3D number of redundant symbols
>       t =3D 1/2 (n-k) =3D error correction capability (number of symbols)
>=20
> So for this use case we get for the kernel rs lib:
>=20
>    k =3D 512
>=20
> So for 512 byte data we need a symbol width of 10. The rs lib in the
> kernel handles this in the encode/decode_rs8 functions by expanding
> the 8 bit FLASH data to 10 bits internally.
>=20
>    m =3D 10
>=20
> If we can store 8 byte =3D=3D 64bit of redundant symbols in the spare
> area, so the number of redundant symbols is:
>=20
>    r =3D 64/10 =3D 6
>=20
> And the resulting code lenght is:
>=20
>    n =3D k + r =3D 518
>=20
> So the max. number of correctable symbols is:
>=20
>    t =3D 1/2 * 6 =3D 3
>=20
> That might be up to 24 bit of corrected data, when the errors are not
> scattered over more than 3 bytes on FLASH.
>=20
> If errors happen on 4 or more different FLASH bytes, they are
> uncorrectable.
>=20
> The 518/512 (10 bit symbol width) code is the optimum which can be
> achieved for 512 byte FLASH read/write chunks with 8 byte of spare
> area usage.
>=20
> To correct 4 symbols in a 512 byte data chunk we need at least 8
> redundant symbols, which means 80 bit =3D=3D 10 bytes storage size in the
> spare area.
>=20
> > Is it possible to correct 4-symbols, by max 9-byte parity?
>=20
> Yes, but that requires that the 512 byte data is converted into a
> serialized bitstream w/o symbol width expansion so 9 bit symbol width
> can be used.
>=20
>     m =3D 9
>     k =3D 456 [ 512 * 8 / 9 rounded up ]
>     r =3D 8 [ 72 / 9 ]
>     t =3D 4
>=20
> Such modes are only useful when both the encoding and the decoding are
> done in hardware, as serializing / deserializing for the software
> en/decoder is making the already slow software RS even more horribly
> slow.
>=20
> As a side note: software RS encoding/decoding is performancewise a bad
> idea in general.
>=20
> Thanks,
>=20
> 	tglx
[Ghorai] Thanks Gleixner,
It's a very informative email for me.
