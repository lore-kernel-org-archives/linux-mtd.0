Received: from anchor-post-32.mail.demon.net ([194.217.242.90])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16x9Tf-0006iV-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2002 17:37:15 +0100
content-class: urn:content-classes:message
Subject: [PATCH] Compiling nand.c without ecc
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C1E49B.C481BE70"
Date: Mon, 15 Apr 2002 17:37:01 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B9508051B@OPTEX1.optex.local>
From: "John Hall" <John.Hall@optionexist.co.uk>
To: <gleixner@autronix.de>
Cc: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C1E49B.C481BE70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The enclosed patch fixes nand.c so that it compiles without
CONFIG_MTD_NAND_ECC being defined. The patch is against the latest CVS.

Regards,
John Hall

--=20
OptionExist Limited.
The Irwin Centre, Scotland Road, Dry Drayton, Cambridge.
Tel: +44 (0)1954 211244, Fax: +44 (0)1954 211565
http://www.optionexist.co.uk/

------_=_NextPart_001_01C1E49B.C481BE70
Content-Type: application/octet-stream;
	name="nand.patch"
Content-Transfer-Encoding: base64
Content-Description: nand.patch
Content-Disposition: attachment;
	filename="nand.patch"

SW5kZXg6IGRyaXZlcnMvbXRkL25hbmQvbmFuZC5jCj09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KUkNTIGZpbGU6IGU6XGN2
cy9jbGllbnRzL2ZsZWV0d29vZC9saW51eC9kcml2ZXJzL210ZC9uYW5kL25hbmQuYyx2CnJldHJp
ZXZpbmcgcmV2aXNpb24gMS40CmRpZmYgLXUgLWIgLXIxLjQgbmFuZC5jCi0tLSBkcml2ZXJzL210
ZC9uYW5kL25hbmQuYwkyMDAyLzA0LzA0IDEwOjE4OjQ1CTEuNAorKysgZHJpdmVycy9tdGQvbmFu
ZC9uYW5kLmMJMjAwMi8wNC8xNSAxNjozNTowNwpAQCAtOTA3LDcgKzkwNywxMSBAQAogCQl9CiAK
IAkJLyogV2UgdXNlIHRoZSBzYW1lIGZ1bmN0aW9uIGZvciB3cml0ZSBhbmQgd3JpdGV2ICEpICov
CisjaWZkZWYgQ09ORklHX01URF9OQU5EX0VDQwogCQlyZXQgPSBuYW5kX3dyaXRlX3BhZ2UgKG10
ZCwgdGhpcywgcGFnZSwgY29sLCBjbnQsIHRoaXMtPmVjY19jb2RlX2J1Zik7CisjZWxzZQorCQly
ZXQgPSBuYW5kX3dyaXRlX3BhZ2UgKG10ZCwgdGhpcywgcGFnZSwgY29sLCBjbnQsIE5VTEwpOwor
I2VuZGlmCiAJCWlmIChyZXQpCiAJCQlnb3RvIG91dDsKIAo=

------_=_NextPart_001_01C1E49B.C481BE70--
