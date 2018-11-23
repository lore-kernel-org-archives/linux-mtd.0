Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gQAkb-0005NC-JD
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2018 12:40:03 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@bootlin.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: fix erase_type array to indicate current
 map conf
Date: Fri, 23 Nov 2018 12:39:44 +0000
Message-ID: <70ac7381-bea8-8f1a-a03b-bc03478dbd7c@microchip.com>
References: <20181122123552.15756-1-tudor.ambarus@microchip.com>
 <3d8a2b83-282d-7cb2-3c8b-addae3c2af7f@nokia.com>
 <65d03690-a475-dc5b-ab9d-14e6216ba0bd@microchip.com>
 <679e7fb8-f424-b72c-ac8a-315926080ede@nokia.com>
In-Reply-To: <679e7fb8-f424-b72c-ac8a-315926080ede@nokia.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACD8B41C0E4C5D4094ABF638ACA5464A@namprd11.prod.outlook.com>
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

SGksIEFsZXhhbmRlciwNCg0KT24gMTEvMjMvMjAxOCAwMTozMyBQTSwgU3ZlcmRsaW4sIEFsZXhh
bmRlciAoTm9raWEgLSBERS9VbG0pIHdyb3RlOg0KPiBTbyBlcmFzZXNpemUgaXMgYmFjayB0byB0
aGUgdmFsdWUgYmVmb3JlIG5vbi11bmlmb3JtIHN1cHBvcnQgcGF0Y2hlcywNCj4gcGFydGl0aW9u
cyBhcmUgbm90IG1hZGUgcmVhZCBvbmx5IGFueSBtb3JlLCBidXQgYWN0dWFsIHdyaXRlIG9yDQo+
IGVyYXNlIHN0aWxsIGZhaWxzLg0KDQpIb3cgZG9lcyB0aGUgZXJhc2UgZmFpbD8NCg0KV2hhdCBt
YXAgY29uZmlndXJhdGlvbiBpcyBzZWxlY3RlZD8gV2hlcmUgYXJlIHRoZSBoeWJyaWQgYmxvY2tz
LCBhdCB0aGUgYm90dG9tDQpvciBhdCB0aGUgdG9wIG9mIHRoZSBhZGRyZXNzIHNwYWNlPw0KDQpE
b2VzIHRoZSBlcmFzZSBmYWlsIGV2ZW4gd2hlbiBhZGRyZXNzIGlzIGFsaWduZWQgd2l0aCA2NGsg
YW5kIHRoZSBzaXplIG11bHRpcGxlDQpvZiA2NGs/IERvZXMgdGhlIGZvbGxvd2luZyBmYWlsPw0K
DQokIG10ZF9kZWJ1ZyBlcmFzZSAvZGV2L3lvdXJfbXRkIDAgNjU1MzYNCg0KVGhlIG5vbi11bmlm
b3JtIGVyYXNlIHdpbGwgZmFpbCBpZiBpdCBjYW4ndCBzZWxlY3QgYSBzZXF1ZW5jZSBvZiBjb21t
YW5kcyB0aGF0DQpjYW4gZXJhc2UgdGhlIGVudGlyZSByZXF1ZXN0ZWQgY2h1bmsuDQoNCkNoZWVy
cywNCnRhDQo=
