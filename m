Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPqU3-0001Vx-S1
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2018 15:01:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: fix erase_type array to indicate current
 map conf
Date: Thu, 22 Nov 2018 15:01:19 +0000
Message-ID: <a8f305c1-ed85-e9c7-1c9d-c60adb74969e@microchip.com>
References: <20181122123552.15756-1-tudor.ambarus@microchip.com>
 <53927e56-4546-91bd-bae7-66bd049bdd9e@microchip.com>
 <70de11e0-0f49-19e4-b6c7-9177c4fd760a@nokia.com>
In-Reply-To: <70de11e0-0f49-19e4-b6c7-9177c4fd760a@nokia.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAEB0D6F41C5F744939339DF71056946@namprd11.prod.outlook.com>
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

SGksIEFsZXhhbmRlciwNCg0KT24gMTEvMjIvMjAxOCAwNDo1NiBQTSwgU3ZlcmRsaW4sIEFsZXhh
bmRlciAoTm9raWEgLSBERS9VbG0pIHdyb3RlOg0KPiBIZWxsbyBUdWRvciwNCj4gDQo+IE9uIDIy
LzExLzIwMTggMTM6MzgsIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IENh
biB5b3UgcGxlYXNlIHRlc3QgdGhpcyBwYXRjaCB0byBzZWUgaWYgaXQgZml4ZXMgeW91ciBwcm9i
bGVtPw0KPiANCj4gdGhlIHBhdGNoIGFwcGxpZXMgbmVpdGhlciB0byBMaW51cydzIG1hc3RlciBu
b3IgdG8gc3BpLW5vci9uZXh0IChvZiBsMi1tdGQgdHJlZSkgYnJhbmNoZXMuDQo+IFdoYXQgaGF2
ZSB5b3UgdXNlZCBhcyBhIGJhc2UgZm9yIHlvdXIgcGF0Y2g/DQoNCmh0dHA6Ly9naXQuaW5mcmFk
ZWFkLm9yZy9saW51eC1tdGQuZ2l0LCBtdGQvZml4ZXMgYnJhbmNoDQoNCj4gDQo+PiBPbiAxMS8y
Mi8yMDE4IDAyOjM2IFBNLCBUdWRvciBBbWJhcnVzIC0gTTE4MDY0IHdyb3RlOg0KPj4+IEZyb206
IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4NCj4+Pg0KPj4+IEJ1
ZyByZXBvcnRlZCBmb3IgdGhlIG91dC1vZi10cmVlIFMyNUZTMTI4UyBmbGFzaCBtZW1vcnkuDQo+
IA0KPiBJdCB0dXJuZWQgb3V0IHRvIGJlIG5vdCByZWxldmFudCwgUzI1RlMxMjhTIHdvcmtzIHdp
dGggdXBzdHJlYW0gTGludXggYXMgd2VsbCwganVzdA0KPiB0aGUgZW50cnkgaXMgbmFtZWQgczI1
ZmwxMjlwMS4uLg0KDQpvaywgd2lsbCByZW1vdmUgdGhpcyBjb21tZW50IGlmIHNvLg0KDQpDaGVl
cnMsDQp0YQ0K
