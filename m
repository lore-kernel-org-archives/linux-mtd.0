Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1btF-0006i1-Vg
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 11:35:58 +0000
Message-ID: <1345030833.3393.129.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/8] mtd: nand: remove unused 'int' return codes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 15 Aug 2012 14:40:33 +0300
In-Reply-To: <1340408145-24531-5-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-5-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-yWb89Gb6DJUYiPLy0KPW"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-yWb89Gb6DJUYiPLy0KPW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-22 at 16:35 -0700, Brian Norris wrote:
> The return codes for read_abs_bbts() and search_read_bbts() are always
> non-zero, and so don't have much meaning. Just remove them.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-yWb89Gb6DJUYiPLy0KPW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQK4qxAAoJECmIfjd9wqK0WfsP/3nnd9WMFc3bTc+6SqHeETP3
upzZy39/L0llZ20GHfgOTUS3HiWSGXFeL+sXQ2ZMlNakaTASfLjvfGs125gwvc4o
omgXMOEtbM6jmbcESWY9tMEZYtThIODnJEYkGwPdNCRs4iWayL9WjYx8e7LcNF/Z
vb005P3nEaM8psIL0Dn4//ZNzlE1v8rhOG98neKJ4PiTI1y/0pek4TqmBixuiUhR
+kP2pI6ahNyo/X0zR4vBq8nkZepFKwsHkHxuOBHLaEa1c54HcxPEgZAt65PgCJQw
BbvFe1/snm5bK6UdjQJ7T/aiEHZuC7ELdAJ1FWpfK4CaP0gyWbh4MD44ITUjHi/G
z8Irhd3EPy+Jdafu/xLlYhKyyqUAgAt7axYJxWHmESQ8Kar9MkDkcP+GBWyYsYzH
Pq4vGjHs/dZ9Mk0+oZwI/GFwzXkmkMilNzpqdaftPKkkZDGimRiSyXil8cFVTZAX
Y4v4mJ5PgYA/qcxxOzZdyINZiMgZeeUZBcuQdAe6BXeMWswCva4xzWi36jnhCvyn
HUJTnH0QIt3MSMyv9VaX+WBkyqBhNUk/xYPn3iRZqqTXU/jSPr0Jn/3zhxW5LCye
YrD3Ks9rUWXHGTzFVuAqaS03v6M/OlapyIIoLaleBDuPHHDGl+lszGYp08PfTkqn
GMTKDjg+fdP0N2HY/cSX
=yJYq
-----END PGP SIGNATURE-----

--=-yWb89Gb6DJUYiPLy0KPW--
