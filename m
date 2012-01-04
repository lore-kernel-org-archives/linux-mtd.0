Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RiU4d-0002sL-5a
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2012 16:52:23 +0000
Received: by ghrr15 with SMTP id r15so7829778ghr.36
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jan 2012 08:52:21 -0800 (PST)
Message-ID: <1325696066.8917.108.camel@sauron.fi.intel.com>
Subject: Re: ubifs panic with 2.6.39 stable - followup
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brad Parker <brad@heeltoe.com>
Date: Wed, 04 Jan 2012 18:54:26 +0200
In-Reply-To: <4F043A7C.1060504@heeltoe.com>
References: <4F043A7C.1060504@heeltoe.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-jutsfD2T8FfqJ3WD0Xh5"
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


--=-jutsfD2T8FfqJ3WD0Xh5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-01-04 at 06:39 -0500, Brad Parker wrote:
> [sorry for the duplicate post; I tried to post a followup with just
>   the url to the pastebin log but for some reason  it got stuck
>   waiting for the moderator]
>=20
> Running and older 2.6.31 kernel with UBIFS I see a panic which appears
> to be during recovery of a bad block. The root fs (which is UBIFS)
> won't mount and the kernel panics.
>=20
> I upgraded the kernel 2.6.39-stable, hoping that would fix the problem,
> as I noticed a lot of recovery fixes had gone in.  It still panics;
> it appears the recovery fails.
>=20
> I rebooted with "ignore_loglevel" and the output is here:
>=20
>      http://pastebin.com/ETJjP4uw
>=20
> The board is essentially an Olimex SAM9-L9260, with Samsung NAND.
>=20
> I'm curious if this looks familiar and if it might be fixed post 2.5.39
>=20
> thanks for any insight.
>=20
> -brad
>=20
> UBIFS: recovery needed
> UBI error: ubi_io_read: error -74 (ECC error) while reading 126976 bytes=
=20
> from PEB 2970:4096, read 126976 bytes
> UBIFS error (pid 1): ubifs_check_node: bad CRC: calculated 0xf510fb95,=
=20
> read 0x4f0a3196

So there is a corrupted inode node, and UBIFS believes it has been
corrupted not because of a power cut. I do not know why it is corrupted,
but if you use MLC then this may be related to the paired pages problem.

Anyway, there is another issue I see from the dump. Even if you somehow
make the node good again, UBIFS will still fail saying something like
"corrupt empty space". Look at line 292 in your pastebin:

ffffffff ffffffff ffffffff ffffffff ffffffff ffdfffff ffffffff ffffffff

See that little "d"? It means that the empty space has a bit-flip. The
question is why? Unstable bit I guess? Does your NAND driver / HW
provides ECC protection for empty pages?

Anyway, currently UBIFS cannot handle these situation. Someone needs to
do this - I can assist by reviewing and advising.

--=20
Best Regards,
Artem Bityutskiy

--=-jutsfD2T8FfqJ3WD0Xh5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPBIRCAAoJECmIfjd9wqK0OAMP/1EAoGon0O15kuG/Asxx87Tm
O3e3Ia7YaCH4VWQ4I+jhjucKrtugKCYoymDMH2qijpVIRUqfICnniU4ijmpJk7O6
Eaza0cjfKSUCVmPyjjHMoY1G1LIFA/zgeAb7LI68efEC/kQ7/MAXgkK3yQqfSvef
7u0QE6ywLHO0fzqbrG8cia66ykD+NgbtNk8Psg7g7lpJY4RvygmuaNmZO2UwZ4oV
0rgNRlgtqjhD4ALy5+Fx6gpd3PqO1PoOlJR5bRKsrPsWNUQaJWRavEPE1Ga4aHHx
r9LBGTf7H6NSjPMyR8/0gYgAdRZ6W81wiHmC8pCgxHwfUb9jQEEiADdnmEkb4Pmi
phPIStLWtCJjeAbvxa5x+/QVv+RtB0gdHlFk2ibHn5W3QP5Jx5m7LzbfIvJnLio9
V+a/N0jvLiaeQ+7QTGS4SdlXxBNPNf80D+6oWjd15UWyqlrY2GyHFKmciT7Ep1rK
zQwBUtmT9dWdB6diK1S55vwwP0lf6BcytVj8LW3i1QoxbSCkrDE8omOLnH9n4601
vvlBMKUnUpzNKbSpT3VlRqaZHVSR9D1gJWyPwnMUAIiOMhxCzBrsy4kagjfxkFC6
X1aBi0YNf32lDkBkgF0D4U0LeEQHv7/jlnxweAIZ2Jg/b8MCNZ7AV5CEq8I5HyYx
JByXKzaP8Fi0QVasvHEA
=uByk
-----END PGP SIGNATURE-----

--=-jutsfD2T8FfqJ3WD0Xh5--
