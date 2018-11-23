Received: from mail-eopbgr50103.outbound.protection.outlook.com
 ([40.107.5.103] helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gQ9i6-0006LY-9h
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2018 11:33:24 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "boris.brezillon@bootlin.com"
 <boris.brezillon@bootlin.com>, "richard@nod.at" <richard@nod.at>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: fix erase_type array to indicate current
 map conf
Date: Fri, 23 Nov 2018 11:33:07 +0000
Message-ID: <679e7fb8-f424-b72c-ac8a-315926080ede@nokia.com>
References: <20181122123552.15756-1-tudor.ambarus@microchip.com>
 <3d8a2b83-282d-7cb2-3c8b-addae3c2af7f@nokia.com>
 <65d03690-a475-dc5b-ab9d-14e6216ba0bd@microchip.com>
In-Reply-To: <65d03690-a475-dc5b-ab9d-14e6216ba0bd@microchip.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7589A192E7D21A48B0470B71C372E894@eurprd07.prod.outlook.com>
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

SGVsbG8gVHVkb3IsDQoNCk9uIDIzLzExLzIwMTggMTE6MzIsIFR1ZG9yLkFtYmFydXNAbWljcm9j
aGlwLmNvbSB3cm90ZToNCj4+IEkndmUgdGVzdGVkIHRoaXMgcGF0Y2ggYW5kIGl0IGZpeGVzIHRo
ZSBlcmFzZXNpemUgZm9yIFMyNUZTMTI4UyBhbmQNCj4+IG91ciAxMjhrIHBhcnRpdGlvbnMgYXJl
IHdyaXRlYWJsZSBhZ2FpbiB3aXRoIHRoaXMgcGF0Y2guDQo+IEdvb2QuIFlvdSBzYWlkIHRoYXQg
dGhlIGZsYXNoIGlzIGNvbmZpZ3VyZWQgaW4gbm9uLXVuaWZvcm0gbWFwcGluZyAoaHlicmlkDQo+
IHNlY3RvciBvcHRpb24pLiBUaGVyZSBpcyBubyB1bmlmb3JtIGVyYXNlIHR5cGUgdGhhdCBjYW4g
ZXJhc2UgdGhlIGVudGlyZQ0KPiBmbGFzaCBtZW1vcnkgYnkgaXRzIG93biwgc28gdGhlIGVyYXNl
IHNob3VsZCBiZSBkb25lIHVzaW5nIHRoZSBub24tdW5pZm9ybQ0KPiBlcmFzZSBjb2RlIChzcGlf
bm9yX2hhc191bmlmb3JtX2VyYXNlKCkgc2hvdWxkIHJldHVybiBmYWxzZSkuIERvZXMgdGhlDQo+
IG5vbi11bmlmb3JtIGVyYXNlIHdvcmsgYXMgZXhwZWN0ZWQ/IA0KDQp1bmZvcnR1bmF0ZWx5LCBp
dCBkb2Vzbid0LiBJIHdhcyB0b28gZmFzdCByZXBvcnRpbmcgdGhlIHN1Y2Nlc3MuLi4NClNvIGVy
YXNlc2l6ZSBpcyBiYWNrIHRvIHRoZSB2YWx1ZSBiZWZvcmUgbm9uLXVuaWZvcm0gc3VwcG9ydCBw
YXRjaGVzLA0KcGFydGl0aW9ucyBhcmUgbm90IG1hZGUgcmVhZCBvbmx5IGFueSBtb3JlLCBidXQg
YWN0dWFsIHdyaXRlIG9yDQplcmFzZSBzdGlsbCBmYWlscy4NCg0KSSdsbCBpbnZlc3RpZ2F0ZSBm
dXJ0aGVyLg0KDQpUYWtpbmcgaW50byBhY2NvdW50IHRoZSBjb21tZW50cyBmcm9tIEJvcmlzLCB3
ZSBwcm9iYWJseSBuZWVkIHRoaXMgcGF0Y2gNCmFueXdheS4NCg0KPiBGb3IgZXhhbXBsZSwgaWYg
dGhlIGh5YnJpZCBzZWN0aW9uIGlzIGF0IHRoZSB0b3Agb2YgdGhlIGFkZHJlc3Mgc3BhY2UsIHdo
ZW4NCj4gdXNpbmcgbXRkX3V0aWxzOg0KPiAkIG10ZF9kZWJ1ZyBlcmFzZSAvZGV2L3lvdXJfbXRk
IDQwOTYgMTI2OTc2DQo+IEkgd291bGQgZXhwZWN0IHRoZSB1c2Ugb2YgdGhlIGZvbGxvd2luZyBl
cmFzZSB0eXBlczogNyo0aywgMzJrLCA2NGsNCj4gVGhlbiB3cml0ZSBhbmQgcmVhZCBiYWNrIHRv
IGNoZWNrIGlmIHRoZSBlcmFzZSB3YXMgZG9uZSBjb3JyZWN0bHk6DQo+ICQgZGQgaWY9L2Rldi91
cmFuZG9tIG9mPWluIGJzPTQwOTYgY291bnQ9MzENCj4gJCBtdGRfZGVidWcgd3JpdGUgL2Rldi95
b3VyX210ZCA0MDk2IDEyNjk3NiBpbg0KPiAkIG10ZF9kZWJ1ZyByZWFkIC9kZXYveW91cl9tdGQg
NDA5NiAxMjY5NzYgb3V0DQo+ICQgc2hhMXN1bSBpbiBvdXQNCj4gdGhlIG91dHB1dCBzaG91bGQg
YmUgdGhlIHNhbWUuDQo+IA0KPiBGZWVsIGZyZWUgdG8gYWRkIHNvbWUgcHJpbnRzIGluIHRoZSBj
b2RlIHRvIGJlIHN1cmUgdGhhdCBub24tdW5pZm9ybSBlcmFzZSBjb2RlDQo+IHNlbGVjdHMgdGhl
IGNvcnJlY3QgZXJhc2UgdHlwZXMuDQo+IA0KDQotLSANCkJlc3QgcmVnYXJkcywNCkFsZXhhbmRl
ciBTdmVyZGxpbi4NCg==
