Received: from mail-db3eur04on0706.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::706]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNFwv-0007lx-TW
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2018 11:36:43 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "Cristian.Birsan@microchip.com" <Cristian.Birsan@microchip.com>
Subject: Re: [RFC] mtd: spi-nor: add support to non-uniform SFDP SPI NOR flash
 memories
Date: Thu, 15 Nov 2018 11:36:07 +0000
Message-ID: <87bfe8c4-e9cb-f67b-8f67-37f728c0658a@nokia.com>
References: <e902a586-9e15-544c-ab4d-37d6ee28cdff@nokia.com>
 <a38ad0f7-e51a-158e-e074-2b1cdabecd16@microchip.com>
 <20181115114620.36ff32c7@bbrezillon>
In-Reply-To: <20181115114620.36ff32c7@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2DFE73F88B72545B097ED91F71041C3@eurprd07.prod.outlook.com>
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

SGVsbG8gQm9yaXMsDQoNCk9uIDE1LzExLzIwMTggMTE6NDYsIEJvcmlzIEJyZXppbGxvbiB3cm90
ZToNCj4+PiAJLyoNCj4+PiAJICogRm9yIG5vbi11bmlmb3JtIFNQSSBmbGFzaCBtZW1vcnksIHNl
dCBtdGQtPmVyYXNlc2l6ZSB0byB0aGUNCj4+PiAJICogbWF4aW11bSBlcmFzZSBzZWN0b3Igc2l6
ZS4gTm8gbmVlZCB0byBzZXQgbm9yLT5lcmFzZV9vcGNvZGUuDQo+Pj4gCSAqLw0KPj4+IAlmb3Ig
KGkgPSBTTk9SX0VSQVNFX1RZUEVfTUFYIC0gMTsgaSA+PSAwOyBpLS0pIHsNCj4+PiAJCWlmICht
YXAtPmVyYXNlX3R5cGVbaV0uc2l6ZSkgew0KPj4+IAkJCWVyYXNlID0gJm1hcC0+ZXJhc2VfdHlw
ZVtpXTsNCj4+PiAJCQlicmVhazsNCj4+PiAJCX0NCj4+PiAJfQ0KPj4+DQo+Pj4gVGhlIHByb2Js
ZW0gaW4gb3VyIGNhc2UgaXMsIHdlIGhhdmUgZXhpc3RpbmcgcGFydGl0aW9uaW5nIHdpdGggMTI4
ayBwYXJ0aXRpb25zDQo+Pj4gKHRoZSBGbGFzaCBpdHNlbGYgc3VwcG9ydHMgMjU2ayBhbmQgNjRr
IGVyYXNlc2l6ZSwgZGVwZW5kaW5nIG9uIGNvbmZpZ3VyYXRpb24pLg0KPj4+IFRoZSBjaGlwIGlz
IGNvbmZpZ3VyZWQgZm9yIDY0ayBlcmFzZXNpemUsIG5vbi11bmlmb3JtIG1hcHBpbmcuDQo+Pj4N
Cj4+PiBUaGUgbWFwcGluZyBpdHNlbGYgaXMgYmVpbmcgZGV0ZWN0ZWQgY29ycmVjdGx5LCBidXQg
d2hlbiBpdCBjb21lcyB0byB0aGUgY29kZQ0KPj4+IHNuaXBwZXQgYWJvdmUsIGl0IHNlbGVjdHMg
dGhlIGJpZ2dlc3QgZXJhc2VzaXplIGZyb20gYWxsIHNpemVzIGFkdmVydGlzZWQgaW4NCj4+PiBT
RkRQLCBpbmNsdWRpbmcgMjU2aywgd2hpY2ggaXMgbm90IGFwcGxpY2FibGUgdG8gdGhlIGN1cnJl
bnQgY29uZmlndXJhdGlvbi4gIA0KPj4gVGhlIGZpeCB3b3VsZCBiZSB0byBzYXZlIHRoZSBzdXBw
b3J0ZWQgZXJhc2UgdHlwZXMgd2hlbiBwYXJzaW5nIHRoZSBTRkRQIFNNUFQNCj4+IHRhYmxlIGFu
ZCB1c2UgdGhvc2UgaW5zdGVhZC4NCj4gQWxleGFuZGVyLCBUdWRvciwgY2FuIG9uZSBvZiB5b3Ug
d29yayBvbiBzdWNoIGEgZml4Pw0KDQpub24tdW5pZm9ybSBjYXNlIGlzIGNvbXBsaWNhdGVkIGJl
Y2F1c2UgY3VycmVudGx5IEkgZG9uJ3Qgc2VlIHRoZSB3YXkgdG8gdGVsbA0KbXRkcGFydC5jIGFi
b3V0IG5vbi11bmlmb3JtIG1hcHMgZnJvbSBzcGktbm9yLmMuDQoNCkJ1dCBzYW1lIHByb2JsZW0g
YXBwbGllcyBldmVuIHRvIHVuaWZvcm0gbWFwcywgSSBoYXZlIGEgcGF0Y2ggYWxyZWFkeSB3aGlj
aA0Kc2VhcmNoZXMgZm9yIG1pbmltdW0gZXJhc2Ugc2l6ZSwgbm90IG1heGltdW0sIEkganVzdCBo
YXZlIG5vdCB0ZXN0ZWQgaXQuLi4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpBbGV4YW5kZXIgU3Zl
cmRsaW4uDQo=
