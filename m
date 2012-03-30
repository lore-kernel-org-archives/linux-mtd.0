Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SDcaL-0006hF-Tg
 for linux-mtd@lists.infradead.org; Fri, 30 Mar 2012 14:13:50 +0000
Message-ID: <1333117016.5440.41.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Fri, 30 Mar 2012 17:16:56 +0300
In-Reply-To: <4F64F17C.2070409@newsguy.com>
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com> <4F636964.3030904@newsguy.com>
 <20120316184345.GF10228@parrot.com> <4F64F17C.2070409@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-32xhleHqgjOOp97RuXgO"
Mime-Version: 1.0
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Ivan Djelic <ivan.djelic@parrot.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-32xhleHqgjOOp97RuXgO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-03-17 at 13:18 -0700, Mike Dunn wrote:
> Before I start on this, I'd like to get a
> blessing from Artem / David, since the chamges will touch many drivers
> in a
> somehat non-trivial manner.=20

Come on Mike, just go ahead without blessings. The stuff you are want to
do very important I believe. Currently MTD is basically lacking behind
the technology.

--=20
Best Regards,
Artem Bityutskiy

--=-32xhleHqgjOOp97RuXgO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIbBAABAgAGBQJPdcBYAAoJECmIfjd9wqK0R1MP+I4/0GdXQueEcLLvJkYDF3rJ
DuT0O/LAx1v4oy8oz1YtTWn6tu4oMNkTvsI/fhtTfaptEA5/VNgKM4VNqXMrVlZN
MtK5gv+3kAVyS7sYbktedA5JzR6w5mC9OsiufzIYkKfMNRGx/2mZO93O3x5cON5v
MLA3nbOu7Ysh3RRlZLFQl49o6+4wufQyiZCqkXG8ZlZFCmpk8tA9EN5NDvPlXV/x
SmEVydwDQWlcBo4myDaW99F7NTjkAoYsB/gWGG/vrxARNohRAxAZFyclbkGnysmd
qrNHsWQJExrO2Ijf3mtOoELpKG5YLpyGFBKhDKGI2dKwxj5ZTYxhvdDUiRQcmsGk
owf2gRUgt0sDAssokB4550t4XTz1oU+dMQLB3H/aGVFGw+mbB4XGqkGSDafLbXc4
i6zTQB/r44PQUq1rIGjODbxBBTj8b2d4Xq1JdAjDtzV5YCGtnQAiOS+nGjVWOvzM
JV30oK+2Utt22XjeBL0EnhS/9XxNZsnaObVB99FC3ghXxD4xMtMu/zl7J7LCMP2m
TAs5YR/426vR9FH14PrUJAFqAAwdlvmyUZT1VpsJkqxNqZy04rSn+9mhOFPMy9nS
l9N5hrkVehc28zViVsmFAYZ8+JBzTns/tIvH4Gq/wKEV6bX0/axWoXI063t4ICfe
BKtETdiXUdpcsc3Demo=
=H9TK
-----END PGP SIGNATURE-----

--=-32xhleHqgjOOp97RuXgO--
