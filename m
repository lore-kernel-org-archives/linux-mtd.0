Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SXTDR-0000da-2E
 for linux-mtd@lists.infradead.org; Thu, 24 May 2012 08:16:13 +0000
Message-ID: <1337847592.15137.83.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] [RFC] UBI: Implement Fastmap support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 24 May 2012 11:19:52 +0300
In-Reply-To: <b3d5919d0b35bb559b7dc115bc9e2720@radon2.swed.at>
References: <1337608916-49771-1-git-send-email-richard@nod.at>
 <1337608916-49771-2-git-send-email-richard@nod.at>
 <20120522180119.2c2a10a8@pixies.home.jungo.com> <4FBBC4EE.4040802@nod.at>
 <20120522211809.53bd6444@halley>
 <b3d5919d0b35bb559b7dc115bc9e2720@radon2.swed.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-MWoDxlRRf4SqJzS9FfPo"
Mime-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Heinz.Egger@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com, tglx@linutronix.de,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MWoDxlRRf4SqJzS9FfPo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-22 at 22:11 +0200, Richard Weinberger wrote:
> >> > In the error case, what are the consequences leaving the older
> on-flash
> >> > fastmap? Shouldn't it be invalidated?
> >>
>=20
> After thinking a bit more about this case I think the best we can to
> is
> switching to read-only mode if ubi_update_fastmap()
> fails.
>=20
Unless it fails because of -EIO, which means the PEB may become bad and
you need to pick a different one and schedule the faulty one for
torturing and marking as bad.

--=20
Best Regards,
Artem Bityutskiy

--=-MWoDxlRRf4SqJzS9FfPo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPve8oAAoJECmIfjd9wqK0RPgP/0zIGRvE1XcP4QuE9+RRNbxd
zXoKDZJ6YRT2UZFHg8cHE+YRm+8Kw615QYgfoRRLk6E5Jjt15ON5GEoQ5lyQJYzF
FW7xaUdwwUKcw4dFnba5VcassTsHLuUwR2IMp/7c6hha7WWVkmv01orN3gktQTrd
JJGIhORu1twxnClzh3bsq+VSwmdMSQJ/wgLO1Q1edSZnG+2P9x1Uv61PoXSFNhSR
jVYCw2H1nvjedrX2Hcy+zDG3v26xI8aD7bfvy7WVUzu6DXEkXSovo3RPDHqxwdjG
stiT2EKn90/mAqwbefQTtHL0NsFimXglkyQxoeK0use1Rd/0YL5Ijc6LMOxfCZ6p
OY/Rwojuq0prGN62dRgwq8scAlungddQQ8u5LS8XAoBAIi/E7CQ1Qh0CO5+23119
sRdtbZYq/E/QqhXSiXd1vc44dHZhwm6LBwqpOdLGFuVo8lPGrMmBYIEMw5wxc9yf
nTqzA5K5LIEShBStzpTOcaaXpVTDWuvWStpgzIxJOhzpZBr05eVKcYGOn+flbvwT
0AL4zxAVcMtitI9FmcCXCjM6aoiwSbDIyLgrZCr/8Ca4pmBGnaLDRCRy367e9Sxg
0gUWhxIM7kf6JpUq1rsSg0CWE80hmo8l0hSt4VgWISjdY3/QipvMtSYahRx1gUZb
+TJGXvI/zyFCD9d3uIMY
=rc1+
-----END PGP SIGNATURE-----

--=-MWoDxlRRf4SqJzS9FfPo--
