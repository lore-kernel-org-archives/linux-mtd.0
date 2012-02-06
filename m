Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RuKWL-00009o-RU
 for linux-mtd@lists.infradead.org; Mon, 06 Feb 2012 09:05:58 +0000
Received: by iafj26 with SMTP id j26so9769068iaf.36
 for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2012 01:05:54 -0800 (PST)
Message-ID: <1328519276.22240.27.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/8] mtd: block2mtd: initialize writebufsize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Date: Mon, 06 Feb 2012 11:07:56 +0200
In-Reply-To: <20120204180035.GB28736@logfs.org>
References: <4fe90e9a0ba750bbdb34d04ca3437b493a19277f.1328257053.git.artem.bityutskiy@linux.intel.com>
 <20120204180035.GB28736@logfs.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-tXMyU/xWhOJAxTXBBP1B"
Mime-Version: 1.0
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-tXMyU/xWhOJAxTXBBP1B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-02-04 at 13:00 -0500, J=C3=B6rn Engel wrote:
> > Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> > Cc: stable@kernel.org [2.6.38+]
> > Cc: Joern Engel <joern@lazybastard.org>
>=20
> Acked-by: Joern Engel <joern@lazybastard.org>

Added, thanks!

> From the description of 0e4ca7e it appears as if using a minimum of
> say 8 for ubifs recovery would have done the trick as well.  Oh well!

It actually need to know the maximum size of the corrupted area. In case
of block2mtd in theory, the whole 512 bytes may be corrupted, even
though I update 1 byte. For real CFI NORs - it is 16 bytes AFAIR.

--=20
Best Regards,
Artem Bityutskiy

--=-tXMyU/xWhOJAxTXBBP1B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPL5hsAAoJECmIfjd9wqK0ZWMP/2kTUzskUdZ22khh/WOeh5Mm
LFgaDKkvyJEcWNi2eKJ/7jvhHdJwlRG1ost/61XCk1v7aQBNmXGrBG9e8b/ApSmy
Gyo63NOYneL54YwVt2/ntJzxaWn1W87xL9leQRW/TsktYfc6F8Fol5ttTNyDEu65
+2gXNM3hDk1+7WOs+Xks9yeuYMpq9QNv8JHdLvx8GtvlhHK8yLnmDEPtKQ1hrGN+
7t790v5GB8QVapda8WmqFtf872RIKqM+HZH/zmMXOiwjRwAs7VJLvoHsvAe5YIXT
KEiwyDzjpqUgbw+X4Geu8DFokF5ddLUsDBoY3s5QIsNqjDp7qav3C1FCxEqtrn+m
+E9Pwc5ZYEDOM3n3hO6XLHdDAEPRj5vDJZHBQt+eSh5tXp3svpkWDGDFd1x4uoiF
9ErQXh+iBecFOlR6nYTUhAXEu8JVXOsR3l2BA+9k37IOSIFsrDKbt/9IFV3gspJw
6/IDp/S1ykaZ3u4sZWQTS6OZygGDShjS8CC2H9uaLJZ9MwvDSp11ObINJaFHovOm
OGCdxFmJ7naTHNcFrx7OKIUO+pgwdePtUPaTnLVmf4t+1PKBEKvrfDman0O5nGEg
NxHygIWjN4bnkx1SU4vJYEkojHexM5NBbvpbrrkHpSGofrttH5TBci8kI3YXqLH/
Fx1U9dXV1xcwLJmhzqS1
=5JFV
-----END PGP SIGNATURE-----

--=-tXMyU/xWhOJAxTXBBP1B--
