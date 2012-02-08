Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv7Vj-000735-Dj
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 13:24:36 +0000
Received: by pbdx9 with SMTP id x9so657006pbd.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2012 05:24:33 -0800 (PST)
Message-ID: <1328707598.22240.64.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/3] mtd: move zero length verification to MTD API
 functions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 08 Feb 2012 15:26:38 +0200
In-Reply-To: <1328704973.22240.60.camel@sauron.fi.intel.com>
References: <1328529789-2106-1-git-send-email-dedekind1@gmail.com>
 <1328529789-2106-2-git-send-email-dedekind1@gmail.com>
 <20120207143505.6fba6d5b@pixies.home.jungo.com>
 <1328704973.22240.60.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-fUrgIVLX3gS3ptPAARDj"
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


--=-fUrgIVLX3gS3ptPAARDj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-02-08 at 14:42 +0200, Artem Bityutskiy wrote:
> On Tue, 2012-02-07 at 14:35 +0200, Shmulik Ladkani wrote:
> > On Mon,  6 Feb 2012 14:03:08 +0200 Artem Bityutskiy <dedekind1@gmail.co=
m> wrote:
> > > @@ -712,6 +717,8 @@ int mtd_point(struct mtd_info *mtd, loff_t from, =
size_t len, size_t *retlen,
> > >  		return -EOPNOTSUPP;
> > >  	if (from < 0 || from > mtd->size || len > mtd->size - from)
> > >  		return -EINVAL;
> > > +	if (!len)
> > > +		return 0;
> > >  	return mtd->_point(mtd, from, len, retlen, virt, phys);
> > >  }
> >=20
> > Previously, '_point' implementors usually assigned *virt (e.g. for NOR =
-
> > to the relevant ioremapped address), regardless 'len' value.
> > Meaning, *virt was set, even in the 'len =3D=3D 0' case.
> > New 'mtd_point()' does not set *virt in this case.
> >=20
> > (Luckily, seems there are no calls to 'mtd_point' with zero 'len'...)
> >=20
> > I guess it is safe to assume the *virt assignment in the '!len' case wa=
s
> > wrong?
>=20
> If length is zero then 'virt' is anyway useless. But we should set it to
> NULL in 'mtd_point()' to make sure that if someone accesses it he gets
> an oops. I'll amend the patch and update the commit message
> correspondingly, thanks a lot for review.


I guess we can go a bit further and sanitize 'mtd_point()' like this:

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Wed, 8 Feb 2012 15:13:26 +0200
Subject: [PATCH] mtd: harmonize mtd_point interface implementation

Some MTD drivers return -EINVAL if the 'phys' parameter is not NULL, trying=
 to
convey that they cannot return the physical address. However, this is not v=
ery
logical because they still can return the virtual address ('virt'). But som=
e
drivers (lpddr) just ignore the 'phys' parameter instead, which is a more
logical thing to do.

Let's harmonize this and:

1. Always initialize 'virt' and 'phys' to 'NULL' in 'mtd_point()'.
2. Do not return an error if the physical address cannot be found.

