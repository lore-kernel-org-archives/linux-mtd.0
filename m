Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv8kM-0008GL-Qd
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 15:48:19 +0000
Message-ID: <50F57A30.10109@pengutronix.de>
Date: Tue, 15 Jan 2013 16:48:00 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: Subodh Nijsure <snijsure@grid-net.com>
Subject: Re: [v4] Add security.* XATTR support for the UBIFS
References: <1336915488-23943-1-git-send-email-snijsure@grid-net.com>
In-Reply-To: <1336915488-23943-1-git-send-email-snijsure@grid-net.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2UATRGLPVLEEOHEUWPSIP"
Cc: Artem Bityutskiy <dedekind1@gmail.com>, penguin-kernel@I-love.SAKURA.ne.jp,
 linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-security-module@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2UATRGLPVLEEOHEUWPSIP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/13/2012 05:24 AM, Subodh Nijsure wrote:
> From: Subodh Nijsure <snijsure@grid-net.com>
>=20
> Also fix couple of bugs in UBIFS extended attribute length calculation.=

>=20
> Changes in v4:
>         Fix lock issues introduced in v3.
>         Tested with CONFIG_SECURITY enabled & disabled.
>=20
> Changes in v3:
> 	 Remove #ifdef CONFIG_UBIFS_FS_XATTR
>=20
> Changes in v2:
>          Instead of just handling security.selinux extended attribute h=
andle
>          all security.* attributes.
>=20
> TESTING: Tested on  MX28 based platforms using Micron MT29F2G08ABAEAH4 =
NAND
>          With these change we are able to label UBIFS filesystem with
>          security.selinux and run system with selinux enabled.
>          This change also allows one to set other security.* extended
>          attributes, such as security.smack security.evm, security.ima
>          Ran integck test on UBI filesystem.
>          This patch set has been tested with CONFIG_LOCKDEP=3Dy and oth=
er options
>          suggested in Submitchecklist
>=20
> Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>

What's the status of this patch? Was there a v5?

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


------enig2UATRGLPVLEEOHEUWPSIP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlD1ejQACgkQjTAFq1RaXHPlOwCgj2oFC4JYU3BoYfv0rPj+AcLP
nZMAn0VrMMC7sVTzcdMpHYjnovv2pJRb
=3CxT
-----END PGP SIGNATURE-----

------enig2UATRGLPVLEEOHEUWPSIP--
