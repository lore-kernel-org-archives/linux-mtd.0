Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RsZfo-0007LF-4Z
 for linux-mtd@lists.infradead.org; Wed, 01 Feb 2012 12:52:29 +0000
Message-ID: <1328100867.28171.88.camel@sauron.fi.intel.com>
Subject: Re: [GIT PULL] logfs: bug fixes
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 01 Feb 2012 14:54:27 +0200
In-Reply-To: <CA+55aFwMinLTj4Jf5D-LHR73vfPLn4EUHooaBGSrsDdrRWsrrw@mail.gmail.com>
References: <CALJbWeoznAvoSzdBp0Kunn+uxqB0XafrLmp7im=49ST340vSjw@mail.gmail.com>
 <CA+55aFzaErfoKG5KEyRMnjHS1=XbA7FNHRhF3J2iR8-m6PqtxQ@mail.gmail.com>
 <CALJbWep4pD69wP76Fcwupw0ppoztOpfHPnv7RvczW06Ko0E4YQ@mail.gmail.com>
 <CA+55aFyquFTUxgtHNRdz-rwha7H2bBocC6hw67a_g0FxG_=95Q@mail.gmail.com>
 <CALJbWeptUqUyVrNZOeQz-toE=akT31L8MLubMj8FKjKy05ppzg@mail.gmail.com>
 <CA+55aFzruneRNt28L5d_fX71-YSGmMXL=4kck_pQbxob4_2+8g@mail.gmail.com>
 <CAN8TOE9pJKD9aznYLDh2Se14og3nn-QHCvjQDXHQu2-dhbVavQ@mail.gmail.com>
 <CA+55aFwMinLTj4Jf5D-LHR73vfPLn4EUHooaBGSrsDdrRWsrrw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-dfbwfl2E2XceuEClPZp9"
Mime-Version: 1.0
Cc: Prasad Joshi <prasadjoshi.linux@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
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


--=-dfbwfl2E2XceuEClPZp9
Content-Type: multipart/mixed; boundary="=-4TKNyRcmwZlI+QY8+mCL"


--=-4TKNyRcmwZlI+QY8+mCL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Wed, 1 Feb 2012 11:50:07 +0200
Subject: [PATCH] mtd: fix merge conflict resolution breakage

This patch fixes merge conflict resolution breakage introduced by merge
commit 'd3712b9dfcf44ca145cf87e7f4096fa2d923471a'.

The commit changed 'mtd_can_have_bb()' function and made it always return
zero, which is incorrect. Instead, we need it to return whether the
underlying flash device can have bad eraseblocks or not. UBI needs this
information because it affects how it handles the underlying flash.
E.g., if the underlying flash is NOR, it cannot have bad blocks and any
write or erase error is fatal, and all we can do is to switch to R/O
mode. We do not need to reserve a pool of good eraseblocks for bad
eraseblocks handling, and so on.

This patch also removes 'mtd_can_have_bb()' invocations from Logfs
to ensure correct Logfs behavior.

I've tested that with this patch UBI works on top of NOR and NAND
flashes emulated by mtdram and nandsim correspondingly.

This patch is based on patch from Linus Torvalds.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---

Linus, here is the emergency fix - basically your patch tested and
and slightly modified. You should probably put yourself as the author.

