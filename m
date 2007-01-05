Received: from mailout3.samsung.com ([203.254.224.33])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H2jMg-0005eV-PR
	for linux-mtd@lists.infradead.org; Fri, 05 Jan 2007 02:20:16 -0500
Received: from ep_ms12_bk (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0JBD000VHWBA4P@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 05 Jan 2007 16:18:46 +0900 (KST)
Received: from ep_spt01 (ms12.samsung.com [203.254.225.99])
	by ms12.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0JBD0074GWBACA@ms12.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 05 Jan 2007 16:18:46 +0900 (KST)
Content-return: prohibited
Date: Fri, 05 Jan 2007 07:18:46 +0000 (GMT)
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: onenand_wait and onenane_read
To: Adrian Hunter <hunter.programmer@gmail.com>
Message-id: <23075422.90991167981526516.JavaMail.weblogic@ep_ml22>
MIME-version: 1.0
MIME-version: 1.0
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: base64
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGksDQoNCj4gTm90ZSB0aGF0IGFmdGVyIHRoZSBwYXRjaCwgb25lbmFuZV93YWl0IHNlZW1zIHRv
IHJldHVybiBub24temVybyBldmVuDQo+IHdoZW4gdGhlIGVycm9yIGlzIGNvcnJlY3RlZCBieSBl
Y2MuICBTaG91bGRuJ3QgaXQgcmV0dXJuIHplcm8gaW4gdGhhdA0KPiBjYXNlPw0KDQpBZnRlciBl
Y2MgcGF0Y2gsIEkgdGhpbmsgaXMgaXQgcmVhbGx5IG5lZWQgdG8gcmV0dXJuIGVycm9yIGNvZGUg
d2hlbiAxIGJpdCBlY2MuDQpFdmVuIHRob3VnaCB0aGVyZSdzIDEtYml0IGVjYyB0aGUgYnVmZmVy
cmFtIGhhcyB2YWxpZCBkYXRhLiBzaW5jZSBlY2MgbG9naWMgYWxyZWFkeSBjb3JyZWN0cyBpdC4N
Cg0KSSB0aGluayB3ZSBkb24ndCBuZWVkIHRvIHJldHVybiBlY2MgZXJyb3Igd2hlbiAxLWJpdCBl
Y2MuIFdlIG9ubHkgcmV0dXJuIGVycm9yIGNvZGUgd2hlbiAyLWJpdCBlY2MgZXJyb3INCg0KQEAg
LTMyNywxMiArMzI3LDEyIEBAIHN0YXRpYyBpbnQgb25lbmFuZF93YWl0KHN0cnVjdCBtdGRfaW5m
byAqbXRkLCBpbnQgc3RhdGUpDQogICAgICAgICAgICAgICAgaW50IGVjYyA9IHRoaXMtPnJlYWRf
d29yZCh0aGlzLT5iYXNlICsgT05FTkFORF9SRUdfRUNDX1NUQVRVUyk7DQogICAgICAgICAgICAg
ICAgaWYgKGVjYykgew0KICAgICAgICAgICAgICAgICAgICAgICAgREVCVUcoTVREX0RFQlVHX0xF
VkVMMCwgIm9uZW5hbmRfd2FpdDogRUNDIGVycm9yID0gMHglMDR4XG4iLCBlY2MpOw0KLSAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKGVjYyAmIE9ORU5BTkRfRUNDXzJCSVRfQUxMKQ0KKyAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKGVjYyAmIE9ORU5BTkRfRUNDXzJCSVRfQUxMKSB7DQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG10ZC0+ZWNjX3N0YXRzLmZhaWxlZCsrOw0KLSAg
ICAgICAgICAgICAgICAgICAgICAgZWxzZSBpZiAoZWNjICYgT05FTkFORF9FQ0NfMUJJVF9BTEwp
DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBlY2M7DQorICAgICAgICAg
ICAgICAgICAgICAgICB9IGVsc2UgaWYgKGVjYyAmIE9ORU5BTkRfRUNDXzFCSVRfQUxMKQ0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdGQtPmVjY19zdGF0cy5jb3JyZWN0ZWQrKzsN
CiAgICAgICAgICAgICAgICB9DQotICAgICAgICAgICAgICAgcmV0dXJuIGVjYzsNCiAgICAgICAg
fQ0KDQogICAgICAgIHJldHVybiAwOw0KDQpUaGFuayB5b3UsDQpLeXVuZ21pbiBQYXJrDQoNCg==
