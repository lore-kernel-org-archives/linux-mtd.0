Received: from mail-bl2nam02on0078.outbound.protection.outlook.com
 ([104.47.38.78] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gH7F6-0003pl-5b
 for linux-mtd@lists.infradead.org; Mon, 29 Oct 2018 13:07:41 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Michal Simek <michals@xilinx.com>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>
Subject: RE: [LINUX PATCH v11 0/3] Add support for Arasan NAND Flash controller
Date: Mon, 29 Oct 2018 13:05:47 +0000
Message-ID: <BN6PR02MB2610FC0417A77722E5F63BE3AFF30@BN6PR02MB2610.namprd02.prod.outlook.com>
References: <1537878031-22253-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20181029105108.562ddd21@xps13>
In-Reply-To: <20181029105108.562ddd21@xps13>
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

SGkgTWlxdWVsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pcXVl
bCBSYXluYWwgW21haWx0bzptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tXQ0KPiBTZW50OiBNb25k
YXksIE9jdG9iZXIgMjksIDIwMTggMzoyMSBQTQ0KPiBUbzogTmFnYSBTdXJlc2hrdW1hciBSZWxs
aSA8bmFnYXN1cmVAeGlsaW54LmNvbT4NCj4gQ2M6IGJvcmlzLmJyZXppbGxvbkBib290bGluLmNv
bTsgcmljaGFyZEBub2QuYXQ7IGR3bXcyQGluZnJhZGVhZC5vcmc7DQo+IGNvbXB1dGVyc2ZvcnBl
YWNlQGdtYWlsLmNvbTsgbWFyZWsudmFzdXRAZ21haWwuY29tOyBsaW51eC1tdGRAbGlzdHMuaW5m
cmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgTWljaGFsIFNpbWVr
IDxtaWNoYWxzQHhpbGlueC5jb20+Ow0KPiBuYWdhc3VyZXNoMTJAZ21haWwuY29tDQo+IFN1Ympl
Y3Q6IFJlOiBbTElOVVggUEFUQ0ggdjExIDAvM10gQWRkIHN1cHBvcnQgZm9yIEFyYXNhbiBOQU5E
IEZsYXNoIGNvbnRyb2xsZXINCj4gDQo+IEhpIE5hZ2EsDQo+IA0KPiBOYWdhIFN1cmVzaGt1bWFy
IFJlbGxpIDxuYWdhLnN1cmVzaGt1bWFyLnJlbGxpQHhpbGlueC5jb20+IHdyb3RlIG9uIFR1ZSwg
MjUgU2VwIDIwMTgNCj4gMTc6NTA6MjggKzA1MzA6DQo+IA0KPiA+IFRoaXMgcGF0Y2ggc2VyaWVz
IGFkZHMgdGhlIGJhc2ljIGRyaXZlciBzdXBwb3J0IGZvciBBcmFzYW4gTkFORCBGbGFzaCBjb250
cm9sbGVyLg0KPiA+IFdlIGFyZSByZWluaXRpYXRpbmcgdGhlIHBhdGNoIHNlcmllcyBieSBmaXhp
bmcgdGhlIGNvbW1lbnRzIGdpdmVuIGJ5IE1pcXVlbCBhbmQgQm9yaXMuDQo+ID4gTWFqb3IgY2hh
bmdlcyBhcmUgZXhlY19vcCgpIGltcGxlbWVudGF0aW9uIHJlbGF0ZWQuDQo+ID4gUmViYXNlZCB0
byA0LjE5IG5hbmQgdHJlZS4NCj4gPiBUZXN0ZWQgTVQyOUYzMkcwOEFCQ0RCSjQuDQo+ID4NCj4g
PiBBcyBzdWdnZXN0ZWQgYnkgQm9yaXMsIGl0IGFsc28gYWRkcyBhIG5ldyB2YXJhaWJsZSBjYWxs
ZWQgbW9kZSBpbg0KPiA+IHN0cnVjdCBuYW5kX3Nkcl90aW1pbmdzLCB3aGljaCB3aWxsIGdpdmUg
ZGlyZWN0bHkgdGhlIHNkciBvcGVyYXRpbmcNCj4gPiBtb2RlLiBhbmQgaXQgaXMgdXNlZnVsIGZv
ciBzb21lIGNvbnRyb2xsZXJzLCB3aGVyZSB3ZSBjYW4gY29uZmlndXJlDQo+ID4gZGlyZWNsdHkg
dGhlIG9wZXJhdGluZyBtb2RlIGluc3RlYWQgb2YgdGltaW5ncy4NCj4gPg0KPiANCj4gVW5sZXNz
IEkgbWlzc2VkIHNvbWV0aGluZyB0aGVyZSBhcmUgc3RpbGwgY29tbWVudHMgZnJvbSBCb3JpcyBw
ZW5kaW5nPw0KPiBJIHdpbGwgd2FpdCBmb3IgeW91ciB2MTIgdG8gZ2l2ZSB0aGlzIGRyaXZlciBh
bm90aGVyIHNob3QuDQpzaGFsbCBJIHNlbmQgdGhlIHYxMiBvbiB0b3Agb2YgbmFuZC9mb3ItNC4y
MD8NCg0KVGhhbmtzLA0KTmFnYSBTdXJlc2hrdW1hciBSZWxsaQ0KPiANCj4gVGhhbmtzLA0KPiBN
aXF1w6hsDQo=
