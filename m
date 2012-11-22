Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbUxc-00067W-QZ
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 11:28:49 +0000
Message-ID: <1353583773.2701.46.camel@sauron.fi.intel.com>
Subject: Re: [patch] UBIFS: use kmalloc_array() in recomp_data_node()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Nov 2012 13:29:33 +0200
In-Reply-To: <1353583603.2701.45.camel@sauron.fi.intel.com>
References: <20121117151126.GA16900@elgon.mountain>
 <1353580297.2701.29.camel@sauron.fi.intel.com>
 <20121122111411.GJ6186@mwanda>
 <1353583603.2701.45.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-nhL1oeWd+WFqaAMpXiQw"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-nhL1oeWd+WFqaAMpXiQw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-22 at 13:26 +0200, Artem Bityutskiy wrote:
> Did you consider kcalloc() ? Just like malloc() / calloc() libc
> functions?=20

Ah, there is kcaoloc already, so I guess then we could just put the
overflow check there instead?

--=20
Best Regards,
Artem Bityutskiy

--=-nhL1oeWd+WFqaAMpXiQw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrgydAAoJECmIfjd9wqK0OewP/iCE4xQu7H8orlxcTuruBUgU
t7D6S/qPBQQQbV+4Y4JtuwGVKuUAgUXerthoTX84smTM/Sj32BXTeVKni0TYPOhN
sXmt1oi3DfvNIsoU4Lo5VdfSO9MORtvaa4b75Nf4mkUjky5Xfr/a4xkp26yrrHMu
+mBrO6fJ72cuin1yMndLArarcp7k12Q0R1TDbp5FFyFjg1SLMM3d4WiRYNHa0ERc
9d1CNScGzPARrc02l7Rmsodm1msQBUBWnQ/6pFvByQaK0Hj4UwCyHDdSzDxJYmu0
skhVsujrbftglS1CsuO1bk17svibLit9b+TfmwL4SafGeOUCNp1dXUAsGCuJFR14
cbUdnuhN4LR/Vzw8dggr8zxUDTsnUWXgHywxJvSZT7NboD3gImVz8SuV6+mh/Pdm
6f8lJxEfubFfbKKrwgHTVlFym62eota8SdeQejE2dqp4F1Qw/EKjNH/HieuLV3rI
95G1+p9VOP5ThPiZYNIcY1VwjgMbo3fJnS0TjNjT9pUHSZulyCx8AWDuTVjfYtim
2xn8qMCtio2E8hmGs+EoTIFn17oCDnqyahg4Z+Ea7fejXrmhx13xghBwPmCueATA
RvTXWPI3ftpaxZOMX5vdbM5a+E8tDnbB/GOK+AcasIEcgLuHiUCIjUtvNXNWU2/+
9caGwLia4LSEkBIiO/dr
=WtJ2
-----END PGP SIGNATURE-----

--=-nhL1oeWd+WFqaAMpXiQw--
