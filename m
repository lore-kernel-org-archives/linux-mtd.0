Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLZtD-0006o3-Vv
 for linux-mtd@lists.infradead.org; Tue, 09 Oct 2012 13:30:29 +0000
Message-ID: <1349789437.1992.116.camel@sauron.fi.intel.com>
Subject: Re: UBIFS Recovery Issue: 'grab_empty_leb: could not find an empty
 LEB'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brent Taylor <motobud@gmail.com>
Date: Tue, 09 Oct 2012 16:30:37 +0300
In-Reply-To: <CAP+RiCDHZYMZPFYmE6YfkLoA1gH=z8cTSRZ+9iQqQ=ei1xXFYg@mail.gmail.com>
References: <CAP+RiCC1afVbKAZESMcZGd1G3+7aKuLTQGggOEFGZxQM6o+QQA@mail.gmail.com>
 <1346413469.9709.44.camel@sauron.fi.intel.com>
 <CAP+RiCBRopbShAGf_fWCvK2R=uPPR1j4Pz12JfJxdEMUjwofNw@mail.gmail.com>
 <CAP+RiCAzOKvV00F8zppPxrL1CHKqR6eU2g08F+s_wm2R6jJ7Cg@mail.gmail.com>
 <CAP+RiCDHZYMZPFYmE6YfkLoA1gH=z8cTSRZ+9iQqQ=ei1xXFYg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-K0ehf6SHA0wXFxNpY9O8"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-K0ehf6SHA0wXFxNpY9O8
Content-Type: multipart/mixed; boundary="=-ijb95OtuAaeAWvCOyeRB"


--=-ijb95OtuAaeAWvCOyeRB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-09-23 at 10:48 -0500, Brent Taylor wrote:
> Ping,  I just didn't want to get lost in the e-mail shuffle.

OK, Brent, here is the fix. I am sorry for so long delay. I simply
do not have enough time for my UBIFS hobby. And thank you for sending
me the image. The fix is attached.

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Tue, 9 Oct 2012 16:20:15 +0300
Subject: [PATCH] UBIFS: fix mounting problems after power cuts

This is a bugfix for a problem with the following symptoms:

1. A power cut happens
2. After reboot, we try to mount UBIFS
3. Mount fails with "No space left on device" error message

UBIFS complains like this:

UBIFS error (pid 28225): grab_empty_leb: could not find an empty LEB

The root cause of this problem is that when we mount, not all LEBs are
categorized. Only those which were read are. However, the
'ubifs_find_free_leb_for_idx()' function assumes that all LEBs were
categorized and 'c->freeable_cnt' is valid, which is a false assumption.

This patch fixes the problem by teaching 'ubifs_find_free_leb_for_idx()'
to always fall back to LPT scanning if no freeable LEBs were found.

This problem was reported by several people in the past, but Brent Taylor
was able to reproduce it and send me a flash image which cannot be mounted,
which made it easy to hunt the bug. Kudos to Brent.

Reported-by: Brent Taylor <motobud@gmail.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: stable@vger.kernel.org
---
 fs/ubifs/find.c |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/find.c b/fs/ubifs/find.c
index 28ec13a..959386b 100644
--- a/fs/ubifs/find.c
+++ b/fs/ubifs/find.c
@@ -682,12 +682,10 @@ int ubifs_find_free_leb_for_idx(struct ubifs_info *c)
 		lprops =3D ubifs_fast_find_freeable(c);
 		if (!lprops) {
 			ubifs_assert(c->freeable_cnt =3D=3D 0);
-			if (c->lst.empty_lebs - c->lst.taken_empty_lebs > 0) {
-				lprops =3D scan_for_leb_for_idx(c);
-				if (IS_ERR(lprops)) {
-					err =3D PTR_ERR(lprops);
-					goto out;
-				}
+			lprops =3D scan_for_leb_for_idx(c);
+			if (IS_ERR(lprops)) {
+				err =3D PTR_ERR(lprops);
+				goto out;
 			}
 		}
 	}
--=20
1.7.7.6



--=20
Best Regards,
Artem Bityutskiy

