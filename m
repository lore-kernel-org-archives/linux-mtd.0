Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejUMm-0000LW-BD
 for linux-mtd@lists.infradead.org; Wed, 07 Feb 2018 18:22:46 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <mkl@pengutronix.de>) id 1ejUMY-0001ZB-Me
 for linux-mtd@lists.infradead.org; Wed, 07 Feb 2018 19:22:31 +0100
Received: from [IPv6:2001:470:7eea:1122:dc84:99c1:396c:9792] (unknown
 [IPv6:2001:470:7eea:1122:dc84:99c1:396c:9792])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (Client CN "mkl@blackshift.org",
 Issuer "StartCom Class 1 Client CA" (not verified))
 (Authenticated sender: mkl@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 790282D8BD1
 for <linux-mtd@lists.infradead.org>; Wed,  7 Feb 2018 18:22:26 +0000 (UTC)
Subject: Re: iotop like tool for mtd devices
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
References: <b299064c-29b2-b496-fa0a-3cccc796064e@pengutronix.de>
Message-ID: <82f112c2-e0a0-1256-766d-b879d933133c@pengutronix.de>
Date: Wed, 7 Feb 2018 19:21:43 +0100
MIME-Version: 1.0
In-Reply-To: <b299064c-29b2-b496-fa0a-3cccc796064e@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="95ZHv2LpT0tOwrS0jKr9dwKBqjmUyMoiP"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--95ZHv2LpT0tOwrS0jKr9dwKBqjmUyMoiP
Content-Type: multipart/mixed; boundary="436pMCS8AUxGFSasYHJJ8T7kWHwEuhCj5";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
Message-ID: <82f112c2-e0a0-1256-766d-b879d933133c@pengutronix.de>
Subject: Re: iotop like tool for mtd devices
References: <b299064c-29b2-b496-fa0a-3cccc796064e@pengutronix.de>
In-Reply-To: <b299064c-29b2-b496-fa0a-3cccc796064e@pengutronix.de>

--436pMCS8AUxGFSasYHJJ8T7kWHwEuhCj5
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 02/07/2018 02:40 PM, Marc Kleine-Budde wrote:
> as iotop doesn't work on (NAND) mtd devices, is there a tool, or an API=

> to query the number of read or written bytes per mtd?

For the record: switching on all the needed kernel config options as
stated in the iotop manpage helps a lot.

sorry for the noise,
Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--436pMCS8AUxGFSasYHJJ8T7kWHwEuhCj5--

--95ZHv2LpT0tOwrS0jKr9dwKBqjmUyMoiP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEENrCndlB/VnAEWuH5k9IU1zQoZfEFAlp7Q7cACgkQk9IU1zQo
ZfHcOQgAltkiHCmIU0KR174W8S2zAmdGsJvgOZWPI+rKW7ENZ3v5Z8dPJmLb2AWH
zpCs/Rv0jBShf/NjK9xIGtTxBD/dp5guCvb0c/XuwZhyhvMIeCB05H8nr/hIAjSW
tc1VGf0Fg+s5OGdsaXD8sBEGZVdX2fkDJNgUw746bFUqSHULeDlbSzIhAzvAht+I
lQYpDH/Lvpr82eBbuPq0Mr0OLJYz7leG/B5wGtY4/FduuEhNBvYFl4ZnchFKs3Tq
XL+WM4+OlXX/8gd1YR1OJUVsCyMKou7kBBUDY84f1KbrfkyYumh7FaY84/F281ie
wApoU0up0J4/vUdYVtuFlAcQVILypg==
=i+Ou
-----END PGP SIGNATURE-----

--95ZHv2LpT0tOwrS0jKr9dwKBqjmUyMoiP--
