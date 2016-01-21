Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aM3iz-0002GI-B0
 for linux-mtd@lists.infradead.org; Thu, 21 Jan 2016 01:07:45 +0000
From: =?utf-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
To: Adam Somerville <adamsomerville@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "zajec5@gmail.com" <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, "jteki@openedev.com"
 <jteki@openedev.com>, "mika.westerberg@linux.intel.com"
 <mika.westerberg@linux.intel.com>,
 "furquan@google.com" <furquan@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RFC] spi-nor: fix cross die reads on Micron multi-die devices
Date: Thu, 21 Jan 2016 01:06:48 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF57B7B@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF57A20@NTXXIAMBX02.xacn.micron.com>
 <CAJorgdvD9WCsHCoRt05tn-vh_1oqsCZiMehbVKQtynocxX_-wQ@mail.gmail.com>
In-Reply-To: <CAJorgdvD9WCsHCoRt05tn-vh_1oqsCZiMehbVKQtynocxX_-wQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
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

IEhpLCBBZGFtIGFuZCBCb3Jpcw0KDQpGb3IgTWljcm9uIE1UMjVRICxNVDI1VCBhbmQgTVQzNVEs
IHRoZXkgZG9lcyBub3QgZXhpc3QgdGhpcyBhY3Rpb24gZXZlbiB0aGV5IGFyZQ0KTXVsdGktZGll
IGRldmljZXMuIFNvIHdoZW4gdGhlIGxhc3QgYnl0ZSBvZiB0aGUgZGllIHNlbGVjdGVkIGlzIHJl
YWQsIHRoZSBuZXh0IGJ5dGUgb3V0cHV0DQppcyB0aGUgZmlyc3QgYnl0ZSBvZiBuZXh0IGRpZShu
b3QgdGhlIHNhbWUgZGllKS4gDQpZb3UgY2FuIGNoZWNrIHRoaXMgYnkgZXh0ZW5kZWQgYWRkcmVz
cyByZWdpc3RlciBjaGFwdGVyIGluIG91ciBkYXRhc2hlZXQsIHRoZXJlIGFyZSBkZXRhaWwNCklu
Zm9ybWF0aW9uLg0KDQo+IEhpLA0KPiANCj4gVGhhbmtzIGZvciBsb29raW5nIGF0IHRoZSB0aGlz
Lg0KPiANCj4gSSBjYW4gcmV3cml0ZSBzbyBpdCBvbmx5IGFmZmVjdHMgTjI1USBkZXZpY2VzLCBJ
IGhvcGVkIGEgc2ltcGxlcg0KPiBpbXBsZW1lbnRhdGlvbiB3b3VsZCBvdXR3ZWlnaCB0aGUgc21h
bGwgb3ZlcmhlYWQgaW5jdXJyZWQgb24gbm9uIGFmZmVjdGVkDQo+IGRldmljZXMuDQo+IA0KPiBE
byB5b3Uga25vdyBpZiB0aGVyZSBhcmUgYW55IHBsYW5zIGZvciBNVDI1KiBiYXNlZCBtdWx0aS1k
aWUgZGV2aWNlcyBhbmQgaWYNCj4gdGhleSB3b3VsZCBoYXZlIHRoZSBzYW1lIGlzc3VlPw0KPiAN
Cj4gVGhhbmtzLA0KPiANCj4gQWRhbQ0KPiANCj4gT24gV2VkLCBKYW4gMjAsIDIwMTYgYXQgMjo0
NSBBTSwgQmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ0KPiA8YmVhbmh1b0BtaWNyb24uY29t
PiB3cm90ZToNCj4gPiBIaSwgQWRhbQ0KPiA+IFRoaXMgaXMgdHJ1ZSwgYnV0IHRoaXMgb25seSBl
eGlzdCBpbiBNaWNyb24gNjVubSBzcGkgbm9yIE4yNVEuDQo+ID4gRm9yIG91ciA0NW5tIHNwaSBu
b3IgTVQyNVEgLCBNVDI1VEwgYW5kIE1UMjVRLCBkb2VzIGV4aXN0IHRoaXMNCj4gcXVlc3Rpb24u
DQo+ID4gU28gSSB0aGluaywgY2FuIHlvdSBkaWZmZXJlbnRpYXRlIGJldHdlZW4gdGhlc2UgaW4g
eW91ciBwYXRjaD8NCj4gPg0KPiA+PiBGcm9tOiBBZGFtIFNvbWVydmlsbGUgPGFkYW1zb21lcnZp
bGxlQGdtYWlsLmNvbT4NCj4gPj4NCj4gPj4gU28gYXMgZmFyIGFzIEkgY2FuIHNlZSB0aGVyZSBp
cyBhIGJ1ZyBpbiB0aGUgc3BpLW5vciBkcml2ZXIgd2hlbg0KPiA+PiBpc3N1aW5nIGRpZSBib3Vu
ZGFyeSBjcm9zc2luZyByZWFkcyBvbiBNaWNyb24gbXVsdGktZGllIGRldmljZXMuDQo+ID4+IE1p
Y3JvbiBOMjVRNTEyQSwgTjI1UTAwQUEgYW5kIHByb2JhYmx5IGFueSBvdGhlciBNaWNyb24gbXVs
dGktZGllDQo+ID4+IGRldmljZXMgZG8gbm90IHN1cHBvcnQgYSBzaW5nbGUgcmVhZCByZXF1ZXN0
IHRoYXQgY3Jvc3NlcyBhIGRpZSBib3VuZGFyeS4NCj4gPj4NCj4gPj4gVGhlIGN1cnJlbnQgYmVo
YXZpb3VyIGlzIHRoYXQgdGhlIGFkZHJlc3Mgb24gdGhlIGRldmljZSB3cmFwcyBiYWNrIHRvDQo+
ID4+IHRoZSBzdGFydCBvZiB0aGUgZmlyc3QgZGllLCB3aXRoIGFueSBkYXRhIHJldHVybmVkIGJl
eW9uZCB0aGUNCj4gPj4gYm91bmRhcnkgYmVpbmcgZnJvbSB0aGUgc3RhcnQgb2YgdGhlIGZpcnN0
IGRpZS4NCj4gPj4NCg==
