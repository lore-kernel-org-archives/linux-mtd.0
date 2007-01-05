Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H2jLD-0005Vt-E8
	for linux-mtd@lists.infradead.org; Fri, 05 Jan 2007 02:18:20 -0500
Received: from ep_ms12_bk (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0JBD00HD8W5MFT@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 05 Jan 2007 16:15:22 +0900 (KST)
Received: from ep_spt03 (ms12.samsung.com [203.254.225.99])
	by ms12.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0JBD008I3W5MQZ@ms12.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 05 Jan 2007 16:15:22 +0900 (KST)
Content-return: prohibited
Date: Fri, 05 Jan 2007 07:15:22 +0000 (GMT)
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: OneNAND: read-while-load
To: Adrian Hunter <hunter.programmer@gmail.com>
Message-id: <30559532.90311167981321931.JavaMail.weblogic@ep_ml22>
MIME-version: 1.0
MIME-version: 1.0
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: base64
Cc: Josh Boyer <jwboyer@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGksDQoNCml0IGxvb2tzIGdvb2QgdG8gbWUuIGV4Y2VwdCBvbmUNCg0KPiArCS8qIFJlYWQtd2hp
bGUtbG9hZCBtZXRob2QgKi8NCj4gDQo+ICsJLyogRG8gZmlyc3QgbG9hZCB0byBidWZmZXJSQU0g
Ki8NCj4gKwlpZiAocmVhZCA8IGxlbikgew0KDQpJIHRoaW5rIGl0IGlzIGFsd2F5IHRydWUuIElz
IHRoZXJlIGFueSBjYXNlIHRoYXQgc2VuZHMgemVybyAnbGVuJyBmcm9tIHVwcGVyIGxheWVyPw0K
DQpJIHdpbGwgcnVuIHJlZ3Jlc3Npb24gdGVzdCB3aXRoIHRoaXMgb25lIGR1cmluZyB0aGlzIHdl
ZWtlbmQuDQoNCkFuZCB3aGljaCBwcm9ncmFtIChKRkZTMiBvciBVQkkpIGRvIHlvdSB1c2UuDQoN
CkkgY2FuJ3QgZmluZCBhbnkgcGVyZm9ybWFuY2UgaW5jcmVhc2UgaW4gSkZGUzINCg0KSGVyZSdz
IG15IHRlc3QgcmVzdWx0cw0KDQpUYXJnZXQ6IEFwb2xsb24gKE9NQVAyKSAzMzBNSHosIE9uZU5B
TkQgODNNSHogd2l0aCBTeW5jLiBCdXJzdCBSZWFkIHN1cHBvcnQgbW9kZQ0KDQojIGlvem9uZSAt
VSAvamZmczIgLWYgL2pmZnMyL3Rlc3QgLWUgLUEgLXMgMTBtIC1xIDI1NmsNCg0KQmVmb3JlIHBh
dGNoDQoNCiAgICAgICAgICAgICAgS0IgIHJlY2xlbiAgIHdyaXRlIHJld3JpdGUgICAgcmVhZCAg
ICByZXJlYWQNCiAgICAgICAgICAgMTAyNDAgICAgICAgNCAgICA1OTYxICAgIDU5NDIgICAgMTU2
NjcgICAgMTU2NzcNCiAgICAgICAgICAgMTAyNDAgICAgICAgOCAgICA2MDUzICAgIDYwMzMgICAg
MTU4NDkgICAgMTU4MzANCiAgICAgICAgICAgMTAyNDAgICAgICAxNiAgICA2MDY4ICAgIDYwNjgg
ICAgMTU5ODMgICAgMTU5NzQNCiAgICAgICAgICAgMTAyNDAgICAgICAzMiAgICA2MDkxICAgIDYw
ODggICAgMTYwOTggICAgMTYwODMNCiAgICAgICAgICAgMTAyNDAgICAgICA2NCAgICA2MTE1ICAg
IDYwNzcgICAgMTYxMjggICAgMTYxMTENCiAgICAgICAgICAgMTAyNDAgICAgIDEyOCAgICA2MTQy
ICAgIDYxMzQgICAgMTYyNDkgICAgMTYyMjYNCiAgICAgICAgICAgMTAyNDAgICAgIDI1NiAgICA2
MTM4ICAgIDYxNDcgICAgMTYxODQgICAgMTYyMTINCg0KQWZ0ZXIgcGF0Y2gNCg0KICAgICAgICAg
ICAgICBLQiAgcmVjbGVuICAgd3JpdGUgcmV3cml0ZSAgICByZWFkICAgIHJlcmVhZA0KICAgICAg
ICAgICAxMDI0MCAgICAgICA0ICAgIDU5MzEgICAgNTkxNCAgICAxNTU5OCAgICAxNTU3Nw0KICAg
ICAgICAgICAxMDI0MCAgICAgICA4ICAgIDYwMzUgICAgNTk0MSAgICAxNTc3NSAgICAxNTc0Mw0K
ICAgICAgICAgICAxMDI0MCAgICAgIDE2ICAgIDYwNzAgICAgNjAzNyAgICAxNjAyMCAgICAxNTk4
Ng0KICAgICAgICAgICAxMDI0MCAgICAgIDMyICAgIDYwOTggICAgNjA4MSAgICAxNjE0MCAgICAx
NjExNQ0KICAgICAgICAgICAxMDI0MCAgICAgIDY0ICAgIDYxMjMgICAgNjEwMCAgICAxNjEyMyAg
ICAxNjEwOA0KICAgICAgICAgICAxMDI0MCAgICAgMTI4ICAgIDYxNDcgICAgNjEwMiAgICAxNjE4
NiAgICAxNjE4OA0KICAgICAgICAgICAxMDI0MCAgICAgMjU2ICAgIDYxMzQgICAgNjExNCAgICAx
NjE0MiAgICAxNjE1Mg0KDQoNClRoYW5rIHlvdSwNCkt5dW5nbWluIFBhcms=
