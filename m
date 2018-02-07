Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejPyB-0008QF-Mv
 for linux-mtd@lists.infradead.org; Wed, 07 Feb 2018 13:41:05 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <mkl@pengutronix.de>) id 1ejPxw-0004hd-BU
 for linux-mtd@lists.infradead.org; Wed, 07 Feb 2018 14:40:48 +0100
Received: from [IPv6:2001:470:7eea:1122:dc84:99c1:396c:9792] (unknown
 [IPv6:2001:470:7eea:1122:dc84:99c1:396c:9792])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (Client CN "mkl@blackshift.org",
 Issuer "StartCom Class 1 Client CA" (not verified))
 (Authenticated sender: mkl@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 91EBE2D8964
 for <linux-mtd@lists.infradead.org>; Wed,  7 Feb 2018 13:40:47 +0000 (UTC)
To: linux-mtd@lists.infradead.org
From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: iotop like tool for mtd devices
Message-ID: <b299064c-29b2-b496-fa0a-3cccc796064e@pengutronix.de>
Date: Wed, 7 Feb 2018 14:40:09 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="7oxyZShMlImvYiDg7kY5Sy3E1GoDeHQBB"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7oxyZShMlImvYiDg7kY5Sy3E1GoDeHQBB
Content-Type: multipart/mixed; boundary="WSrjnqM17RDSmKSccTFYW0Wr3upJdrnNl";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
Message-ID: <b299064c-29b2-b496-fa0a-3cccc796064e@pengutronix.de>
Subject: iotop like tool for mtd devices

--WSrjnqM17RDSmKSccTFYW0Wr3upJdrnNl
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Hello,

as iotop doesn't work on (NAND) mtd devices, is there a tool, or an API
to query the number of read or written bytes per mtd?

regards,
Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--WSrjnqM17RDSmKSccTFYW0Wr3upJdrnNl--

--7oxyZShMlImvYiDg7kY5Sy3E1GoDeHQBB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEENrCndlB/VnAEWuH5k9IU1zQoZfEFAlp7AboACgkQk9IU1zQo
ZfHNgggAnpkQ8Y4CNvci4fXwvBiAyxQQz5Dv5iCHee+ybYfhzcqHvnXXkjoaUNDx
Fr68199sznN41REs3Q6GqHWk4uxmQlcTpEFpwEDaTQtAvDGfTl+SvR+pWT4GGhPa
JD0x7cUQ4h0QhCjXGTn1bOS5bOSVijRGzGPPlHfmqmCHTRTfgR0AHlruPxSmFdqq
MtFdcjsmsfNtd4ijJXByODG4XVe5WxKBc770DJDM39kAPVZq0JVIQBHcCY2DFnZZ
QrRKDFGzUjaQkwpQ6PWFYnTgxIRsRY9bEk2uroQyhrRB6xN/AMFFc0kYcMutTyQB
TPpgItOhvj2euDU+MU30njzNAc1kqw==
=lZG8
-----END PGP SIGNATURE-----

--7oxyZShMlImvYiDg7kY5Sy3E1GoDeHQBB--
