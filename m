Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A2GkA-0006vT-QY
	for <linux-mtd@lists.infradead.org>; Wed, 24 Sep 2003 22:00:14 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1064436337.1183.3856.camel@tubarao.lnxi.com>
References: <1064436337.1183.3856.camel@tubarao.lnxi.com>
Message-Id: <1064437137.1183.3861.camel@tubarao.lnxi.com>
Mime-Version: 1.0
Date: 24 Sep 2003 14:58:58 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-nzO4SbH4a6YiIOfM3iZe"
Subject: Re: cfi_util dependency
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-nzO4SbH4a6YiIOfM3iZe
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-09-24 at 14:45, Thayne Harbaugh wrote:

> It seems to me that cfi_util should be a unique config value
> (CONFIG_MTD_CFI_UTIL) that is turned on when either CONFIG_MTD_CFI or
> CONFIG_MTD_JEDECPROBE is enabled.

Errr - that should be that CONFIG_MTD_CFI_UTIL should be turned on when
any of CONFIG_MTD_CFI_INTELEXT, CONFIG_MTD_CFI_AMDSTD or
CONFIG_MTD_CFI_STAA are turned on.

--=20
Thayne Harbaugh
Linux Networx

--=-nzO4SbH4a6YiIOfM3iZe
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA/cgWRfsBPTKE6HMkRAlDeAJ9QmDB7HjtlBQIUuD+SJvXHMZh8QQCfVN5A
vy9+VHPqX0a/sUPqPuYozWI=
=NPNX
-----END PGP SIGNATURE-----

--=-nzO4SbH4a6YiIOfM3iZe--
