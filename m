Received: from news.ti.com ([192.94.94.33] helo=dragon.ti.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BgCAg-0007s8-QQ
	for linux-mtd@lists.infradead.org; Thu, 01 Jul 2004 20:44:55 -0400
Received: from dlep31.itg.ti.com ([157.170.139.161])
	by dragon.ti.com (8.12.11/8.12.11) with ESMTP id i620ijDD017722
	for <linux-mtd@lists.infradead.org>;
	Thu, 1 Jul 2004 19:44:45 -0500 (CDT)
Received: from dlep90.itg.ti.com (localhost [127.0.0.1])
	by dlep31.itg.ti.com (8.12.11/8.12.11) with ESMTP id i620iie5000383
	for <linux-mtd@lists.infradead.org>;
	Thu, 1 Jul 2004 19:44:44 -0500 (CDT)
Received: from dlee2k70.ent.ti.com (localhost [127.0.0.1])
	by dlep90.itg.ti.com (8.12.11/8.12.11) with ESMTP id i620iijZ007336
	for <linux-mtd@lists.infradead.org>;
	Thu, 1 Jul 2004 19:44:44 -0500 (CDT)
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C45FCD.C48EE9F2"
Date: Thu, 1 Jul 2004 19:44:44 -0500
Message-ID: <BA2832125C3C994384FCC051CDFC73690F47AE@dlee2k05.ent.ti.com>
From: "Zhang, Jian" <jzhang@ti.com>
To: <linux-mtd@lists.infradead.org>
Cc: "Johnson, Steve-OMAP" <stevej@ti.com>
Subject: bug fix for mtdchar.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C45FCD.C48EE9F2
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is a patch to fix a bug in drivers/mtd/mtdchar.c.

This bug causes to remove wrong mtd device nodes from devfs. If you have
mtd0, mtd2 and mtd3, it tries to remove mtd0, mtd4 and mtd6.

Regards,
Jian=20
=20

------_=_NextPart_001_01C45FCD.C48EE9F2
Content-Type: application/octet-stream;
	name="patch1"
Content-Transfer-Encoding: base64
Content-Description: patch1
Content-Disposition: attachment;
	filename="patch1"

LS0tIC9ob21lL2EwMzg0Nzg5L210ZC0yMDA0MDYyNy9kcml2ZXJzL210ZC9tdGRjaGFyLmMJMjAw
NC0wNi0xOSAxNzowMDo1NS4wMDAwMDAwMDAgLTA1MDAKKysrIGRyaXZlcnMvbXRkL210ZGNoYXIu
YwkyMDA0LTA3LTAxIDE5OjE1OjU3LjAwMDAwMDAwMCAtMDUwMApAQCAtNTYyLDkgKzU2Miw5IEBA
IHN0YXRpYyB2b2lkIG10ZF9ub3RpZnlfcmVtb3ZlKHN0cnVjdCBtdGQKIHsKIAlpZiAoIW10ZCkK
IAkJcmV0dXJuOwotCi0JZGV2ZnNfcmVtb3ZlICgibXRkLyVkIiwgbXRkLT5pbmRleCoyKTsKLQlk
ZXZmc19yZW1vdmUgKCJtdGQvJWRybyIsIG10ZC0+aW5kZXgqMik7CisgICAgICAgIAorCWRldmZz
X3JlbW92ZSAoIm10ZC8lZCIsIG10ZC0+aW5kZXgpOworCWRldmZzX3JlbW92ZSAoIm10ZC8lZHJv
IiwgbXRkLT5pbmRleCk7CiB9CiAKICNlbmRpZgo=

------_=_NextPart_001_01C45FCD.C48EE9F2--
