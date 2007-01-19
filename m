Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H7p3t-0005nc-Ru
	for linux-mtd@lists.infradead.org; Fri, 19 Jan 2007 03:25:31 -0500
Received: from ep_ms12_bk (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0JC300LZ5WJCJW@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 19 Jan 2007 17:21:12 +0900 (KST)
Received: from ep_spt01 (ms12.samsung.com [203.254.225.99])
	by ms12.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0JC3007XMWJCZA@ms12.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 19 Jan 2007 17:21:12 +0900 (KST)
Content-return: prohibited
Date: Fri, 19 Jan 2007 08:21:12 +0000 (GMT)
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: OneNAND: Always print error messages
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Message-id: <7109995.92931169194871882.JavaMail.weblogic@ep_ml26>
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

DQoNCg0KLS0tLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tLS0NClNlbmRlciA6IEFkcmlhbiBI
dW50ZXI8ZXh0LWFkcmlhbi5odW50ZXJAbm9raWEuY29tPiANCkRhdGUgICA6IEphbiAxOSwgMjAw
NyAxNzowMg0KVGl0bGUgIDogUmU6IE9uZU5BTkQ6IEFsd2F5cyBwcmludCBlcnJvciBtZXNzYWdl
cw0KDQpleHQgS3l1bmdtaW4gUGFyayB3cm90ZToNCj4+IElzIGl0IHBvc3NpYmxlIHRvIGdldCBh
biBFQ0MgZXJyb3Igd2hlbiBzY2FubmluZyBhIGJhZCBibG9jaz8NCj4gDQo+IFRoZW9yZXRpY2Fs
IGl0J3MgcG9zc2libGUgYnV0IEkgbmV2ZXIgc2VlIGl0Lg0KDQpJIGxpa2UgdG8gcHJvZ3JhbSBh
bGwgdGhlIGNvcm5lciBjYXNlcy4NCg0KPj4gSWYgYSBsb2FkIGVycm9yIG9jY3VycyB3aGVuIHNj
YW5uaW5nIGEgYmFkIGJsb2NrLCBkb2VzIHRoYXQgbWVhbiB0aGUgZGF0YVJBTQ0KPj4gaGFzIGJl
ZW4gdXBkYXRlZCBvciBub3Q/DQo+IA0KPiBzY2FubmluZyBhIGJhZCBibG9jayBtZWFucyByZWFk
IG9vYiBzbyB3ZSBkb24ndCB1cGRhdGUgZGF0YVJBTS4gSW4gb25lbmFuZCBpbXBsZW1lbnRhdGlv
bi4gd2UgYWx3YXlzIGludmFsaWQgZGF0YVJBTSBpbiBvb2IgY2FzZS4NCg0KSSBtZWFudCB0aGUg
ZGF0YVJBTSBzcGFyZSBhcmVhOiA4MDEwaCAtIDgwNGZoIGluIHRoZSBidWZmZXJSQU0gYWRkcmVz
cyBtYXAuDQoNCkFmdGVyIGEgbG9hZCBlcnJvciwgd2lsbCB0aGlzOg0KDQoJCXRoaXMtPnJlYWRf
YnVmZmVycmFtKG10ZCwgT05FTkFORF9TUEFSRVJBTSwgYnVmLCBjb2x1bW4sIHRoaXNsZW4pOw0K
DQpyZWFkIHRoZSB3aGF0IHdhcyBtZWFudCB0byBiZSBsb2FkZWQsIG9yIHdpbGwgaXQgc3RpbGwg
Y29udGFpbiB0aGUgZGF0YSBmcm9tIGEgcHJldmlvdXMgbG9hZD8NCg0KPT4gSXQgZGVwZW5kcyBv
biBsb2FkIGVycm9yIHRpbWluZ3MuIGJ1dCB3ZSB0aGluayBpdCBpcyBhbHdheXMgaW52YWxpZC4N
CmxvYWQgZXJyb3IgbWVhbnMgdGhhdCB0aGVyZSdzIGVycm9yIGR1cmluZyBsb2FkIGZyb20gbmFu
ZCBjb3JlIHRvIGJ1ZmZlcnJhbS4NCg0KVGhhbmsgeW91LA0KS3l1bmdtaW4gUGFyaw0KDQoNCg0K
