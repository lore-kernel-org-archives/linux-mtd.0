Received: from usti.fccps.cz ([194.108.74.250])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Beqiq-0007GJ-Dl
	for linux-mtd@lists.infradead.org; Mon, 28 Jun 2004 03:38:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by usti.fccps.cz (Postfix) with ESMTP id BC1BD77C88
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Jun 2004 09:38:22 +0200 (CEST)
Received: from usti.fccps.cz ([127.0.0.1])
	by localhost (usti [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 10043-07 for <linux-mtd@lists.infradead.org>;
	Mon, 28 Jun 2004 09:38:21 +0200 (CEST)
Received: from frr (unknown [10.0.0.238])
	by usti.fccps.cz (Postfix) with ESMTP id D0DCF77C86
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Jun 2004 09:38:20 +0200 (CEST)
From: "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To: linux-mtd@lists.infradead.org
Date: Mon, 28 Jun 2004 09:40:12 +0200
MIME-Version: 1.0
Content-type: Multipart/Mixed; boundary=Message-Boundary-9875
Message-ID: <40DFE77C.1526.14100E42@localhost>
Subject: definition of CONFIG_MTD_DOCECC missing in
	drivers/mtd/devices/Config.in
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Message-Boundary-9875
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Dear MTD maintainers,

I've downloaded a "daily CVS snapshot" today:
mtd-snapshot-20040627.tar.bz2

I've noticed that CONFIG_MTD_DOCECC is missing
in $KERNEL_SRC_DIR/drivers/mtd/devices/Config.in,
which results in linker errors - unresolved
calls to doc_decode_ecc(), that is defined in docecc.c.

Attached is a suggested patch (I hope).

Have a nice day, thanks for the great job that you're doing.

Frank Rysanek


--Message-Boundary-9875
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  docecc.Config.in.patch
     Date:  28 Jun 2004, 8:31
     Size:  919 bytes.
     Type:  Binary

--Message-Boundary-9875
Content-type: Application/Octet-stream; name="docecc.Config.in.patch";
	type=Binary
Content-disposition: attachment; filename="docecc.Config.in.patch"
Content-transfer-encoding: BASE64

LS0tIG10ZC9kcml2ZXJzL210ZC9kZXZpY2VzL0NvbmZpZy5pbgkyMDAzLTA1LTI5IDAwOjAw
OjEwLjAwMDAwMDAwMCArMDIwMAorKysgbGludXgtMi40LjI2L2RyaXZlcnMvbXRkL2Rldmlj
ZXMvQ29uZmlnLmluCTIwMDQtMDYtMjggMDg6MTI6NTYuMDAwMDAwMDAwICswMjAwCkBAIC0z
MSw2ICszMSw5IEBACiAgICBkZXBfdHJpc3RhdGUgJyAgTS1TeXN0ZW1zIERpc2stT24tQ2hp
cCAyMDAwIGFuZCBNaWxsZW5uaXVtJyBDT05GSUdfTVREX0RPQzIwMDAgJENPTkZJR19NVEQK
ICAgIGRlcF90cmlzdGF0ZSAnICBNLVN5c3RlbXMgRGlzay1Pbi1DaGlwIE1pbGxlbm5pdW0t
b25seSBhbHRlcm5hdGl2ZSBkcml2ZXIgKHNlZSBoZWxwKScgQ09ORklHX01URF9ET0MyMDAx
ICRDT05GSUdfTVRECiAgICBkZXBfdHJpc3RhdGUgJyAgTS1TeXN0ZW1zIERpc2stT24tQ2hp
cCBNaWxsZW5uaXVtIFBsdXMgZHJpdmVyIChzZWUgaGVscCknIENPTkZJR19NVERfRE9DMjAw
MVBMVVMgJENPTkZJR19NVEQKKyAgIGlmIFsgIiRDT05GSUdfTVREX0RPQzIwMDFQTFVTIiA9
ICJ5IiAtbyAiJENPTkZJR19NVERfRE9DMjAwMSIgPSAieSIgLW8gIiRDT05GSUdfTVREX0RP
QzIwMDAiID0gInkiIC1vICIkQ09ORklHX01URF9ET0MyMDAxUExVUyIgPSAibSIgLW8gIiRD
T05GSUdfTVREX0RPQzIwMDEiID0gIm0iIC1vICIkQ09ORklHX01URF9ET0MyMDAwIiA9ICJt
IiBdOyB0aGVuCisgICAgICBkZWZpbmVfYm9vbCBDT05GSUdfTVREX0RPQ0VDQyB5CisgICBm
aQogICAgaWYgWyAiJENPTkZJR19NVERfRE9DMjAwMVBMVVMiID0gInkiIC1vICIkQ09ORklH
X01URF9ET0MyMDAxIiA9ICJ5IiAtbyAiJENPTkZJR19NVERfRE9DMjAwMCIgPSAieSIgXTsg
dGhlbgogICAgICAgZGVmaW5lX2Jvb2wgQ09ORklHX01URF9ET0NQUk9CRSB5CiAgICBlbHNl
Cg==

--Message-Boundary-9875--
