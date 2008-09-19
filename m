Received: from mailout5.samsung.com ([203.254.224.35])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KgfGa-00057q-8s
	for linux-mtd@lists.infradead.org; Fri, 19 Sep 2008 12:39:20 +0000
Received: from ep_ms13_bk (mailout5.samsung.com [203.254.224.35])
	by mailout5.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0K7G003G90HGWX@mailout5.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 19 Sep 2008 21:39:16 +0900 (KST)
Received: from ep_spt01 (ms13.samsung.com [203.254.225.109])
	by ms13.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0K7G00LBP0HGMY@ms13.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 19 Sep 2008 21:39:16 +0900 (KST)
Content-return: prohibited
Date: Fri, 19 Sep 2008 12:39:16 +0000 (GMT)
From: AYYANARPONNUSAMY GANGHEYAMOORTHY <moorthy.apg@samsung.com>
Subject: [PATCH 2/2] [MTD] [Flex-OneNAND] JFFS2 support
To: linux-mtd@lists.infradead.org
Message-id: <21064664.53031221827956443.JavaMail.weblogic@epml16>
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

VGhpcyBwYXRjaCBhbGxvd3MgSkZGUzIgdG8gYmUgdXNlZCBvbiBGbGV4LU9uZU5BTkQNCldlIHJl
Z2lzdGVyIHRoZSBGbGV4LU9uZU5BTkQgZHJpdmVyIHdpdGggY2FwYWJpbGl0eQ0Kb2YgTUxDIE5B
TkQgZmxhc2guDQoNClNpZ25lZC1vZmYtYnk6IFJhanNoZWthciBIIFBheWFnb25kIDxyYWpzaGVr
YXIuaHBAc2Ftc3VuZy5jb20+DQotLS0NCi0tLSBhL2RyaXZlcnMvbXRkL29uZW5hbmQvb25lbmFu
ZF9iYXNlLmMJMjAwOC0wOS0wMiAxMzo1Mzo0MC4wMDAwMDAwMDAgKzA1MzANCisrKyBiL2RyaXZl
cnMvbXRkL29uZW5hbmQvb25lbmFuZF9iYXNlLmMJMjAwOC0wOS0wMiAxMzo1NDozNC4wMDAwMDAw
MDAgKzA1MzANCkBAIC0zMjYyLDcgKzMyNjIsOCBAQCBpbnQgb25lbmFuZF9zY2FuKHN0cnVjdCBt
dGRfaW5mbyAqbXRkLCBpDQogDQogCS8qIEZpbGwgaW4gcmVtYWluaW5nIE1URCBkcml2ZXIgZGF0
YSAqLw0KIAltdGQtPnR5cGUgPSBNVERfTkFOREZMQVNIOw0KLQltdGQtPmZsYWdzID0gTVREX0NB
UF9OQU5ERkxBU0g7DQorCW10ZC0+ZmxhZ3MgPSBPTkVOQU5EX0lTX01MQyh0aGlzKSA/IE1URF9D
QVBfTUxDTkFOREZMQVNIIDoNCisJCQlNVERfQ0FQX05BTkRGTEFTSDsNCiAJbXRkLT5lcmFzZSA9
IG9uZW5hbmRfZXJhc2U7DQogCW10ZC0+cG9pbnQgPSBOVUxMOw0KIAltdGQtPnVucG9pbnQgPSBO
VUxMOw0KDQoNCiANCiA=
