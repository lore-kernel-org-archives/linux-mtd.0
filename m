Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNckY-00083d-PJ
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2018 11:57:28 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: <alexandre.belloni@bootlin.com>, <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: Use 4B opcodes when the NOR
 advertises both 3B and 4B
Date: Fri, 16 Nov 2018 11:57:10 +0000
Message-ID: <0b747728-0abf-7e88-0d83-3b3db1415837@microchip.com>
References: <20181031144504.19405-1-boris.brezillon@bootlin.com>
 <20181031144504.19405-2-boris.brezillon@bootlin.com>
 <bf8fe028-a9ad-56da-df3b-c4e232b5f5cb@microchip.com>
In-Reply-To: <bf8fe028-a9ad-56da-df3b-c4e232b5f5cb@microchip.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2873A57390208743A9B26274900B6C7E@namprd11.prod.outlook.com>
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

DQoNCk9uIDExLzA5LzIwMTggMTI6NDkgUE0sIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbSB3
cm90ZToNCj4gDQo+IA0KPiBPbiAxMC8zMS8yMDE4IDA0OjQ1IFBNLCBCb3JpcyBCcmV6aWxsb24g
d3JvdGU6DQo+PiBXaGVuIHRoZSBOT1Igc3VwcG9ydHMgNCBieXRlcyBvcGNvZGVzIHdlIHNob3Vs
ZCB1c2UgdGhvc2UgaW5zdGVhZCBvZg0KPj4gc3dpdGNoaW5nIHRoZSBmbGFzaCBpbiA0LWJ5dGVz
IG1vZGUuIFRoaXMgd2F5LCB3ZSBkb24ndCBoYXZlIHRvIHJlc3RvcmUNCj4+IHRoZSBhZGRyZXNz
aW5nIG1vZGUgd2hlbiByZXNldHRpbmcgdGhlIGJvYXJkLg0KPj4NCj4+IFJlcG9ydGVkLWJ5OiBB
bGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBib290bGluLmNvbT4N
Cj4+IFRlc3RlZC1ieTogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3Rs
aW4uY29tPg0KPj4gUmV2aWV3ZWQtYnk6IEN5cmlsbGUgUGl0Y2hlbiA8Y3lyaWxsZS5waXRjaGVu
QHdlZGV2NHUuZnI+DQo+IA0KPiBSZXZpZXdlZC1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1i
YXJ1c0BtaWNyb2NoaXAuY29tPg0KPiANCg0KSSBwcm9wb3NlIHRvIHN0YWxsIHRoaXMgcGF0Y2gg
Zm9yIGEgd2VlayBvciBzbywgdW50aWwgd2Ugd2lsbCBoYXZlIGEgY2xlYXJlcg0KdmlldyBvbiBo
b3cgYXJlIGRlZmluZWQgdGhlIGZsYXNoZXMgdGhhdCBkb24ndCBoYXZlIDRCIG9wY29kZXMsIGJ1
dCBjYW4gZW50ZXINCnRoZSA0LUJ5dGUgbW9kZSBvbiBjb21tYW5kLg0KDQo+PiAtLS0NCj4+IENo
YW5nZXMgaW4gdjM6DQo+PiAtIEFkZCBBbGV4YW5kcmUgUi1iK1QtYg0KPj4gLSBBZGQgQ3lyaWxs
ZSBSLWINCj4+DQo+PiBDaGFuZ2VzIGluIHYyDQo+PiAtIE5vbmUNCj4+IC0tLQ0KPj4gIGRyaXZl
cnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jIHwgMSArDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5v
ci5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCj4+IGluZGV4IDc5ODkxNWI1YzJi
MC4uYjIwYmM0YjM2ZjBmIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGkt
bm9yLmMNCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jDQo+PiBAQCAtMjY0
Myw2ICsyNjQzLDcgQEAgc3RhdGljIGludCBzcGlfbm9yX3BhcnNlX2JmcHQoc3RydWN0IHNwaV9u
b3IgKm5vciwNCj4+ICAJCWJyZWFrOw0KPj4gIA0KPj4gIAljYXNlIEJGUFRfRFdPUkQxX0FERFJF
U1NfQllURVNfNF9PTkxZOg0KPj4gKwljYXNlIEJGUFRfRFdPUkQxX0FERFJFU1NfQllURVNfM19P
Ul80Og0KPj4gIAkJbm9yLT5mbGFncyB8PSBTTk9SX0ZfNEJfT1BDT0RFUzsNCg0KDQpNYXliZSB3
ZSB3aWxsIGFsc28gd2FudCB0byBjaGVjayB0aGF0IEJGUFQgRFdPUkQxNlszMToyNF0gaGFzIHZh
bHVlIHh4MXhfeHh4eGIgLQ0KaXQgaW5kaWNhdGVzIHRoYXQgNEIgb3Bjb2RlcyBhcmUgc3VwcG9y
dGVkLg0KDQpDaGVlcnMsDQp0YQ0KDQo+PiAgCQlub3ItPmFkZHJfd2lkdGggPSA0Ow0KPj4gIAkJ
YnJlYWs7DQo+Pg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0DQo+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLw0KPiANCg==
