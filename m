Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghe1A-0007Sc-Fh
 for linux-mtd@lists.infradead.org; Thu, 10 Jan 2019 17:21:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <roger.pueyo@guifi.net>, <linux-mtd@lists.infradead.org>
CC: <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for en25qh64
Date: Thu, 10 Jan 2019 17:21:14 +0000
Message-ID: <2ecd524a-9ba7-aef0-0846-5db9ed2cef01@microchip.com>
References: <20181227150348.12093-1-roger.pueyo@guifi.net>
In-Reply-To: <20181227150348.12093-1-roger.pueyo@guifi.net>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D4067CF37BC9C40822C72852A9F1AB9@namprd11.prod.outlook.com>
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

SGksIFJvZ2VyLA0KDQpPbiAxMi8yNy8yMDE4IDA1OjAzIFBNLCBSb2dlciBQdWV5byBDZW50ZWxs
ZXMgd3JvdGU6DQo+IFRoZSBFb24gRU4yNVFINjQgaXMgYSA2NCBNYml0IFNQSSBOT1IgZmxhc2gg
bWVtb3J5IGNoaXAgZm91bmQNCj4gb24gcmVjZW50IHdpcmVsZXNzIHJvdXRlcnMuIEl0cyAzMiwg
MTI4IGFuZCAyNTYgTWJpdCBzaWJsaW5ncw0KPiBhcmUgYWxyZWR5IHN1cHBvcnRlZC4NCg0Kcy9h
bHJlZHkvYWxyZWFkeQ0KDQo+IA0KPiBUZXN0ZWQgb24gYSBDT01GQVNUIENGLUUxMjBBIHYzIGJv
YXJkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUHVleW8gQ2VudGVsbGVzIDxyb2dlci5w
dWV5b0BndWlmaS5uZXQ+DQo+IC0tLQ0KPiAgZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMg
fCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9z
cGktbm9yLmMNCj4gaW5kZXggNmUxM2JiZDFhYWE1Li40YmI2ZjRkMjAzZGMgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jDQo+ICsrKyBiL2RyaXZlcnMvbXRkL3Nw
aS1ub3Ivc3BpLW5vci5jDQo+IEBAIC0xNzQxLDYgKzE3NDEsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGZsYXNoX2luZm8gc3BpX25vcl9pZHNbXSA9IHsNCj4gIAl7ICJlbjI1cDY0IiwgICAgSU5G
TygweDFjMjAxNywgMCwgNjQgKiAxMDI0LCAgMTI4LCAwKSB9LA0KPiAgCXsgImVuMjVxNjQiLCAg
ICBJTkZPKDB4MWMzMDE3LCAwLCA2NCAqIDEwMjQsICAxMjgsIFNFQ1RfNEspIH0sDQo+ICAJeyAi
ZW4yNXFoMzIiLCAgIElORk8oMHgxYzcwMTYsIDAsIDY0ICogMTAyNCwgICA2NCwgMCkgfSwNCj4g
Kwl7ICJlbjI1cWg2NCIsICAgSU5GTygweDFjNzAxNywgMCwgNjQgKiAxMDI0LCAgMTI4LCAwKSB9
LA0KDQpUaGUgZmxhc2ggc3VwcG9ydHMgNEtpQiBlcmFzZSB0eXBlLCBzbyB5b3UnbGwgaGF2ZSB0
byBzZXQgU0VDVF80Sy4gT25lIGNhbiB1c2UNCmxhcmdlciBzZWN0b3JzLCB3aGVuIGF2YWlsYWJs
ZSwgYnkgZGlzYWJsaW5nIENPTkZJR19NVERfU1BJX05PUl9VU0VfNEtfU0VDVE9SUy4NCg0KQWxz
bywgdGhlIGZsYXNoIHN1cHBvcnRzIFNQSU5PUl9PUF9SRUFEXzFfMV8yLCBzbyBpdCdzIGJldHRl
ciB0byBzZXQNClNQSV9OT1JfRFVBTF9SRUFEIGluIG9yZGVyIHRvIHRyaWdnZXIgdGhlIGJmcHQg
cGFyc2luZy4gTm90ZSB0aGF0IGF0IGJmcHQNCnBhcnNpbmcsIFNQSU5PUl9PUF9QUF8xXzRfNCB3
aWxsIGJlIGVuYWJsZWQgYW5kIHRoZSByZWFkcyBzaG91bGQgYmUgZG9uZSB3aXRoDQp0aGUgZWJo
IGNvbW1hbmQuIFBsZWFzZSB0ZXN0IGlmIHRoZXNlIGFzc3VtcHRpb25zIGFyZSB2YWxpZCwgYW5k
IGlmIGNvcnJlY3QsDQpzdWJtaXQgYSBuZXcgcGF0Y2guDQoNCkNoZWVycywNCnRhDQo=
