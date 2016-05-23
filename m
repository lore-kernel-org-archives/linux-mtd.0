Received: from chaos.universe-factory.net ([37.72.148.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b4smT-0003p6-3U
 for linux-mtd@lists.infradead.org; Mon, 23 May 2016 16:32:39 +0000
Subject: Re: [PATCH 1/2] mtd: spi-nor: disable software protection for
 Macronix flash at startup
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <e4b01b739197bd4556617b70553093c58d3b1497.1463578353.git.mschiffer@universe-factory.net>
 <57430D4C.3010000@atmel.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
From: Matthias Schiffer <mschiffer@universe-factory.net>
Message-ID: <b3d19f59-84c8-1ed2-c3c9-14e6975767e5@universe-factory.net>
Date: Mon, 23 May 2016 18:32:12 +0200
MIME-Version: 1.0
In-Reply-To: <57430D4C.3010000@atmel.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="fkr3w4CvLpI6CK308Teuu58qt7cQ9fBhC"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fkr3w4CvLpI6CK308Teuu58qt7cQ9fBhC
Content-Type: multipart/mixed; boundary="jHP3lBNoKTeJeDjC61WQbVXdHVU4xbMtT"
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Message-ID: <b3d19f59-84c8-1ed2-c3c9-14e6975767e5@universe-factory.net>
Subject: Re: [PATCH 1/2] mtd: spi-nor: disable software protection for
 Macronix flash at startup
References: <e4b01b739197bd4556617b70553093c58d3b1497.1463578353.git.mschiffer@universe-factory.net>
 <57430D4C.3010000@atmel.com>
In-Reply-To: <57430D4C.3010000@atmel.com>

--jHP3lBNoKTeJeDjC61WQbVXdHVU4xbMtT
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 05/23/2016 04:01 PM, Cyrille Pitchen wrote:
> Hi Matthias,
>=20
> Le 18/05/2016 15:32, Matthias Schiffer a =E9crit :
>> This patch has been tested in OpenWrt for a few months and seems to wo=
rk
>> correctly.
>>
>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-n=
or.c
>> index 157841d..d681003 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1304,6 +1304,7 @@ int spi_nor_scan(struct spi_nor *nor, const char=
 *name, enum read_mode mode)
>> =20
>>  	if (JEDEC_MFR(info) =3D=3D SNOR_MFR_ATMEL ||
>>  	    JEDEC_MFR(info) =3D=3D SNOR_MFR_INTEL ||
>> +	    JEDEC_MFR(info) =3D=3D SNOR_MFR_MACRONIX ||
>>  	    JEDEC_MFR(info) =3D=3D SNOR_MFR_SST ||
>>  	    info->flags & SPI_NOR_HAS_LOCK) {
>>  		write_enable(nor);
>>
> The line following this patch chunk is "write_sr(nor, 0);" however, if =
I refer
> to the Macronix mx25l25673g datasheet about the Status Register, bits[5=
:2]
> (BP0, BP1, BP2 and BP3) are non-volatile and define the protected area.=

> Also bit6 (Quad Enable) is also non-volatile and is used to reassign #W=
P and
> #Hold pins to IO2 and IO3 functions needed by Quad SPI protocols on man=
y other
> Macronix memories (indeed on the 73g part, the Quad Enable bit is alway=
s 1).
>=20
> So you should not write 0 directly into the Status Register if you only=
 want to
> clear bit7 (Status Register Write Disable): use a read, modify, write s=
equence
> instead.
>=20
>=20
> Best regards,
>=20
> Cyrille
>=20

Hi,
clearing the protected area (BP0..BP3) is exactly what this code is
supposed to do; it was already doing this for Atmel, Intel and SST flash,=

and this patch series makes it behave the same for Macronix and Winbond.

I see that the mx25l25673g defaults to unprotected according to the
datasheet, but removing the protection again should not hurt. If there is=

actually a problem with writing 0 to the Quad Enable bit, we can of cours=
e
make this conditional and/or just clear the relevant bits.

I've observed the mx25l6405d coming up with protection bits set (the
datasheet doesn't seem to specify the initial state of the bits). It's al=
so
possible that the software protection is enabled by the bootloader, which=
 I
can't replace; but I'd argue that the kernel should try to get the flash
chip into a known state on boot, thus always removing the software protec=
tion.

Most of the setup of the flash chip is done after the "write_sr(nor, 0);"=

in spi_nor_scan(). Do you suspect that "write_sr(nor, 0);" might cause
problems anyways?

Regards,
Matthias


--jHP3lBNoKTeJeDjC61WQbVXdHVU4xbMtT--

--fkr3w4CvLpI6CK308Teuu58qt7cQ9fBhC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJXQzCMAAoJEBbvP2TLIB2cVGIP/329sABiLK7X6q/Ae/yD7KNT
KIXWVGEf8pAoQpAlMKbKNw4/+lQwxP5Ix0Y2d9L/hHDyJJ6y+3KtOx24SM9Pgwoh
fF7Osg6IkkCXiDvI9XddhHxhXtogTjs749a+U7cy2ihi/2ibnsROv23YTe5KJmR9
Y/6SohUURrpulCIt7dEwOMGIMJP0uVZ1FO8on+7PXx/vblC0ptX5E3YLLLTkO+f1
Cq5n3mhplOaudY4lAGOzdBCkUmGY7yHgX3O/cogPnR4BFhHgui9t5WMrTxKEHnW8
V8QFl/hc5FpceyoSM+xQUccbVIXXC6joYCCPPyPBNhKpv+zmwpoOfSqYAkJRT1U9
R/Gfl21w9baHFS4/ZxIlhW3/qqWtynvv+xUPyZW4g2Y74EpewMqf7LlwTzqHtOEL
Sp/xXZpodk9FDTZj0r0RrbirK+HjEeHMuWC6ykL0L02w5R/kQ2QHfnJCJRp/M0XY
kbq1C9dxxXTznNjf6u8/b70YTEUkOsfmYpPZ9afHO3NMcJ8wcp13pV15a7Cx2I98
D6f33A2IsQhzvTFXsiHXesNvEaXOaeqB0BuBd8EgFRM+/5MOlNKDuyQ7DPNe8xYy
Su5ISysl/eVQgx0yFNf46CrgoMm3RjPkdi94bEtg1LDkz4RMOkJpShBGBzEi0hLz
2KBhOzuMdas0IEfAfcKq
=BySe
-----END PGP SIGNATURE-----

--fkr3w4CvLpI6CK308Teuu58qt7cQ9fBhC--
