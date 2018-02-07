Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejVRl-00038q-QL
 for linux-mtd@lists.infradead.org; Wed, 07 Feb 2018 19:31:59 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <mkl@pengutronix.de>) id 1ejVRY-0001lB-SM
 for linux-mtd@lists.infradead.org; Wed, 07 Feb 2018 20:31:44 +0100
Received: from [IPv6:2001:470:7eea:1122:dc84:99c1:396c:9792] (unknown
 [IPv6:2001:470:7eea:1122:dc84:99c1:396c:9792])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (Client CN "mkl@blackshift.org",
 Issuer "StartCom Class 1 Client CA" (not verified))
 (Authenticated sender: mkl@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 2541C2D8C1E
 for <linux-mtd@lists.infradead.org>; Wed,  7 Feb 2018 19:31:44 +0000 (UTC)
Subject: Re: iotop like tool for mtd devices
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
References: <b299064c-29b2-b496-fa0a-3cccc796064e@pengutronix.de>
 <82f112c2-e0a0-1256-766d-b879d933133c@pengutronix.de>
Message-ID: <90ae15e2-3d17-54ba-da6e-2891de35bd3e@pengutronix.de>
Date: Wed, 7 Feb 2018 20:31:07 +0100
MIME-Version: 1.0
In-Reply-To: <82f112c2-e0a0-1256-766d-b879d933133c@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="oVkqT2eHZ41dEnoChRtfyMdsM55X6iX17"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oVkqT2eHZ41dEnoChRtfyMdsM55X6iX17
Content-Type: multipart/mixed; boundary="kjfvXVaYZsRhD62weaPS1YlonPf0ag3Nd";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
Message-ID: <90ae15e2-3d17-54ba-da6e-2891de35bd3e@pengutronix.de>
Subject: Re: iotop like tool for mtd devices
References: <b299064c-29b2-b496-fa0a-3cccc796064e@pengutronix.de>
 <82f112c2-e0a0-1256-766d-b879d933133c@pengutronix.de>
In-Reply-To: <82f112c2-e0a0-1256-766d-b879d933133c@pengutronix.de>

--kjfvXVaYZsRhD62weaPS1YlonPf0ag3Nd
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 02/07/2018 07:21 PM, Marc Kleine-Budde wrote:
> On 02/07/2018 02:40 PM, Marc Kleine-Budde wrote:
>> as iotop doesn't work on (NAND) mtd devices, is there a tool, or an AP=
I
>> to query the number of read or written bytes per mtd?
>=20
> For the record: switching on all the needed kernel config options as
> stated in the iotop manpage helps a lot.

Update:

The kernel makes the information available at /proc/$$/io. However
"read_bytes" and "write_bytes" seems not to be accurate for mtd devices.

Poking around a bit in the kernel code makes me wonder if some
task_io_account_read(), task_io_account_write() at the right places
would make the accounting better?

Marc

http://lxr.bootlin.com/linux/latest/ident/task_io_account_read
http://lxr.bootlin.com/linux/latest/ident/task_io_account_write

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--kjfvXVaYZsRhD62weaPS1YlonPf0ag3Nd--

--oVkqT2eHZ41dEnoChRtfyMdsM55X6iX17
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEENrCndlB/VnAEWuH5k9IU1zQoZfEFAlp7U/sACgkQk9IU1zQo
ZfHqLgf+ND+5A4No6WhF1TyJWvhkMiarut52kCVOh/Wx6cmFRE3Jwsr98l/Fr1dn
jpdqcOsQaHUktwyxgUNAy8r5Jmgjmr+OG7F6VOkEgM3hgwv7IRhnpxZtLSQ1p524
mO6jShtaLbtPHLDU1+JY8T1IFsZ0Sb15FwYTbAPWY8BQ+ntGC/jeQ6gWNCiKijMH
fAucxNsHYunfVcCa4Db/nL8TadPM12cFrSxvSUITA6HirWLRUzbCRyWIqqGuV/12
WyEYVCaoJZJM9PzrdTONKsSh9mf9Hu0i5oBYDq/hC6h1OB4bkKIJ5dmlD5ANLR/V
AhlfybxQMs4KI5zCVU/Kz+ONXZx2Uw==
=m9Ft
-----END PGP SIGNATURE-----

--oVkqT2eHZ41dEnoChRtfyMdsM55X6iX17--
