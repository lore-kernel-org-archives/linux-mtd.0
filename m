Received: from mailout3.samsung.com ([203.254.224.33])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H8tgR-0004uY-Tw
	for linux-mtd@lists.infradead.org; Mon, 22 Jan 2007 02:33:43 -0500
Received: from ep_ms12_bk (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0JC900G3TEBH7Q@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 22 Jan 2007 16:33:17 +0900 (KST)
Received: from ep_spt02 (ms12.samsung.com [203.254.225.99])
	by ms12.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0JC900JF3EBGJA@ms12.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 22 Jan 2007 16:33:17 +0900 (KST)
Content-return: prohibited
Date: Mon, 22 Jan 2007 07:33:16 +0000 (GMT)
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: OneNAND: Check first or second pages for bad block information
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Message-id: <3686708.94231169451196140.JavaMail.weblogic@ep_ml23>
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

SGksDQoNCkknbSBub3Qgc3VyZSB3ZSBoYXZlIHRvIGNoZWNrIDJuZCBwYWdlLiBZZXMsIFNwZWMu
IHNheXMgd2Ugd2lsbCBjaGVjayAxc3QgYW5kIDJuZCBvbmVzLg0KDQpJdCBpbmNyZWFzZSB0aGUg
Ym9vdCB0aW1lIGV2ZW4gdGhvdWdoIGl0J3Mgc21hbGxlciBvbmUgdGhhbiBvdGhlcnMuDQoNCkxl
dCBtZSB0aGluaywgd2hlbiB3ZSBjaGVjayAybmQgcGFnZSBjYXNlLg0KSW4gaW5pdGlhbCBiYWQs
IG5vIG5lZWQgdG8gY2hlY2sgMm5kIHBhZ2UuDQpJbiBydW50aW1lIGJhZCwgaXQgaXMgb25seSBo
YXBwZW5kIHdoZW4gZmlyc3QgcGFnZSB3cml0ZSBmYWlsZWQuIEJ1dCBkdXJpbmcgd3JpdGUgaXQg
aGFzIG5vbi0weEZGIHZhbHVlLiBzbyBuZXh0IHRpbWUgaXQgd2lsbCBiZSBkZXRlY3RlZCBhcyBp
bnZhbGlkLg0KDQpIb3cgZG8geW91IHRoaW5rIGFib3V0IGl0Pw0KDQpUaGFuayB5b3UsDQpLeXVu
Z21pbiBQYXJrDQoNCg0KLS0tLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tLS0NClNlbmRlciA6
IEFkcmlhbiBIdW50ZXI8ZXh0LWFkcmlhbi5odW50ZXJAbm9raWEuY29tPiANCkRhdGUgICA6IEph
biAxOSwgMjAwNyAyMzozNw0KVGl0bGUgIDogW1BBVENIXSBbTVREXSBPbmVOQU5EOiBDaGVjayBm
aXJzdCBvciBzZWNvbmQgcGFnZXMgZm9yIGJhZCBibG9jaw0KIGluZm9ybWF0aW9uDQoNCg0KT25l
TkFORCByZWNvcmRzIGJhZCBibG9jayBpbmZvcm1hdGlvbiBpbiB0aGUgb3V0LW9mLWJhbmQgYXJl
YSBvZg0KZWl0aGVyIHRoZSBmaXJzdCBvciBzZWNvbmQgcGFnZSBvZiBhIGJsb2NrLiAgRHVlIHRv
IGEgbG9naWMgZXJyb3IsDQpvbmx5IHRoZSBmaXJzdCBwYWdlIHdhcyBiZWluZyBjaGVja2VkLg0K
DQpTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gSHVudGVyIDxleHQtYWRyaWFuLmh1bnRlckBub2tpYS5j
b20+DQotLS0NCiBkcml2ZXJzL210ZC9vbmVuYW5kL29uZW5hbmRfYmJ0LmMgfCAgICAyICstDQog
MSBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9vbmVuYW5kL29uZW5hbmRfYmJ0LmMgYi9kcml2ZXJzL210ZC9v
bmVuYW5kL29uZW5hbmRfYmJ0LmMNCmluZGV4IDkwZGI4ZjUuLmFhNDZiN2YgMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL210ZC9vbmVuYW5kL29uZW5hbmRfYmJ0LmMNCisrKyBiL2RyaXZlcnMvbXRkL29u
ZW5hbmQvb25lbmFuZF9iYnQuYw0KQEAgLTY4LDcgKzY4LDcgQEAgc3RhdGljIGludCBjcmVhdGVf
YmJ0KHN0cnVjdCBtdGRfaW5mbyAqbQ0KIA0KIAlwcmludGsoS0VSTl9JTkZPICJTY2FubmluZyBk
ZXZpY2UgZm9yIGJhZCBibG9ja3NcbiIpOw0KIA0KLQlsZW4gPSAxOw0KKwlsZW4gPSAyOw0KIA0K
IAkvKiBXZSBuZWVkIG9ubHkgcmVhZCBmZXcgYnl0ZXMgZnJvbSB0aGUgT09CIGFyZWEgKi8NCiAJ
c2NhbmxlbiA9IG9vYmxlbiA9IDA7DQotLSANCjEuNC4zDQoNCg0KDQo=
