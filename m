Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOWIx-0006R5-2p
 for linux-mtd@lists.infradead.org; Sun, 29 Apr 2012 15:44:56 +0000
Received: by mail-lpp01m010-f49.google.com with SMTP id y4so1724253lag.36
 for <linux-mtd@lists.infradead.org>; Sun, 29 Apr 2012 08:44:54 -0700 (PDT)
Message-ID: <1335714291.1942.15.camel@koala>
Subject: Re: [PATCH v2 1/2] jffs2: validate symlink size in
 jffs2_do_read_inode_internal()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Xi Wang <xi.wang@gmail.com>
Date: Sun, 29 Apr 2012 18:44:51 +0300
In-Reply-To: <1335379523-31415-1-git-send-email-xi.wang@gmail.com>
References: <1335379523-31415-1-git-send-email-xi.wang@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Cdr4ZLJq/KMOKElPo9Ve"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Cdr4ZLJq/KMOKElPo9Ve
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-25 at 14:45 -0400, Xi Wang wrote:
> `csize' is read from disk and thus needs validation.  Otherwise a bogus
> value 0xffffffff would turn the subsequent kmalloc(csize + 1, ...) into
> kmalloc(0, ...), leading to out-of-bounds write.
>=20
> This patch limits `csize' to JFFS2_MAX_NAME_LEN, which is also used
> in jffs2_symlink().

I think your commit message is a not general enough because it talks
about 0xFFFFFFFF value, but there may be any other large value as well.
I've added the following cause to the commit message and pushed both
patches to l2-mtd.git, thanks! Please, verify.

The clause:

"Artem: we actually validate csize by checking CRC, so this 0xFFs cannot
come from empty flash region. But I guess an attacker could feed JFFS2
an image with random csize value, including 0xFFs."

--=20
Best Regards,
Artem Bityutskiy

--=-Cdr4ZLJq/KMOKElPo9Ve
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPnWHzAAoJECmIfjd9wqK0hcQQAIvtoYgYSSXRLsQ/gEA2d3hb
XT6xPgc+xW6QJsJ+fm0olYzbXKI8pUEa6NecweXz44SzCp89Aq2nuYuKHiWG0u20
S/uzKPFewADQG0eIGEu8lonFJIl5NnjQIwzO/6TazRdH0LGuMLDSCGgaE5807h+v
FGwzUJLeGjtCW1WU6hdYbrvp4cQWE4/FTd3Gc7jdjGC0y+q/84TnI5JTkoDziisF
b8d1lqvuKWihWmnanRPfQlvF9mkRVTe9SNXWoLiaSqhhwr1xOF1C6Jfwo6QITyoq
16AN1wDbq0f+bXI9zMlvge0cNmxKqg6NPAzLZkN64hDUsoNqzZ7ojH7a9+EVtFPx
FfaqPoyD92tumW6q6cxk+ywnAoPawnxKcfFElYpIr9NU0Grz+C8GqM9S/IP0x9ex
lndOpYzjSr3CR7cxjknQhxPnqBbroRTDZ1D8baBBij7O5SDVdBAdXTJz8wQYjH2Y
WIRqurEVYUdpdSh9g3r18Pj5+rhKibzV/smo47dhhAJe9b94Q1R3IpFvMNepRrsK
40iCnALT/h6n04Ga34aS9TgYhFdQUG6VV3fxyjevkXona2KOytaLC121PEXxAQeb
QvMxIsAtQo89Q4UFXIfKXTw/Trk0e0a/ed2pH7rhpvexN2peQO/GdYHoOYxX55vu
4YD3LpsPuF97ttA89lu6
=xWRD
-----END PGP SIGNATURE-----

--=-Cdr4ZLJq/KMOKElPo9Ve--
