Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H2lqD-0007w0-UN
	for linux-mtd@lists.infradead.org; Fri, 05 Jan 2007 04:58:29 -0500
Received: from ep_ms12_bk (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0JBE00M333PACS@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 05 Jan 2007 18:58:23 +0900 (KST)
Received: from ep_spt02 (ms12.samsung.com [203.254.225.99])
	by ms12.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0JBE006BV3PA1O@ms12.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 05 Jan 2007 18:58:22 +0900 (KST)
Content-return: prohibited
Date: Fri, 05 Jan 2007 09:58:22 +0000 (GMT)
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: OneNAND: read-while-load
To: Artem Bityutskiy <dedekind@infradead.org>
Message-id: <3488442.114061167991102401.JavaMail.weblogic@ep_ml22>
MIME-version: 1.0
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: base64
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <hunter.programmer@gmail.com>
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

WWVzLCBXZSBhbHJlYWR5IGtuZXcgcmVhZC13aGlsZS1sb2FkaW5nIGhhcyBiZXR0ZXIgcGVyZm9y
bWFuY2UgdGhhbiBub3JtYWwgcmVhZC4NCkludGVybmFsbHkgd2UgY2FsbGVkIGl0ICdNUmVhZCcg
KHJlZmVyIGFub3RoZXIgT25lTkFORCBvcGVuIHNvdXJjZSBpbiBzYW1zdW5nIHdlYiBzaXRlKQ0K
DQpDdXJyZW50bHkgaXQgaXMgYmVzdCBvbmUgaWYgdGhlIEpGRlMyIHJlcXVlc3RzIHJlYWQgNEtC
IG9yIG1vcmUuDQphbmQgaWYgeW91IGFyZSB1c2luZyB0aGUgbXRkYmxvY2suIGl0IGFsc28gaGFz
IGJlbmVmaXRzDQoNClRoYW5rIHlvdSwNCkt5dW5nbWluIFBhcmsNCg0KLS0tLS0tLSBPcmlnaW5h
bCBNZXNzYWdlIC0tLS0tLS0NClNlbmRlciA6IEFydGVtIEJpdHl1dHNraXk8ZGVkZWtpbmRAaW5m
cmFkZWFkLm9yZz4gDQpEYXRlICAgOiBKYW4gMDUsIDIwMDcgMTg6MDENClRpdGxlICA6IFJlOiBP
bmVOQU5EOiByZWFkLXdoaWxlLWxvYWQNCg0KS3l1bmdtaW4sIEFkcmlhbiwNCg0KT24gRnJpLCAy
MDA3LTAxLTA1IGF0IDA3OjE1ICswMDAwLCBLeXVuZ21pbiBQYXJrIHdyb3RlOg0KPiBJIHdpbGwg
cnVuIHJlZ3Jlc3Npb24gdGVzdCB3aXRoIHRoaXMgb25lIGR1cmluZyB0aGlzIHdlZWtlbmQuDQo+
IA0KPiBBbmQgd2hpY2ggcHJvZ3JhbSAoSkZGUzIgb3IgVUJJKSBkbyB5b3UgdXNlLg0KPiANCj4g
SSBjYW4ndCBmaW5kIGFueSBwZXJmb3JtYW5jZSBpbmNyZWFzZSBpbiBKRkZTMg0KDQpJdCBkZXBl
bmRzIGhvdyB5b3UgdGVzdGVkIGl0LiBTdXJlbHkgeW91IG5vdGljZSBzb21lIHBlcmZvcm1hbmNl
IGdhaW4NCm9ubHkgaWYgSkZGUzIgcmVhZHMgbW9yZSB0aGVuIDJLIGJ5dGVzIG9mIGRhdGEuIEFu
ZCB0aGlzIG9ubHkgaGFwcGVucw0Kd2hlbiB5b3UgcmVhZCBmaWxlcydzIGNvbnRlbnRzLCBlc3Bl
Y2lhbGx5IGlmIHRoaXMgZmlsZSdzIHBhZ2VzIHdlcmUgbm90DQpjb21wcmVzc2VkIHRvIGxlc3Mg
dGhlbiAySy4NCg0KU28gYSB0ZXN0IGxpa2U6DQoNCmRkIGlmPS9kZXYvdWRhbmRvbSBvZj0vbW50
L2pmZnMyL2ZpbGUgYnM9NEsNCnRpbWUgZGQgaWY9L21udC9qZmZzMi9maWxlIG9mPS9kZXYvbnVs
bA0KDQp3b3VsZCBiZSByb3VnaGx5IE9LLg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkFydGVtIEJp
dHl1dHNraXkgKNCR0LjRgtGO0YbQutC40Lkg0JDRgNGC0ZHQvCkNCg0KDQoNCg==
