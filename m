Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6NKV-0001qp-JH
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2012 15:03:48 +0000
Message-ID: <1346166478.2848.411.camel@sauron.fi.intel.com>
Subject: Re: [RFC][PATCH] mtd: bcm47part driver for BCM47XX chipsets
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Tue, 28 Aug 2012 18:07:58 +0300
In-Reply-To: <1345847412-24509-1-git-send-email-zajec5@gmail.com>
References: <1345847412-24509-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+A/OPtaJzYH30OtAGc3V"
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


--=-+A/OPtaJzYH30OtAGc3V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-08-25 at 00:30 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> This driver provides parser detecting partitions on BCM47XX flash
> memories. It has many differences in comparision to older BCM63XX, like:
> 1) Different CFE with no more trivial MAGICs
> 2) More partitions types (board_data, ML, POT)
> 3) Supporting more than 1 flash on a device
> which resulted in decision of writing new parser.
>=20
> It uses generic mtd interface and was successfully tested with Netgear
> WNDR4500 router which has 2 flash memories: serial one and NAND one.

Would you please send a defconfig which I could use to compile-test
this?

--=20
Best Regards,
Artem Bityutskiy

--=-+A/OPtaJzYH30OtAGc3V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPN7PAAoJECmIfjd9wqK06wEP/iDCPXyb+Htob1rQX8f0qdPA
oVOVZ6K4qQQn2cX3eJYu9JMQddJ/YYRZ3Xg88B4ILp7/zSFLr7l3PO2gb1PxHJUw
1WvfnQzlNKZ1VJzBwOsMY2wf+OTX7DI/9wIZesWR5OEkO8i+KFRhK6jGolViIcHI
QsCXhagyS5K3FvUsyAQLosVGfRmPx94sXm+7b2wzuzyCnqClxur9zcNbMm/SaRot
1X1MZ6Cv5vxiy4Y36XAkLR9bMqPsQN5+nNhAp4z0B3NOV5iZWT74w0AQ3lQHq+yQ
stjfBezN69ow26q41rlfw5dpICuojxFPivqY1HjxjK2jIY3zlNzp7DByzBWAGnlS
xxwUyP0oQY2ddJD0Z09/SaHJ+d0sSqj9kJwE+J4Kw9PAJehrzddBrYAwHuQvOndo
y3qLwnIXyVe/lX85Rs8bFm01X0TF3qNPiUo16RKMC3RqsMpiHKO0E1N7NGdjGODs
rXRnXTi3SFoH5SS3pBavWxVWBgCsEuZZDbtgEearqunjsGE20TR2gC0MsBpza0zi
fGKQ4CcFI2IwSWP3DCTm6OlFQgJAyLgXIeLSeywsqGOB//sbmCZC5jIfynEyNMYy
VRHohy9kLQ/awB/N3BhafWcThAhisbMq9ExVLlVSESoFnB7QckBc+WnhCGhAotSI
4w6gdQc99q6SYQei6u1t
=4pxX
-----END PGP SIGNATURE-----

--=-+A/OPtaJzYH30OtAGc3V--
