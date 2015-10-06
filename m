Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjR7u-00010Y-9G
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2015 12:13:51 +0000
Received: from localhost (localhost [127.0.0.1])
 by bes.se.axis.com (Postfix) with ESMTP id 18B1B2E0A6
 for <linux-mtd@lists.infradead.org>; Tue,  6 Oct 2015 14:13:26 +0200 (CEST)
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
 by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id fo8GeAY538Ey for <linux-mtd@lists.infradead.org>;
 Tue,  6 Oct 2015 14:13:25 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
 by bes.se.axis.com (Postfix) with ESMTP id C693B2E0A4
 for <linux-mtd@lists.infradead.org>; Tue,  6 Oct 2015 14:13:24 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
 by postfix.imss71 (Postfix) with ESMTP id A1ADE1289
 for <linux-mtd@lists.infradead.org>; Tue,  6 Oct 2015 14:13:24 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
 by boulder.se.axis.com (Postfix) with ESMTP id 93E17122B
 for <linux-mtd@lists.infradead.org>; Tue,  6 Oct 2015 14:13:24 +0200 (CEST)
Received: from xmail4.se.axis.com (xmail4.se.axis.com [10.0.5.46])
 by thoth.se.axis.com (Postfix) with ESMTP id 910D834009
 for <linux-mtd@lists.infradead.org>; Tue,  6 Oct 2015 14:13:24 +0200 (CEST)
From: Marcus Prebble <marcus.prebble@axis.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: =?utf-8?B?UmljYXJkIFdhbmRlcmzDtmY=?= <ricardw@axis.com>
Date: Tue, 6 Oct 2015 14:13:23 +0200
Subject: [PATCH] mtd-utils: lib: mtd_read: Take the buffer offset into
 account when reading
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7B9E316CFDF@xmail3.se.axis.com>
Content-Language: en-US
Content-Type: multipart/mixed;
 boundary="_002_A612847CFE53224C91B23E3A5B48BAC7B9E316CFDFxmail3seaxisc_"
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--_002_A612847CFE53224C91B23E3A5B48BAC7B9E316CFDFxmail3seaxisc_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgbXRkLWxpc3QsCgpBc3N1bWluZyB0aGUgcmVhZCgpIGNhbGwgZG9lcyBub3QgcmV0dXJuIHpl
cm8gYW5kIHRoZSByZXN1bHQgaXMgbGVzcwp0aGFuIGxlbiwgdGhlIGN1cnJlbnQgaW1wbGVtZW50
YXRpb24gd2lsbCBvdmVyd3JpdGUgdGhlIGRhdGEgYWxyZWFkeQpyZWFkIGluIGJ1ZiB3aGljaCBk
b2Vzbid0IHNlZW0gY29ycmVjdC4KClN1Z2dlc3RlZCBwYXRjaCBhdHRhY2hlZCAoZ2l0IGZvcm1h
dC1wYXRjaCkKCi1NYXJjdXMK

--_002_A612847CFE53224C91B23E3A5B48BAC7B9E316CFDFxmail3seaxisc_
Content-Type: text/x-patch;
	name="0001-mtd_read-Take-the-buffer-offset-into-account-when-re.patch"
Content-Description: 0001-mtd_read-Take-the-buffer-offset-into-account-when-re.patch
Content-Disposition: attachment;
	filename="0001-mtd_read-Take-the-buffer-offset-into-account-when-re.patch";
	size=944; creation-date="Tue, 06 Oct 2015 12:13:23 GMT";
	modification-date="Tue, 06 Oct 2015 12:13:23 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1ZGNjYmJkODc2MDQ2NjVlODk2NDcyZDUyZjMzNTFjMTRjMjRkMmIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJjdXMgUHJlYmJsZSA8cHJlYmJsZUBheGlzLmNvbT4KRGF0
ZTogTW9uLCA1IE9jdCAyMDE1IDE3OjMyOjU0ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gbXRkX3Jl
YWQ6IFRha2UgdGhlIGJ1ZmZlciBvZmZzZXQgaW50byBhY2NvdW50IHdoZW4gcmVhZGluZwoKU3Vi
c2VxdWVudCBjYWxscyB0byByZWFkKCkgd2l0aGluIHRoZSBsb29wIHdpbGwgbm93IG5vIGxvbmdl
cgpvdmVyd3JpdGUgdGhlIGV4aXN0aW5nIGNvbnRlbnRzIG9mIGJ1Zi4KLS0tCiBsaWIvbGlibXRk
LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvbGliL2xpYm10ZC5jIGIvbGliL2xpYm10ZC5jCmluZGV4IDYwYjQ3
ODIuLmJmNmQ3MWYgMTAwNjQ0Ci0tLSBhL2xpYi9saWJtdGQuYworKysgYi9saWIvbGlibXRkLmMK
QEAgLTEwNzIsMTAgKzEwNzIsMTAgQEAgaW50IG10ZF9yZWFkKGNvbnN0IHN0cnVjdCBtdGRfZGV2
X2luZm8gKm10ZCwgaW50IGZkLCBpbnQgZWIsIGludCBvZmZzLAogCQkJCSAgbXRkLT5tdGRfbnVt
LCBzZWVrKTsKIAogCXdoaWxlIChyZCA8IGxlbikgewotCQlyZXQgPSByZWFkKGZkLCBidWYsIGxl
bik7CisJCXJldCA9IHJlYWQoZmQsIGJ1ZiArIHJkLCBsZW4gLSByZCk7CiAJCWlmIChyZXQgPCAw
KQogCQkJcmV0dXJuIHN5c19lcnJtc2coImNhbm5vdCByZWFkICVkIGJ5dGVzIGZyb20gbXRkJWQg
KGVyYXNlYmxvY2sgJWQsIG9mZnNldCAlZCkiLAotCQkJCQkgIGxlbiwgbXRkLT5tdGRfbnVtLCBl
Yiwgb2Zmcyk7CisJCQkJCSAgbGVuIC0gcmQsIG10ZC0+bXRkX251bSwgZWIsIG9mZnMgKyByZCk7
CiAJCXJkICs9IHJldDsKIAl9CiAKLS0gCjIuMS40Cgo=

--_002_A612847CFE53224C91B23E3A5B48BAC7B9E316CFDFxmail3seaxisc_--