Also attached the patch for your convenience.

 fs/logfs/dev_mtd.c      |    6 ------
 include/linux/mtd/mtd.h |    2 +-
 2 files changed, 1 insertions(+), 7 deletions(-)

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
index c09020a..d43dc25 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -487,7 +487,7 @@ static inline int mtd_has_oob(const struct mtd_info *mt=
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
1.7.9

--=-4TKNyRcmwZlI+QY8+mCL
Content-Disposition: attachment; filename="0001-mtd-fix-mtd_can_have_bb.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="0001-mtd-fix-mtd_can_have_bb.patch"; charset="UTF-8"

RnJvbSAxOTFiOTBkNTljYjk3YjgzZDVmOTc5ZDQ2OTQwZDBiYWIyYjAyYjE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQXJ0ZW0gQml0eXV0c2tpeSA8YXJ0ZW0uYml0eXV0c2tpeUBs
aW51eC5pbnRlbC5jb20+DQpEYXRlOiBXZWQsIDEgRmViIDIwMTIgMTE6NTA6MDcgKzAyMDANClN1
YmplY3Q6IFtQQVRDSF0gbXRkOiBmaXggbWVyZ2UgY29uZmxpY3QgcmVzb2x1dGlvbiBicmVha2Fn
ZQ0KDQpUaGlzIHBhdGNoIGZpeGVzIG1lcmdlIGNvbmZsaWN0IHJlc29sdXRpb24gYnJlYWthZ2Ug
aW50cm9kdWNlZCBieSBtZXJnZQ0KY29tbWl0ICdkMzcxMmI5ZGZjZjQ0Y2ExNDVjZjg3ZTdmNDA5
NmZhMmQ5MjM0NzFhJy4NCg0KVGhlIGNvbW1pdCBjaGFuZ2VkICdtdGRfY2FuX2hhdmVfYmIoKScg
ZnVuY3Rpb24gYW5kIG1hZGUgaXQgYWx3YXlzIHJldHVybg0KemVybywgd2hpY2ggaXMgaW5jb3Jy
ZWN0LiBJbnN0ZWFkLCB3ZSBuZWVkIGl0IHRvIHJldHVybiB3aGV0aGVyIHRoZQ0KdW5kZXJseWlu
ZyBmbGFzaCBkZXZpY2UgY2FuIGhhdmUgYmFkIGVyYXNlYmxvY2tzIG9yIG5vdC4gVUJJIG5lZWRz
IHRoaXMNCmluZm9ybWF0aW9uIGJlY2F1c2UgaXQgYWZmZWN0cyBob3cgaXQgaGFuZGxlcyB0aGUg
dW5kZXJseWluZyBmbGFzaC4NCkUuZy4sIGlmIHRoZSB1bmRlcmx5aW5nIGZsYXNoIGlzIE5PUiwg
aXQgY2Fubm90IGhhdmUgYmFkIGJsb2NrcyBhbmQgYW55DQp3cml0ZSBvciBlcmFzZSBlcnJvciBp
cyBmYXRhbCwgYW5kIGFsbCB3ZSBjYW4gZG8gaXMgdG8gc3dpdGNoIHRvIFIvTw0KbW9kZS4gV2Ug
ZG8gbm90IG5lZWQgdG8gcmVzZXJ2ZSBhIHBvb2wgb2YgZ29vZCBlcmFzZWJsb2NrcyBmb3IgYmFk
DQplcmFzZWJsb2NrcyBoYW5kbGluZywgYW5kIHNvIG9uLg0KDQpUaGlzIHBhdGNoIGFsc28gcmVt
b3ZlcyAnbXRkX2Nhbl9oYXZlX2JiKCknIGludm9jYXRpb25zIGZyb20gTG9nZnMNCnRvIGVuc3Vy
ZSBjb3JyZWN0IExvZ2ZzIGJlaGF2aW9yLg0KDQpJJ3ZlIHRlc3RlZCB0aGF0IHdpdGggdGhpcyBw
YXRjaCBVQkkgd29ya3Mgb24gdG9wIG9mIE5PUiBhbmQgTkFORA0KZmxhc2hlcyBlbXVsYXRlZCBi
eSBtdGRyYW0gYW5kIG5hbmRzaW0gY29ycmVzcG9uZGluZ2x5Lg0KDQpUaGlzIHBhdGNoIGlzIGJh
c2VkIG9uIHBhdGNoIGZyb20gTGludXMgVG9ydmFsZHMuDQoNClNpZ25lZC1vZmYtYnk6IEFydGVt
IEJpdHl1dHNraXkgPGFydGVtLmJpdHl1dHNraXlAbGludXguaW50ZWwuY29tPg0KLS0tDQogZnMv
bG9nZnMvZGV2X210ZC5jICAgICAgfCAgICA2IC0tLS0tLQ0KIGluY2x1ZGUvbGludXgvbXRkL210
ZC5oIHwgICAgMiArLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZnMvbG9nZnMvZGV2X210ZC5jIGIvZnMvbG9nZnMvZGV2
X210ZC5jDQppbmRleCBlOTc0MDRkLi45YzUwMTQ0IDEwMDY0NA0KLS0tIGEvZnMvbG9nZnMvZGV2
X210ZC5jDQorKysgYi9mcy9sb2dmcy9kZXZfbXRkLmMNCkBAIC0xNTIsOSArMTUyLDYgQEAgc3Rh
dGljIHN0cnVjdCBwYWdlICpsb2dmc19tdGRfZmluZF9maXJzdF9zYihzdHJ1Y3Qgc3VwZXJfYmxv
Y2sgKnNiLCB1NjQgKm9mcykNCiAJZmlsbGVyX3QgKmZpbGxlciA9IGxvZ2ZzX210ZF9yZWFkcGFn
ZTsNCiAJc3RydWN0IG10ZF9pbmZvICptdGQgPSBzdXBlci0+c19tdGQ7DQogDQotCWlmICghbXRk
X2Nhbl9oYXZlX2JiKG10ZCkpDQotCQlyZXR1cm4gTlVMTDsNCi0NCiAJKm9mcyA9IDA7DQogCXdo
aWxlIChtdGRfYmxvY2tfaXNiYWQobXRkLCAqb2ZzKSkgew0KIAkJKm9mcyArPSBtdGQtPmVyYXNl
c2l6ZTsNCkBAIC0xNzIsOSArMTY5LDYgQEAgc3RhdGljIHN0cnVjdCBwYWdlICpsb2dmc19tdGRf
ZmluZF9sYXN0X3NiKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHU2NCAqb2ZzKQ0KIAlmaWxsZXJf
dCAqZmlsbGVyID0gbG9nZnNfbXRkX3JlYWRwYWdlOw0KIAlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9
IHN1cGVyLT5zX210ZDsNCiANCi0JaWYgKCFtdGRfY2FuX2hhdmVfYmIobXRkKSkNCi0JCXJldHVy
biBOVUxMOw0KLQ0KIAkqb2ZzID0gbXRkLT5zaXplIC0gbXRkLT5lcmFzZXNpemU7DQogCXdoaWxl
IChtdGRfYmxvY2tfaXNiYWQobXRkLCAqb2ZzKSkgew0KIAkJKm9mcyAtPSBtdGQtPmVyYXNlc2l6
ZTsNCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaCBiL2luY2x1ZGUvbGludXgv
bXRkL210ZC5oDQppbmRleCBjMDkwMjBhLi5kNDNkYzI1IDEwMDY0NA0KLS0tIGEvaW5jbHVkZS9s
aW51eC9tdGQvbXRkLmgNCisrKyBiL2luY2x1ZGUvbGludXgvbXRkL210ZC5oDQpAQCAtNDg3LDcg
KzQ4Nyw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IG10ZF9oYXNfb29iKGNvbnN0IHN0cnVjdCBtdGRf
aW5mbyAqbXRkKQ0KIA0KIHN0YXRpYyBpbmxpbmUgaW50IG10ZF9jYW5faGF2ZV9iYihjb25zdCBz
dHJ1Y3QgbXRkX2luZm8gKm10ZCkNCiB7DQotCXJldHVybiAwOw0KKwlyZXR1cm4gISFtdGQtPmJs
b2NrX2lzYmFkOw0KIH0NCiANCiAJLyogS2VybmVsLXNpZGUgaW9jdGwgZGVmaW5pdGlvbnMgKi8N
Ci0tIA0KMS43LjkNCg0K


--=-4TKNyRcmwZlI+QY8+mCL--

--=-dfbwfl2E2XceuEClPZp9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPKTYDAAoJECmIfjd9wqK0iOEQAJzdulhhWzXGXL5nXv3KqvZD
gh5DbdI0+gPzFqWPEJa9H7U1t6tLTAoUUe9p5BdmDT33mUg1yvbqMJIG9lo0hH+q
RS5cW57LYbCWxkuQjy4DNi2l8RC0O1DjhF0n76hjsCCmaKECZgwK/K+7lX8uwS08
Rmz+8INhAwsdt7Vy8LEItYOko+bZCauXEfpQeYgpf7bU7+jZrq6O3V75mJetgtUm
/mwe+cZnH1pPZQu6KMIjSAZ2D5w1XuQWGEcl2+CzwCXJ/lVEs7VBFpuWksu4gKWs
8toStwt6lUFE5tpUInSQu5OYfc5ceIvLff8cxCSRq0WC0usGEEO/dbl6sRiaHstB
mnWId19cbSB08kAjLhRZ/MUjZzR3+t9cuZq6SPAX7UAvN8cJh/wVg7sGm9wwykCd
0PM8R8yF4EfwVUQiTaEPQMi2YEQlEHrs6PSk30+kio0wF0RwyOKJpF79YWQbHxE7
1R9cRUrClg8RdNCExB7SltT4cJJjhAfuqvMTGshff5kcDyHnuZ1v7N/kWQIn0ZlE
ranhVkf9AZfFKLOJGJCGDdNpjUmeD4ZGKUs1keEG4YPgDixiU2bNvVvfTVM3U91I
mmux1SUfCiRvxxDi8RNx7cFSrJEa5TqAB+xP5y4dyWO4n9FA9iEJC2dX/jd96Sti
f/cuvy3vHISgH1yAOnRJ
=vvEw
-----END PGP SIGNATURE-----

--=-dfbwfl2E2XceuEClPZp9--
