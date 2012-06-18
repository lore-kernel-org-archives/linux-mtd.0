Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SgepT-0006Cc-Vb
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 16:29:28 +0000
Message-ID: <4FDF5764.6090404@nod.at>
Date: Mon, 18 Jun 2012 18:29:24 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: UBI fastmap torture script
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig64F8A66AD58B6F74135DF176"
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig64F8A66AD58B6F74135DF176
Content-Type: multipart/mixed;
 boundary="------------080108070200010208080207"

This is a multi-part message in MIME format.
--------------080108070200010208080207
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi!

If you want to test UBI fastmap you can use my torture.sh script.
Please adjust it to your needs (N, MTD device, UBI device, volume size).
WARNING: It erases the MTD device!

paranoia.diff is also very useful to catch errors.
It turns all ubi_asserts() into BUG() and adds an extra self check to det=
ect
duplicated PEBs.
Also bit flip emulation and all other UBI self-checks are enabled by defa=
ult.

Have fun!
//richard



--------------080108070200010208080207
Content-Type: application/x-shellscript;
 name="torture.sh"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="torture.sh"

Iy9iaW4vYmFzaAoKc2V0IC1lCgpOPTEwCgpmdW5jdGlvbiBkb19hdHRhY2goKQp7Cgl1Ymlh
dHRhY2ggLW0gMCAvZGV2L3ViaV9jdHJsCgl1YmlkZXRhY2ggLW0gMCAvZGV2L3ViaV9jdHJs
Cn0KCmZ1bmN0aW9uIGRvX21vdW50MSgpCnsKCXViaWF0dGFjaCAtbSAwIC9kZXYvdWJpX2N0
cmwKCW1vdW50IC9kZXYvdWJpMF8wIC9tbnQvIC10IHViaWZzCgl1bW91bnQgL21udAoJdWJp
ZGV0YWNoIC1tIDAgL2Rldi91YmlfY3RybAp9CgpmdW5jdGlvbiBkb19tb3VudDIoKQp7Cgl1
YmlhdHRhY2ggLW0gMCAvZGV2L3ViaV9jdHJsCgltb3VudCAvZGV2L3ViaTBfMCAvbW50LyAt
dCB1YmlmcwoJdW1vdW50IC9tbnQKCW1vdW50IC9kZXYvdWJpMF8wIC9tbnQvIC10IHViaWZz
Cgl1bW91bnQgL21udAoJbW91bnQgL2Rldi91YmkwXzAgL21udC8gLXQgdWJpZnMKCXVtb3Vu
dCAvbW50Cgltb3VudCAvZGV2L3ViaTBfMCAvbW50LyAtdCB1YmlmcwoJdW1vdW50IC9tbnQK
CW1vdW50IC9kZXYvdWJpMF8wIC9tbnQvIC10IHViaWZzCgl1bW91bnQgL21udAoJbW91bnQg
L2Rldi91YmkwXzAgL21udC8gLXQgdWJpZnMKCXVtb3VudCAvbW50Cgltb3VudCAvZGV2L3Vi
aTBfMCAvbW50LyAtdCB1YmlmcwoJdW1vdW50IC9tbnQKCXViaWRldGFjaCAtbSAwIC9kZXYv
dWJpX2N0cmwKfQoKZnVuY3Rpb24gZG9fbW91bnRfd3JpdGUxKCkKewoJdWJpYXR0YWNoIC1t
IDAgL2Rldi91YmlfY3RybAoJbW91bnQgL2Rldi91YmkwXzAgL21udC8gLXQgdWJpZnMKCXJt
IC1mIHgKCWRkIGlmPS9kZXYvdXJhbmRvbSBvZj0vbW50L3ggYnM9MU0gY291bnQ9MQoJZGQg
aWY9L2Rldi91cmFuZG9tIG9mPS9tbnQveCBicz0xTSBjb3VudD0yCglkZCBpZj0vZGV2L3Vy
YW5kb20gb2Y9L21udC94IGJzPTFNIGNvdW50PTEwCglkZCBpZj0vZGV2L3VyYW5kb20gb2Y9
L21udC94IGJzPTFNIGNvdW50PTMwCglybSAtZiB4Cgl1bW91bnQgL21udAoJdWJpZGV0YWNo
IC1tIDAgL2Rldi91YmlfY3RybAp9CgpmdW5jdGlvbiBkb19tb3VudF93cml0ZTIoKQp7Cgl1
YmlhdHRhY2ggLW0gMCAvZGV2L3ViaV9jdHJsCgltb3VudCAvZGV2L3ViaTBfMCAvbW50LyAt
dCB1YmlmcwoJcm0gLWYgYSBiIGMgZAoJZGQgaWY9L2Rldi91cmFuZG9tIG9mPS9tbnQvYSBi
cz0xTSBjb3VudD0xMAoJZGQgaWY9L2Rldi91cmFuZG9tIG9mPS9tbnQvYiBicz0xTSBjb3Vu
dD0xCglkZCBpZj0vZGV2L3VyYW5kb20gb2Y9L21udC9kIGJzPTFNIGNvdW50PTIwCglkZCBp
Zj0vZGV2L3VyYW5kb20gb2Y9L21udC9jIGJzPTFNIGNvdW50PTEwCglybSAtZiBhIGIgYyBk
Cgl1bW91bnQgL21udAoJdWJpZGV0YWNoIC1tIDAgL2Rldi91YmlfY3RybAp9CgpmbGFzaF9l
cmFzZWFsbCAvZGV2L210ZDAKCnViaWF0dGFjaCAtbSAwIC9kZXYvdWJpX2N0cmwKdWJpbWt2
b2wgLU4gdGVzdCAtcyAxMDBNaUIgL2Rldi91YmkwCm1rZnMudWJpZnMgL2Rldi91YmkwXzAK
dWJpZGV0YWNoIC1tIDAgL2Rldi91YmlfY3RybAoKZm9yIGkgaW4gYHNlcSAxICROYCA7IGRv
Cglkb19hdHRhY2gKZG9uZQoKZm9yIGkgaW4gYHNlcSAxICROYCA7IGRvCglkb19tb3VudDEK
ZG9uZQoKZm9yIGkgaW4gYHNlcSAxICROYCA7IGRvCglkb19tb3VudDIKZG9uZQoKZm9yIGkg
aW4gYHNlcSAxICROYCA7IGRvCglkb19tb3VudF93cml0ZTEKZG9uZQoKZm9yIGkgaW4gYHNl
cSAxICROYCA7IGRvCglkb19tb3VudF93cml0ZTIKZG9uZQoKZm9yIGkgaW4gYHNlcSAxICRO
YCA7IGRvCglkb19hdHRhY2gKCWRvX21vdW50MQoJZG9fbW91bnQyCglkb19tb3VudF93cml0
ZTEKCWRvX21vdW50X3dyaXRlMgpkb25lCgplY2hvICJTdGlsbCBhbGl2ZT8iCg==
--------------080108070200010208080207
Content-Type: text/x-patch;
 name="paranoia.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="paranoia.diff"

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 1ad128d..1acefaf 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -928,6 +928,9 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_=
num, int vid_hdr_offset)
 	if (err)
 		goto out_free;
