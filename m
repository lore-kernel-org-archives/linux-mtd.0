Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGmf5-0006y1-AV
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 08:08:03 +0000
Message-ID: <1348646887.24309.32.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: fsl_ifc_nand: fix cast removes address space of
 expression warnings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kim Phillips <kim.phillips@freescale.com>
Date: Wed, 26 Sep 2012 11:08:07 +0300
In-Reply-To: <20120913185607.af76965cb973dfb1059c842f@freescale.com>
References: <20120913185607.af76965cb973dfb1059c842f@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wBJWKsR9wgOYgl/7Rgst"
Mime-Version: 1.0
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wBJWKsR9wgOYgl/7Rgst
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-09-13 at 18:56 -0500, Kim Phillips wrote:
> found by sparse.
>=20
> Signed-off-by: Kim Phillips <kim.phillips@freescale.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-wBJWKsR9wgOYgl/7Rgst
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYrfnAAoJECmIfjd9wqK0cdwP/jhDMd+B3ElBfU7IcTjyzIcP
RGkPw+vRHAzWb7+6pKMSBRncW76563vkf8sa5yk14iBLkjI36tvy9ra8fsRVt0qL
scPh0aAYONnRraYqZhWmsCG+jlcAhGNpTefTQcpcXZfSJE0F5xISAybk7MJhhYFa
4yuM3aptMllN+dJl4ssQd+YnYbQ36Jt4KNJzBbkGXTDjYTcsbeui1AwGNvtMrUrn
V6vXnDl5r1TMUf6BC7DxQ1H8Kyzbr6EL0uzPnFGGd6YJE+zH5TAQoJzQfWjqncWL
OeCdZqF/34YbbQrOH/3AFLjEUc/FGJuAt9jH8wXK6YymC0Fva1rFgI8E83zsps0G
zmE3OcPv84EMdM7QmKdjp8rU0SsoBRqxfYaCBFWUoP2Nkl7GVIDkUf0qoFCCorXr
EDa0iWsZv97CJzo9fjb/6uuvOPOoYpg8IrsMz+/QO5Z5ZtSn8qpp5uDmREz+HXlv
ZoLcQr699xJG6vqfNqnoczUAwt76IyGSy7tMnmq/5dW1j1m0Ux/YnMnP4dmBBCxz
NtKuwv8DqIQg1Ru1/LuezScuyYA4i98Wa46oSLSwgypIDQnx7O7bO71ouk8zNXeK
tr4S3RoGYopu6WNMCdcipUzXSt3W+/t4sd+koMTtNXAlfqD+aQ2P9DGA2RBTEhfw
efKpuybRJVBbJyd9m4Jc
=W+fj
-----END PGP SIGNATURE-----

--=-wBJWKsR9wgOYgl/7Rgst--
