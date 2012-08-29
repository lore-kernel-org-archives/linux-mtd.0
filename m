Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6ipe-00022R-Et
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 14:01:23 +0000
Message-ID: <1346249180.2848.485.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: Added a device flag for subpage read support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jeff Westfahl <jeff.westfahl@ni.com>
Date: Wed, 29 Aug 2012 17:06:20 +0300
In-Reply-To: <1344893730-11345-1-git-send-email-jeff.westfahl@ni.com>
References: <1344893730-11345-1-git-send-email-jeff.westfahl@ni.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wPZwAJezKpFxDiHv9OQm"
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


--=-wPZwAJezKpFxDiHv9OQm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-13 at 16:35 -0500, Jeff Westfahl wrote:
> Added a NAND device flag for subpage read support. Previously this was
> hard coded based on large page and soft ECC.
> Updated base NAND driver to use the new subpage read flag if the NAND is
> large page and soft ECC.
>=20
> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-wPZwAJezKpFxDiHv9OQm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPiHcAAoJECmIfjd9wqK0cDkP/RM6d/XqcHXEhRT3SM9FoCJX
Mc0a4FsLvVSeVyl3wEgH14wtLyOYNC2l78rh5vBMqLYSSPrA/Wi76wB4FqWLSMnc
J+qW5uYFrOW442am61NFl+Q54Wqeb+j27XcOf/MD8YhN/Rbswx448dwxgoERWAlz
w+6f+ez8cc7YbHs+lXa35+9MYY3Q4kd7c0RMgErkIie5S2beVpDHM9aLxlVALAmd
WQ87ChnCa6ciRgr2WT9YOioJn5pE3MMSh+7ppGV/vdfC357cyPIJdgnn2ZjTi0S6
pbbe5eHlcsoCwCezmEowfgB64KlhRs1+p8PV/aLPqXA54VgSyIuaAa/PCz4N/P9f
H+ffFbFuDDsuKnC4Wa4jJn8QFKkp4tdeh3uoM1gM+CKzjyrV9/vMzOfV7lhPgfWv
Cg9Os+kxWVVB+Lv9rwAQGxWz/uVRZ5ZCLkoc7uu/U8c4TYVKAb0KqdjnmzLJ5bGH
B2GQ9YFbXJfrjN7iomTySclcIKro0myEtvgk5tqQad9LMq4xEvymOqqwUrgI6RWx
tZ1GkXfF/bs1CKdNme6z4a9t2LKQXVTSL1Uxhzos/qc4/qYSVcoZUVXqkjdQP7cX
06qRMWvfrixj4PuETu/1IRqXDidOsiFj3x2x/sxZnvxk9s7qcGBJ4sKOXw2drSLh
5Sw/2/YCSn9KQEBQ3y4j
=mqE7
-----END PGP SIGNATURE-----

--=-wPZwAJezKpFxDiHv9OQm--
