Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A2GXH-0006u6-1V
	for <linux-mtd@lists.infradead.org>; Wed, 24 Sep 2003 21:46:55 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: linux-mtd@lists.infradead.org
Message-Id: <1064436337.1183.3856.camel@tubarao.lnxi.com>
Mime-Version: 1.0
Date: 24 Sep 2003 14:45:37 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-CFOWdYlful3AuSWRODAu"
Subject: cfi_util dependency
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-CFOWdYlful3AuSWRODAu
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

There is now an unnecessary cfi_util dependency.  It seems that
cfi_probe is needed to build cfi_util (CONFIG_MTD_CFI turns on both
cfi_probe and cfi_util).  This causes a problem for using
cfi_cmdset_0001, 0002 and 0020.  Any of the cfi_cmdset_* drivers can be
used without cfi_probe if the jedec_probe path is used.


It seems to me that cfi_util should be a unique config value
(CONFIG_MTD_CFI_UTIL) that is turned on when either CONFIG_MTD_CFI or
CONFIG_MTD_JEDECPROBE is enabled.

Another thing, cfi_read_pri() and cfi_fixup() need EXPORT_SYMBOL().

If someone wants to fix this, thanks; else I'll fix it soon enough.


--=20
Thayne Harbaugh
Linux Networx

--=-CFOWdYlful3AuSWRODAu
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA/cgJxfsBPTKE6HMkRAvu5AJ0YwOlcJK36rZw8aTUDBDazDYvvngCfTaa6
XCMZrkzsYXBKBw7wBi8Mc3A=
=5qXk
-----END PGP SIGNATURE-----

--=-CFOWdYlful3AuSWRODAu--
