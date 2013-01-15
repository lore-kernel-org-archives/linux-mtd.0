Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv1XW-0005lg-Mq
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 08:06:35 +0000
Message-ID: <1358237242.2731.100.camel@sauron.fi.intel.com>
Subject: Re: whiteout for UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Cliff Brake <cliff.brake@gmail.com>
Date: Tue, 15 Jan 2013 10:07:22 +0200
In-Reply-To: <CAOd_LFycV4LUmk=Ua+f64AsL_BxFqmw_wF601RbdO9ou94_kow@mail.gmail.com>
References: <CAOd_LFycV4LUmk=Ua+f64AsL_BxFqmw_wF601RbdO9ou94_kow@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wP9siDRiOBFoPsxRJyho"
Mime-Version: 1.0
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wP9siDRiOBFoPsxRJyho
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-12-12 at 13:14 -0500, Cliff Brake wrote:
> Hello,
>=20
> I'm trying to use overlayfs with UBIFS, and its complaining about lack
> of whiteout support (with kernel 3.5).  Has anyone looked into
> implementing this, and are there patches available?

I never saw anyone looking into whiteouts support for UBIFS.

--=20
Best Regards,
Artem Bityutskiy

--=-wP9siDRiOBFoPsxRJyho
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9Q46AAoJECmIfjd9wqK0lb4QAIuHarTNe+/Pxjs6LFh3zP87
eKtvvwBzJvf4Ce93mzn1bZVGBQBylzkWq38oLoEL/jGhNPPSAEKkJw6udUJVxF/m
rVJjtmzzCOqOX5alVGkgClTLy58bqp1e7TvRrXYdzfjN3WC+Hcyo/6/rmJT0XAbC
xf/wDlk9JPmK7yTBci7XP6uGyi+BeYFt4NCnaFNK0LxbJa4UQKZYkni464R7bktw
VPDMfgHKb9T0cWx/rvB6SqTjZwFF4UEq2mtwLSzaLqKKum/NGrpA70gChyeSbofZ
Petz6u0fUXrENryvBXKMtrAge49uID8clM70Q6bUIYC/oXrzybG9jZ9NV5HmCvzf
woQizf5+c+JjpHnysIKyOuXt/ZhjKs3dJAcLTovO9bckSofelyKdr8Ei6isK8Cx+
En9v056cjDtwX9E3TG+JTVuNNBq/TbAKJ8WbR+7A35deLJEcWeAF0j/Wh/Js123m
lcC6FzwWy5ADbgzNiNda6Y1UTllTfVam5eSgPDwH99QbvyBcHNvYw4AZYdWc0YA/
njxjgajySHBfpqnYI+HelNtXeIl30QJ71hcjBdktcSCM69c9pXYxpCSAaxpN7R9b
gDX2GNvsOzX5TGsazqN2TWQkLkjIAO0GGuPRAnQwHK+6OMIGp5xId53Ym6/IzTOS
VEdFx3I3ieUps0+X6XwH
=oL95
-----END PGP SIGNATURE-----

--=-wP9siDRiOBFoPsxRJyho--
