Received: from mail-gx0-f12.google.com ([209.85.217.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L2W8H-00066J-Or
	for linux-mtd@lists.infradead.org; Tue, 18 Nov 2008 19:21:06 +0000
Received: by gxk5 with SMTP id 5so104942gxk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Nov 2008 11:21:04 -0800 (PST)
Message-ID: <f383264b0811181113q51db57e5t39a55e79a0e02ae6@mail.gmail.com>
Date: Tue, 18 Nov 2008 11:13:46 -0800
From: "Matt Reimer" <mattjreimer@gmail.com>
To: "Linux MTD" <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD][NAND] pxa3xx: fix non-page-aligned reads
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_99026_18699323.1227035626795"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_99026_18699323.1227035626795
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Sorry this patch is an attachment; I haven't figured out how to make
git send-email use my gmail account without giving a "5.7.1 Relay
access denied" error.

------=_Part_99026_18699323.1227035626795
Content-Type: text/x-patch;
	name=0001--MTD-NAND-pxa3xx-fix-non-page-aligned-reads.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fnox88j90
Content-Disposition: attachment;
	filename=0001--MTD-NAND-pxa3xx-fix-non-page-aligned-reads.patch

RnJvbSBmMTAyMTgwYTNiOTFiZWQ3M2U5ZTYzMmQxYzdhMDhmNTM5YzIyODgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXR0IFJlaW1lciA8bXJlaW1lckB2cG9wLm5ldD4KRGF0ZTog
VHVlLCAxOCBOb3YgMjAwOCAxMDo0Nzo0MiAtMDgwMApTdWJqZWN0OiBbUEFUQ0hdIFtNVERdW05B
TkRdIHB4YTN4eDogZml4IG5vbi1wYWdlLWFsaWduZWQgcmVhZHMKClJlYWRzIGZyb20gbm9uLXBh
Z2UtYWxpZ25lZCBhZGRyZXNzZXMgd2VyZSBicm9rZW4gYmVjYXVzZSB3aGlsZSB0aGUKYWRkcmVz
cyB0byByZWFkIGZyb20gd2FzIGNvcnJlY3RseSB3cml0dGVuIHRvIE5EQ0IqLCBhIGZ1bGwgcGFn
ZSB3YXMKYWx3YXlzIHJlYWQuIEZpeCB0aGlzIGJ5IGlnbm9yaW5nIHRoZSBjb2x1bW4gYW5kIG9u
bHkgdXNpbmcgdGhlIHBhZ2UKYWRkcmVzcy4KCkkgc3VzcGVjdCB0aGlzIHdob2xlLXBhZ2UgYmVo
YXZpb3IgaXMgZHVlIHRvIHRoZSBjb250cm9sbGVyJ3MgbmVlZCB0bwpyZWFkIHRoZSBlbnRpcmUg
cGFnZSBpbiBvcmRlciB0byBnZW5lcmF0ZSBjb3JyZWN0IEVDQy4gSW4gdGhlIG5vbi1FQ0MKY2Fz
ZSB0aGlzIGNvdWxkIGJlIG9wdGltaXplZCB0byB1c2UgdGhlIGNvbHVtbiBhZGRyZXNzLCBhbmQg
dG8gc2V0IHRoZQpyZWFkIGxlbmd0aCB0byB3aGF0IGlzIGJlaW5nIHJlcXVlc3RlZCByYXRoZXIg
dGhhbiB0aGUgbGVuZ3RoIG9mIGFuCmVudGlyZSBwYWdlLgoKU2lnbmVkLW9mZi1ieTogTWF0dCBS
ZWltZXIgPG1yZWltZXJAc2Rnc3lzdGVtcy5jb20+Ci0tLQogZHJpdmVycy9tdGQvbmFuZC9weGEz
eHhfbmFuZC5jIHwgICAgNCArKy0tCiAxIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3B4YTN4eF9uYW5k
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3B4YTN4eF9uYW5kLmMKaW5kZXggZmUyYmM3ZS4uMGQ4ZmZh
NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9weGEzeHhfbmFuZC5jCisrKyBiL2RyaXZl
cnMvbXRkL25hbmQvcHhhM3h4X25hbmQuYwpAQCAtMzc5LDE0ICszNzksMTQgQEAgc3RhdGljIGlu
dCBwcmVwYXJlX3JlYWRfcHJvZ19jbWQoc3RydWN0IHB4YTN4eF9uYW5kX2luZm8gKmluZm8sCiAJ
CS8qIGxhcmdlIGJsb2NrLCAyIGN5Y2xlcyBmb3IgY29sdW1uIGFkZHJlc3MKIAkJICogcm93IGFk
ZHJlc3Mgc3RhcnRzIGZyb20gM3JkIGN5Y2xlCiAJCSAqLwotCQlpbmZvLT5uZGNiMSB8PSAocGFn
ZV9hZGRyIDw8IDE2KSB8IChjb2x1bW4gJiAweGZmZmYpOworCQlpbmZvLT5uZGNiMSB8PSBwYWdl
X2FkZHIgPDwgMTY7CiAJCWlmIChmLT5yb3dfYWRkcl9jeWNsZXMgPT0gMykKIAkJCWluZm8tPm5k
Y2IyID0gKHBhZ2VfYWRkciA+PiAxNikgJiAweGZmOwogCX0gZWxzZQogCQkvKiBzbWFsbCBibG9j
aywgMSBjeWNsZXMgZm9yIGNvbHVtbiBhZGRyZXNzCiAJCSAqIHJvdyBhZGRyZXNzIHN0YXJ0cyBm
cm9tIDJuZCBjeWNsZQogCQkgKi8KLQkJaW5mby0+bmRjYjEgPSAocGFnZV9hZGRyIDw8IDgpIHwg
KGNvbHVtbiAmIDB4ZmYpOworCQlpbmZvLT5uZGNiMSA9IHBhZ2VfYWRkciA8PCA4OwogCiAJaWYg
KGNtZCA9PSBjbWRzZXQtPnByb2dyYW0pCiAJCWluZm8tPm5kY2IwIHw9IE5EQ0IwX0NNRF9UWVBF
KDEpIHwgTkRDQjBfQVVUT19SUzsKLS0gCjEuNS42LjMKCg==
------=_Part_99026_18699323.1227035626795--
