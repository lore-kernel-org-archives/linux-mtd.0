Received: from mail-eopbgr10139.outbound.protection.outlook.com
 ([40.107.1.139] helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTjCY-0006CJ-Bb
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 08:03:35 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Marek
 Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] mtd: spi-nor: Provide default address width and latency
 for map selection
Date: Mon, 3 Dec 2018 08:03:18 +0000
Message-ID: <f11c7ab4-ee19-ad4e-7943-d6359ac58249@nokia.com>
References: <20181129181519.15681-1-alexander.sverdlin@nokia.com>
 <20181130114019.175ab7ec@bbrezillon>
In-Reply-To: <20181130114019.175ab7ec@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A111A45ACB6F184AB0BED6B992B601BC@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGVsbG8gQm9yaXMhDQoNCk9uIDMwLzExLzIwMTggMTE6NDAsIEJvcmlzIEJyZXppbGxvbiB3cm90
ZToNCj4+ICsJCS8qDQo+PiArCQkgKiBKRVNEMjE2IGFsbG93cyB0byBvbWl0IHBhcnRpY3VsYXIg
YWRkcmVzcyBsZW5ndGggb3IgbGF0ZW5jeQ0KPj4gKwkJICogc3BlY2lmaWNhdGlvbiBpbiB0aGUg
aGVhZGVyIGFuZCBhdCB0aGlzIHBvaW50IHRoZXkgYXJlIHN0aWxsDQo+PiArCQkgKiB1bnNldCwg
c28gd2UgbmVlZCBzb21lIGhldXJpc3RpY3MuIE9uZSBleGFtcGxlIGlzIFMyNUZTMTI4Uy4NCj4+
ICsJCSAqLw0KPj4gKwkJaWYgKCFub3ItPmFkZHJfd2lkdGgpDQo+PiArCQkJbm9yLT5hZGRyX3dp
ZHRoID0gMzsNCj4+ICsJCWlmICghbm9yLT5yZWFkX2R1bW15KQ0KPj4gKwkJCW5vci0+cmVhZF9k
dW1teSA9IDg7DQo+PiArDQo+IExvb2tzIGxpa2UgdGhlIHNhbWUgcHJvYmxlbSB3YXMgcmVwb3J0
ZWQgYnkgWW9nZXNoIGhlcmUgWzFdLiBPbmUgbW9yZQ0KDQpUaGlzIGlzIGluZGVlZCB0aGUgc2Ft
ZSBwcm9ibGVtLCBhbHRob3VnaCBJIHdhcyBub3QgYXdhcmUgb2YgdGhlIFsxXSBkaXNjdXNzaW9u
Lg0KDQo+IHByb29mIHRoYXQgcGFyc2luZyBTRkRQIGlzIG5vdCB0cml2aWFsLiBJIG1lYW4sIHdo
YXQncyB0aGUgcG9pbnQgb2YNCj4gZGVmaW5pbmcgYSBnZW5lcmljIHRhYmxlcyB0byBkZXNjcmli
ZSBOT1IgY2FwYWJpbGl0aWVzIGlmIHlvdSB0aGVuDQo+IGRlcGVuZCBvbiB2ZW5kb3IvY2hpcCBz
cGVjaWZpYyBpbml0IHRvIHJlYWQgdGhvc2UgdGFibGVzLi4uDQo+IA0KPiBBbnl3YXksIEkgdGhp
bmsgdGhpcyBzb3J0IG9mIGluaXRpYWxpemF0aW9uIHNob3VsZCBiZSBwbGFjZWQgaW4gYQ0KPiBw
cmVfc2ZkcCgpIGZpeHVwIGhvb2ssIGFzIGdldHRpbmcgdGhlIHJpZ2h0IHZhbHVlcyBsaWtlbHkg
cmVxdWlyZXMNCg0KVGhpcyBpcyBzdGlsbCBvbiBteSBUT0RPIGxpc3QsIHRvIGxlYXJuIGFib3V0
IG5ldyBob29rcy4NCg0KPiByZWFkaW5nIHNvbWUgdm9sYXRpbGUvbm9uLXZvbGF0aWxlIHJlZ3Mu
DQoNClRoaXMgaXMgdGhlIHNhbWUgaW5zdHJ1Y3Rpb24gNjVoIHdoaWNoIGlzIHVzZWQgdG8gcmVh
ZCByZWdzIGFuZCB3aGljaA0KYXBwZWFycyBpbiBTTVBUIGhlYWRlcnMsIGl0IGlzIGEgY2hpY2tl
bi1lZ2cgcHJvYmxlbS4NCg0KVGhlcmVmb3JlLCBJIGRvbid0IGtub3cgaWYgaXQncyBwb3NzaWJs
ZSB0byBwcm92aWRlIHNtYXJ0ZXIgaGV1cmlzdGljcw0KaGVyZS4gQnV0IHdpdGhvdXQgaXQgU3Bh
bnNpb24gUzI1RlMtUyBGYW1pbHkgaXMgbm93IGJyb2tlbiBieSBTRkRQLg0KDQo+PiAgCQllcnIg
PSBzcGlfbm9yX3JlYWRfcmF3KG5vciwgYWRkciwgMSwgJmRhdGFfYnl0ZSk7DQo+PiAgCQlpZiAo
ZXJyKQ0KPj4gIAkJCWdvdG8gb3V0Ow0KPiBbMV1odHRwczovL2xrbWwub3JnL2xrbWwvMjAxOC8x
MC8yMi8zNTQNCj4gDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KQWxleGFuZGVyIFN2ZXJkbGluLg0K