--=-ijb95OtuAaeAWvCOyeRB
Content-Disposition: attachment;
	filename="0001-UBIFS-fix-mounting-problems-after-power-cuts.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-UBIFS-fix-mounting-problems-after-power-cuts.patch";
	charset="UTF-8"

RnJvbSBlOGQ2YjBlNDYxNWJhMzhiMGQzZGQ2MjQ2NTE3YjM0NmM5MWU2YThkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQXJ0ZW0gQml0eXV0c2tpeSA8YXJ0ZW0uYml0eXV0c2tpeUBs
aW51eC5pbnRlbC5jb20+DQpEYXRlOiBUdWUsIDkgT2N0IDIwMTIgMTY6MjA6MTUgKzAzMDANClN1
YmplY3Q6IFtQQVRDSF0gVUJJRlM6IGZpeCBtb3VudGluZyBwcm9ibGVtcyBhZnRlciBwb3dlciBj
dXRzDQoNClRoaXMgaXMgYSBidWdmaXggZm9yIGEgcHJvYmxlbSB3aXRoIHRoZSBmb2xsb3dpbmcg
c3ltcHRvbXM6DQoNCjEuIEEgcG93ZXIgY3V0IGhhcHBlbnMNCjIuIEFmdGVyIHJlYm9vdCwgd2Ug
dHJ5IHRvIG1vdW50IFVCSUZTDQozLiBNb3VudCBmYWlscyB3aXRoICJObyBzcGFjZSBsZWZ0IG9u
IGRldmljZSIgZXJyb3IgbWVzc2FnZQ0KDQpVQklGUyBjb21wbGFpbnMgbGlrZSB0aGlzOg0KDQpV
QklGUyBlcnJvciAocGlkIDI4MjI1KTogZ3JhYl9lbXB0eV9sZWI6IGNvdWxkIG5vdCBmaW5kIGFu
IGVtcHR5IExFQg0KDQpUaGUgcm9vdCBjYXVzZSBvZiB0aGlzIHByb2JsZW0gaXMgdGhhdCB3aGVu
IHdlIG1vdW50LCBub3QgYWxsIExFQnMgYXJlDQpjYXRlZ29yaXplZC4gT25seSB0aG9zZSB3aGlj
aCB3ZXJlIHJlYWQgYXJlLiBIb3dldmVyLCB0aGUNCid1Ymlmc19maW5kX2ZyZWVfbGViX2Zvcl9p
ZHgoKScgZnVuY3Rpb24gYXNzdW1lcyB0aGF0IGFsbCBMRUJzIHdlcmUNCmNhdGVnb3JpemVkIGFu
ZCAnYy0+ZnJlZWFibGVfY250JyBpcyB2YWxpZCwgd2hpY2ggaXMgYSBmYWxzZSBhc3N1bXB0aW9u
Lg0KDQpUaGlzIHBhdGNoIGZpeGVzIHRoZSBwcm9ibGVtIGJ5IHRlYWNoaW5nICd1Ymlmc19maW5k
X2ZyZWVfbGViX2Zvcl9pZHgoKScNCnRvIGFsd2F5cyBmYWxsIGJhY2sgdG8gTFBUIHNjYW5uaW5n
IGlmIG5vIGZyZWVhYmxlIExFQnMgd2VyZSBmb3VuZC4NCg0KVGhpcyBwcm9ibGVtIHdhcyByZXBv
cnRlZCBieSBzZXZlcmFsIHBlb3BsZSBpbiB0aGUgcGFzdCwgYnV0IEJyZW50IFRheWxvcg0Kd2Fz
IGFibGUgdG8gcmVwcm9kdWNlIGl0IGFuZCBzZW5kIG1lIGEgZmxhc2ggaW1hZ2Ugd2hpY2ggY2Fu
bm90IGJlIG1vdW50ZWQsDQp3aGljaCBtYWRlIGl0IGVhc3kgdG8gaHVudCB0aGUgYnVnLiBLdWRv
cyB0byBCcmVudC4NCg0KUmVwb3J0ZWQtYnk6IEJyZW50IFRheWxvciA8bW90b2J1ZEBnbWFpbC5j
b20+DQpTaWduZWQtb2ZmLWJ5OiBBcnRlbSBCaXR5dXRza2l5IDxhcnRlbS5iaXR5dXRza2l5QGxp
bnV4LmludGVsLmNvbT4NCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQotLS0NCiBmcy91Ymlm
cy9maW5kLmMgfCAgIDEwICsrKystLS0tLS0NCiAxIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2ZpbmQuYyBiL2Zz
L3ViaWZzL2ZpbmQuYw0KaW5kZXggMjhlYzEzYS4uOTU5Mzg2YiAxMDA2NDQNCi0tLSBhL2ZzL3Vi
aWZzL2ZpbmQuYw0KKysrIGIvZnMvdWJpZnMvZmluZC5jDQpAQCAtNjgyLDEyICs2ODIsMTAgQEAg
aW50IHViaWZzX2ZpbmRfZnJlZV9sZWJfZm9yX2lkeChzdHJ1Y3QgdWJpZnNfaW5mbyAqYykNCiAJ
CWxwcm9wcyA9IHViaWZzX2Zhc3RfZmluZF9mcmVlYWJsZShjKTsNCiAJCWlmICghbHByb3BzKSB7
DQogCQkJdWJpZnNfYXNzZXJ0KGMtPmZyZWVhYmxlX2NudCA9PSAwKTsNCi0JCQlpZiAoYy0+bHN0
LmVtcHR5X2xlYnMgLSBjLT5sc3QudGFrZW5fZW1wdHlfbGVicyA+IDApIHsNCi0JCQkJbHByb3Bz
ID0gc2Nhbl9mb3JfbGViX2Zvcl9pZHgoYyk7DQotCQkJCWlmIChJU19FUlIobHByb3BzKSkgew0K
LQkJCQkJZXJyID0gUFRSX0VSUihscHJvcHMpOw0KLQkJCQkJZ290byBvdXQ7DQotCQkJCX0NCisJ
CQlscHJvcHMgPSBzY2FuX2Zvcl9sZWJfZm9yX2lkeChjKTsNCisJCQlpZiAoSVNfRVJSKGxwcm9w
cykpIHsNCisJCQkJZXJyID0gUFRSX0VSUihscHJvcHMpOw0KKwkJCQlnb3RvIG91dDsNCiAJCQl9
DQogCQl9DQogCX0NCi0tIA0KMS43LjcuNg0KDQo=


