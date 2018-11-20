Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP5vo-0007uA-6g
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 13:19:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexandre.belloni@bootlin.com>
CC: <marek.vasut@gmail.com>, <richard@nod.at>, <boris.brezillon@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <cyrille.pitchen@wedev4u.fr>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: Use 4B opcodes when the NOR
 advertises both 3B and 4B
Date: Tue, 20 Nov 2018 13:18:49 +0000
Message-ID: <210d4dff-b729-ae69-3b61-d63d6ae38604@microchip.com>
References: <20181031144504.19405-1-boris.brezillon@bootlin.com>
 <20181031144504.19405-2-boris.brezillon@bootlin.com>
 <bf8fe028-a9ad-56da-df3b-c4e232b5f5cb@microchip.com>
 <0b747728-0abf-7e88-0d83-3b3db1415837@microchip.com>
 <20181116134235.GD29768@piout.net>
In-Reply-To: <20181116134235.GD29768@piout.net>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC8547825945684A9CF9FA7D4BF1F7E7@namprd11.prod.outlook.com>
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

SGksIEFsZXhhbmRyZSwNCg0KT24gMTEvMTYvMjAxOCAwMzo0MiBQTSwgQWxleGFuZHJlIEJlbGxv
bmkgd3JvdGU6DQo+IE9uIDE2LzExLzIwMTggMTE6NTc6MTArMDAwMCwgVHVkb3IuQW1iYXJ1c0Bt
aWNyb2NoaXAuY29tIHdyb3RlOg0KPj4NCj4+DQo+PiBPbiAxMS8wOS8yMDE4IDEyOjQ5IFBNLCBU
dWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+Pj4NCj4+Pg0KPj4+IE9uIDEwLzMx
LzIwMTggMDQ6NDUgUE0sIEJvcmlzIEJyZXppbGxvbiB3cm90ZToNCj4+Pj4gV2hlbiB0aGUgTk9S
IHN1cHBvcnRzIDQgYnl0ZXMgb3Bjb2RlcyB3ZSBzaG91bGQgdXNlIHRob3NlIGluc3RlYWQgb2YN
Cj4+Pj4gc3dpdGNoaW5nIHRoZSBmbGFzaCBpbiA0LWJ5dGVzIG1vZGUuIFRoaXMgd2F5LCB3ZSBk
b24ndCBoYXZlIHRvIHJlc3RvcmUNCj4+Pj4gdGhlIGFkZHJlc3NpbmcgbW9kZSB3aGVuIHJlc2V0
dGluZyB0aGUgYm9hcmQuDQo+Pj4+DQo+Pj4+IFJlcG9ydGVkLWJ5OiBBbGV4YW5kcmUgQmVsbG9u
aSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEJv
cmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGJvb3RsaW4uY29tPg0KPj4+PiBUZXN0ZWQt
Ynk6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4NCj4+
Pj4gUmV2aWV3ZWQtYnk6IEN5cmlsbGUgUGl0Y2hlbiA8Y3lyaWxsZS5waXRjaGVuQHdlZGV2NHUu
ZnI+DQo+Pj4NCj4+PiBSZXZpZXdlZC1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0Bt
aWNyb2NoaXAuY29tPg0KPj4+DQo+Pg0KPj4gSSBwcm9wb3NlIHRvIHN0YWxsIHRoaXMgcGF0Y2gg
Zm9yIGEgd2VlayBvciBzbywgdW50aWwgd2Ugd2lsbCBoYXZlIGEgY2xlYXJlcg0KPj4gdmlldyBv
biBob3cgYXJlIGRlZmluZWQgdGhlIGZsYXNoZXMgdGhhdCBkb24ndCBoYXZlIDRCIG9wY29kZXMs
IGJ1dCBjYW4gZW50ZXINCj4+IHRoZSA0LUJ5dGUgbW9kZSBvbiBjb21tYW5kLg0KPj4NCj4gDQo+
IE5vdGUgdGhhdCB0aGlzIHBhdGNoIGlzIGJhZGx5IG5lZWRlZCBmb3Igc29tZSBvZiBvdXIgYm9h
cmRzLiB3aXRob3V0IGl0LA0KPiB0aGV5IGNhbid0IHJlYm9vdCBwcm9wZXJseS4gSSB3b3VsZCB2
ZXJ5IG11Y2ggbGlrZSB0byBzZWUgaXQgZW50ZXINCj4gdXBzdHJlYW0gYW5kIGJlIGJhY2twb3J0
ZWQgc29vbmVyIHRoYW4gbGF0ZXIuDQoNCldoYXQgZmxhc2ggZG8gdGhlIGJvYXJkcyB1c2U/IERv
ZXMgeW91ciBmbGFzaCBzdXBwb3J0IFNGRFAgNC1CeXRlIEluc3RydWN0aW9uDQp0YWJsZT8gSWYg
eWVzLCB0aGUgZm9sbG93aW5nIHBhdGNoIHNob3VsZCBzb2x2ZSB5b3VyIHByb2JsZW0gaW5kaXJl
Y3RseToNCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzEwMTUwMzYv
DQoNCllvdSBzaG91bGQgYWxzbyBhcHBseSB0aGUgZm9sbG93aW5nIGlmIHlvdSB3YW50IHRvIHRl
c3QgaXQ6DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC8xMDEzMjk0
Lw0KDQpDaGVlcnMsDQp0YQ0K
