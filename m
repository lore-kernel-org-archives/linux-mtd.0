Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ObKUN-0005qA-V7
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2010 21:36:37 +0000
Message-ID: <4C4616D6.1050803@pengutronix.de>
Date: Tue, 20 Jul 2010 23:36:22 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] mxc_nand: fix Unbalanced enable for IRQ
References: <1276178584-10074-1-git-send-email-eric@eukrea.com>	<1279345824.3212.24.camel@localhost.localdomain>	<4C457885.9000404@pengutronix.de>
	<1279621337.16462.100.camel@localhost>
In-Reply-To: <1279621337.16462.100.camel@localhost>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigC46A7811473E1C6891931266"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigC46A7811473E1C6891931266
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey David,

Artem Bityutskiy wrote:
> On Tue, 2010-07-20 at 12:20 +0200, Marc Kleine-Budde wrote:
>> Current mainline has (still) this problem, too. Is there any change to=

>> get this patch into 2.6.35 before the release?
>=20
> You should bug David Woodhouse about this.

The imx NAND driver does throw this unbalanced IRQ warning in the
current 2.6.35-rcX mainline tree. David can you try to get this into
mainline before the release?

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enigC46A7811473E1C6891931266
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkxGFtsACgkQjTAFq1RaXHMihQCgi+4yeo1vrMDL5is5OquOyWXs
RzwAnRd2Lxfr6hiWRsQXuEEGdx1hgCp1
=KDEe
-----END PGP SIGNATURE-----

--------------enigC46A7811473E1C6891931266--