--=-ijb95OtuAaeAWvCOyeRB--

--=-K0ehf6SHA0wXFxNpY9O8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdCb9AAoJECmIfjd9wqK0AWMP/isCd/85UmqMOL1eIhbk5k20
YqjgxL+kkHboGouzeLLEaS+ProXMf52S5nyjGJTA1J/nl/EhMtmqEjYtkQJWiGsy
gAYs4h2IiLqVPqwjzQ66TxRlb2iqSmn3X+Ckrv7cLjV1xMzCy6mjse+14kXc2Uzs
+L5HHGQgiCKLbu9QUJXJvt8r5j2CtYxSZUGGc5yY8VDs0QNFwR2pEiFnMB3HcXRu
4GxBib5awpTM00wWHv1SaXS7XP0gxrRzdOnRGniUwDtBY99k2tQ6RLW3V8vC8fz1
QpChDSEGaPPmj5+8NeVUZVzTHBGb8X0mXUKuc+vzm4i+u/IQwkyUeex1LIiF9JOz
vRuxXvFLTX0VeYDw3ZDyn6WW87LGEvojL5gKSMzxR32ZYG5UPlpulma64gWXzcXF
DvUeDs5K+SkOCTI3aGSR/tkw+IRuJoh54IpDxNb5Um/JRvPdbPOTM7UOJ2O+Sjdc
UU6g6e/Oi2tgIpydWeQ5Vh/3XbMVBQujWivgQwhC25OlyppRY9KmLTVL+94xsVGB
sXmSBQ9zh7S7arOP4U6NJ0n13N5niy7TBwU3ClsiTTgVfNQafIp0vJBaQxxGoPIi
hBsKDtdDn0XNzFOW3RVqd5JM/NOziTO7prjh3u85RKhFFQdSqagugWmO/tnvo4pk
dq+V6bvHDpYawBKpvloL
=lST0
-----END PGP SIGNATURE-----

--=-K0ehf6SHA0wXFxNpY9O8--
