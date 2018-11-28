Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gS1Fv-0003qf-I0
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2018 14:56:01 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: Fix memory allocation in nanddev_bbt_init()
Date: Wed, 28 Nov 2018 14:55:45 +0000
Message-ID: <7634bb45-6167-31e8-e169-b5c9bf7e2fc5@kontron.de>
References: <1543304637-27308-1-git-send-email-frieder.schrempf@kontron.de>
 <20181128154104.577d5923@bbrezillon>
In-Reply-To: <20181128154104.577d5923@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1C7C49255D6A542A08440A9CD6218C2@snt-world.com>
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

SGkgQm9yaXMsDQoNCk9uIDI4LjExLjE4IDE1OjQxLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6DQo+
IE9uIFR1ZSwgMjcgTm92IDIwMTggMDc6NDQ6NTIgKzAwMDANCj4gU2NocmVtcGYgRnJpZWRlciA8
ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPiB3cm90ZToNCj4gDQo+PiBGaXggdGhlIHNpemUg
b2YgdGhlIGJ1ZmZlciBhbGxvY2F0ZWQgdG8gc3RvcmUgdGhlIGluLW1lbW9yeSBCQlQuDQo+PiBU
aGlzIGJ1ZyB3YXMgcHJldmlvdXNseSBoaWRkZW4gYnkgYSBkaWZmZXJlbnQgYnVnLCB0aGF0IHdh
cyBmaXhlZCBpbg0KPj4gZDA5ODA5M2JhMDZlLg0KPj4NCj4+IEZpeGVzOiA5YzM3MzZhM2RlMjEg
KCJtdGQ6IG5hbmQ6IEFkZCBjb3JlIGluZnJhc3RydWN0dXJlIHRvIGRlYWwgd2l0aCBOQU5EIGRl
dmljZXMiKQ0KPj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPg0KPj4gU2lnbmVkLW9mZi1i
eTogRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPg0KPiANCj4g
TG9va3MgbGlrZSB5b3VyIEZyb20gaGVhZGVyIGRvZXMgbm90IG1hdGNoIHRoZSBTb0IgdGFnDQo+
ICgnRnJpZWRlciBTY2hyZW1wZicgdnMgJ1NjaHJlbXBmIEZyaWVkZXInKSBhbmQgY2hlY2twYXRj
aCBkb2VzIG5vdCBsaWtlDQo+IHRoYXQuIEknbGwgZml4IGl0IHdoZW4gYXBwbHlpbmcsIGJ1dCBt
YXliZSB5b3Ugc2hvdWxkIGZpeA0KPiB5b3VyIC5naXRjb25maWcgdG8gbWFrZSB0aGVtIG1hdGNo
Lg0KDQpBY3R1YWxseSB0aGUgRnJvbSBoZWFkZXIgaW4gbXkgbG9jYWwgcGF0Y2ggaXMgY29ycmVj
dCAoPGZpcnN0IG5hbWU+IA0KPGxhc3QgbmFtZT4sIEZyaWVkZXIgU2NocmVtcGYpIGFzIGl0IGNv
bWVzIGZyb20gbXkgZ2l0IGNvbmZpZy4gQnV0IHNpbmNlIA0Kb3VyIGNvbXBhbnkgd2FzIHJlbmFt
ZWQgYW5kIG91ciBtYWlsIHNlcnZlcnMgd2VyZSB0cmFuc2ZlcnJlZCwgb3VyIA0KZS1tYWlscyBh
cmUgc2VudCB3aXRoIEZyb209PGxhc3QgbmFtZT4gPGZpcnN0IG5hbWU+Lg0KDQpJdCBzZWVtcyBs
aWtlIGdpdCBzZW5kLWVtYWlsIG9yIHBhdGNod29yayBvciB3aGF0ZXZlciB1c2VzIHRoZSANCmlu
Zm9ybWF0aW9uIGZyb20gdGhlIGUtbWFpbCBoZWFkZXIgaW5zdGVhZCBvZiB3aGF0IGlzIGluIHRo
ZSBwYXRjaC4NCg0KSSB3aWxsIHRyeSB0byByYWlzZSB0aGlzIGlzc3VlIHdpdGggb3VyIElUIGRl
cGFydG1lbnQgYXMgdGhpcyB3b3VsZCBiZSANCmJlc3QgZml4ZWQgb24gdGhlaXIgc2lkZS4NCg0K
VGhhbmtzLA0KRnJpZWRlcg0KDQo+IA0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvbXRkL25hbmQvYmJ0
LmMgfCAzICsrLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvYmJ0LmMgYi9kcml2
ZXJzL210ZC9uYW5kL2JidC5jDQo+PiBpbmRleCA1NmNkZTM4Li5jMTI0OTdmIDEwMDY0NA0KPj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9iYnQuYw0KPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9i
YnQuYw0KPj4gQEAgLTI3LDcgKzI3LDggQEAgaW50IG5hbmRkZXZfYmJ0X2luaXQoc3RydWN0IG5h
bmRfZGV2aWNlICpuYW5kKQ0KPj4gICAJdW5zaWduZWQgaW50IG53b3JkcyA9IERJVl9ST1VORF9V
UChuYmxvY2tzICogYml0c19wZXJfYmxvY2ssDQo+PiAgIAkJCQkJICAgQklUU19QRVJfTE9ORyk7
DQo+PiAgIA0KPj4gLQluYW5kLT5iYnQuY2FjaGUgPSBremFsbG9jKG53b3JkcywgR0ZQX0tFUk5F
TCk7DQo+PiArCW5hbmQtPmJidC5jYWNoZSA9IGt6YWxsb2MobndvcmRzICogKEJJVFNfUEVSX0xP
TkcgLyBCSVRTX1BFUl9CWVRFKSwNCj4+ICsJCQkJICBHRlBfS0VSTkVMKTsNCj4+ICAgCWlmICgh
bmFuZC0+YmJ0LmNhY2hlKQ0KPj4gICAJCXJldHVybiAtRU5PTUVNOw0KPj4gICANCj4g
