Received: from finch-post-12.mail.demon.net ([194.217.242.41])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16t9Pp-0005tn-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 16:44:45 +0100
Received: from optex.demon.co.uk ([158.152.119.220] helo=optex1.optex.local)
	by finch-post-12.mail.demon.net with esmtp (Exim 3.35 #1)
	id 16t9Pi-000Ao4-0C
	for linux-mtd@lists.infradead.org; Thu, 04 Apr 2002 15:44:38 +0000
content-class: urn:content-classes:message
Subject: [PATCH] drivers/mtd/nand/Config.in
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C1DBEF.9E9CABD0"
Date: Thu, 4 Apr 2002 16:44:34 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B950804DF@OPTEX1.optex.local>
From: "John Hall" <John.Hall@optionexist.co.uk>
To: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
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

------_=_NextPart_001_01C1DBEF.9E9CABD0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I found a small typo in the NAND Config.in that prevented the JFFS2 OOB
option from being displayed. The patch is against the latest cvs.

Regards,
John Hall

--=20
OptionExist Limited.
The Irwin Centre, Scotland Road, Dry Drayton, Cambridge.
Tel: +44 (0)1954 211244, Fax: +44 (0)1954 211565
http://www.optionexist.co.uk/

------_=_NextPart_001_01C1DBEF.9E9CABD0
Content-Type: application/octet-stream;
	name="nand-config.in.diff"
Content-Transfer-Encoding: base64
Content-Description: nand-config.in.diff
Content-Disposition: attachment;
	filename="nand-config.in.diff"

SW5kZXg6IENvbmZpZy5pbgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09ClJDUyBmaWxlOiAvaG9tZS9jdnMvbXRkL2RyaXZl
cnMvbXRkL25hbmQvQ29uZmlnLmluLHYKcmV0cmlldmluZyByZXZpc2lvbiAxLjYKZGlmZiAtdSAt
YiAtcjEuNiBDb25maWcuaW4KLS0tIENvbmZpZy5pbgkyMSBGZWIgMjAwMiAyMzo0NToxOSAtMDAw
MAkxLjYKKysrIENvbmZpZy5pbgk0IEFwciAyMDAyIDE1OjQzOjE0IC0wMDAwCkBAIC0xMCw3ICsx
MCw3IEBACiBpZiBbICIkQ09ORklHX01URF9OQU5EIiA9ICJ5IiAtbyAiJENPTkZJR19NVERfTkFO
RCIgPSAibSIgXTsgdGhlbgogICAgYm9vbCAnICAgIEVuYWJsZSBFQ0MgY29ycmVjdGlvbiBhbGdv
cml0aG0nICBDT05GSUdfTVREX05BTkRfRUNDCiAgICBib29sICcgICAgVmVyaWZ5IE5BTkQgcGFn
ZSB3cml0ZXMnIENPTkZJR19NVERfTkFORF9WRVJJRllfV1JJVEUKLSAgIGlmIFsgIiRDT05GSUdf
SkZGUzJfRlMiID0gInkiIC1vICIkQ09ORklHX0pGRlMyX0ZTIiA9ICJtIl07IHRoZW4KKyAgIGlm
IFsgIiRDT05GSUdfSkZGUzJfRlMiID0gInkiIC1vICIkQ09ORklHX0pGRlMyX0ZTIiA9ICJtIiBd
OyB0aGVuCiAgICAJYm9vbCAnICAgIFVzZSBKRkZTMiBsYXlvdXQgZm9yIE9PQiBhcmVhJyBDT05G
SUdfTVREX05BTkRfRUNDX0pGRlMyCiAgICBmaQogZmkK

------_=_NextPart_001_01C1DBEF.9E9CABD0--
