Received: from mail-bl2nam02on0053.outbound.protection.outlook.com
 ([104.47.38.53] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3p0O-0003zQ-Qg
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 20:27:43 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 0/3] mtd: fix AMD/Intel flash bugs
Date: Wed, 4 Apr 2018 20:27:27 +0000
Message-ID: <1522873644.7075.62.camel@infinera.com>
References: <20180301133941.19660-1-joakim.tjernlund@infinera.com>
 <1520784361.4790.86.camel@infinera.com>
 <20180315165454.5bf24ec0@bbrezillon>
 <1521136555.4790.159.camel@infinera.com>
In-Reply-To: <1521136555.4790.159.camel@infinera.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3E809C30950A140AD0C18F295268B81@namprd10.prod.outlook.com>
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

T24gVGh1LCAyMDE4LTAzLTE1IGF0IDE4OjU1ICswMTAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBUaHUsIDIwMTgtMDMtMTUgYXQgMTY6NTQgKzAxMDAsIEJvcmlzIEJyZXppbGxvbiB3
cm90ZToNCj4gPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9m
IHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMg
c2FmZS4NCj4gPiANCj4gPiANCj4gPiBPbiBTdW4sIDExIE1hciAyMDE4IDE2OjA2OjAzICswMDAw
DQo+ID4gSm9ha2ltIFRqZXJubHVuZCA8Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+IHdy
b3RlOg0KPiA+IA0KPiA+ID4gT24gVGh1LCAyMDE4LTAzLTAxIGF0IDE0OjM5ICswMTAwLCBKb2Fr
aW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+ID4gPiBUaGlzIGZpeGVzIGEgYnVnIHdoaWNoIGFsbG93
cyByZWFkL3dyaXRlIHRvIGEgZXJhc2UgYmxvY2sgY3VycmVudGx5DQo+ID4gPiA+IGVyYXNpbmcu
DQo+ID4gPiA+IEFsc28gd29ya3MgYXJvdW5kIGEgY2hpcCBidWcgaW4gTWljcm9uIDI4RjAwQVAz
MCBjaGlwcy4NCj4gPiA+ID4gDQo+ID4gPiA+IEpvYWtpbSBUamVybmx1bmQgKDMpOg0KPiA+ID4g
PiAgIGNmaV9jbWRzZXRfMDAwMTogRG8gbm90IGFsbG93IHJlYWQvd3JpdGUgdG8gc3VzcGVuZCBl
cmFzZSBibG9jay4NCj4gPiA+ID4gICBjZmlfY21kc2V0XzAwMDE6IFdvcmthcm91bmQgTWljcm9u
IEVyYXNlIHN1c3BlbmQgYnVnLg0KPiA+ID4gPiAgIGNmaV9jbWRzZXRfMDAwMjogRG8gbm90IGFs
bG93IHJlYWQvd3JpdGUgdG8gc3VzcGVuZCBlcmFzZSBibG9jay4NCj4gPiA+ID4gDQo+ID4gPiA+
ICBkcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDEuYyB8IDMzICsrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLQ0KPiA+ID4gPiAgZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNl
dF8wMDAyLmMgfCAgOSArKysrKystLS0NCj4gPiA+ID4gIGluY2x1ZGUvbGludXgvbXRkL2ZsYXNo
Y2hpcC5oICAgICAgIHwgIDEgKw0KPiA+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gUGluZz8NCj4g
PiANCj4gPiBZb3UgZGlkbid0IENjIHRoZSBNVEQgbWFpbnRhaW5lcnMsIHNvIHRoYXQncyBub3Qg
c3VycHJpc2luZyB5b3UgZG9uJ3QNCj4gPiBnZXQgYSByZXBseSBmcm9tIHVzIDpQLg0KPiANCj4g
SSBmaW5kIGl0IG1vcmUgc3VycHJpc2luZyB0aGF0IHRoZSBNVEQgbWFpbnRhaW5lcnMgZG9lc24n
dCByZWFkIHRoZSBNVEQgbGlzdCA/IEkgZmlndXJlZA0KPiB0aGlzIHdhcyBhIHJlcXVpcmVtZW50
Lg0KPiANCj4gPiANCj4gPiA+IFRoaXMgaXMgYSBmYWlybHkgc2VyaW91cyBidWcgYXMgaXQgY29u
ZnVzZXMgdGhlIGZsYXNoIHN0YXRlIG1hY2hpbmUsDQo+ID4gPiBtYWtpbmcgZnVydGhlciBmbGFz
aCBhY2Nlc3MgZmFpbC4NCj4gPiANCj4gPiBJJ2xsIHRyeSB0byBoYXZlIGEgbG9vay4NCj4gDQo+
IFRoYW5rcw0KDQpQaW5nPyA=
