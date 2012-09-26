Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGovT-000778-P4
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 10:33:08 +0000
Message-ID: <1348655591.24309.64.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 01/10] UBI: Add fastmap on-flash data structures
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Richard Weinberger <richard@nod.at>
Date: Wed, 26 Sep 2012 13:33:11 +0300
In-Reply-To: <1348511492-91606-2-git-send-email-richard@nod.at>
References: <1348511492-91606-1-git-send-email-richard@nod.at>
 <1348511492-91606-2-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-JiLOpgp6PFEr9L3H7T1Q"
Mime-Version: 1.0
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tim.bird@am.sony.com
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-JiLOpgp6PFEr9L3H7T1Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-24 at 20:31 +0200, Richard Weinberger wrote:
> Add the on-flash data structures neeed by fastmap
> to ubi-media.h
>=20
> Signed-off-by: Richard Weinberger <richard@nod.at>

Richard, thanks, here is the deal I suggest

1. I do not really have time to review this in details.
2. I do not want to block this either
3. I want to merge this to 3.7 with come pre-conditions (see below)
   as "Experimental" with a claim that the on-flash format can
   be changed. Something like Linus did for btrfs. Then let people
   play with fastmap. I am sure it'll need changes when people
   try to use it in production.
  =20
   a. Aiaiai is happy
   b. You provide a section for the mtd web site describing fastmap
   c. It does not break anything when it is disabled
   d. When it is enabled, it also passes the UBI tests

Actually, I want to expose it to linux-next already after step a.
Despite a lot of testing you have already done, I am willing to do some
testing myself as well, so I'll do c. and d. and let you know if there
are issues.

Could you please do b. ?

--=20
Best Regards,
Artem Bityutskiy

--=-JiLOpgp6PFEr9L3H7T1Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYtnnAAoJECmIfjd9wqK0SOIP+QFDXBwCs6hFbH8HpPB1Y3MW
9XUsOI+nzw4tfFVlYn0q4L7Lq7tGE0aydZOe767Aa9WMRJhFP+AaQ0DBHJ9MrEeW
KELQRAJ1gTGmFosAmEg4/rurx9RX8p+J1dU91tA+faPMq1AJ9rvVT14aCmZLjloW
QYab/zigRmD2t/RA5xnqNfbsD3zeaN38x5OuyhHNNXHjlLp2cC3Q5nbh97WKzPt7
zP7EY+n202dffovk9fsp2nDF1XfEHmB2KKZBf5UHomIZJu2mN+/eL3ozF+IJdJzK
W9cf41uN1bO6EQnrmuXJhMXtmMOWy7BzV3SgvgOM+cKt3Jd9/xN7L0WF5BWqevWS
WHYZ3g+oT6ki2c88IdHkjn/7GkEy8X1IxKlbJcMExRZ2vX6qOZ2Lz4mV1ipDDQzm
5brqd/gK8E4NuJxLsTl3Os80rkmoBarJVZfudQiBDS5gA9/qQVrxHcHjJO5PxRPd
nj2fM305YOpxPvMujBfSvPubRRKpqm81f56iXAg37fQWJLF5uRnhDcuCIggEr6l+
oMtz+h53vRXHEfkI1lISKbgkUWJZ07meGT8d90s00sqMigJnuLf1Iz5u+2ntOazB
IZZjH3x3QZLpFru+UBbRJZHdhZJ4u+8quj2q9bGrUANgqR4oC0kmPKuCSVPFDtbh
Anhj/VdJI1mYHSAnSXuH
=XvRE
-----END PGP SIGNATURE-----

--=-JiLOpgp6PFEr9L3H7T1Q--
