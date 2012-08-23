Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4UIO-0007eh-Al
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 10:05:52 +0000
Message-ID: <1345716615.2848.229.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 0/6] UBI: add max_beb_per1024 parameter / ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 23 Aug 2012 13:10:15 +0300
In-Reply-To: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-1oUSBdLV1uvPPGgTaafu"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-1oUSBdLV1uvPPGgTaafu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 18:00 +0200, Richard Genoud wrote:
> This patch serie introduce, step by step the kernel module parameter
> max_beb_per1024, then the ioctl and finally drop the kernel config option
> CONFIG_MTD_UBI_BEB_LIMIT.
>=20
> It's based on top of linux-ubi/master (4ebb4b5)

I've also pushed this patch:

=46rom 5fe236c703063f9bc87b66c593408a0d48bbe0e7 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Thu, 23 Aug 2012 13:01:11 +0300
Subject: [PATCH] UBI: disallow max_beb_per1024 on NOR flash

If the flash does not admit of bad blocks (e.g., NOR) - disallow using
'max_beb_per1024'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/build.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index aa60b30..865e4fa 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -860,9 +860,6 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_nu=
m,
 	if (max_beb_per1024 < 0 || max_beb_per1024 > MAX_MTD_UBI_BEB_LIMIT)
 		return -EINVAL;
=20
-	if (!max_beb_per1024)
-		max_beb_per1024 =3D CONFIG_MTD_UBI_BEB_LIMIT;
-
 	/*
 	 * Check if we already have the same MTD device attached.
 	 *
@@ -935,6 +932,15 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_n=
um,
 	if (err)
 		goto out_free;
=20
+	if (!max_beb_per1024) {
+		if (!ubi->bad_allowed) {
+			ubi_err("mtd%d does not admit of bad blocks, "
+				"max_beb_per1024 cannot be used", mtd->index);
+			goto out_free;
+		}
+		max_beb_per1024 =3D CONFIG_MTD_UBI_BEB_LIMIT;
+	}
+
 	err =3D -ENOMEM;
 	ubi->peb_buf =3D vmalloc(ubi->peb_size);
 	if (!ubi->peb_buf)
--=20
1.7.10.4

Are you OK with this?

Now that we seem to have everything in, would you please give this all a
final test. Could you please check both on nandsim and mtdram?

--=20
Best Regards,
Artem Bityutskiy

--=-1oUSBdLV1uvPPGgTaafu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNgGHAAoJECmIfjd9wqK0G4oQAIfSMhvqXLhF3wyXt/Lp3jG8
jDYSBWoSLBQc8yKr9wxBZF0zr0xq42PEH0gUq/YKEUQ0qzUTUr7yJ95I5hv7Ep2z
cnGeylq27F7NFGKAPrhp0YtHHRcb2Wsyakhr5lQxkgtFIH8Um12By2HWHbbU6jZh
XrXdo8Fi9Xe/amkMXdEl5eQ3ChXYmsGHP7PWtnDZLvhyfO+nCAFtu6PwJF72pUl+
wqMaEBsUyPPB14dyoSL+QpESyvmMLu5wt98ghef8USpCPu+IN/r3Cf+pHMCvj4Ub
MH7SrZdBomgR6VVYx+aAxOCLD3djZMeN8Z5C7KvBYPRsMMrfgUYoR7Fe1nOeE3fG
iPvkQ31YUU0vOfaAFuwWOndrxEnD5XCblxqmz8Ps96CGAlEx9W3g0ZNBJOcnGymd
e97GgaBK9s7AziX2KIpr7s8NJ3G8XexIzwgajGVPPxoRHzxvpJQAoOkKurmsn5E6
BsZAVFh5bQSUXnnigO1ZIYc5uShqfjkOrQ380kaDdpePxNFktn06OlN3XI0QdxZl
cfzY+FmGrcBLav1Wv584XPmx6p/adFggIn7oRZouz8GM+0eQaLp+8p514ypu6Das
MG+EkOYauRwPpHVrRdgXN1RvTieD40gpTGqQOtC0nL+4VLgg7HKItBGK7AJh9r9U
3f2vPr9j9mKtPFvRFMgx
=3aCI
-----END PGP SIGNATURE-----

--=-1oUSBdLV1uvPPGgTaafu--
