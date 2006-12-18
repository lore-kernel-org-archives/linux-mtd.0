Received: from mailout3.samsung.com ([203.254.224.33])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GwA3z-0003qq-4e
	for linux-mtd@lists.infradead.org; Sun, 17 Dec 2006 23:25:22 -0500
Received: from ep_ms12_bk (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0JAG000KKC9BP7@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 18 Dec 2006 13:24:47 +0900 (KST)
Received: from ep_spt02 (ms12.samsung.com [203.254.225.99])
	by ms12.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0JAG00288C9BS7@ms12.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 18 Dec 2006 13:24:47 +0900 (KST)
Content-return: prohibited
Date: Mon, 18 Dec 2006 04:24:02 +0000 (GMT)
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: OneNAND: Update OOB free table
To: Timo Teras <timo.teras@solidboot.com>
Message-id: <14053092.180201166415887159.JavaMail.weblogic@ep_ml21>
MIME-version: 1.0
MIME-version: 1.0
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: base64
Cc: David Woodhouse <dwmw2@infradead.org>,
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

SGkgYWxsLA0KDQo+IE9uIEZyaSwgRGVjIDE1LCAyMDA2IGF0IDEyOjQxOjUzUE0gKzAyMDAsIEFy
dGVtIEJpdHl1dHNraXkgd3JvdGU6DQo+ID4gT24gRnJpLCAyMDA2LTEyLTE1IGF0IDAyOjM4ICsw
MDAwLCBLeXVuZ21pbiBQYXJrIHdyb3RlOg0KPiA+ID4gSG93IGFib3V0IHRoZSB0aGUgY2hhbmdl
IHRoZSBKRkZTMiBsb2dpYyB0byBza2lwIHRoZSBlY2Nwb3MgaW4gY2xlYW5tYXJrIGNoZWNrLg0K
PiA+ID4gSW4gb25lbmFuZF9vb2JfNjQsIGl0IGRlc2NyaWJlcyB0aGUgZWNjcG9zLiBTbyB0aGUg
SkZGUzIgc2tpcCB0aGUgZWNjcG9zDQo+ID4gDQo+ID4gTWF5IHlvdSByZWZpbmUgd2hhdCBpcyB0
aGUgcHJvYmxlbSBwbGVhc2U/DQoNCj4gamZmczJfY2hlY2tfb29iX2VtcHR5KCkgY2hlY2sgdGhh
dCB0aGUgd2hvbGUgT09CIGFyZWEgY29udGFpbnMgb25seSAweGZmDQo+IGJ5dGVzIGV4Y2VwdCBm
b3IgdGhlIGNsZWFuIG1hcmtlciBhcmVhLiBUaGlzIGlzIGJyb2tlbiBvbiBPbmVOQU5EIGFzIHdy
aXRpbmcNCj4gY2xlYW4gbWFya2VyIHRvIE9PQiBhcmVhIHdpbGwgY2hhbmdlIEVDQyBieXRlcy4N
Cj4NCj4gQWxzbyB0aGUgY2xlYW4gbWFya2VyIGlzIG5vdCB3cml0dGVuIHByb3Blcmx5IGFzIG9u
bHkgdGhlIGZpcnN0IG9vYmZyZWUNCj4gdGFibGUgZWxlbWVudCBpcyB1c2VkLiBCdXQgdGhpcyBp
cyBhIGRpZmZlcmVudCBpc3N1ZS4NCg0KSG93IGFib3V0IHRoZSB0aGlzIHBhdGNoPw0KSXQgc2tp
cHMgdGhlIGVjYyBwb3NpdGlvbiB3aGljaCBpcyBkZWZpbmVkIGluIGVjYyBsYXlvdXQgaW4gbXRk
IGRyaXZlcnMuDQoNClRoYW5rIHlvdSwNCkt5dW5nbWluIFBhcmsNCg0KLS0NCg0KZGlmZiAtdSAt
cCAtcjEuMS4xLjEgd2J1Zi5jDQotLS0gZnMvamZmczIvd2J1Zi5jICAgICAxMiBPY3QgMjAwNiAw
NTo1MDozMCAtMDAwMCAgICAgIDEuMS4xLjENCisrKyBmcy9qZmZzMi93YnVmLmMgICAgIDE4IERl
YyAyMDA2IDA0OjIxOjI5IC0wMDAwDQpAQCAtOTY3LDYgKzk2Nyw4IEBAIGludCBqZmZzMl9jaGVj
a19vb2JfZW1wdHkoc3RydWN0IGpmZnMyX3MNCiAgICAgICAgaW50IGksIHBhZ2UsIHJldDsNCiAg
ICAgICAgaW50IG9vYnNpemUgPSBjLT5tdGQtPm9vYnNpemU7DQogICAgICAgIHN0cnVjdCBtdGRf
b29iX29wcyBvcHM7DQorICAgICAgIHN0cnVjdCBuYW5kX2VjY2xheW91dCAqb2luZm8gPSBjLT5t
dGQtPmVjY2xheW91dDsNCisgICAgICAgaW50IGVjY3BvcyA9IDA7DQoNCiAgICAgICAgb3BzLmxl
biA9IE5SX09PQl9TQ0FOX1BBR0VTICogb29ic2l6ZTsNCiAgICAgICAgb3BzLm9vYmxlbiA9IG9v
YnNpemU7DQpAQCAtOTkxLDYgKzk5MywxMiBAQCBpbnQgamZmczJfY2hlY2tfb29iX2VtcHR5KHN0
cnVjdCBqZmZzMl9zDQoNCiAgICAgICAgLyogU3BlY2lhbCBjaGVjayBmb3IgZmlyc3QgcGFnZSAq
Lw0KICAgICAgICBmb3IoaSA9IDA7IGkgPCBvb2JzaXplIDsgaSsrKSB7DQorICAgICAgICAgICAg
ICAgLyogU2tpcCBFQ0MgcG9zaXRpb24gZm9yIE9uZU5BTkQgKi8NCisgICAgICAgICAgICAgICBp
ZiAoaSA9PSBvaW5mby0+ZWNjcG9zW2VjY3Bvc10pIHsNCisgICAgICAgICAgICAgICAgICAgICAg
IGVjY3BvcysrOw0KKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQorICAgICAgICAg
ICAgICAgfQ0KKw0KICAgICAgICAgICAgICAgIC8qIFllYWgsIHdlIGtub3cgYWJvdXQgdGhlIGNs
ZWFubWFya2VyLiAqLw0KICAgICAgICAgICAgICAgIGlmIChtb2RlICYmIGkgPj0gYy0+ZnNkYXRh
X3BvcyAmJg0KICAgICAgICAgICAgICAgICAgICBpIDwgYy0+ZnNkYXRhX3BvcyArIGMtPmZzZGF0
YV9sZW4pDQoNCg0K
