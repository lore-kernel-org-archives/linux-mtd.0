Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TfnLt-0006GQ-Q4
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2012 07:55:38 +0000
Message-ID: <1354607777.11583.50.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] ubi: Dont call ubi_self_check_all_ff() in
 __wl_get_peb()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Tue, 04 Dec 2012 09:56:17 +0200
In-Reply-To: <1354564667-9549-3-git-send-email-richard@nod.at>
References: <1354548780.11583.21.camel@sauron.fi.intel.com>
 <1354564667-9549-1-git-send-email-richard@nod.at>
 <1354564667-9549-3-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kK84atZQpYHZ5fpbNn+N"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, zsadecki@itwatchdogs.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-kK84atZQpYHZ5fpbNn+N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-12-03 at 20:57 +0100, Richard Weinberger wrote:
> As ubi_self_check_all_ff() might sleep we are not allowed
> to call it from atomic context.
> For now we call it only from ubi_wl_get_peb().
> There are some code paths where it would also make sense,
> but these paths are currently atomic and only enabled
> when fastmap is used.
>=20
> Signed-off-by: Richard Weinberger <richard@nod.at>

Can you confirm that you enabled the 3 debugging options I sent and
tested both FM and non-FM configurations with those options enabled?

--=20
Best Regards,
Artem Bityutskiy

--=-kK84atZQpYHZ5fpbNn+N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvayhAAoJECmIfjd9wqK0rI8P/2BjyfsnReL8cjNBfssb9WJb
yPtTCIKJ7eoQkhQoHUZevenDOGVzUS7cJRz58FoIi5u20p2TPCz4vT3CLDPIWuZy
Y5EEAB71Lp1zFK/XRtx/CJcZzPyEyGKsu0FR5QBOLZXEgifLpf2rittxaeqWz1iV
4OnYLFdO3jaqRRHTmeGPNGshkuitmxMqsxSUbuNxVVJufiN7wlWA5iQJ1Vaaahzb
960In3p1GpbBQws8X3kUq8f8ImKDsxovCkaVKu+ljy/auKeZxnp97ce7pFZNZRGp
23rtoD/KNTmdOFAVxsidJEDIuahGXjF166mEmKezGC3P4FCJn1eV9GTM6ZYLYYaE
9B3k6+C5kDHk4D2PDUILE99UM9fvdZMxRLjJAodY2RZxX//mMFJSKseCng7dy21o
5XVY3A8sfH9scEy0V54FZ8NKK/+wTGuLejiYZgwG1mfVQ7d+5XsG2DkHZMrDM2qA
HFxYrI/CvzmBlntTawBDjwC5dtyOm0pm6Cd/AmJxm60A+FLu+QV0rWNt6H2qkN0n
kMb0kvWpKwM6qK/nSm/yeRPqX5ELkEd5RvPLf2FVrXNM58j9s1OTCrOa+r0sJZNu
kd7O4CYvyBloipd8ioLcnwyua/U73V2HQV/i18ca9Q3jdQ/I/L+w0lD0o2/SGrs4
dj33PE7LzFmoaBRIZ32q
=boqB
-----END PGP SIGNATURE-----

--=-kK84atZQpYHZ5fpbNn+N--
