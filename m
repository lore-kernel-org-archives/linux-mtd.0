Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPWGZ-00063W-IB
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 09:54:36 +0000
Message-ID: <1335952662.10293.37.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] mtd: nandsim: remove autoincrement code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 02 May 2012 12:57:42 +0300
In-Reply-To: <1335917575-14953-1-git-send-email-computersforpeace@gmail.com>
References: <1335917575-14953-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-G3flSPjjP8gCt0G6iSgw"
Mime-Version: 1.0
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-G3flSPjjP8gCt0G6iSgw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-01 at 17:12 -0700, Brian Norris wrote:
> The NAND layer always has NAND_NO_AUTOINCR set, so we will never utilize =
the
> AUTOINCR code in nandsim. We will be removing the NAND_NO_AUTOINCR option=
 soon,
> and so kill this code as well.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to l2-mtd.git, thanks.

P.S. Jumped at your patches to unblock you.

--=20
Best Regards,
Artem Bityutskiy

--=-G3flSPjjP8gCt0G6iSgw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPoQUWAAoJECmIfjd9wqK0oq0QAL6X/bx5vm2fKyIKczPi32FM
fmKfSWrcjPS9zyyjxlI011tj+RSwAabXhpjx1fbrcREpx5LDI8eBjxvNj6EGYng+
pf6z2lETQz0M65KllDuFACYJnKEQUMyRVqnq77S7tNK3jnflQEtPYBuTsZ5ddDf9
lOMQC8GO1e/5MxDk3NeDl3YoQbIgeJ5XR8wSG6vShDCW+OBigoPMoWZdXsLoWIbF
BtBFpf9yO2ps+YoViuxrDrb5GRnVWSXpYqFM3P6286iyc7ZzV985PGqxNd5KYC4H
dB9nqcQMZKcC78mI6AinqMSCmaIDHupSOtEpzYxQBjRbjjzFuRK1pW3+1gcRWAl+
H1Yww/sJ4X3GlP84kjPGTIePpWJH1CtfhGaoW8SFzRQUa7ctqG+VXLvERtQ33WgI
soeUuLtvTEMIoEIZlxbGKSgl2vaLDdkpcLEZV7TDVENPGXNKtkllBQZy6ZTxEZ+h
EXoLSdkPuBmgZvTB9jytEjf/mQCRgvnXX+Y7WZRF0282yZq0Wmt5tKsnvWeznzyc
ez3o3hTEfemMcup61FdKZKDJGP24M7vt22/0WbIhg6w9AXQRfAJTwcJyd8dEi2EK
UFYF3blFMjWid7BpIffYFkMAAmoczYhagEiV6jJA2yobmy0YhcLbLnTH6rrz8Krx
RqyNfEOB39YOCPvMStjY
=gXMc
-----END PGP SIGNATURE-----

--=-G3flSPjjP8gCt0G6iSgw--
