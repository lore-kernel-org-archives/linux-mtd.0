Received: from mailout3.samsung.com ([203.254.224.33])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H45ad-0002Zd-H2
	for linux-mtd@lists.infradead.org; Mon, 08 Jan 2007 20:15:52 -0500
Received: from ep_ms12_bk (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0JBK0087DU4I89@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 09 Jan 2007 10:14:42 +0900 (KST)
Received: from ep_spt02 (ms12.samsung.com [203.254.225.99])
	by ms12.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0JBK00DRPU4I32@ms12.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 09 Jan 2007 10:14:42 +0900 (KST)
Content-return: prohibited
Date: Tue, 09 Jan 2007 01:14:42 +0000 (GMT)
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: OneNAND: read-while-load (known problem)
To: Adrian Hunter <hunter.programmer@gmail.com>
Message-id: <21965393.307811168305282593.JavaMail.weblogic@ep_ml29>
MIME-version: 1.0
MIME-version: 1.0
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: base64
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

QWgsIEkgc2VlDQoNCnBsZWFzZSB0cnkgdGhpcyBwYXRjaC4gSW4gbXkgdGVzdCBwcm9ncmFtLiBJ
dCBwYXNzZWQuDQoNClRoYW5rIHlvdSwNCkt5dW5nbWluIFBhcmsNCg0KLS0NCg0KQEAgLTc0Nyw2
ICs4MTksMTQgQEAgc3RhdGljIGludCBvbmVuYW5kX3JlYWQoc3RydWN0IG10ZF9pbmZvICptdGQs
IGxvZmZfdCBmcm9tLCBzaXplX3QgbGVuLA0KICAgICAgICAgICAgICAgIGZyb20gKz0gdGhpc2xl
bjsNCiAgICAgICAgICAgICAgICBpZiAocmVhZCArIHRoaXNsZW4gPCBsZW4pIHsNCiAgICAgICAg
ICAgICAgICAgICAgICAgIHRoaXMtPmNvbW1hbmQobXRkLCBPTkVOQU5EX0NNRF9SRUFELCBmcm9t
LCBtdGQtPndyaXRlc2l6ZSk7DQorICAgICAgICAgICAgICAgICAgICAgICAvKg0KKyAgICAgICAg
ICAgICAgICAgICAgICAgICogQ2hpcCBib3VuZGFyeSBoYW5kbGluZyBpbiBERFANCisgICAgICAg
ICAgICAgICAgICAgICAgICAqIE5vdyB3ZSBpc3N1ZWQgY2hpcCAxIHJlYWQgYW5kIHBvaW50ZWQg
Y2hpcCAxDQorICAgICAgICAgICAgICAgICAgICAgICAgKiBidWZmZXJhbSBzbyB3ZSBoYXZlIHRv
IHBvaW50IGNoaXAgMCBidWZmZXJhbS4NCisgICAgICAgICAgICAgICAgICAgICAgICAqLw0KKyAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKHRoaXMtPmRldmljZV9pZCAmIE9ORU5BTkRfREVWSUNF
X0lTX0REUCAmJg0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGZyb20gPT0gKHRoaXMtPmNo
aXBzaXplID4+IDEpKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aGlzLT53cml0
ZV93b3JkKDAsIHRoaXMtPmJhc2UgKyBPTkVOQU5EX1JFR19TVEFSVF9BRERSRVNTMik7DQogICAg
ICAgICAgICAgICAgICAgICAgICBPTkVOQU5EX1NFVF9QUkVWX0JVRkZFUlJBTSh0aGlzKTsNCiAg
ICAgICAgICAgICAgICB9DQogICAgICAgICAgICAgICAgLyogV2hpbGUgbG9hZCBpcyBnb2luZywg
cmVhZCBmcm9tIGxhc3QgYnVmZmVyUkFNICovDQoNCg0KDQoNCi0tLS0tLS0gT3JpZ2luYWwgTWVz
c2FnZSAtLS0tLS0tDQpTZW5kZXIgOiBBZHJpYW4gSHVudGVyPGh1bnRlci5wcm9ncmFtbWVyQGdt
YWlsLmNvbT4gDQpEYXRlICAgOiBKYW4gMDgsIDIwMDcgMTg6MjkNClRpdGxlICA6IFJlOiBPbmVO
QU5EOiByZWFkLXdoaWxlLWxvYWQgKGtub3duIHByb2JsZW0pDQoNCk9uIDEvOC8wNywgS3l1bmdt
aW4gUGFyayA8a3l1bmdtaW4ucGFya0BzYW1zdW5nLmNvbT4gd3JvdGU6DQo+IEhpIEFkcmlhbiwN
Cj4NCj4gPiBEbyB5b3UgdGhpbmsgdGhlcmUgY291bGQgYmUgYSBwcm9ibGVtIHdpdGggb25lbmFu
ZF9jaGVja19idWZmZXJyYW0gYWxzbz8NCj4NCj4gTm8sIG9uZW5hbmRfY2hlY2tfYnVmZmVycmFt
ICYgb25lbmFuZF91cGRhdGVfYnVmZmVycmFtIGlzIHJpZ2h0Lg0KPg0KDQpXaGF0IEkgbWVhbnQg
d2FzIHRoaXM6DQoNCjEuIFJlYWQgcGFnZSB4IGZyb20gY2hpcCAwLiBJdCBnb2VzIHRvIGRhdGFS
QU0gMCBpbiBjaGlwIDANCjIuIFJlYWQgcGFnZSB5IGZyb20gY2hpcCAxLiBJdCBnb2VzIHRvIGRh
dGFSQU0gMSBpbiBjaGlwIDENCjMuIFJlYWQgcGFnZSB4IGZyb20gY2hpcCAwLiBOb3cgdGhlIHJl
YWQgaW5jb3JyZWN0bHkgY29tZXMgZnJvbQ0KZGF0YVJBTSAwIGluIGNoaXAgMSBiZWNhdXNlIHRo
YXQgd2FzIHRoZSBsYXN0IGNoaXAgc2VsZWN0ZWQuDQoNCg0K
