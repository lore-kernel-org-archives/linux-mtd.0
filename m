Message-ID: <1328789487.22240.84.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] mtd: ixp4xx: oops in ixp4xx_flash_probe
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marc Kleine-Budde <mkl@blackshift.org>
Date: Thu, 09 Feb 2012 14:11:27 +0200
In-Reply-To: <1328729069-21308-3-git-send-email-mkl@blackshift.org>
References: <1328729069-21308-1-git-send-email-mkl@blackshift.org>
 <1328729069-21308-3-git-send-email-mkl@blackshift.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wUh7yDv3yx4/Pe6SEgvf"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wUh7yDv3yx4/Pe6SEgvf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-02-08 at 20:24 +0100, Marc Kleine-Budde wrote:
> In commit "c797533 mtd: abstract last MTD partition parser argument" the
> third argument of "mtd_device_parse_register()" changed from start addres=
s
> of the MTD device to a pointer to a struct.

Hi, thanks for the fix. Several comments:

1. I've removed the huge oops from the description - it is not very
helpful and not worth having.
2. It is usually a good idea to CC the author of the commit causing the
regression.
3. For regressions like this it is a good idea put the stable tree tag.

I've added

Cc: stable@kernel.org [3.2+]

(git tag --contains c797533 gives the version)

and pushed to the l2-mtd.git tree, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-wUh7yDv3yx4/Pe6SEgvf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPM7fvAAoJECmIfjd9wqK0GfEQAJV3mmbEN7/HPNIsa2hfSwT1
zfKtIcqDn+MB4rkLNcw7uUwCWVbHKJ5XnNKOr8WSCZHAl3pn7YMG2gx7+m7oivpv
aHxAPxEnfrP47mfxZoDCvoRKSeh7aEGj5mSV2gsyETZ249uuM45YqNr2fjNn4O99
rotRNRxbSK4BhD0bSqEvmzxINqSHkgvseIluxfu3yM53xRAqf4/2QL+ZZnCgE7Wq
KVAxGHHZw+B0iFY+W4pErZqisN/rmwa1xM22cp8rmESKm01hwy7fKL7Qz3OxLv//
3SO9BKO/yLMp/ZRoAsA/Z2hRwCL438ff7KdCNjNGjRcH9hhKk0GYl583OE79xj9q
JKYdf2LfRAd4QeGTysXOxIxZT83wO6r093vOmjr0qF5E0DseJIJ1ZOdWtTjAfYmh
T7tH1+pNR5aZ0ehyQzam/HhNapbpcMqFLLwRezoWTJd657fcxsoBDcL4N2sqSREm
vaMJFVR2NonEs8b6gEIe3mwe8MKxfl8JxktKSDdk8zrhnFyFUc1m23SV6a4BWma8
1NP1Pvwvs5eX0bNk9UA2Qmuh4/IURzpS2KFi+Ux/jS6O+J2vyrG0R0uVAiXJLDlP
DhLXwPhGX6M8XCFXwu75nosoIanaXJ8PTFNxP8XJzwl1QhJ1UWoYxkd/JgYiRqAS
++gpgATPtnLf04z6jF+a
=qynT
-----END PGP SIGNATURE-----

--=-wUh7yDv3yx4/Pe6SEgvf--
