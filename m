Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RsWBU-0000SM-5C
 for linux-mtd@lists.infradead.org; Wed, 01 Feb 2012 09:08:57 +0000
Message-ID: <1328087455.28171.77.camel@sauron.fi.intel.com>
Subject: Re: [GIT PULL] logfs: bug fixes
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 01 Feb 2012 11:10:55 +0200
In-Reply-To: <CA+55aFzruneRNt28L5d_fX71-YSGmMXL=4kck_pQbxob4_2+8g@mail.gmail.com>
References: <CALJbWeoznAvoSzdBp0Kunn+uxqB0XafrLmp7im=49ST340vSjw@mail.gmail.com>
 <CA+55aFzaErfoKG5KEyRMnjHS1=XbA7FNHRhF3J2iR8-m6PqtxQ@mail.gmail.com>
 <CALJbWep4pD69wP76Fcwupw0ppoztOpfHPnv7RvczW06Ko0E4YQ@mail.gmail.com>
 <CA+55aFyquFTUxgtHNRdz-rwha7H2bBocC6hw67a_g0FxG_=95Q@mail.gmail.com>
 <CALJbWeptUqUyVrNZOeQz-toE=akT31L8MLubMj8FKjKy05ppzg@mail.gmail.com>
 <CA+55aFzruneRNt28L5d_fX71-YSGmMXL=4kck_pQbxob4_2+8g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-/nWMvqMvnrlCaWE4M1Do"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Prasad Joshi <prasadjoshi.linux@gmail.com>,
 =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
 David Woodhouse <David.Woodhouse@intel.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-/nWMvqMvnrlCaWE4M1Do
Content-Type: multipart/mixed; boundary="=-l993f7XVUHpqCYG/XbH5"


--=-l993f7XVUHpqCYG/XbH5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-01-31 at 09:46 -0800, Linus Torvalds wrote:
> Some uses may care about that "does it support bad blocks explicitly",
> but nobody should ever care about "can_have_bb()". Possibly somebody
> could care about the "inverse", in the sense that some filesystem
> might want to only support devices that are defined to be perfect, but
> that doesn't sound much like a MTD filesystem.

Hi Linus,

apologies for the hassle, this should have been dealt with in
linux-next, I agree.

I agree with your 'mtd_block_isbad()' change which now returns 0 if the
underlying flash does not support bad blocks. This is cleaner and
imposes less job on the MTD API users.

This semantic change needs some additional clean-up work which is not
critical though and will be dealt with normally during the v3.4 merge
window. This whole API rework is going to continue and there will be
many changes - only the first step is merged now. Just an example of the
clean-up we need after your conflict resolution.

--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -257,8 +257,7 @@ static void find_next_position(struct mtdoops_context *=
cxt)
        size_t retlen;
