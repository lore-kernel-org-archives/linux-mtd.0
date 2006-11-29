Received: from mail.gmx.net ([213.165.64.20])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GpRP8-0002Zy-Bg
	for linux-mtd@lists.infradead.org; Wed, 29 Nov 2006 10:31:26 -0500
From: Toralf =?utf-8?q?F=C3=B6rster?= <toralf.foerster@gmx.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-2.6.19-rc6-g1275361c build #142 failed
Date: Wed, 29 Nov 2006 16:31:17 +0100
References: <200611291547.21354.toralf.foerster@gmx.de>
	<1164812111.14595.71.camel@pmac.infradead.org>
In-Reply-To: <1164812111.14595.71.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1720546.Zhb7K5RPsp";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200611291631.20184.toralf.foerster@gmx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart1720546.Zhb7K5RPsp
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Mittwoch, 29. November 2006 15:55 schrieb David Woodhouse:
> On Wed, 2006-11-29 at 15:47 +0100, Toralf F=C3=B6rster wrote:
> > WARNING: "cfi_cmdset_0002" [drivers/mtd/chips/gen_probe.ko]
> > undefined!
>
> I don't understand -- isn't cfi_cmdset_0002 in your kernel and exported?
> It should be, if CONFIG_MTD_CFI_AMDSTD is set.

tfoerste@n22 ~/devel $ grep -i cfi results/config.rnd.142
CONFIG_MTD_CFI=3Dm
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_CFI_I1=3Dy
CONFIG_MTD_CFI_I2=3Dy
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=3Dy
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=3Dm

Hhm, might be a Kconfig depend/select problem ?
=2D-=20
MfG/Sincerely

Toralf F=C3=B6rster

--nextPart1720546.Zhb7K5RPsp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFbafIhyrlCH22naMRAgvlAKC9k44o+B0Nv0m955vlo/ND88hHKQCgvggI
zoHzksgmAlFtS9DS+ml8cqo=
=S98I
-----END PGP SIGNATURE-----

--nextPart1720546.Zhb7K5RPsp--
