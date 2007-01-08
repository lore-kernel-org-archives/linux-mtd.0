Received: from mailout3.samsung.com ([203.254.224.33])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H3lL2-0003Y3-4T
	for linux-mtd@lists.infradead.org; Sun, 07 Jan 2007 22:38:23 -0500
Received: from ep_ms12_bk (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0JBJ00ETC62BKT@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 08 Jan 2007 12:37:23 +0900 (KST)
Received: from ep_spt02 (ms12.samsung.com [203.254.225.99])
	by ms12.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0JBJ00H1K62B3E@ms12.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 08 Jan 2007 12:37:23 +0900 (KST)
Content-return: prohibited
Date: Mon, 08 Jan 2007 03:37:23 +0000 (GMT)
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: OneNAND: read-while-load (known problem)
To: Artem Bityutskiy <dedekind@infradead.org>
Message-id: <7302633.455711168227442976.JavaMail.weblogic@ep_ml21>
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

SGksDQoNCkZZSTogcmVhZC13aGlsZS1sb2FkIGtub3duIHByb2JsZW0gaW4gRERQLg0KDQpPZiBj
b3Vyc2UgaXQncyByYXJlIGNhc2UgaW4gTVRELiBhbmQgcGxlYXNlIGRvbid0IHByb2dyYW0gbGlr
ZSB0aGlzIGluIHVwcGVyIGxheWVyLg0KDQpJZiB5b3UgYXJlIHVzaW5nIE9uZU5BTkQgRERQIChE
dWFsIERlbnNpZHkgUGFja2FnZSkgYW5kIHlvdSB3YW50IHRvIHJlYWQgZGF0YSBiZXR3ZWVuIGNo
aXAgYm91bmRhcnkuIHlvdSBtYXliZSBmYWlsZWQgdG8gcmVhZC4NCg0KRm9yIGV4YW1wbGUsIDJH
Yml0IE9uZU5BTkQgRERQIGhhcyBmb2xsb3dpbmcgYWRkcmVzcw0KDQpDaGlwIDA6IDB4MDAwMCAw
MDAwIH4gMHgwODAwIDAwMDAgLSAxDQpDaGlwIDE6IDB4MDgwMCAwMDAwIH4gMHgxMDAwIDAwMDAg
LSAxDQoNCklmIHlvdSB3YW50IHRvIHJlYWQgZnJvbSAweDA3ZmYgZjgwMCB0byAweDgwMDAgMDgw
MCAoNEtCKS4gaXQgd2lsbCBiZSBmYWlsZWQgc2luY2UgZWFjaCBjaGlwIGhhcyBpdHMgb3duIGJ1
ZmZlcnJhbQ0KU28gaXQgZG9uJ3Qgc3VwcG9ydCByZWFkLXdoaWxlLWxvYWRpbmcgYmV0d2VlbiBl
YWNoIGNoaXAuIA0KDQpbQ2hpcCAwXSBvbmVuYW5kX3VwZGF0ZV9idWZmZXJyYW06IDEgYWRkciAw
eDdmZmUwMDAsIHZhbGlkID0gMQ0KW0NoaXAgMF0gb25lbmFuZF91cGRhdGVfYnVmZmVycmFtOiAw
IGFkZHIgMHg3ZmZlODAwLCB2YWxpZCA9IDENCltDaGlwIDBdIG9uZW5hbmRfdXBkYXRlX2J1ZmZl
cnJhbTogMSBhZGRyIDB4N2ZmZjAwMCwgdmFsaWQgPSAxDQpbQ2hpcCAwXSBvbmVuYW5kX3VwZGF0
ZV9idWZmZXJyYW06IDAgYWRkciAweDdmZmY4MDAsIHZhbGlkID0gMQ0KICAtPiBTZW5kIG5leHQg
cGFnZSByZWFkLCBidXQgbmV4dCBwYWdlIGlzIGluIGNoaXAgMQ0KW0NoaXAgMV0gb25lbmFuZF91
cGRhdGVfYnVmZmVycmFtOiAxIGFkZHIgMHg4MDAwMDAwLCB2YWxpZCA9IDEgPT4gQWN0dWFsbHkg
aXQncyBpbnZhbGlkIA0KW0NoaXAgMV0gb25lbmFuZF91cGRhdGVfYnVmZmVycmFtOiAwIGFkZHIg
MHg4MDAwODAwLCB2YWxpZCA9IDENCltDaGlwIDFdIG9uZW5hbmRfdXBkYXRlX2J1ZmZlcnJhbTog
MSBhZGRyIDB4ODAwMTAwMCwgdmFsaWQgPSAxDQoNClRoYW5rIHlvdSwNCkt5dW5nbWluIFBhcmsN
Cg0KDQotLS0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0tLQ0KU2VuZGVyIDogQXJ0ZW0gQml0
eXV0c2tpeTxkZWRla2luZEBpbmZyYWRlYWQub3JnPiANCkRhdGUgICA6IEphbiAwNSwgMjAwNyAx
OTo1NA0KVGl0bGUgIDogUmU6IE9uZU5BTkQ6IHJlYWQtd2hpbGUtbG9hZA0KDQpPbiBGcmksIDIw
MDctMDEtMDUgYXQgMDk6NTggKzAwMDAsIEt5dW5nbWluIFBhcmsgd3JvdGU6DQo+IFllcywgV2Ug
YWxyZWFkeSBrbmV3IHJlYWQtd2hpbGUtbG9hZGluZyBoYXMgYmV0dGVyIHBlcmZvcm1hbmNlIHRo
YW4gbm9ybWFsIHJlYWQuDQo+IEludGVybmFsbHkgd2UgY2FsbGVkIGl0ICdNUmVhZCcgKHJlZmVy
IGFub3RoZXIgT25lTkFORCBvcGVuIHNvdXJjZSBpbiBzYW1zdW5nIHdlYiBzaXRlKQ0KDQpJdCBp
cyB0cnVlIHRoYXQgSkZGUzIgaXMgY3VycmVudGx5IHRoZSBtYWluIHVzZXIuIEJ1dCBpdCBtYXkg
YmUgY2hhbmdlZA0KaW4gdGhlIGZ1dHVyZS4gQWxzbyBvbmUgZGF5IG9uZSBjYW4gdGVhY2ggSkZG
UzIgdG8gbWFpbnRhaW4gbGFyZ2VyIG5vZGVzDQp3aXRoLCBzYXkgMTZLIG9yIG1vcmUgYnl0ZXMg
b2YgZGF0YS4gQW5kIEJUVywgVUJJIHJlYWRzIHdob2xlDQplcmFzZWJsb2NrcyB3aGVuIG1ha2lu
ZyB3ZWFyLWxldmVsaW5nLCBzbyBpdCB3b3VsZCBhbHNvIGJlbmVmaXQuDQoNCi0tIA0KQmVzdCBy
ZWdhcmRzLA0KQXJ0ZW0gQml0eXV0c2tpeSAo0JHQuNGC0Y7RhtC60LjQuSDQkNGA0YLRkdC8KQ0K
DQoNCg0K
