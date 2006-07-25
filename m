Received: from out5.smtp.messagingengine.com ([66.111.4.29])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G5LoE-0004HO-MB
	for linux-mtd@lists.infradead.org; Tue, 25 Jul 2006 08:14:53 -0400
Message-Id: <1153827722.9918.266810956@webmail.messagingengine.com>
From: "Komal Shah" <komal_shah802003@yahoo.com>
To: linux-mtd@lists.infradead.org, tony@atomide.com
Content-Transfer-Encoding: 7bit
Content-Type: multipart/mixed; boundary="_----------=_115382772299181";
	charset="ISO-8859-1"
MIME-Version: 1.0
Subject: [PATCH] OMAP: Add TI OMAP242x H4 EVM NOR flash support.
Date: Tue, 25 Jul 2006 04:42:02 -0700
Cc: david-b@pacbell.net, jzhang@ti.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

--_----------=_115382772299181
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface
Date: Tue, 25 Jul 2006 11:42:02 UT

David/Tony,

Attached patch adds support for TI OMAP242x based H4 EVM
board NOR flash support.

Please review it and give the ack if it is OK.

---Komal Shah
http://komalshah.blogspot.com

-- 
http://www.fastmail.fm - mmm... Fastmail...


--_----------=_115382772299181
Content-Disposition: attachment;
	filename="0001-OMAP-Add-TI-OMAP242x-NOR-Flash.patch"
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream;
	name="0001-OMAP-Add-TI-OMAP242x-NOR-Flash.patch"
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface
Date: Tue, 25 Jul 2006 11:42:02 UT

RnJvbSBub2JvZHkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IEtv
bWFsIFNoYWggPGtvbWFsX3NoYWg4MDIwMDNAeWFob28uY29tPgpEYXRlOiBU
dWUsIDI1IEp1bCAyMDA2IDIyOjI2OjA1ICswNTMwClN1YmplY3Q6IFtQQVRD
SF0gT01BUDogQWRkIFRJIE9NQVAyNDJ4IEg0IEVWTSBOT1IgZmxhc2ggc3Vw
cG9ydC4KClBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgVEkgT01BUDI0MnggKGh0
dHA6Ly93d3cudGkuY29tL29tYXApCkg0IEVWTSBOT1IgRmxhc2ggc3VwcG9y
dC4KClNpZ25lZC1vZmYtYnk6IEtvbWFsIFNoYWggPGtvbWFsX3NoYWg4MDIw
MDNAeWFob28uY29tPgoKLS0tCgogZHJpdmVycy9tdGQvbWFwcy9vbWFwX25v
ci5jIHwgICAxNCArKysrKysrKy0tLS0tLQogMSBmaWxlcyBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgo3OTkzZWJlNTliMGE0
ZGM4ZmMxYzhkZGMzOTkwNGUwZDVlYjFiZTljCmRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9tYXBzL29tYXBfbm9yLmMgYi9kcml2ZXJzL210ZC9tYXBzL29t
YXBfbm9yLmMKaW5kZXggNDE4YWZmZi4uYTZlNzA1ZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tdGQvbWFwcy9vbWFwX25vci5jCisrKyBiL2RyaXZlcnMvbXRk
L21hcHMvb21hcF9ub3IuYwpAQCAtNjEsMTIgKzYxLDE0IEBAIHN0YXRpYyB2
b2lkIG9tYXBfc2V0X3ZwcChzdHJ1Y3QgbWFwX2luZm8KIHsKIAlzdGF0aWMg
aW50CWNvdW50OwogCi0JaWYgKGVuYWJsZSkgewotCQlpZiAoY291bnQrKyA9
PSAwKQotCQkJT01BUF9FTUlGU19DT05GSUdfUkVHIHw9IE9NQVBfRU1JRlNf
Q09ORklHX1dQOwotCX0gZWxzZSB7Ci0JCWlmIChjb3VudCAmJiAoLS1jb3Vu
dCA9PSAwKSkKLQkJCU9NQVBfRU1JRlNfQ09ORklHX1JFRyAmPSB+T01BUF9F
TUlGU19DT05GSUdfV1A7CisJaWYgKCFjcHVfaXNfb21hcDI0eHgoKSkgewor
CQlpZiAoZW5hYmxlKSB7CisJCQlpZiAoY291bnQrKyA9PSAwKQorCQkJCU9N
QVBfRU1JRlNfQ09ORklHX1JFRyB8PSBPTUFQX0VNSUZTX0NPTkZJR19XUDsK
KwkJfSBlbHNlIHsKKwkJCWlmIChjb3VudCAmJiAoLS1jb3VudCA9PSAwKSkK
KwkJCQlPTUFQX0VNSUZTX0NPTkZJR19SRUcgJj0gfk9NQVBfRU1JRlNfQ09O
RklHX1dQOworCQl9CiAJfQogfQogCi0tIAoxLjMuMwoK

--_----------=_115382772299181--
