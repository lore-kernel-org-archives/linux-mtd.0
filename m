Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TF1eg-00013e-Vc
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2012 11:44:23 +0000
Message-ID: <1348227856.1890.6.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] drivers/mtd/devices/m25p80.c: Fix whole device erase
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?C=E9dric?= Cano <ccano@interfaceconcept.com>
Date: Fri, 21 Sep 2012 14:44:16 +0300
In-Reply-To: <5044D88F.2060003@ic.fr>
References: <5044D88F.2060003@ic.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2aKYmNOhzYnSHh5AcIKA"
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


--=-2aKYmNOhzYnSHh5AcIKA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-03 at 18:19 +0200, C=C3=A9dric Cano wrote:
> From: C=C3=A9dric Cano <ccano@interfaceconcept.com>
>=20
> There are two ways to erase SPI Flash devices: sector per sector or the=
=20
> entire Flash (used when MTD partition is the whole Flash).
>=20
> When the whole Flash is erased, the SPI command is sent to the device=20
> and the erase function ends. Then, when another access (read, write or=
=20
> erase) is done, a  wait of busy is performed that fails because of Flash=
=20
> erase time (can be more than 30s in case of whole erase).
>=20
> This patch removes chip erase and use only sector per sector erase to=20
> erase the chip. When erase is performed, Flash accesses can be done.

Please, re-send the patch with a better commit message which not only
explains _what_ you do, but also _why_ you do this, which problem you
solve, and what is the impact of the patch.

--=20
Best Regards,
Artem Bityutskiy

--=-2aKYmNOhzYnSHh5AcIKA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXFMQAAoJECmIfjd9wqK0acoQAIU0l2dtOE6+tEbx4O+5gdVA
DMywIUzXwuCYqCxkl8HNyvD9Ep8Gw0IAUL+gNWWiZG8KsNONanFmhOsJ7sksSZRf
cCw4Mvaw+hYfT7KgbCH+QnNrXvQhZksZoIiQeUqDu7AjfxG954lAK+OjRV5gw+lq
mVECMpxO0x8Q/HkhhPM8LB0XaV8bBFTQgFY7WpjWJOwHhR83EqLp4CNPe4Sw4xqE
3XGU66OTvc41OHT6HwxBy5dzUFSxXitRSVECW/G217ABUgwARDMFIDRToYMRerDT
OdS9tDU9KmA3cxiXqkBVFlGNIwfEkJfRDj8mJfHA2W5g88lfXIOp2dhLhiLT9RvB
OdA0iZMsTXyZBpIlemFV4wurbvRWxtYCPIREhFN0Jz88T49C7X8XQDJ1LhMcLecI
tWFt9Ba1ISlvvTYUYCAtaTjYD0RgQbNGGF6owbdnOG32yeLU4bmf5fpyTBQ5AGwf
w2tkG1nImyPaeaUCw9aa/AAG6spv1xbKr6Z2odgAmR4F9syoHyeiNEPonrLp1O8Y
1CGfRYea+YUIRo7uzinHXWmgz2bb3xjreCvZTr7UETaPiD93Pv5SGxN7ESNA1eCZ
Ny+nIqHPiZATD0m2fll8wpCgN9n6q/x0hNhGuGnYlMM2lO5CFVyPR5H8YCHDfxXb
rT8kxoNn5S3Kx9WMeBz5
=TrQW
-----END PGP SIGNATURE-----

--=-2aKYmNOhzYnSHh5AcIKA--
