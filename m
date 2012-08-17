Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2KxU-0000tR-Gt
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 11:43:21 +0000
Message-ID: <1345204086.27859.59.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: esb2rom: convert to MFD model
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Date: Fri, 17 Aug 2012 14:48:06 +0300
In-Reply-To: <42f902f6-f22d-4498-80e2-bb3a3bc809bf@zimbra>
References: <42f902f6-f22d-4498-80e2-bb3a3bc809bf@zimbra>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-UFT9wjB6CYG13TCbcg5Y"
Mime-Version: 1.0
Cc: Guenter Roeck <guenter@roeck-us.net>, linux-mtd@lists.infradead.org,
 Lew Glendenning <lglendenning@lnxi.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-UFT9wjB6CYG13TCbcg5Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-07-12 at 16:50 -0500, Aaron Sierra wrote:
> Move esb2rom PCI device scanning to lpc_ich.
>=20
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>

For me this patch is too big to review. Can you split it, but still keep
bisectable? Also, the commit message should be more sensible and should
explain what you do, how, and which problem you solved, and how you
tested this.

Why the MFD list is not CCed?

> +MODULE_ALIAS("platform:" KBUILD_MODNAME);

Does this have to be in this patch? Looks like an independent change.

--=20
Best Regards,
Artem Bityutskiy

--=-UFT9wjB6CYG13TCbcg5Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLi92AAoJECmIfjd9wqK0iW0P/AvNx8+qURQekprpExJk0MOb
XdeDuTw/UMWF2xIbaLua2PWT1g5nMp48214tbUZa3GjjKNMFk0nDfLvl8/lBvx4Y
p4mRSwEbFzgZjUBuYpG4kCpYmrso2RK94o9/4fk38TWKQ8nDsNUB+C8QX/25K9y8
oFt3Zn59wVUTdcuNvsIvleWnW8s3KyeL4I0wr5EP+fVZl5lpf2yfTV6heFKm63k7
3Rrfp7ar9opxOvz1D2y5zVbwx4f7Ry/qeKLGLrMgFc6JDa2L14d5GDJRwaay5AAU
6aFhJ7q5RerA6GrCKEKxQbrrkZqPIpJMNYOIGPPnMfLH64g9XtJyGOPc5za7ikif
hCl4XoJ7G/BK42XKS1RKo807oTUQ6AbLjOb7YXYqREyjpTiJfoQb557qoMJAZMsl
/jyCDA9yvTE8UfI/koeJvt87mLOrbCV1CHyXx2DYFmoiIompCH572pRIJaQZg+jj
ZiQijfvFCCxmOJmDvTAxaJ80G35ucU4B/GtLBPlNgpOeGBpUDCssuZV2pd28L6zz
jrwj70ue2jlU/Gz/xhURatXW0MO2578Pd31H33U2Zf5EENipUtl820rq0WcmeD6c
5hDYKDpHYSrura2HxWB3valGXmUMMRFiV1a20Xrh7dzZX5gGNb8l/qxRc2u3UjJt
b/0rDSIvWonWCZiu026k
=6ZE5
-----END PGP SIGNATURE-----

--=-UFT9wjB6CYG13TCbcg5Y--
