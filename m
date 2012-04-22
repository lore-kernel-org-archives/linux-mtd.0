Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLy4W-0003D5-HL
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 14:47:29 +0000
Received: by lagy4 with SMTP id y4so9612254lag.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 07:47:26 -0700 (PDT)
Message-ID: <1335105890.28267.27.camel@brekeke>
Subject: Re: Exposing NAND chip information
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tom Isaacson <Tom.Isaacson@navico.com>
Date: Sun, 22 Apr 2012 17:44:50 +0300
In-Reply-To: <B36E81988B048A4FA3600EDE585F756BD0EBD2@EXCH02-AKLNZ.MARINE.NET.INT>
References: <B36E81988B048A4FA3600EDE585F756BD0EBD2@EXCH02-AKLNZ.MARINE.NET.INT>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zIOi65lPdOFVuNyKJlre"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-zIOi65lPdOFVuNyKJlre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-04-15 at 23:20 +0000, Tom Isaacson wrote:
> Hi,
>=20
> Our production software needs to record the NAND chip type used in
> production so we have a record in case we get problems later. The
> information we need is printed out by nand_get_flash_type(), e.g.:
>   NAND device: Manufacturer ID: 0x98, Chip ID: 0xd1 (Toshiba NAND
> 128MiB 3,3V 8-bit)
> My plan is to add some files to the /sys tree to expose this
> information. But the only part of that information stored is the
> device name, in mtd_info.name. Is there any reason why I shouldn't add
> the manufacturer name and ID and the chip ID to mtd_info so they can
> be accessed later on? Or should I add them to mxd_mtd_s (in
> nand_base.c) and keep it local?
>=20
If you have a need to have them in mtd_info - probably you can add
those. Just add/document a way to detect that the chip does not have
this data. E.g., all zeroes or -1. I mean, NORs might not have the IDs.

> Also, when I add the files to the /sys tree is there any naming
> convention I should follow? I was going to copy the way the eMMC
> device does it:
>   manfid - Manufacturer ID
>   devid - Chip ID
>   manf_name - Manufacturer name
>   dev_name - Chip name

Should we put all ID's to the same file instead? Or at lease
manfid/manf_name and devid/dev_name pairs to waste less RAM because each
sysfs file cunsumes several KiBs of RAM AFAIR (struct inode alone is
several KiB). Also if you add sysfs files - do not forget to document
them id Documentation/ABI and CC Greg KH.

--=20
Best Regards,
Artem Bityutskiy

--=-zIOi65lPdOFVuNyKJlre
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPlBliAAoJECmIfjd9wqK02pIP/2b0ix1TdFxleEER70o32MbH
5kC4TRZfiFaHRCRr7Zkbm8HLXA0bw23wxeVKyYvDdKFr6DY+yGx8WydHQf0bgqUO
dO7OPxIUMlmbUGNqP51YZKt9CHPnX71LhydzqS4xsB6ND8xIgdlEupz1L5/XCkWs
aEBZ1bLqEuUedH+V2Uo93y7FjhT8uBf4631lQFBRQE/pCUZKDTMwowB9cGN8/G4f
FyRWFVmNo643MOO5cnUOr8VRqe/A8yoE5lJdvE8jYTwivACffudjMGTJVA1izr1M
vDTgKt4UKCIrh85mDOheCBvHYJ3Bbkfpz24q1ct+3WEQdmBKdLj350uazqRI/F1B
y0IZcfCn1+JK9vasnJdbcMnxmw1RA2xFfwcfWA71hWdKWBABO8n1ozWisE70mz0k
6sgdIuGUsVS7bCDnlvqAHjtkBSWhN9TeSHsvRYDDGKr1NMGZd4i1FTcQbFxwyzsx
VaYWlGsVcqKPCV9Gf4CIdFPCP0Dbisaf9wcr1KoAG7Ivx3Bq1mK3Po+vzoWITz/3
/C61rMNUhSJQe5+6wIBkxwKTmAFUBzmqfn86NU90Y7kMLX2f3UZEQy7tC1zE2glQ
SYPfuHouPhinneUsmd0EOk7z/S9/HeEzuaUvkWTJ4x/x9XfoDpAE3OjcFb841SPp
wXSJOYbqXzgFRZthPbcX
=X7Pk
-----END PGP SIGNATURE-----

--=-zIOi65lPdOFVuNyKJlre--
