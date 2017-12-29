Received: from mail-bl2nam02on0093.outbound.protection.outlook.com
 ([104.47.38.93] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUz0i-0000pb-Ur
 for linux-mtd@lists.infradead.org; Fri, 29 Dec 2017 18:04:02 +0000
From: Trent Piepho <tpiepho@impinj.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "broonie@kernel.org"
 <broonie@kernel.org>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "radu.pirea@microchip.com" <radu.pirea@microchip.com>, "robh@kernel.org"
 <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/3] mtd: spi-nor: add optional DMA-safe bounce buffer for
 data transfer
Date: Fri, 29 Dec 2017 18:03:47 +0000
Message-ID: <1514570627.26695.114.camel@impinj.com>
References: <cover.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <fc2440c6f52877f28286d89691049e5cba10e6a7.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <1514317385.26695.39.camel@impinj.com>
 <1a7dc424-1ce0-6c64-fc52-bb88ec7db8fa@wedev4u.fr>
 <1514487276.26695.94.camel@impinj.com>
 <08be8b42-732a-bf28-40c4-f46bf9d71c80@ti.com>
In-Reply-To: <08be8b42-732a-bf28-40c4-f46bf9d71c80@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <51651E7A11DB4D408180A3F356864551@namprd06.prod.outlook.com>
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

