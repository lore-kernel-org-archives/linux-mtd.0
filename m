Received: from wf-out-1314.google.com ([209.85.200.175])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L2W1s-0002g1-SA
	for linux-mtd@lists.infradead.org; Tue, 18 Nov 2008 19:14:29 +0000
Received: by wf-out-1314.google.com with SMTP id 28so3059920wfc.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Nov 2008 11:14:27 -0800 (PST)
Message-ID: <f383264b0811181114r326417eqee13e3ccdd06b0a@mail.gmail.com>
Date: Tue, 18 Nov 2008 11:14:26 -0800
From: "Matt Reimer" <mattjreimer@gmail.com>
To: "Linux MTD" <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD][NAND] pxa3xx: convert from ns to clock ticks more
	accurately
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_99038_13148393.1227035666937"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_99038_13148393.1227035666937
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline



------=_Part_99038_13148393.1227035666937
Content-Type: text/x-patch;
	name=0002--MTD-NAND-pxa3xx-convert-from-ns-to-clock-ticks-m.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fnoxchut0
Content-Disposition: attachment;
	filename=0002--MTD-NAND-pxa3xx-convert-from-ns-to-clock-ticks-m.patch

RnJvbSAyMGY3ODcyY2E0NzZkZGI1MWQ1YzJiYTgyNTc2NzBiNzNjZGVhY2Y1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXR0IFJlaW1lciA8bXJlaW1lckB2cG9wLm5ldD4KRGF0ZTog
VHVlLCAxOCBOb3YgMjAwOCAxMDo1NDozMiAtMDgwMApTdWJqZWN0OiBbUEFUQ0hdIFtNVERdW05B
TkRdIHB4YTN4eDogY29udmVydCBmcm9tIG5zIHRvIGNsb2NrIHRpY2tzIG1vcmUgYWNjdXJhdGVs
eQoKVGhlIHZhcmlvdXMgZmllbGRzIGluIE5EVFJ7MDF9IGFyZSBpbiB1bml0cyBvZiBjbG9jayB0
aWNrcyBtaW51cyBvbmUsIGJ1dCB0aGUKbnMyY3ljbGUgbWFjcm8gbWlzdGFrZW5seSBhZGRzIG9u
ZSwgaW5mbGF0aW5nIHRoZSBudW1iZXIgb2YgY2xvY2sgdGlja3MgYW5kCm1ha2luZyBpdCBpbXBv
c3NpYmxlIHRvIHNldCBhbnkgb2YgdGhlc2UgZmllbGRzIHRvIHplcm8uCgpTaWduZWQtb2ZmLWJ5
OiBNYXR0IFJlaW1lciA8bXJlaW1lckBzZGdzeXN0ZW1zLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9u
YW5kL3B4YTN4eF9uYW5kLmMgfCAgICAyICstCiAxIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3B4YTN4
eF9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3B4YTN4eF9uYW5kLmMKaW5kZXggMGQ4ZmZhNi4u
ZGNiODdhZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9weGEzeHhfbmFuZC5jCisrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcHhhM3h4X25hbmQuYwpAQCAtMzA5LDcgKzMwOSw3IEBAIHN0YXRp
YyBzdHJ1Y3QgcHhhM3h4X25hbmRfZmxhc2ggKmJ1aWx0aW5fZmxhc2hfdHlwZXNbXSA9IHsKICNk
ZWZpbmUgTkRUUjFfdEFSKGMpCShtaW4oKGMpLCAxNSkgPDwgMCkKIAogLyogY29udmVydCBuYW5v
LXNlY29uZHMgdG8gbmFuZCBmbGFzaCBjb250cm9sbGVyIGNsb2NrIGN5Y2xlcyAqLwotI2RlZmlu
ZSBuczJjeWNsZShucywgY2xrKQkoaW50KSgoKG5zKSAqIChjbGsgLyAxMDAwMDAwKSAvIDEwMDAp
ICsgMSkKKyNkZWZpbmUgbnMyY3ljbGUobnMsIGNsaykJKGludCkoKChucykgKiAoY2xrIC8gMTAw
MDAwMCkgLyAxMDAwKSAtIDEpCiAKIHN0YXRpYyB2b2lkIHB4YTN4eF9uYW5kX3NldF90aW1pbmco
c3RydWN0IHB4YTN4eF9uYW5kX2luZm8gKmluZm8sCiAJCQkJICAgc3RydWN0IHB4YTN4eF9uYW5k
X3RpbWluZyAqdCkKLS0gCjEuNS42LjMKCg==
------=_Part_99038_13148393.1227035666937--
