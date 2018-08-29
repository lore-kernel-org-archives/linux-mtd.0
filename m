Received: from mail-cys01nam02on0065.outbound.protection.outlook.com
 ([104.47.37.65] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuxhz-0006Ke-Cu
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2018 10:28:21 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
CC: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] spi-nor: intel-spi: Add support for Intel Ice Lake SPI
 serial flash
Date: Wed, 29 Aug 2018 10:28:05 +0000
Message-ID: <57933711d93f3ba372ca14743daa90df834ed494.camel@infinera.com>
References: <20180828165059.55223-1-mika.westerberg@linux.intel.com>
 <3261d2da-c0a5-920e-ca12-17924a2d3918@gmail.com>
 <20180829111740.12223549@bbrezillon>
In-Reply-To: <20180829111740.12223549@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DE205614F00944FB46104AD93AE867A@namprd10.prod.outlook.com>
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

T24gV2VkLCAyMDE4LTA4LTI5IGF0IDExOjE3ICswMjAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6
DQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9y
Z2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0K
PiANCj4gDQo+IEhpIE1hcmVrLA0KPiANCj4gT24gVHVlLCAyOCBBdWcgMjAxOCAxODo1NjozOCAr
MDIwMA0KPiBNYXJlayBWYXN1dCA8bWFyZWsudmFzdXRAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+
ID4gT24gMDgvMjgvMjAxOCAwNjo1MCBQTSwgTWlrYSBXZXN0ZXJiZXJnIHdyb3RlOg0KPiA+ID4g
SW50ZWwgSWNlIExha2UgZXhwb3NlcyB0aGUgU1BJIHNlcmlhbCBmbGFzaCBjb250cm9sbGVyIGFz
IGEgUENJIGRldmljZQ0KPiA+ID4gaW4gdGhlIHNhbWUgd2F5IHRoYW4gSW50ZWwgRGVudmVydG9u
LiBBZGQgSWNlIExha2UgU1BJIHNlcmlhbCBmbGFzaCBQQ0kNCj4gPiA+IElEIHRvIHRoZSBkcml2
ZXIgbGlzdCBvZiBzdXBwb3J0ZWQgZGV2aWNlcy4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1i
eTogTWlrYSBXZXN0ZXJiZXJnIDxtaWthLndlc3RlcmJlcmdAbGludXguaW50ZWwuY29tPg0KPiA+
IA0KPiA+IFRoaXMgc2hvdWxkIHByb2JhYmx5IGdvIHRocm91Z2ggdHJpdmlhbCBwYXRjaGVzIE1M
LCBubyA/DQo+IA0KPiBOb3BlLCBpdCBzaG91bGQgZ28gdGhyb3VnaCB0aGUgc3BpLW5vciB0cmVl
LiBBY3R1YWxseSwgZXZlbiBmb3IgdHJpdmlhbA0KPiBmaXhlcyBsaWtlIHR5cG9zLCBJIHByZWZl
ciB0byB0YWtlIHRoZW0gZGlyZWN0bHkgdG8gYXZvaWQgcG9zc2libGUNCj4gZnV0dXJlIGNvbmZs
aWN0cyBpbiBjYXNlIHNvbWV0aGluZyBjaGFuZ2VzIG5lYXIgdGhlIHR5cG8uDQo+IA0KPiA+IEFs
c28sIENDIFN0YWJsZS4NCj4gDQo+IFdoeT8gSXQncyBhZGRpbmcgYSBuZXcgZW50cnkgaW4gcGNp
X2lkc1tdIHRhYmxlLCBpdCBsb29rcyBsaWtlDQo+IHN1cHBvcnRpbmcgbmV3IEhXIHRvIG1lLCBu
b3QgZml4aW5nIGEgYnVnLg0KDQpTbyB5b3UgY2FuIGJvb3QvdXNlIG5ldyBIVyB3aXRoIHN0YWJs
ZSBrZXJuZWxzLiBTdGFibGUga2VybmVscyB3b3VsZCBiZWNvbWUNCnVzZWxlc3MgZmFpcmx5IHF1
aWNrbHkgb3RoZXJ3aXNlLg0KSFcgZW5hYmxlbWVudCBwYXRjaGVzIGFyZSBPSyB3aGVuIHRoZXkg
ZG9uJ3QgYWZmZWN0IGV4aXN0aW5nIEhXIGJ5IG11Y2guDQoNCiBKb2NrZQ0K