So as a result, all drivers will set 'phys' to 'NULL' if it is not supporte=
d.
None of the 'mtd_point()' users use 'phys' anyway, so this should not break
anything. I guess we could also just delete this parameter later.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/devices/mtdram.c |    3 ---
 drivers/mtd/devices/phram.c  |    4 ----
 drivers/mtd/devices/pmc551.c |    4 ----
 drivers/mtd/devices/slram.c  |    3 ---
 drivers/mtd/mtdcore.c        |    3 +++
 5 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 0e0e6ed..ec59d65 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -43,9 +43,6 @@ static int ram_erase(struct mtd_info *mtd, struct erase_i=
nfo *instr)
 static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, void **virt, resource_size_t *phys)
 {
-	/* can we return a physical address with this driver? */
-	if (phys)
-		return -EINVAL;
 	*virt =3D mtd->priv + from;
 	*retlen =3D len;
 	return 0;
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index d3474a4..9d2bf17 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -51,10 +51,6 @@ static int phram_erase(struct mtd_info *mtd, struct eras=
e_info *instr)
 static int phram_point(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, void **virt, resource_size_t *phys)
 {
-	/* can we return a physical address with this driver? */
-	if (phys)
-		return -EINVAL;
-
 	*virt =3D mtd->priv + from;
 	*retlen =3D len;
 	return 0;
diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index 6269a43..c4368ec 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -205,10 +205,6 @@ static int pmc551_point(struct mtd_info *mtd, loff_t f=
rom, size_t len,
 	printk(KERN_DEBUG "pmc551_point(%ld, %ld)\n", (long)from, (long)len);
 #endif
=20
-	/* can we return a physical address with this driver? */
-	if (phys)
-		return -EINVAL;
-
 	soff_hi =3D from & ~(priv->asize - 1);
 	soff_lo =3D from & (priv->asize - 1);
=20
diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index 842e489..ccd39ff 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -99,9 +99,6 @@ static int slram_point(struct mtd_info *mtd, loff_t from,=
 size_t len,
 {
 	slram_priv_t *priv =3D mtd->priv;
=20
-	/* can we return a physical address with this driver? */
-	if (phys)
-		return -EINVAL;
 	*virt =3D priv->start + from;
 	*retlen =3D len;
 	return(0);
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index ead52b3..1680ef5 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -706,6 +706,9 @@ int mtd_point(struct mtd_info *mtd, loff_t from, size_t=
 len, size_t *retlen,
 	      void **virt, resource_size_t *phys)
 {
 	*retlen =3D 0;
+	*virt =3D NULL;
+	if (phys)
+		*phys =3D NULL;
 	if (!mtd->_point)
 		return -EOPNOTSUPP;
 	if (from < 0 || from > mtd->size || len > mtd->size - from)
--=20
1.7.9

--=20
Best Regards,
Artem Bityutskiy

--=-fUrgIVLX3gS3ptPAARDj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPMngOAAoJECmIfjd9wqK0nMYP/iZRhbPjTTHkdFxQxR5zrlmC
qI0BGoihcgAHNOtiEivPN5KKp1UQe8/2Ypdw5fCyJznWmQ/I+1RjWM1WAfsQj+09
m0Fgh9vOgDrmEsisrXARMbOsM5+u8iItfMzMAJ+GZ/cUHGdn4G2kqeUipj3Z4E1D
MnlOlU8oxwgOPW7GJjA3e5Hjpgtr/PDmuIGW2qkIs9Nuh+uSoOT0oNciAJdsvv8t
y3A/TXXshVilwI9R4dw0WG/heDsmR/Td25+eY6msASCRMzW0H7keYeiP7207lnVF
FUIqzllAD0iifCujs/OJBNgb2dxI6NoVGwCbaxPSV8H1gsCeOwYPGwzRPe+zUr48
G8T+MQ0piJyNa9Rm5l504dFAOGfxzOGhbQfeKuYuod3VlenWB68Oi++KImUMynYh
XB+VEJWB/KULjzlLQWJ1STcqncI6OG1klJKQbolE4LyFvWn5PocQqBzzmD8c1GA9
vvUukcm/n4cduqpvdwkBhoCEIdricGfQDj6LmAuADsS3+/oVyxjAFw56W6XWqmEX
xgAXKuw3tCEc9TuVwd8MM5WP3CyC68RD/EXgdkReDs6fg8/bhZUoGwPiSi7Wjtkj
HZ7Sg+8smpmD/CRb13NzqCyeAq+D2lz09nUX0fiLZTqHCMolA86davRBgoPW3iEE
fo5Ri71kWYYUxIY5Hp7l
=0tsd
-----END PGP SIGNATURE-----

--=-fUrgIVLX3gS3ptPAARDj--
