Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TzrIe-0000Uq-AH
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2013 16:11:12 +0000
Message-ID: <1359389561.7570.18.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: physmap_of: fix cmdline partition method w/o
 linux,mtd-name
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Jan 2013 18:12:41 +0200
In-Reply-To: <20130124090547.GB7697@sapphire.tkos.co.il>
References: <df9da712b775781366ae23aac28ed20849b4e4d3.1356260943.git.baruch@tkos.co.il>
 <20130124090547.GB7697@sapphire.tkos.co.il>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-IlvbmqD85IcuV6+DH3Fk"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, devicetree-discuss@lists.ozlabs.org,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-IlvbmqD85IcuV6+DH3Fk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-01-24 at 11:05 +0200, Baruch Siach wrote:
> Hi linux-mtd, Artem, David,
>=20
> Ping?
>=20
> It's been a month, and this is a simple uninitialized pointer dereference=
 bug=20
> fix.

It is in linux-mtd now.

--=20
Best Regards,
Artem Bityutskiy

--=-IlvbmqD85IcuV6+DH3Fk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRBqN5AAoJECmIfjd9wqK0oM0P/irHLG9gziQXzDhilDIpCdYg
cPPSOvcC2WBtiXTlXSiKfdUvSPYoU76LzWdv4ygdBPHuKs5M7FYZ3PaQOYUaJu89
7CNKEqTFJxxQLZn/lcaqEkSFWuA1zSKt+hRIt4FoiQy0TqJNbJvzWPUKUstd+geH
/wWAs84KKqRBHbYRc5kfZ9XSlho6PpPEuxjR/cuz/RWASkJ6zVyJC1SfHuLpGPM4
aOafss3nEx1oPUS6anXInixsWInKxGnsI+GsRxGXYMsuGzZxiK/W3WFB0qxYlEhU
16/uQDjb8YuqqV4x8Y6e780L+6BeTbiVJvQKbSHN7FiXZYmfVYSFATrAmWsvhru3
pOqJ+nG4zyYfjDjcprjPShPxIekuk94G1bl2LOWxlIbQQ6I+b+6RAJAcHyHZ6mqh
siiUw/zCJX8Bsr773/Q5omZy4PiGFJWzDwgyAPFeCYOy73Y8VowZMYaPAzr0Ojvs
YLXKW3oDl6Su5uDU8NJab3q/iw0/W533NGspc8MlATS0Z0plvR5g5o9uLTIMT9mO
Km88ZRds3pS63QtEWTE/O347TIrpPJDjPbd2d9H7wXk6LfN+R6iAXRGSnXlTFdnE
g392zt+IgeAn8KAHwC5zP3s9HjGOVeZeWBiNwM1XREQH+7kRZlea+eycFDrjUh+T
kp7BT4/JEtrKmELmodFL
=Ksn+
-----END PGP SIGNATURE-----

--=-IlvbmqD85IcuV6+DH3Fk--
