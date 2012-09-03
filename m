Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8SrU-0004Xn-Pj
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 09:22:29 +0000
Message-ID: <1346664440.3061.23.camel@sauron.fi.intel.com>
Subject: Re: UBI error: nor_erase_prepare: cannot invalidate PEB 76, write
 returned -5 read returned 2
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexander Stein <alexander.stein@systec-electronic.com>, Pieter Smith
 <pieter.smith@eu.omron.com>
Date: Mon, 03 Sep 2012 12:27:20 +0300
In-Reply-To: <201012011437.16978.alexander.stein@systec-electronic.com>
References: <201012011437.16978.alexander.stein@systec-electronic.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-o5Wy5h8Vu3cZT6HNARWT"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-o5Wy5h8Vu3cZT6HNARWT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-12-01 at 14:37 +0100, Alexander Stein wrote:
> Hello,
>=20
> I'm observing the given error after starting Linux. ubiattach is called f=
rom=20
> within the init-script. Currently I'm running v2.6.34. The filesystem is=
=20
> mounted read-only as expected.
> It gets curious that afterwards in u-boot the corresponding sector is com=
plety=20
> empty, read 0xff. It seems the sector cannot be written, although it is e=
mpty.
> Has anybody an idea about such phenomenon? Oh, before it forget, I use a=
=20
> Numonyx Axcell M29EW NOR-Flash 128MiB.

Sorry guys, cannot help, but if you happen to find the root-cause and
fix it - patches are welcome :)

--=20
Best Regards,
Artem Bityutskiy

--=-o5Wy5h8Vu3cZT6HNARWT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRHf4AAoJECmIfjd9wqK0stkP/0LB6VVxJ23jLL0NuRb+KFjB
+kzoJcwNIiO5+V2MsuE4x3mNTYBX5N+IvcjvYtOGZrl2AsjN44eSXHYwk4yFb3sH
FWttEYXqUnFNb+tgin779hCmVH5now/4LyrhuvV9mNl9+OWpgsq4+WavYCSpTVxq
2BvsBE+hO3IMpX5MG2Hj5bs9Zbd2k3PR+HFsvsmVabw24IET/YhsaJidr/qaavHX
Dq9j+R5VKl6HSmJ6l4ATmtgAYbibA4ac97xPZuQKIyTAAva9ZlIuboDswjwuW4AF
vceD8Y55jL42ZFhfkStWVg9dwTdaYaxGyj0Nyr+5umJOIKDBGwNVAKIFg3kireas
XNvS4lIMNiOnvRXgQPh4Nx5sJWhFCB8T+xweA2ScNY3wWNvlpMTA2WOF1BmotAO8
mjkIfiejy5uDCDw3E0KUI6VP0MJj0GPonEQN8/MFxi2+M6kDluppfG3s0vlpS2wf
cNsgzrIH4MthnA0QHE+KGbs9a66FTyKpqPa13R5BceCzsTowJieU+WEGlqL5yAKO
I8dVHRqLHxlSy2N5vfyFNRBAqTezS4ysmAJ8Uj4/53G/nL4uRd50ZhytGZArpntW
bhKFRRPPzQz4Vjo2CSfQ4NCG4uFEW+U94dDP4hp9ggUbBMBbx7PWe+wk18UEr1IX
RJAjw/wt6xsxYy5Lzxzk
=XT2K
-----END PGP SIGNATURE-----

--=-o5Wy5h8Vu3cZT6HNARWT--
