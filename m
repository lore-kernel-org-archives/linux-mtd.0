Received: from p01c12o141.mxlogic.net ([208.65.145.64])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NxpdO-0001EB-5u
	for linux-mtd@lists.infradead.org; Fri, 02 Apr 2010 22:46:39 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, lkml
	<linux-kernel@vger.kernel.org>
Date: Fri, 2 Apr 2010 17:46:30 -0500
Subject: [PATCH] mtd/maps/physmap: catch failure to register
	MTD_PHYSMAP_COMPAT device
Message-ID: <0D753D10438DA54287A00B0270842697636A7E9D36@AUSP01VMBX24.collaborationhost.net>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "randy.dunlap@oracle.com" <randy.dunlap@oracle.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SWYgdGhlIGRlZmF1bHQgS2NvbmZpZyB2YWx1ZXMgYXJlIHVzZWQgd2l0aCBNVERfUEhZU01BUF9D
T01QQVQgeW91IGVuZA0KdXAgd2l0aCBhIHJlc291cmNlIHdoZXJlIGVuZCA8IHN0YXJ0LiAgVGhp
cyBjYXVzZXMgX19yZXF1ZXN0X3Jlc291cmNlIHRvDQpyZXR1cm4gYSBjb25mbGljdCB3aGljaCB0
aGVuIHJldHVybnMgYW4gLUVCVVNZIGVycm9yIGNvZGUuICBUaGUgY3VycmVudA0KcGh5c21hcC5j
IGNvZGUganVzdCBhc3N1bWVzIHRoYXQgdGhlIHBsYXRmb21fZGV2aWNlX3JlZ2lzdGVyIHdpbGwg
YWx3YXlzDQpzdWNjZWVkLg0KDQpDYXRjaCB0aGlzIGZhaWx1cmUgZHVyaW5nIHRoZSBwaHlzbWFw
X2luaXQgYW5kIHByb3BvZ2F0ZSB0aGUgZXJyb3IuDQoNClNpZ25lZC1vZmYtYnk6IEggSGFydGxl
eSBTd2VldGVuIDxoc3dlZXRlbkB2aXNpb25lbmdyYXZlcnMuY29tPg0KQ2M6IERhdmlkIFdvb2Ro
b3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4NClJlcG9ydGVkLWJ5OiBSYW5keSBEdW5sYXAgPHJh
bmR5LmR1bmxhcEBvcmFjbGUuY29tPg0KDQotLS0NCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L21hcHMvcGh5c21hcC5jIGIvZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLmMNCmluZGV4IGQ5NjAz
ZjcuLjQyNjQ2MWEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL210ZC9tYXBzL3BoeXNtYXAuYw0KKysr
IGIvZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLmMNCkBAIC0yNjQsOCArMjY0LDExIEBAIHN0YXRp
YyBpbnQgX19pbml0IHBoeXNtYXBfaW5pdCh2b2lkKQ0KIA0KIAllcnIgPSBwbGF0Zm9ybV9kcml2
ZXJfcmVnaXN0ZXIoJnBoeXNtYXBfZmxhc2hfZHJpdmVyKTsNCiAjaWZkZWYgQ09ORklHX01URF9Q
SFlTTUFQX0NPTVBBVA0KLQlpZiAoZXJyID09IDApDQotCQlwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0
ZXIoJnBoeXNtYXBfZmxhc2gpOw0KKwlpZiAoZXJyID09IDApIHsNCisJCWVyciA9IHBsYXRmb3Jt
X2RldmljZV9yZWdpc3RlcigmcGh5c21hcF9mbGFzaCk7DQorCQlpZiAoZXJyKQ0KKwkJCXBsYXRm
b3JtX2RyaXZlcl91bnJlZ2lzdGVyKCZwaHlzbWFwX2ZsYXNoX2RyaXZlcik7DQorCX0NCiAjZW5k
aWYNCiANCiAJcmV0dXJuIGVycjsNCg==
