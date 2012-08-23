Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4Tes-0007S5-PZ
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 09:25:00 +0000
Message-ID: <1345714184.2848.220.camel@sauron.fi.intel.com>
Subject: Re: [PATCH MTD-UTILS v2 3/4] ubiattach: introduce max_beb_per1024
 in UBI_IOCATT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 23 Aug 2012 12:29:44 +0300
In-Reply-To: <1345651477-5301-4-git-send-email-richard.genoud@gmail.com>
References: <1345651477-5301-1-git-send-email-richard.genoud@gmail.com>
 <1345651477-5301-4-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-JBJGYoK+GC3v40fI0Ts6"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-JBJGYoK+GC3v40fI0Ts6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 18:04 +0200, Richard Genoud wrote:
> The ioctl UBI_IOCATT has been extended with max_beb_per1024 parameter.
>=20
> This parameter is used for adjusting the "maximum expected number of
> bad blocks per 1024 blocks" for each mtd device.
> The number of physical erase blocks (PEB) that UBI will reserve for bad
> block handling is now:
> whole_flash_chipset__PEB_number * max_beb_per1024 / 1024

Pushed this one with some amendments.

--=20
Best Regards,
Artem Bityutskiy

--=-JBJGYoK+GC3v40fI0Ts6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNfgIAAoJECmIfjd9wqK0THQQAMYTeeQzO71b5McKKtdz71jL
bAUCMCAHt3VJ8Nh332zpydVlgyQ3iHpK4YT4VzRKko3eRVjVZBdLcR3j/aiWaPd2
98sun8pvxnKGw6e/zm67vOSjgn1XLs3Jz5vxUsnutga3Y70WoM7F5JIDbnYpMO7a
sKIptrp+aMDmNy3NnZu1pfAehPBr2lA6ZzOB1THsRiK3zi2+NtkCx4S99drG189T
X1Ymgj6MH+8kljrLudm518cdSjEy3jlvWHmqBDasCgzjsJHsa8xy/UeSR4gcatpS
EnWiamOsKG4LChNUXGt11ZHxbJOu8fzqZyLcgGpxLm6VhfdMpQBN7qBXEWphMYHs
LZmZBcChYOEyVBzp7zfvRDQFIY+2iieC5iGm22GBNVZs4XnOgHw9nVtWK9gzZawb
cQO0O4949144Oa2T/DP2QcPIzs4vQBCJK5uJcaRsw2c8vGezQkGreiGpBHYu9afH
VMk/wzdJCOhw6kUkRwKfyfZKozN3hYx58tfFqCPCcqH2iagm2+VzDw2BWppDV6SO
3g+FS7fdHylU2y9cWjCtP7o2DClgXJNIAyLWrch3llKljmqK3Tok6RbxMEFIcP1Q
5FQIn8LxkpJTol6xDplnQtr1M78vgsZs30jtA1QCMJ+XjviMqUkWkTAUl/aFpplg
yYfhlbfRAkDwTB4N4s2K
=G4hL
-----END PGP SIGNATURE-----

--=-JBJGYoK+GC3v40fI0Ts6--