T24gRnJpLCAyMDE3LTEyLTI5IGF0IDE1OjQ2ICswNTMwLCBWaWduZXNoIFIgd3JvdGU6DQo+IE9u
IEZyaWRheSAyOSBEZWNlbWJlciAyMDE3IDEyOjI0IEFNLCBUcmVudCBQaWVwaG8gd3JvdGU6DQo+
ID4gDQo+ID4gPiBWaWduZXNoIGhhcyBzdWdnZXN0ZWQgdG8gY2FsbCB2aXJ0X2FkZHJfdmFsaWQo
KSBpbnN0ZWFkLg0KPiA+ID4gSSB0aGluayBCb3JpcyBoYXMgYWxzbyB0b2xkIG1lIGFib3V0IHRo
aXMgZnVuY3Rpb24uDQo+ID4gPiBTbyBpdCBtaWdodCBiZSB0aGUgcmlnaHQgc29sdXRpb24uIFdo
YXQgZG8geW91IHRoaW5rIGFib3V0IHRoZWlyIHByb3Bvc2FsPw0KPiA+IA0KPiA+IE5vdCBzdXJl
IHdoYXQgZXhhY3RseSB0aGUgZGlmZmVyZW5jZXMgYXJlIGJldHdlZW4gdGhlc2UgbWV0aG9kcy4g
IFRoZQ0KPiA+IGZhY3QgdGhhdCBlYWNoIG9mIHRoZSBtYW55IGV4aXN0aW5nIERNQSBmaXhlcyB1
c2VzIHNsaWdodGx5IGRpZmZlcmVudA0KPiA+IGNvZGUgdG8gZGV0ZWN0IHdoYXQgaXMgdW5zYWZl
IHNwZWFrcyB0byB0aGUgZGlmZmljdWx0eSBvZiB0aGlzIHByb2JsZW0hDQo+IA0KPiBNeSB1bmRl
cnN0YW5kaW5nIGJhc2VkIG9uIERvY3VtZW50YXRpb24vRE1BLUFQSS1IT1dUTy50eHQgYW5kDQo+
IERvY3VtZW50YXRpb24vYXJtL21lbW9yeS50eHQgaXMgdGhhdA0KPiB2aXJ0X2FkZHJfdmFsaWQo
KSB3aWxsIGd1YXJhbnRlZSB0aGF0IGFkZHJlc3MgaXMgaW4gcmFuZ2Ugb2YNCj4gUEFHRV9PRkZT
RVQgdG8gaGlnaF9tZW1vcnktMSAoS2VybmVsIGRpcmVjdC1tYXBwZWQgUkFNIHJlZ2lvbikgd2hp
Y2ggaXMNCj4gYWRkcmVzcyByYW5nZSBvZiBidWZmZXJzIHRoYXQgYXJlIERNQSdhYmxlLg0KDQpU
aGVyZSdzIGNvZGUgaW4gZ3BtaS1uYW5kLmMgdGhhdCBkb2VzOg0KDQogICAgICAgIC8qIGZpcnN0
IHRyeSB0byBtYXAgdGhlIHVwcGVyIGJ1ZmZlciBkaXJlY3RseSAqLw0KICAgICAgICBpZiAodmly
dF9hZGRyX3ZhbGlkKHRoaXMtPnVwcGVyX2J1ZikgJiYNCiAgICAgICAgICAgICAgICAhb2JqZWN0
X2lzX29uX3N0YWNrKHRoaXMtPnVwcGVyX2J1ZikpIHsNCiAgICAgICAgICAgICAgICBzZ19pbml0
X29uZShzZ2wsIHRoaXMtPnVwcGVyX2J1ZiwgdGhpcy0+dXBwZXJfbGVuKTsNCg0KU28gd2hvZXZl
ciB3cm90ZSB0aGF0IHRob3VnaHQgdGhhdCBzdGFjayBvYmplY3RzIG5lZWRlZCBhbiBhZGRpdGlv
bmFsDQp0ZXN0IGJleW9uZCB2aXJ0X2FkZHJfdmFsaWQuICBCdXQgaXQgZG9lcyBhcHBlYXIgdG8g
YmUgZmFyIG1vcmUgY29tbW9uDQp0byBkZXBlbmQgb24ganVzdCB2aXJ0X2FkZHJfdmFsaWQsIHNv
IHBlcmhhcHMgdGhlIGNvZGUgaW4gZ3BtaS1uYW5kIGlzDQppbiBlcnJvci4NCg0KPiA+ICB2aXJ0
X2FkZHJfdmFsaWQoKSBpcyBhbHJlYWR5IHVzZWQgYnkgc3BpLXRpLXFzcGkuICBzcGkgY29yZSB1
c2VzIGZvcg0KPiA+IHRoZSBidWZmZXIgbWFwIGhlbHBlciwgYnV0IHRoYXQgY29kZSBwYXRoIGlz
IGZvciBidWZmZXJzIHdoaWNoIGFyZSBOT1QNCj4gPiB2bWFsbG9jIG9yIGhpZ2htZW0sIGJ1dCBh
cmUgc3RpbGwgbm90IHZpcnRfYWRkcl92YWxpZCgpIGZvciBzb21lIG90aGVyDQo+ID4gcmVhc29u
Lg0KPiA+IA0KPiANCj4gCWlmICh2bWFsbG9jZWRfYnVmIHx8IGttYXBfYnVmKSB7DQo+IAkJLyog
SGFuZGxlIHZtYWxsb2MnZCBvciBrbWFwJ2QgYnVmZmVycyAqLw0KPiAJCS4uLg0KVGhpcyBzdHVm
ZiBkb2VzIGdldCBETUFlZC4gIFNvIEkgaGF2ZSB0byB3b25kZXIsIGlmIHNwaS5jIHRoaW5rcyBp
dCBjYW4NCnVzZSBETUEgd2l0aCB2bWFsbG9jIG9yIGhpZ2htZW0sIGNvdWxkbid0IHNwaS1ub3Qg
ZG8gdGhlIHNhbWUgaW5zdGVhZA0Kb2YgdGhlIGJvdW5jZSBidWZmZXI/DQoNCj4gICAgICAgICB9
IGVsc2UgaWYgKHZpcnRfYWRkcl92YWxpZChidWYpKSB7DQo+IAkJLyogSGFuZGxlIGttYWxsb2Mn
ZCBhbmQgc3VjaCBidWZmZXJzICovDQo+ICAgICAgICAgICAgICAgICAuLi4NCj4gCX0gZWxzZSB7
DQo+IAkJLyogRXJyb3IgaWYgbm9uZSBvZiB0aGUgYWJvdmUgKi8NCg0KU28gd2hhdCBpcyB0aGlz
IGNhc2UgaGVyZSBmb3I/ICBJdCdzIHNvbWUgY2xhc3MgdGhhdCBkb2VzIG5vdCBoYXZlIGENCnZh
bGlkIHZpcnR1YWwgYWRkcmVzcyBhbmQgeWV0IGlzIG5vdCB2bWFsbG9jIG9yIGhpZ2htZW0uDQoN
Cj4gCQlyZXR1cm4gLUVJTlZBTDsNCj4gCX0NCj4g
