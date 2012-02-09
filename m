Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvSiy-0001ku-SY
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2012 12:03:41 +0000
Received: by pbcun1 with SMTP id un1so284427pbc.36
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2012 04:03:38 -0800 (PST)
Message-ID: <1328789146.22240.82.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] libmtd: perform device checking first
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 09 Feb 2012 14:05:46 +0200
In-Reply-To: <1328736382-5798-1-git-send-email-computersforpeace@gmail.com>
References: <1328736382-5798-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-jWZmsyUezYpXG98ItLFY"
Mime-Version: 1.0
Cc: Brian Foster <brian.foster@maxim-ic.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-jWZmsyUezYpXG98ItLFY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-02-08 at 13:26 -0800, Brian Norris wrote:
> If we don't check for the MTD before calling `legacy_get_dev_info1', we m=
ay
> get errors like:
>=20
> libmtd: MTD subsystem is old and does not support sysfs, so MTD character=
 device nodes have to exist
> libmtd: error!: "/dev/mtd2" is not a character device
> mtdinfo: error!: libmtd failed get MTD device 2 information
>          error 22 (Invalid argument)
>=20
> So reverse the order of these two checks.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Looks good, thanks, but could you please send a version which applies to
mtd-utils.git? The 3rd patch in this series does not apply.

--=20
Best Regards,
Artem Bityutskiy

--=-jWZmsyUezYpXG98ItLFY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPM7aaAAoJECmIfjd9wqK0/lQP/R7ZGwTn//s6yne+oo5s8V1l
vDS1vU+DS0gS7Znp5qA0KNlzba1v794f1M+zh32Do+ALZVr6qqdDkmP6fanrFe8b
nQ5vmkAU07kWTeK/s3xKWuH/fxJaUoyyQ+gkRCdBv+bE1IMRgg/wwigldYmofsgF
aIMdlpLAW03ucNFkxdEAhKzpSnp7XL6fstHgpixOCy+mXbvs/+ovs3ZYI8AMyS2G
8Ly8CMLyD9yNSjElZbsT3ApaAwrE77dJFblvvAamyhj55SsPxPNV6odIQ4FCmv3+
Vs/Q3ZfWRhY1QcdXykMhHSuMOvsBiN7xLmFDG5kTSMlpc/5p0wgQn/rPTgaYscE9
fPSr0itjBhlS7sjn0yWDfsfi8uQ8zqMWFmxJklKj/1ORNKbfS1QlKa3os8SiJoaO
EeJpCDxgxn1tY5em2DXNpoMfPrvzUpOnwDFTMe0jkGjnvgginwnPtMzQYpl31wDg
go2koxm4IighanmuzjqJyh1RH78VJGHSmcdV437jFDRlXj5x7/5E/X8yqkU1VyWF
5SmH1poriBHEjhjBSkPazVYM4CJ6obCagQrzmSlrEAORp4HDaBDxIsxyjyLRiSYD
b4dpRwljN5JP2np7UjVLF1eX0BxwmV2AQXlJEqubsiSlIyzMNob77+1gJ62rghnR
89QVEgpuekTRSHTCo2az
=zDQV
-----END PGP SIGNATURE-----

--=-jWZmsyUezYpXG98ItLFY--