=20
+	ubi->dbg->chk_gen =3D 1;
+	ubi->dbg->emulate_bitflips =3D 1;
+
 	err =3D ubi_attach(ubi);
 	if (err) {
 		ubi_err("failed to attach mtd%d, error %d", mtd->index, err);
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index d5d2645..a4fac6e 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -31,7 +31,7 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr=
);
 	if (unlikely(!(expr))) {                                             \
 		printk(KERN_CRIT "UBI assert failed in %s at %u (pid %d)\n", \
 		       __func__, __LINE__, current->pid);                    \
-		dump_stack();                                                \
+		BUG();                                                \
 	}                                                                    \
 } while (0)
=20
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index f4d2c79..7b49665 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1632,7 +1632,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_=
attach_info *ai)
 	int err, i, found_pebs =3D 0;
 	struct rb_node *rb1, *rb2;
 	struct ubi_ainf_volume *av;
-	struct ubi_ainf_peb *aeb, *tmp;
+	struct ubi_ainf_peb *aeb, *tmp, *x;
 	struct ubi_wl_entry *e;
=20
 	ubi->used =3D ubi->erroneous =3D ubi->free =3D ubi->scrub =3D RB_ROOT;
@@ -1653,6 +1653,28 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi=
_attach_info *ai)
 		INIT_LIST_HEAD(&ubi->pq[i]);
 	ubi->pq_head =3D 0;
