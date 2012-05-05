Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQbWF-00011z-G0
 for linux-mtd@lists.infradead.org; Sat, 05 May 2012 09:43:16 +0000
Received: by lbbgg6 with SMTP id gg6so3213702lbb.36
 for <linux-mtd@lists.infradead.org>; Sat, 05 May 2012 02:43:13 -0700 (PDT)
Message-ID: <1336210990.2027.2.camel@koala>
Subject: Re: [PATCH v2 0/7] mtd: Change meaning of -EUCLEAN return code on
 reads
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Sat, 05 May 2012 12:43:10 +0300
In-Reply-To: <1335380771-27805-1-git-send-email-mikedunn@newsguy.com>
References: <1335380771-27805-1-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Y7iQa6BYUVeKuxVRj/rL"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Y7iQa6BYUVeKuxVRj/rL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-25 at 12:06 -0700, Mike Dunn wrote:
> This v2 of this set includes the following changes:
>   - [Patch 4/7]: Propagate bitflip_threshold from master to slave partiti=
on.
>   - [Patch 5/7]: Zero out max_bitflips outside of if-block in fsl_ifc_nan=
d.
>   - [Patch 6/7]: Simplify ecc strength sanity check.

Would you please do one more thing - create a piece of documentation
about this feature at the mtd web site.

http://git.infradead.org/mtd-www.git

--=20
Best Regards,
Artem Bityutskiy

--=-Y7iQa6BYUVeKuxVRj/rL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPpPYuAAoJECmIfjd9wqK02KoP+gJfq957qr2tDiOPLKHiF55X
lROdYAHUrmAHctcgMEILP4kRYAqBzLyw8f+P4SOKRFFps7ULZ8coIpJkDuc+OYCt
d5/2MHV3ZVHwWgCeDK+w548yAZPJEYMKAgbZQ5MjAQpfEPzml+UWqB0cnWW9hf3c
XuflwxRXNvhwtleRfkBOmDrOANaU6/idL56YHvq5QD/PdwOgPSnO6j6kcjHYaqu9
V+SHYfHma3xIk3mEnJMvT53msvcdg4+etGYWA3yQMtaLMGQDFWVI9psGL7NZU5Xy
I2Wa7fuSpkb0JQ/HIuVM5K4EjsAyFIAb5uoE/b/xittxvtXzEIj61Hdpk8mObeJr
Icat/XSk5c2p8UJxE6MdkrCnVcAUxVg/VD8u6Zm5IxFtu4wZ8XP5dJ7HaPYmkMAA
qkANFEdlFQ3TSeH7KHbWdWjS6IK8xFgrrh0NwBOZ0kr/PQ+gLMXNDKis9X17ydmT
MFvMX/wyj9qeJmVJ5N9FaAtPZu11zkLC49PpwK1iOehEhn8AXK54nCvicuiVXx8m
LwwqmDCmW5MCzLf86dnngKy1f8tZk3DaZDunmJL9SkuFRMceMqkIhJRZj1Lg/MIS
H91xqu99JS/8giA4iiazRtz5LMHVSDa1sZsWH5YJ6dHUbrmklY8NOcvMkETApNVJ
0iC4rcOnD5dhf1H8xmT5
=51SG
-----END PGP SIGNATURE-----

--=-Y7iQa6BYUVeKuxVRj/rL--
