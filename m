Received: from mail-bl2nam02on0085.outbound.protection.outlook.com
 ([104.47.38.85] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuxxw-0006MQ-H2
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2018 10:44:50 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>
CC: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH] spi-nor: intel-spi: Add support for Intel Ice Lake SPI
 serial flash
Date: Wed, 29 Aug 2018 10:44:36 +0000
Message-ID: <bad7867d47a289730435eb8fba9bf21ae103b425.camel@infinera.com>
References: <20180828165059.55223-1-mika.westerberg@linux.intel.com>
 <3261d2da-c0a5-920e-ca12-17924a2d3918@gmail.com>
 <20180829111740.12223549@bbrezillon>
 <57933711d93f3ba372ca14743daa90df834ed494.camel@infinera.com>
 <20180829123306.3e9928a4@bbrezillon>
In-Reply-To: <20180829123306.3e9928a4@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0ABA356B1129E4E92285E03D1B7217E@namprd10.prod.outlook.com>
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

T24gV2VkLCAyMDE4LTA4LTI5IGF0IDEyOjMzICswMjAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6
DQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9y
Z2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0K
PiANCj4gDQo+IE9uIFdlZCwgMjkgQXVnIDIwMTggMTA6Mjg6MDUgKzAwMDANCj4gSm9ha2ltIFRq
ZXJubHVuZCA8Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+IHdyb3RlOg0KPiANCj4gPiBP
biBXZWQsIDIwMTgtMDgtMjkgYXQgMTE6MTcgKzAyMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToN
Cj4gPiA+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhl
IG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5s
ZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZl
Lg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IEhpIE1hcmVrLA0KPiA+ID4gDQo+ID4gPiBPbiBUdWUs
IDI4IEF1ZyAyMDE4IDE4OjU2OjM4ICswMjAwDQo+ID4gPiBNYXJlayBWYXN1dCA8bWFyZWsudmFz
dXRAZ21haWwuY29tPiB3cm90ZToNCj4gPiA+IA0KPiA+ID4gPiBPbiAwOC8yOC8yMDE4IDA2OjUw
IFBNLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6DQo+ID4gPiA+ID4gSW50ZWwgSWNlIExha2UgZXhw
b3NlcyB0aGUgU1BJIHNlcmlhbCBmbGFzaCBjb250cm9sbGVyIGFzIGEgUENJIGRldmljZQ0KPiA+
ID4gPiA+IGluIHRoZSBzYW1lIHdheSB0aGFuIEludGVsIERlbnZlcnRvbi4gQWRkIEljZSBMYWtl
IFNQSSBzZXJpYWwgZmxhc2ggUENJDQo+ID4gPiA+ID4gSUQgdG8gdGhlIGRyaXZlciBsaXN0IG9m
IHN1cHBvcnRlZCBkZXZpY2VzLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IE1pa2EgV2VzdGVyYmVyZyA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+
ID4gDQo+ID4gPiA+IFRoaXMgc2hvdWxkIHByb2JhYmx5IGdvIHRocm91Z2ggdHJpdmlhbCBwYXRj
aGVzIE1MLCBubyA/DQo+ID4gPiANCj4gPiA+IE5vcGUsIGl0IHNob3VsZCBnbyB0aHJvdWdoIHRo
ZSBzcGktbm9yIHRyZWUuIEFjdHVhbGx5LCBldmVuIGZvciB0cml2aWFsDQo+ID4gPiBmaXhlcyBs
aWtlIHR5cG9zLCBJIHByZWZlciB0byB0YWtlIHRoZW0gZGlyZWN0bHkgdG8gYXZvaWQgcG9zc2li
bGUNCj4gPiA+IGZ1dHVyZSBjb25mbGljdHMgaW4gY2FzZSBzb21ldGhpbmcgY2hhbmdlcyBuZWFy
IHRoZSB0eXBvLg0KPiA+ID4gDQo+ID4gPiA+IEFsc28sIENDIFN0YWJsZS4NCj4gPiA+IA0KPiA+
ID4gV2h5PyBJdCdzIGFkZGluZyBhIG5ldyBlbnRyeSBpbiBwY2lfaWRzW10gdGFibGUsIGl0IGxv
b2tzIGxpa2UNCj4gPiA+IHN1cHBvcnRpbmcgbmV3IEhXIHRvIG1lLCBub3QgZml4aW5nIGEgYnVn
Lg0KPiA+IA0KPiA+IFNvIHlvdSBjYW4gYm9vdC91c2UgbmV3IEhXIHdpdGggc3RhYmxlIGtlcm5l
bHMuIFN0YWJsZSBrZXJuZWxzIHdvdWxkIGJlY29tZQ0KPiA+IHVzZWxlc3MgZmFpcmx5IHF1aWNr
bHkgb3RoZXJ3aXNlLg0KPiA+IEhXIGVuYWJsZW1lbnQgcGF0Y2hlcyBhcmUgT0sgd2hlbiB0aGV5
IGRvbid0IGFmZmVjdCBleGlzdGluZyBIVyBieSBtdWNoLg0KPiANCj4gV2hlcmUgZGlkIHlvdSBn
ZXQgdGhhdCBmcm9tPyBJJ3ZlIGFsd2F5cyBiZWVuIHRvbGQgdGhhdCBDYy1pbmcgc3RhYmxlDQo+
IHdhcyByZXNlcnZlZCBmb3IgYnVnIGZpeGVzLg0KDQpGcm9tIGZvbGxvd2luZyBsaW51eCBkZXYg
bGlzdHMuIEkgZG9uJ3QgaGF2ZSBhIHJlZmVyZW5jZSwgc29ycnkuDQoNCklmIHlvdSBsb29rIGF0
IHRoZSBjb21taXQgbG9nIGZvciBzdGFibGUga2VybmVscyB5b3Ugd2lsbCBzZWUgdGhhdCBhIGxv
dCBtb3JlDQp0aGFuIHB1cmUgYnVnIGZpeGVzLiBTb21ldGltZXMgYmFja3BvcnQgb2YgbmV3IGlu
ZnJhIHN0cnVjdHVyZSB0bw0KYWxsb3cgZm9yIGVhc3kgYmFja3BvcnRpbmcgb2YgZml4ZXMgdG9v
Lg0KDQogSm9ja2UNCg==
