Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SIjts-0003vG-Ek
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 17:03:08 +0000
Message-ID: <1334336766.13160.20.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: use module_pci_driver
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Axel Lin <axel.lin@gmail.com>
Date: Fri, 13 Apr 2012 20:06:06 +0300
In-Reply-To: <1333418384.18133.6.camel@phoenix>
References: <1333418384.18133.6.camel@phoenix>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-HDei6lBdvNSrXC/OZxEb"
Mime-Version: 1.0
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Tim Hockin <thockin@sun.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Andy Lowe <alowe@mvista.com>, Jamie Iles <jamie@jamieiles.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Russell King <rmk@arm.linux.org.uk>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-HDei6lBdvNSrXC/OZxEb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-04-03 at 09:59 +0800, Axel Lin wrote:
> This patch converts the drivers in drivers/mtd/* to use module_pci_driver=
()
> macro which makes the code smaller and a bit simpler.
>=20
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-HDei6lBdvNSrXC/OZxEb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPiFz+AAoJECmIfjd9wqK0vZ4P/0X3tlh/tLfEnE2FsIXJVWfN
q1ydiQUoQ+QW8AZSDJIUx/3A8T3j8ANks9ZZVi6idcKHR6xvE3lGYTC+HyFZwx//
ztBRJqu3whnwUzIJIjWrzSGcZ/sRFgJtsWd+T5LuEgIkYUhW5DiSELTvie0HjnLq
7n/Femya0eiuYsqeoYnQq0tJMf5vrlgboOpFNaxydeNNw6MkJitHMt+KeDXLJQcb
bpMYHDVuYwxKGQ3sQkQcRRQxO/yIzEnTInUPjjFA2hKQHlRjkv+ywE8jOOEQh+jW
MyaqgdcbU0NE7E0pM9rA7/4+UXcfq4wPbToMjJID0/HGvQ37QXV7oNU2N1T4AK0w
6T222IMZXKKkJDYaCpr7LnJfhEFxMXs+24Rjsq0qa9gRDbsFUsTsKzuwu3NsI+vg
LxlV2Tt/bwZggeqPVmQJUFYuGZ1WAVpuyASxDhrk17v6ZjVQI0LRg73xtnehG/fq
WIkrXtzCuyhYofBOf9PcGZkmkDelLtwPVGAKuYLw5Yrvw8wH8ux/rbzn+ni3/C3K
jvC1fUcCLa+x2DEoUSeiWZ1wQHOoxIIGs+d2mipdwMptKE0sWkZUDoAZax/HqlZt
WfkXH0hUxNjMcu2emcZIKpo51SE3/NoNyPej1yplDV8EcMsxkaW85xK/jrY7feDB
Or1Fz7c3x3IK1WJDgJPp
=Djej
-----END PGP SIGNATURE-----

--=-HDei6lBdvNSrXC/OZxEb--
