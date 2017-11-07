Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eC9MP-0006wC-9H
 for linux-mtd@lists.infradead.org; Tue, 07 Nov 2017 19:16:35 +0000
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: quota support
Cc: dongsheng.yang@easystack.cn, Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Message-ID: <697aaad0-f27a-db45-08d0-e23f6bec7873@pengutronix.de>
Date: Tue, 7 Nov 2017 20:16:00 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="lWu56uFP2F6uvefak3Dfg5U6XcwldukDf"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lWu56uFP2F6uvefak3Dfg5U6XcwldukDf
Content-Type: multipart/mixed; boundary="hK66FGorEPhCTiML0XLhlaMn0polfW1AJ";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: dongsheng.yang@easystack.cn, Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Message-ID: <697aaad0-f27a-db45-08d0-e23f6bec7873@pengutronix.de>
Subject: quota support

--hK66FGorEPhCTiML0XLhlaMn0polfW1AJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hello,

as fas as I can see UBIFS doesn't support quota yet, is anyone working
on UBIFS quota support?

Dongsheng Yang posted a quota patch series some time ago, is this the
newest series https://github.com/yangdongsheng/linux/tree/ubifs_quota_v3 =
?

regards,
Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--hK66FGorEPhCTiML0XLhlaMn0polfW1AJ--

--lWu56uFP2F6uvefak3Dfg5U6XcwldukDf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE4bay/IylYqM/npjQHv7KIOw4HPYFAloCBnAACgkQHv7KIOw4
HPYW/Af/XgV1fvxAQlpUmzOU/No2EaaAtex5B3LFsWBVMkdBqObdC4sfwUr6aCpJ
lk8uI2rGZc2zGjQ+gMEH+aZFCr0FBEjJl9tU6L8ZePNon23ts9nXTl3/aFCmZ65M
vORD1jWAci5FNa7QoMoYnqbGAy8j1QT1i4gtTdBZHCYM7NUb6MQYqO3sbGFbcdZv
EQ7Y2R1UiemqI4963rFwI+Lgkwgf3K4oZYPVnZ4wulVNWPyJX7hC5/p4Ah2xy0FP
7iWFmstIICXRadz0hNMx7aZuFGgzGX8Gx2u1Xk8IjBi53bgb7bdXQCO0p+e+kzh1
TKTZXGgBF+OEjDaosoBgsyAOEf+xAQ==
=WzHi
-----END PGP SIGNATURE-----

--lWu56uFP2F6uvefak3Dfg5U6XcwldukDf--
