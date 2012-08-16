Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1xYS-0005xV-PA
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 10:43:58 +0000
Message-ID: <1345114118.3393.199.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/8] mtd: check for max_bitflips in mtd_read_oob()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 16 Aug 2012 13:48:38 +0300
In-Reply-To: <CAN8TOE9wC6_NQ=DMX70ovWzP4JuFZKsORgn53Jq9ZNSGcFiCig@mail.gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-3-git-send-email-computersforpeace@gmail.com>
 <1345029870.3393.128.camel@sauron.fi.intel.com>
 <CAN8TOE9wC6_NQ=DMX70ovWzP4JuFZKsORgn53Jq9ZNSGcFiCig@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-KtVEdrbboh3ZHO3Kx37i"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, Mike Dunn <mikedunn@newsguy.com>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-KtVEdrbboh3ZHO3Kx37i
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-15 at 12:15 -0700, Brian Norris wrote:
> Note that there was a v2 of this patch, although the difference was
> very minor (the comments and the Reviewed-by's). The end result is
> almost the same as your amendments.

Reviewed-by tags are important for me, because people spent time and
they should be credited in some form in git log. I actually collected
all the tags from the thread and added them when applying your patches.=20

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-KtVEdrbboh3ZHO3Kx37i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLNAGAAoJECmIfjd9wqK0bwYP/RrgLS/CfERGxwKX63xEpTFf
mKMxTekYMgcOxkVSk7Pu3m/g0Yuxhy1PDFBQiKXDwAd2OP1knSXIzM1D9WjQcUF2
TVE8PzkKs9/OLf/5RFfY6YW8ddaXn+7gN7uaaEqAhOqUedkxlQqRSo5RRhvRQs6/
jA9ZcNCeaoTx4NfQGUpwqVR9yjR/IoouALbtmXwPg/+/JHYrfAiDVto/HBeSvje4
kQ1tMWTV+HeTQ4M9wGL0QPf91Y7/0yfYIWKTDwrVB+rjpPERnCU503s1wka7+ZbQ
cnu5MMwcArh1OPduGaonwekpoO80BmleBDdoS2qpzL/C4rMQ1b3MVpyriH+Et0Bp
OsRxTDTeWzGGqRpgUHOwJk0n+Nb6NfGk8ueje6j4kwMV3q9mzzBH2hvTNpBeyd0b
gDtoDL6Y78aW1yhDQ5HVFH9gzV/x+Hsr06pjJiUy79K5ESAFM4chlWh4qac4KfqA
AdBtIMLlOL9omcrVP9BCxVL04+JrfVkIqpeaYeqsOBJnqIl5C8dxPQdjVxhF4GB2
tZ/HhgLfL415IbIc3OQoBz6LqB/+x+pZ/TCSO9/IyhMO+w9UOqKkvuxILhxtYGMo
89g6RE3zEWNIL03vcXUBJoEsUMzeNENzQ9XKKMnmr15OuEkn4MtLuS6YQSieIWpW
LZO8ACvcqEOx/X5x8oYV
=P+0z
-----END PGP SIGNATURE-----

--=-KtVEdrbboh3ZHO3Kx37i--
