Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4uqg-000053-39
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 14:26:58 +0000
Message-ID: <1345818706.2848.316.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] MTD: check for valid pdata inside plat_nand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
Date: Fri, 24 Aug 2012 17:31:46 +0300
In-Reply-To: <1342940398-2162-1-git-send-email-blogic@openwrt.org>
References: <1342940398-2162-1-git-send-email-blogic@openwrt.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Oj5x8aNLBFmcZc+SufyS"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Oj5x8aNLBFmcZc+SufyS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-07-22 at 08:59 +0200, John Crispin wrote:
> If plat_nand loads and the platform_data is not properly set it will segf=
ault.
>=20
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: linux-mtd@lists.infradead.org
> ---

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Oj5x8aNLBFmcZc+SufyS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN5BSAAoJECmIfjd9wqK0locP/1fNg7qAcyhe5vBvCmSNq0Y4
v/bqV64U9jw6sk0x23J1tKgT1+jijrV+iMO1oX2OKfT/VM7+2I/pMoTryCQm6s9I
JRNfvVHIaSVeaTmNk2N9/gpZmOPT7uJs/jp8BPWLjHUKujoX6bAYucvpHyUbmviE
1wT92PJnt/TPK8rExRzVgnz0Gtu6L1S9ytS3XSqsMJY1dSWp6Qmn4hzzApIp86mt
KgJLJfGWdP/3eknlg0biGxasgZiz2KQXKeW6NpjCcCiih8hWx6pV5jT4F/YUFO7i
9sptc5tvsHCt1baVdQo8GA3Rp+UTUpz8CuesnmMCAQAmqia/6EpFaHgbduYoIJjV
QxP2N9M0sWkACFxEk+SRGxbqKIbgYaUZIGbfCCVCYvNsuOBrFvYMsYPJvpAzeaE/
81BpnfId8jC0C83Rz6kTqwmcyL3MTMQKsIwSaHBX/SeKwp8h30XJEPFYO7gkK4b1
joG1Pd+qmj5TYv2yWyC/EA3V5e6A5+OxEDLC47/ziM4GzvUEUBtWsBzbRe8BS2iJ
utwbLC5yJ7lZ7Yf7O15ewz6j01ZX2Ugv+vM9+ZkJjdWdDru0Bzx0j5bbsVE4EmFZ
NOtCOEB/E0U9lgfF7SkH8Pc3UwY/rVeMxUCtJ2TW+85LdzJtMULRhP4KVGB1C6LK
h1LKoSJX5WIiAyzpPWVD
=RzJD
-----END PGP SIGNATURE-----

--=-Oj5x8aNLBFmcZc+SufyS--