=20
+	ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb) {
+		ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb) {
+			list_for_each_entry(x, &ai->erase, u.list) {
+				if (x->pnum =3D=3D aeb->pnum) {
+					ubi_err("PEB: %i is in used/scrub and erase!", x->pnum);
+				}
+			}
+			list_for_each_entry(x, &ai->free, u.list) {
+				if (x->pnum =3D=3D aeb->pnum) {
+					ubi_err("PEB: %i is in used/scrub and free!", x->pnum);
+				}
+			}
+		}
+	}
+	list_for_each_entry(aeb, &ai->erase, u.list) {
+		list_for_each_entry(x, &ai->free, u.list) {
+			if (x->pnum =3D=3D aeb->pnum) {
+				ubi_err("PEB: %i is in erase and free!", x->pnum);
+			}
+		}
+	}
+
 	list_for_each_entry_safe(aeb, tmp, &ai->erase, u.list) {
 		cond_resched();
=20
@@ -1819,7 +1841,7 @@ static int self_check_ec(struct ubi_device *ubi, in=
t pnum, int ec)
 	if (ec !=3D read_ec && read_ec - ec > 1) {
 		ubi_err("self-check failed for PEB %d", pnum);
 		ubi_err("read EC is %lld, should be %d", read_ec, ec);
-		dump_stack();
+		BUG();
 		err =3D 1;
 	} else
 		err =3D 0;
@@ -1849,7 +1871,7 @@ static int self_check_in_wl_tree(const struct ubi_d=
evice *ubi,
=20
 	ubi_err("self-check failed for PEB %d, EC %d, RB-tree %p ",
 		e->pnum, e->ec, root);
-	dump_stack();
+	BUG();
 	return -EINVAL;
 }
=20
@@ -1877,6 +1899,6 @@ static int self_check_in_pq(const struct ubi_device=
 *ubi,
=20
 	ubi_err("self-check failed for PEB %d, EC %d, Protect queue",
 		e->pnum, e->ec);
-	dump_stack();
+	BUG();
 	return -EINVAL;
 }

--------------080108070200010208080207--

--------------enig64F8A66AD58B6F74135DF176
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJP31dlAAoJEN9758yqZn9epDEIAMiHpH2CJGc+MRK4XSB0tzTK
8Glvo47osSe4BZD0uotbDqqOftUVdZz80+CGsc5xjTlKggvs1i9yDtsvQ8hX74zR
ObPYKaRMboG9DfpIrONRsozx3SmmrAT/tp9XJMvG7MbMq1/cyrOfydfWfAwzpIjW
TwMdZWYyiyWB3zhz1Rk/B4R7hSodtOwPR8bys9lNfL8BNjXe7JM7ilF5kQuX6KgV
O75YEEa/TKFCEesq+3Do5bAluzGpUw7a94XQOU5HVVzly+dhLWKstzo2L2/1hdQe
0A4QO1hS2hOxmokCIvVwuDpUB+wYlWbiWObYVOz5ydlc7KDvn3vjSZVG9dVeTxk=
=ATbD
-----END PGP SIGNATURE-----

--------------enig64F8A66AD58B6F74135DF176--
