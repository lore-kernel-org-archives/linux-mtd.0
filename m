Received: from mail-eopbgr80132.outbound.protection.outlook.com
 ([40.107.8.132] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPqP0-0007zZ-T1
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2018 14:56:24 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: fix erase_type array to indicate current
 map conf
Date: Thu, 22 Nov 2018 14:56:07 +0000
Message-ID: <70de11e0-0f49-19e4-b6c7-9177c4fd760a@nokia.com>
References: <20181122123552.15756-1-tudor.ambarus@microchip.com>
 <53927e56-4546-91bd-bae7-66bd049bdd9e@microchip.com>
In-Reply-To: <53927e56-4546-91bd-bae7-66bd049bdd9e@microchip.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4BCC37AA5BF5E428CA69D32D423EFAF@eurprd07.prod.outlook.com>
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

SGVsbG8gVHVkb3IsDQoNCk9uIDIyLzExLzIwMTggMTM6MzgsIFR1ZG9yLkFtYmFydXNAbWljcm9j
aGlwLmNvbSB3cm90ZToNCj4gQ2FuIHlvdSBwbGVhc2UgdGVzdCB0aGlzIHBhdGNoIHRvIHNlZSBp
ZiBpdCBmaXhlcyB5b3VyIHByb2JsZW0/DQoNCnRoZSBwYXRjaCBhcHBsaWVzIG5laXRoZXIgdG8g
TGludXMncyBtYXN0ZXIgbm9yIHRvIHNwaS1ub3IvbmV4dCAob2YgbDItbXRkIHRyZWUpIGJyYW5j
aGVzLg0KV2hhdCBoYXZlIHlvdSB1c2VkIGFzIGEgYmFzZSBmb3IgeW91ciBwYXRjaD8NCg0KPiBP
biAxMS8yMi8yMDE4IDAyOjM2IFBNLCBUdWRvciBBbWJhcnVzIC0gTTE4MDY0IHdyb3RlOg0KPj4g
RnJvbTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPg0KPj4NCj4+
IEJ1ZyByZXBvcnRlZCBmb3IgdGhlIG91dC1vZi10cmVlIFMyNUZTMTI4UyBmbGFzaCBtZW1vcnku
DQoNCkl0IHR1cm5lZCBvdXQgdG8gYmUgbm90IHJlbGV2YW50LCBTMjVGUzEyOFMgd29ya3Mgd2l0
aCB1cHN0cmVhbSBMaW51eCBhcyB3ZWxsLCBqdXN0DQp0aGUgZW50cnkgaXMgbmFtZWQgczI1Zmwx
MjlwMS4uLg0KDQo+PiBCRlBUIHRhYmxlIGFkdmVydGlzZXMgYWxsIHRoZSBlcmFzZSB0eXBlcyBz
dXBwb3J0ZWQgYnkgYWxsIHRoZQ0KPj4gcG9zc2libGUgbWFwIGNvbmZpZ3VyYXRpb25zLiBVcGRh
dGUgdGhlIGVyYXNlX3R5cGUgYXJyYXkgdG8gaW5kaWNhdGUNCj4+IHdoaWNoIGVyYXNlIHR5cGVz
IGFyZSBhcHBsaWNhYmxlIHRvIHRoZSBjdXJyZW50IG1hcCBjb25maWd1cmF0aW9uLg0KPj4NCj4+
IEJhY2t3YXJkIGNvbXBhdGliaWxpdHkgdGVzdCBkb25lIG9uIHNzdDI2dmYwNjRiLg0KPj4NCj4+
IEZpeGVzOiBiMDM4ZThlM2JlNzIgKCJtdGQ6IHNwaS1ub3I6IHBhcnNlIFNGRFAgU2VjdG9yIE1h
cCBQYXJhbWV0ZXIgVGFibGUiKQ0KPj4gUmVwb3J0ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8
YWxleGFuZGVyLnN2ZXJkbGluQG5va2lhLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IFR1ZG9yIEFt
YmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMs
DQpBbGV4YW5kZXIgU3ZlcmRsaW4uDQo=
