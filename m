Received: from metis.ext.pengutronix.de ([92.198.50.35])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O1U08-00010f-L6
	for linux-mtd@lists.infradead.org; Tue, 13 Apr 2010 00:29:13 +0000
Date: Tue, 13 Apr 2010 02:27:06 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
Subject: Re: [PATCH v2 6/7] mtd: cfi_cmdset_0002: add CFI detection for SST
	39VF{16, 32}xx chips
Message-ID: <20100413002706.GA8978@pengutronix.de>
References: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
	<20100408091215.GD21805@pengutronix.de>
	<20100412022458.GB3274@pengutronix.de>
	<201004121828.38560.fabio.giovagnini@aurion-tech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <201004121828.38560.fabio.giovagnini@aurion-tech.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Guillaume LECERF <glecerf@gmail.com>,
	linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2010 at 06:28:38PM +0200, Fabio Giovagnini wrote:

> I'm very interested to use such a patch; which kernel version Do I need t=
o use=20
> for appling it successfully?

I tried the mtd-master-tree and 2.6.33.2 with commit
f3e69c6584be2db1ccd5292d6a1d7c566d265701. Worked with both.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkvDuloACgkQD27XaX1/VRuQVQCgrqF+A5Vs/BNGmfrGuVD8KVFu
Eq0An1LIVnt6OzsUDbEHXYtmfUrZaUlT
=NuiJ
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
