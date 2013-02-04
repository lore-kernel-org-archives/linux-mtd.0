Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U2HYx-00014P-VY
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 08:38:04 +0000
Message-ID: <1359967187.13791.21.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: onfi don't WARN if we are in 16 bits mode (fwd)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paul Walmsley <paul@pwsan.com>
Date: Mon, 04 Feb 2013 10:39:47 +0200
In-Reply-To: <alpine.DEB.2.00.1301260754500.19277@utopia.booyaka.com>
References: <alpine.DEB.2.00.1301260754500.19277@utopia.booyaka.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+T7vhqgGbuLwfEJLW7QX"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-+T7vhqgGbuLwfEJLW7QX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2013-01-26 at 07:56 +0000, Paul Walmsley wrote:
> Hi Artem, David,
>=20
> if possible, it would be good to get this one into v3.8-rc, due to the=
=20
> large OMAP boot-time warning mentioned at:
>=20
> http://article.gmane.org/gmane.linux.ports.arm.omap/91317

It is in David's tree, he merges things upstream, I do not know about
his plans WRT this patch, unfortunately.

--=20
Best Regards,
Artem Bityutskiy

--=-+T7vhqgGbuLwfEJLW7QX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRD3PTAAoJECmIfjd9wqK0bg8QAMgIBIkhzNTx/KjKTfZPugM3
+GasRz/Iz4CiI0OAraet3pfTBhfRXe8pNw+Tgfy7hRAQ0m2zefh+3kehfbWtN5qS
aDk0OXB0hJ6DQMXPygEDy7dQvUZ46jsQ9dXuupuDP2p+FFGCw3meQaM3yvp7TajJ
xI5zVm3iCNDKLj+6RrOdp82oyvaqZOnjHfwPRBHs/2jdeeRDd2JarIVZjCjMjzoo
l8vT+zWBYsVueWcUA3CIKdzw1dE74r+ydrkJ6o8EUI4swnzcl2MRoAITdXDHqUg4
uCRSb9Mo1Rjp55cRZA9rzUFNYYBQ3v3XIqGzXK3u4jiVWQ/Dd//usUj0B8fNA8KU
1+SAHyjeZgXje57zv1p/k4YbC1xMPn/Qt3MksizfcR1akY7q+5+6/HnGrWVvsji1
Z8enBsToyWJuGUJBH5fhfAOm5jDfe5ZeOTwM01nV9fOYGmKidaJppHCC9ZTq1BXQ
kmCo4p/1hcjM/uBbPec+JHh3hn8r0sjoKtM8Q6T1qAiRUT1DHcR7bhFPQMJdIV+j
p/h2pep/nkmaz3ZSssgFM2VTXF5yRIvqVhi6LdUwuzLmu8va1b5+EcFjt0/WfP0U
e1qpB/fRG+8WbE0rEYb4W9XsTQR7nXDE0IOiYmMZgmh1m8kcqqjyPPKq+74Xwv4m
giUIDdQdjhbC420WwFP+
=q6K5
-----END PGP SIGNATURE-----

--=-+T7vhqgGbuLwfEJLW7QX--
