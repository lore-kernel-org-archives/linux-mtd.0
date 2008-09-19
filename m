Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KgfIf-0008AC-Qo
	for linux-mtd@lists.infradead.org; Fri, 19 Sep 2008 12:41:33 +0000
Received: from ep_ms13_bk (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0K7G00LAT0L57I@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 19 Sep 2008 21:41:29 +0900 (KST)
Received: from ep_spt04 (ms13.samsung.com [203.254.225.109])
	by ms13.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0K7G00LJT0L4MY@ms13.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 19 Sep 2008 21:41:29 +0900 (KST)
Content-return: prohibited
Date: Fri, 19 Sep 2008 12:41:28 +0000 (GMT)
From: AYYANARPONNUSAMY GANGHEYAMOORTHY <moorthy.apg@samsung.com>
Subject: [PATCH] [MTD-UTILS] Add support for 4KB page flash devices
To: linux-mtd@lists.infradead.org
Message-id: <33142758.53091221828088797.JavaMail.weblogic@epml16>
MIME-version: 1.0
MIME-version: 1.0
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: base64
Cc: David.Woodhouse@intel.com
Reply-To: moorthy.apg@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

V2UgY2FuIG5vdyB1c2UgdGhlc2UgdXRpbGl0aWVzIG9uIDRLQiBkZXZpY2VzLg0KDQpTaWduZWQt
b2ZmLWJ5OiBSb2hpdCBIYWdhcmd1bmRnaSA8aC5yb2hpdEBzYW1zdW5nLmNvbT4NCi0tLQ0KLS0t
IGEvZmxhc2hfb3RwX3dyaXRlLmMJMjAwOC0wNi0yNyAyMTo1MToyOC4wMDAwMDAwMDAgKzA1MzAN
CisrKyBiL2ZsYXNoX290cF93cml0ZS5jCTIwMDgtMDctMDEgMTY6MDQ6MTIuMDAwMDAwMDAwICsw
NTMwDQpAQCAtMTgsNyArMTgsNyBAQCBpbnQgbWFpbihpbnQgYXJnYyxjaGFyICphcmd2W10pDQog
CWludCBmZCwgdmFsLCByZXQsIHNpemUsIHdyb3RlLCBsZW47DQogCW10ZF9pbmZvX3QgbXRkSW5m
bzsNCiAJb2ZmX3Qgb2Zmc2V0Ow0KLQljaGFyICpwLCBidWZbMjA0OF07DQorCWNoYXIgKnAsIGJ1
Zls0MDk2XTsNCiANCiAJaWYgKGFyZ2MgIT0gNCB8fCBzdHJjbXAoYXJndlsxXSwgIi11IikpIHsN
CiAJCWZwcmludGYoc3RkZXJyLCAiVXNhZ2U6ICVzIC11IDxkZXZpY2U+IDxvZmZzZXQ+XG4iLCBh
cmd2WzBdKTsNCi0tLSBhL2luY2x1ZGUvbXRkL210ZC1hYmkuaAkyMDA4LTA2LTI3IDIxOjUxOjI4
LjAwMDAwMDAwMCArMDUzMA0KKysrIGIvaW5jbHVkZS9tdGQvbXRkLWFiaS5oCTIwMDgtMDYtMzAg
MTg6NTE6MzkuMDAwMDAwMDAwICswNTMwDQpAQCAtMTA0LDcgKzEwNCw3IEBAIHN0cnVjdCBuYW5k
X29vYmluZm8gew0KIAl1aW50MzJfdCB1c2VlY2M7DQogCXVpbnQzMl90IGVjY2J5dGVzOw0KIAl1
aW50MzJfdCBvb2JmcmVlWzhdWzJdOw0KLQl1aW50MzJfdCBlY2Nwb3NbMzJdOw0KKwl1aW50MzJf
dCBlY2Nwb3NbMTI4XTsNCiB9Ow0KIA0KIHN0cnVjdCBuYW5kX29vYmZyZWUgew0KQEAgLTExOSw3
ICsxMTksNyBAQCBzdHJ1Y3QgbmFuZF9vb2JmcmVlIHsNCiAgKi8NCiBzdHJ1Y3QgbmFuZF9lY2Ns
YXlvdXQgew0KIAl1aW50MzJfdCBlY2NieXRlczsNCi0JdWludDMyX3QgZWNjcG9zWzY0XTsNCisJ
dWludDMyX3QgZWNjcG9zWzEyOF07DQogCXVpbnQzMl90IG9vYmF2YWlsOw0KIAlzdHJ1Y3QgbmFu
ZF9vb2JmcmVlIG9vYmZyZWVbTVREX01BWF9PT0JGUkVFX0VOVFJJRVNdOw0KIH07DQotLS0gYS9m
bGFzaGNwLmMJMjAwOC0wNi0yNyAyMTo1MToyOC4wMDAwMDAwMDAgKzA1MzANCisrKyBiL2ZsYXNo
Y3AuYwkyMDA4LTA3LTAyIDE0OjQ5OjIxLjAwMDAwMDAwMCArMDUzMA0KQEAgLTYxLDcgKzYyLDcg
QEAgdHlwZWRlZiBpbnQgYm9vbDsNCiAjZGVmaW5lIFBFUkNFTlRBR0UoeCx0b3RhbCkgKCgoeCkg
KiAxMDApIC8gKHRvdGFsKSkNCiANCiAvKiBzaXplIG9mIHJlYWQvd3JpdGUgYnVmZmVyICovDQot
I2RlZmluZSBCVUZTSVpFICgxMCAqIDEwMjQpDQorI2RlZmluZSBCVUZTSVpFICgxMCAqIDQwOTYp
DQogDQogLyogY21kLWxpbmUgZmxhZ3MgKi8NCiAjZGVmaW5lIEZMQUdfTk9ORQkJMHgwMA0KDQoN
CiANCiA=
