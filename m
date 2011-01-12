Received: from mail160.messagelabs.com ([216.82.253.99])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pcovn-00079L-Ht
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2011 00:51:20 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date: Tue, 11 Jan 2011 18:46:10 -0600
Subject: [PATCH] mtd_blkdevs: local symbols should be static
Message-ID: <0D753D10438DA54287A00B027084269764CE0E550B@AUSP01VMBX24.collaborationhost.net>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

VGhlIGZ1bmN0aW9uIGJsa3RyYW5zX2Rldl9yZWxlYXNlIGFuZCBibGt0cmFuc19kZXZfcHV0IGFy
ZSBvbmx5IHVzZWQNCmxvY2FsbHkgaW4gdGhpcyBmaWxlIGFuZCBzaG91bGQgYmUgc3RhdGljLg0K
DQpTaWduZWQtb2ZmLWJ5OiBIIEhhcnRsZXkgU3dlZXRlbiA8aHN3ZWV0ZW5AdmlzaW9uZW5ncmF2
ZXJzLmNvbT4NCkNjOiBEYXZpZCBXb29kaG91c2UgPGR3bXcyQGluZnJhZGVhZC5vcmc+DQoNCi0t
LQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYyBiL2RyaXZlcnMvbXRk
L210ZF9ibGtkZXZzLmMNCmluZGV4IGNiMjBjNjcuLjNiY2RmNmMgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL210ZC9tdGRfYmxrZGV2cy5jDQorKysgYi9kcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jDQpA
QCAtNDAsNyArNDAsNyBAQA0KIHN0YXRpYyBMSVNUX0hFQUQoYmxrdHJhbnNfbWFqb3JzKTsNCiBz
dGF0aWMgREVGSU5FX01VVEVYKGJsa3RyYW5zX3JlZl9tdXRleCk7DQogDQotdm9pZCBibGt0cmFu
c19kZXZfcmVsZWFzZShzdHJ1Y3Qga3JlZiAqa3JlZikNCitzdGF0aWMgdm9pZCBibGt0cmFuc19k
ZXZfcmVsZWFzZShzdHJ1Y3Qga3JlZiAqa3JlZikNCiB7DQogCXN0cnVjdCBtdGRfYmxrdHJhbnNf
ZGV2ICpkZXYgPQ0KIAkJY29udGFpbmVyX29mKGtyZWYsIHN0cnVjdCBtdGRfYmxrdHJhbnNfZGV2
LCByZWYpOw0KQEAgLTY3LDcgKzY3LDcgQEAgdW5sb2NrOg0KIAlyZXR1cm4gZGV2Ow0KIH0NCiAN
Ci12b2lkIGJsa3RyYW5zX2Rldl9wdXQoc3RydWN0IG10ZF9ibGt0cmFuc19kZXYgKmRldikNCitz
dGF0aWMgdm9pZCBibGt0cmFuc19kZXZfcHV0KHN0cnVjdCBtdGRfYmxrdHJhbnNfZGV2ICpkZXYp
DQogew0KIAltdXRleF9sb2NrKCZibGt0cmFuc19yZWZfbXV0ZXgpOw0KIAlrcmVmX3B1dCgmZGV2
LT5yZWYsIGJsa3RyYW5zX2Rldl9yZWxlYXNlKTsNCg==
