Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXCpr-0003Dq-Ig
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2011 14:14:32 +0000
Received: by iaby26 with SMTP id y26so10486iab.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 06:14:31 -0800 (PST)
Subject: Re: [PATCH] MTD: nand: Convert au1550nd to use
 module_platform_driver()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Axel Lin <axel.lin@gmail.com>
Date: Sun, 04 Dec 2011 16:15:32 +0200
In-Reply-To: <1322748247.31743.1.camel@phoenix>
References: <1322748247.31743.1.camel@phoenix>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-inji+l5rPcf7ZbYZlN52"
Message-ID: <1323008139.9400.59.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Cc: linux-mips@linux-mips.org, Manuel Lauss <manuel.lauss@googlemail.com>,
 linux-mtd@lists.infradead.org, Ralf Baechle <ralf@linux-mips.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-inji+l5rPcf7ZbYZlN52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2011-12-01 at 22:04 +0800, Axel Lin wrote:
> Cc: Manuel Lauss <manuel.lauss@googlemail.com>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
> Hi Ralf,
> This patch converts au1550nd to use module_platform_driver().
> You have committed a5bd32fd "MTD: nand: make au1550nd.c a platform_driver=
".
> Currently this patch can only apply to either your tree or linux-next.
> Could you help to take it.
> ( committed a5bd32fd does not exist in l2-mtd-2.6.git,
> so Artem cannot apply it.)

Yes, please, merge the au1550nd.c piece via Ralf, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-inji+l5rPcf7ZbYZlN52
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO24CEAAoJECmIfjd9wqK0e7wQAMJWcelDQxxBzqU/aQa/lnZ2
U3QUnVGStwLCL3ADXSPCqQ2P3a2mdPZdljcjYntg4GtDlq6k84a3O9qz6sigw+ts
WgXZ/E2RUy6vqvoPOtSJHL1jbqI8pF5+4hcOErbGeidssNVpG4RAyvfRxocD86dt
B9L2rQFBqFGyzdVc13F/hxtsGpk8ROx0UlsMO4ymrAnyNqSv4nyeT/UNEd+tUvje
ZpZhPl5RTTOx+R5gq2U4RGM9Dm7GEGKldBTMH84TJGC2abx/xmQ35e4WWT5uoqrA
y6gWBgz2AvNILyvouW5Fsuh2cVTgxrVFueYBR4rMNNlHSU7uDWdMJCDYIj2aZmL4
prrAWmtlYDOuMLZoz9DOM/3JpjppURHxkjKf48xQt/M4eEoJCUgUVoD0WIkPrGOg
e+lTfwefyEgrDBP8BbGbplPBJOzeEgCXeO+WhTpnsOCYjbVw5Zv2oqZwG8Lw8CpI
vjCG7nmQhyoTMD9wKRLNPjyZsIFREh90aeGl9qMqYdRQnzZGQShmo9chh+3K1st5
MYWqCZAFenUVTaSg5bhGqH7uZqEaQCQYmMkfoc+l7TdUxTz9aBTtjwUnXnOcIxoA
8oVAENtvSXAjRdu4JoF1vq2QyQ+PpIjiBlwfM+hBvIcVrwKaM9mNG68FAj2ZsObs
mt+t/7SFmpfdpKsEqhP0
=/ziI
-----END PGP SIGNATURE-----

--=-inji+l5rPcf7ZbYZlN52--