=20
        for (page =3D 0; page < cxt->oops_pages; page++) {
-               if (mtd_can_have_bb(mtd) &&
-                   mtd_block_isbad(mtd, page * record_size))
+               if (mtd_block_isbad(mtd, page * record_size))
                        continue;
                /* Assume the page is used */
                mark_page_used(cxt, page);


However, as Brian pointed, the 'can_have_bb()' change is incorrect and
breaks for example UBI. We need an interface which tells us whether the
underlying flash can have bad eraseblocks and they should be dealt with
by software (NAND) or it cannot have bad eraseblocks and I/O errors mean
that flash is worn-out and should be physically changed (NOR). For
example, UBI behaves differently depending on this information.

Thus, returning hard-coded 0 or 1 from 'can_have_bb()' is incorrect.

The patch you attached looks good except that we should have this change
instead:

 static inline int mtd_can_have_bb(const struct mtd_info *mtd)
 {
-       return 0;
+       return !!mtd->block_isbad;
 }

I've inlined and attached the modified version of your patch. If no one
objects, let's merge it as a quick fix.

diff --git a/fs/logfs/dev_mtd.c b/fs/logfs/dev_mtd.c
index e97404d..9c50144 100644
--- a/fs/logfs/dev_mtd.c
+++ b/fs/logfs/dev_mtd.c
@@ -152,9 +152,6 @@ static struct page *logfs_mtd_find_first_sb(struct supe=
r_block *sb, u64 *ofs)
 	filler_t *filler =3D logfs_mtd_readpage;
 	struct mtd_info *mtd =3D super->s_mtd;
=20
-	if (!mtd_can_have_bb(mtd))
-		return NULL;
-
 	*ofs =3D 0;
 	while (mtd_block_isbad(mtd, *ofs)) {
 		*ofs +=3D mtd->erasesize;
@@ -172,9 +169,6 @@ static struct page *logfs_mtd_find_last_sb(struct super=
_block *sb, u64 *ofs)
 	filler_t *filler =3D logfs_mtd_readpage;
 	struct mtd_info *mtd =3D super->s_mtd;
=20
-	if (!mtd_can_have_bb(mtd))
-		return NULL;
-
 	*ofs =3D mtd->size - mtd->erasesize;
 	while (mtd_block_isbad(mtd, *ofs)) {
 		*ofs -=3D mtd->erasesize;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 2212952..887ebe3 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -489,7 +489,7 @@ static inline int mtd_has_oob(const struct mtd_info *mt=
d)
=20
 static inline int mtd_can_have_bb(const struct mtd_info *mtd)
 {
-	return 0;
+	return !!mtd->block_isbad;
 }
=20
 	/* Kernel-side ioctl definitions */

--=20
Best Regards,
Artem Bityutskiy

--=-l993f7XVUHpqCYG/XbH5
Content-Disposition: attachment; filename="mtd-patch-v2.diff"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="mtd-patch-v2.diff"; charset="UTF-8"

ZGlmZiAtLWdpdCBhL2ZzL2xvZ2ZzL2Rldl9tdGQuYyBiL2ZzL2xvZ2ZzL2Rldl9tdGQuYw0KaW5k
ZXggZTk3NDA0ZC4uOWM1MDE0NCAxMDA2NDQNCi0tLSBhL2ZzL2xvZ2ZzL2Rldl9tdGQuYw0KKysr
IGIvZnMvbG9nZnMvZGV2X210ZC5jDQpAQCAtMTUyLDkgKzE1Miw2IEBAIHN0YXRpYyBzdHJ1Y3Qg
cGFnZSAqbG9nZnNfbXRkX2ZpbmRfZmlyc3Rfc2Ioc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgdTY0
ICpvZnMpDQogCWZpbGxlcl90ICpmaWxsZXIgPSBsb2dmc19tdGRfcmVhZHBhZ2U7DQogCXN0cnVj
dCBtdGRfaW5mbyAqbXRkID0gc3VwZXItPnNfbXRkOw0KIA0KLQlpZiAoIW10ZF9jYW5faGF2ZV9i
YihtdGQpKQ0KLQkJcmV0dXJuIE5VTEw7DQotDQogCSpvZnMgPSAwOw0KIAl3aGlsZSAobXRkX2Js
b2NrX2lzYmFkKG10ZCwgKm9mcykpIHsNCiAJCSpvZnMgKz0gbXRkLT5lcmFzZXNpemU7DQpAQCAt
MTcyLDkgKzE2OSw2IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAqbG9nZnNfbXRkX2ZpbmRfbGFzdF9z
YihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCB1NjQgKm9mcykNCiAJZmlsbGVyX3QgKmZpbGxlciA9
IGxvZ2ZzX210ZF9yZWFkcGFnZTsNCiAJc3RydWN0IG10ZF9pbmZvICptdGQgPSBzdXBlci0+c19t
dGQ7DQogDQotCWlmICghbXRkX2Nhbl9oYXZlX2JiKG10ZCkpDQotCQlyZXR1cm4gTlVMTDsNCi0N
CiAJKm9mcyA9IG10ZC0+c2l6ZSAtIG10ZC0+ZXJhc2VzaXplOw0KIAl3aGlsZSAobXRkX2Jsb2Nr
X2lzYmFkKG10ZCwgKm9mcykpIHsNCiAJCSpvZnMgLT0gbXRkLT5lcmFzZXNpemU7DQpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9tdGQvbXRkLmggYi9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaA0K
aW5kZXggMjIxMjk1Mi4uODg3ZWJlMyAxMDA2NDQNCi0tLSBhL2luY2x1ZGUvbGludXgvbXRkL210
ZC5oDQorKysgYi9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaA0KQEAgLTQ4OSw3ICs0ODksNyBAQCBz
dGF0aWMgaW5saW5lIGludCBtdGRfaGFzX29vYihjb25zdCBzdHJ1Y3QgbXRkX2luZm8gKm10ZCkN
CiANCiBzdGF0aWMgaW5saW5lIGludCBtdGRfY2FuX2hhdmVfYmIoY29uc3Qgc3RydWN0IG10ZF9p
bmZvICptdGQpDQogew0KLQlyZXR1cm4gMDsNCisJcmV0dXJuICEhbXRkLT5ibG9ja19pc2JhZDsN
CiB9DQogDQogCS8qIEtlcm5lbC1zaWRlIGlvY3RsIGRlZmluaXRpb25zICovDQo=


--=-l993f7XVUHpqCYG/XbH5--

--=-/nWMvqMvnrlCaWE4M1Do
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPKQGfAAoJECmIfjd9wqK023wP/iv6QUajn9iLE5agqMtSSro4
M1I/W4Hq+K2ttaWUux7Na/MIeqNtZB5NQHq752GQhucqaVjG3wjhA+WQr7vtq2Ld
VGpIQYw87GawLes6fDq2gH1GBqoVOv0ovVTq0JLgdRVmRCF474QS4Pf21RxmLPHG
+zKfeIdyEyNdxUmpusC76NoaEHdnVyKjxP8q6IQ/0DPzSj7ah6t4q48l6evX1eMC
rMFQMXxdjCG9/BgwsPc3Oap9vr4B2j9A1AnIZT1lXjJLnF4i0IHiv/zFHAxg1kez
RjI7G5aZMOThGhKHWHVn4xabcpFJjSMuxRUl8o7JrlQXx2DNDM/+9qUxfhY8l+lB
jo4ivEhOnbKXAriRzemZy5fgrp0H9LBaf3+9dJ9lSXTAtubG2GT/246b+K0XNTTT
WgpWtoLuVvCX4wKNp1UfSLQv32bMkJ2Akd5j2WdvexzePd6lIMFnLoTwF7KqrVED
hjSBhE7mYCHRtcwwq+OYTrho57wTmk1exxl3e1eIdNO1rR4mmEvpSflJ95OmdNgn
cjrU3abkVLiEZ22/fhg/hHD+eMnOVIeVctjUgXmHwf8d6AyDX31xPm1YPmS6v1DG
9rLZnpFfV14qLqWCTp9PemtIcGSVYiC9PWUFEz+hiOuwRpi6pSOC4E2fN2x5MjRn
121cn43Y51tPTcCjw1qR
=ysWy
-----END PGP SIGNATURE-----

--=-/nWMvqMvnrlCaWE4M1Do--
