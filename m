Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4ur5-000077-Ae
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 14:27:23 +0000
Message-ID: <1345818733.2848.317.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V2 2/2] MTD: MIPS: lantiq: Add NAND support on Lantiq
 XWAY SoC.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
Date: Fri, 24 Aug 2012 17:32:13 +0300
In-Reply-To: <1345746512-22823-1-git-send-email-blogic@openwrt.org>
References: <1345746512-22823-1-git-send-email-blogic@openwrt.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-cJpTl0HYI/ISTiMshhf5"
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


--=-cJpTl0HYI/ISTiMshhf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-23 at 20:28 +0200, John Crispin wrote:
> The driver uses plat_nand. As the platform_device is loaded from DT, we n=
eed
> to lookup the node and attach our xway specific "struct platform_nand_dat=
a"
> to it.
>=20
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: linux-mtd@lists.infradead.org

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-cJpTl0HYI/ISTiMshhf5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN5BtAAoJECmIfjd9wqK0BEAP/iIc00lkYiL0hI+MAgqL+HJ/
gC4t6yvV/UzSLqFeX92mEsg0S5CXSjpN4amo+bsZGXDiuDZXFmzg+JQSF214P8ab
Hkt0AEavXtzCQSB+qv9J4jaXc4p3JALiwIUok8dAsvZR60PPNUTO1iq3BHk8yqNZ
Vx3nZV+ZR0ZJOycmSHgX+3ByDNiBDltRakFuQJHDpBjxhiv35hMiHiKrzn6AejjT
y3mDovcpNIYIQMG4aLC28WvrvOrELDEM4OPtF3MJYkeBgLzRHTOCewheOQgftYjN
lhpTKuA96W7A2whRLRwN9kx9uQUMAaJBVsF/Sbr6iDjwel0/BmKPeAZm/XO2GQYy
0zDJgAVvPPVuYCmlCvyu2iLALn9JjjFMjMW+HnIdDAWAfpX4+vUU7i8D7fNKTO0Y
AWcYcP2Ts/+B5xotFBpS4jAmJ/hkZedfZs4lEK3sh0pRSdNVWSRddJJO45/VBBfW
2OcK9FzlRXpdNp5uHASUodkMBrVc5TzTsKfa9ZdmadgkyeVkzEHFrIgaG8oJrUBB
D+WZSIiAbWTW10hssoYG/vF1WK+07MQzBFzmKVijnTPL7C23JOxwwK5rGbWVGqdO
17oDrGBrdKnY+vNW/b5rjGcZ9Vn1Xgfz1coqVdXh9mzlVvMHgcoIgMyFc2KzKWzT
bRIORpzpkipCwCJ04bvu
=qyuA
-----END PGP SIGNATURE-----

--=-cJpTl0HYI/ISTiMshhf5--
