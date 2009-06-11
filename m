Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MEiFR-0004CH-Da
	for linux-mtd@lists.infradead.org; Thu, 11 Jun 2009 11:15:16 +0000
Received: by ewy7 with SMTP id 7so194050ewy.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Jun 2009 04:15:05 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 11 Jun 2009 14:15:04 +0300
Message-ID: <7948530906110415u3cc3cd62je650881b6385c8f5@mail.gmail.com>
Subject: [PATCH] MTD: OneNAND OMAP2/3: Fix incorrect bufferram offset
From: Mika Korhonen <mika.j.korhonen@gmail.com>
To: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
Content-Type: multipart/mixed; boundary=0016364d2b292b9b18046c10b4f1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0016364d2b292b9b18046c10b4f1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi, I was testing 2-plane programming and noticed that when writing
and doing a verify read straight after I kept getting 00 00 00 00 ...
instead of the written data. I found out that OMAP2/3 version of
onenand_bufferram_offset() uses the faked page size instead of the
real one. The generic version in onenand_base.c is ok.

The patch to fix this is attached.

br
Mika

--0016364d2b292b9b18046c10b4f1
Content-Type: text/x-diff; charset=US-ASCII;
	name="0001-MTD-OneNAND-OMAP2-3-Fix-incorrect-bufferram-offset.patch"
Content-Disposition: attachment;
	filename="0001-MTD-OneNAND-OMAP2-3-Fix-incorrect-bufferram-offset.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fvtd84ba0

RnJvbSA0YWQ0NzlmNTIzODU2MDI4Njk5OWMwN2MzMGZlYzNhNmE1NTUxZGQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNaWthIEtvcmhvbmVuIDxtaWthLmoua29yaG9uZW5AZ21haWwu
Y29tPgpEYXRlOiBUaHUsIDExIEp1biAyMDA5IDE0OjA1OjA3ICswMzAwClN1YmplY3Q6IFtQQVRD
SF0gTVREOiBPbmVOQU5EIE9NQVAyLzM6IEZpeCBpbmNvcnJlY3QgYnVmZmVycmFtIG9mZnNldAoK
Rml4ZXMgdGhlIGNhc2Ugd2hlcmUgQ09ORklHX01URF9PTkVOQU5EXzJYX1BST0dSQU0gaXMgc2V0
IGFuZAp0aGUgcmVhbCBwYWdlIHNpemUgZGlmZmVycyBmcm9tIG10ZF9pbmZvLndyaXRlc2l6ZS4K
ClNpZ25lZC1vZmYtYnk6IE1pa2EgS29yaG9uZW4gPG1pa2Euai5rb3Job25lbkBnbWFpbC5jb20+
Ci0tLQogZHJpdmVycy9tdGQvb25lbmFuZC9vbWFwMi5jIHwgICAgMiArLQogMSBmaWxlcyBjaGFu
Z2VkLCAxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvb25lbmFuZC9vbWFwMi5jIGIvZHJpdmVycy9tdGQvb25lbmFuZC9vbWFwMi5jCmluZGV4
IGRmMjZkYjguLjMyZGU2MzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL29uZW5hbmQvb21hcDIu
YworKysgYi9kcml2ZXJzL210ZC9vbmVuYW5kL29tYXAyLmMKQEAgLTI2Nyw3ICsyNjcsNyBAQCBz
dGF0aWMgaW5saW5lIGludCBvbWFwMl9vbmVuYW5kX2J1ZmZlcnJhbV9vZmZzZXQoc3RydWN0IG10
ZF9pbmZvICptdGQsIGludCBhcmVhKQogCiAJaWYgKE9ORU5BTkRfQ1VSUkVOVF9CVUZGRVJSQU0o
dGhpcykpIHsKIAkJaWYgKGFyZWEgPT0gT05FTkFORF9EQVRBUkFNKQotCQkJcmV0dXJuIG10ZC0+
d3JpdGVzaXplOworCQkJcmV0dXJuIHRoaXMtPndyaXRlc2l6ZTsKIAkJaWYgKGFyZWEgPT0gT05F
TkFORF9TUEFSRVJBTSkKIAkJCXJldHVybiBtdGQtPm9vYnNpemU7CiAJfQotLSAKMS41LjYuNQoK
--0016364d2b292b9b18046c10b4f1--
