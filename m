Received: from mail-la0-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1THRN1-0001yQ-N1
 for linux-mtd@lists.infradead.org; Fri, 28 Sep 2012 03:36:08 +0000
Received: by lagz14 with SMTP id z14so766446lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2012 20:36:04 -0700 (PDT)
Message-ID: <1348803345.1830.2.camel@kyv>
Subject: Re: [PATCH] mtd: omap2-nand: avoid unaligned DMA accesses, fall
 back on prefetch method
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Date: Fri, 28 Sep 2012 06:35:45 +0300
In-Reply-To: <1348155850-26174-1-git-send-email-arnout@mind.be>
References: <1348155850-26174-1-git-send-email-arnout@mind.be>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-PeYRArTOnmsCKx5t8CSp"
Mime-Version: 1.0
Cc: Tony Lindgren <tony@atomide.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 Sven Krauss <sven.krauss@web.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-PeYRArTOnmsCKx5t8CSp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-09-20 at 17:44 +0200, Arnout Vandecappelle (Essensium/Mind)
wrote:
> It's difficult to reproduce the error, because the buffers are
> aligned most of the time.

Can you just take one of the mtd tests (e.g., mtd_speedtest), amend it a
little and make sure it uses unaligned buffers?

> Perhaps a better method is to fetch the first few unaligned bytes
> with the prefetch method, and then continue with DMA.  However,
> since it's hard to force an unaligned buffer, it's also hard to
> test that this method works.

Yes, this would be a lot cleaner.

--=20
Best Regards,
Artem Bityutskiy

--=-PeYRArTOnmsCKx5t8CSp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQZRsRAAoJECmIfjd9wqK0WukP/16ei9hMSBIum7Tn4z+BOSYM
4sak8j58lqy8JIl3VA8/Pgvj3guVWCF8vexBvCpcELmtVia7UsGWLdNlCpGT4sAI
lATz5rqyytiEoPvwjDTL0WxFZo0tgvPQ44NoDtbyOMHxgPj6/NzqAMlHyG2QQDJA
JCsV7lxqa73TY7aL9NvCHxkyUKx7CgP+zwpqghdTl8Z1c/MBGmWyPr9Do/jyUuCC
ugQBsKWta41jZbW1VYas9HrtvsMJSV71pt5WpYaRDH+5EVOxrlxu2DCxFvakFBNV
f5tdDhFULRIwhtgMRmEW0RHP47PbTcmEaEFB6MgvJr/r6SjpMqIhvrbsx16kj6h8
Fm6a5fUw5lJzL/Bo9BKNNskEhbq7zPFIcw1H9Dqd9zmXtEkoQx52RkcDgFLfZzAm
WNoCmUvWEWTN6C4sjt6aCrmTkPRkWJp2sf32WWl+WfjJIBUmfTsiS3B7DKqGqdOJ
07LWT6wpE4NG/5PcrHaHHmxNW1ev0nbyx+moNHSAtI5e5msv59WkAlVlF9BI9Tvx
dltIHhKWt2pcP6ijmkq90YR7xq6A4GDqB68UyWuk/4LXBVHu0/5biCrv/JiHDXTd
n4qM+KDdPJKXzv4JRyS7l87Tp7Sd8J5ZFQizNnzvouUFpYzdN3iDVatFH1orgZc0
BbYK/HDrHn1sg8DcT6W4
=LXSN
-----END PGP SIGNATURE-----

--=-PeYRArTOnmsCKx5t8CSp--
