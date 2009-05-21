Received: from ey-out-1920.google.com ([74.125.78.148])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M7Ei3-0003xd-8v
	for linux-mtd@lists.infradead.org; Thu, 21 May 2009 20:17:54 +0000
Received: by ey-out-1920.google.com with SMTP id 13so287058eye.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 May 2009 13:17:45 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 21 May 2009 23:17:44 +0300
Message-ID: <7948530905211317h5bd9a395ta5b8575befed96c@mail.gmail.com>
Subject: [PATCH] [MTD] ONENAND: Fix devexit macro usage in OMAP OneNAND (was
	Re: [PATCH] OMAP OneNAND: add missing __devexit_p wrappers)
From: Mika Korhonen <mika.j.korhonen@gmail.com>
To: David Brownell <david-b@pacbell.net>
Content-Type: multipart/mixed; boundary=001485f724f03a3b4e046a71d698
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--001485f724f03a3b4e046a71d698
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/4/29 David Brownell <david-b@pacbell.net>:
> On Wednesday 29 April 2009, Adrian Hunter wrote:
>> + =A0 =A0 =A0 .shutdown =A0 =A0 =A0 =3D __devexit_p(omap2_onenand_shutdo=
wn),
>
> That looks wrong. =A0Shutdown functions shouldn't get discarded
> like exit functions. =A0I'd think the fix for that would be taking
> away any __devexit annotation on the shutdown function.
>
>

Here follows the revised patch, fixed as suggested.

Mika

--001485f724f03a3b4e046a71d698
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-Fix-devexit-macro-usage-in-OMAP-OneNAND.patch"
Content-Disposition: attachment;
	filename="0001-Fix-devexit-macro-usage-in-OMAP-OneNAND.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fuzwef1j0

RnJvbSAwOTAxNjFkY2MyOGY2ODVhOWIxZjE1YzJjNjUyOTI1ZjA1MmJkZjE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNaWthIEtvcmhvbmVuIDxtaWthLmoua29yaG9uZW5AZ21haWwu
Y29tPgpEYXRlOiBUaHUsIDIxIE1heSAyMDA5IDIzOjA5OjQyICswMzAwClN1YmplY3Q6IFtQQVRD
SF0gRml4IGRldmV4aXQgbWFjcm8gdXNhZ2UgaW4gT01BUCBPbmVOQU5ECgpBZGQgbWlzc2luZyBf
X2RldmV4aXRfcCB3cmFwcGVyIGFuZCBubyBtb3JlIG1hcmsgc2h1dGRvd24gd2l0aCBfX2RldmVz
aXQuCkZpeGVzIGJ1aWxkIGluIGNvbmZpZ3VyYXRpb25zIHdoZXJlIGRldmV4aXQgZnVuY3Rpb25z
IGdldCBkaXNjYXJkZWQuCgpTaWduZWQtb2ZmLWJ5OiBNaWthIEtvcmhvbmVuIDxtaWthLmoua29y
aG9uZW5AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvbXRkL29uZW5hbmQvb21hcDIuYyB8ICAgIDQg
KystLQogMSBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvb25lbmFuZC9vbWFwMi5jIGIvZHJpdmVycy9tdGQvb25l
bmFuZC9vbWFwMi5jCmluZGV4IGYyZTlkZTEuLmRmMjZkYjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bXRkL29uZW5hbmQvb21hcDIuYworKysgYi9kcml2ZXJzL210ZC9vbmVuYW5kL29tYXAyLmMKQEAg
LTU2Niw3ICs1NjYsNyBAQCBpbnQgb21hcDJfb25lbmFuZF9yZXBoYXNlKHZvaWQpCiAJCQkJICAg
ICAgTlVMTCwgX19hZGp1c3RfdGltaW5nKTsKIH0KIAotc3RhdGljIHZvaWQgX19kZXZleGl0IG9t
YXAyX29uZW5hbmRfc2h1dGRvd24oc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRp
YyB2b2lkIG9tYXAyX29uZW5hbmRfc2h1dGRvd24oc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIHsKIAlzdHJ1Y3Qgb21hcDJfb25lbmFuZCAqYyA9IGRldl9nZXRfZHJ2ZGF0YSgmcGRldi0+
ZGV2KTsKIApAQCAtNzc4LDcgKzc3OCw3IEBAIHN0YXRpYyBpbnQgX19kZXZleGl0IG9tYXAyX29u
ZW5hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIHN0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIG9tYXAyX29uZW5hbmRfZHJpdmVyID0gewogCS5wcm9iZQkJPSBv
bWFwMl9vbmVuYW5kX3Byb2JlLAotCS5yZW1vdmUJCT0gb21hcDJfb25lbmFuZF9yZW1vdmUsCisJ
LnJlbW92ZQkJPSBfX2RldmV4aXRfcChvbWFwMl9vbmVuYW5kX3JlbW92ZSksCiAJLnNodXRkb3du
CT0gb21hcDJfb25lbmFuZF9zaHV0ZG93biwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUJPSBEUklW
RVJfTkFNRSwKLS0gCjEuNi4wLjQKCg==
--001485f724f03a3b4e046a71d698--
