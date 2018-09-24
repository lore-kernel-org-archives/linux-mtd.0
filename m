Received: from mail-bl2nam02on0042.outbound.protection.outlook.com
 ([104.47.38.42] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4MS4-0001yK-9B
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2018 08:42:46 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
CC: "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "kyungmin.park@samsung.com"
 <kyungmin.park@samsung.com>, "absahu@codeaurora.org" <absahu@codeaurora.org>,
 "peterpandong@micron.com" <peterpandong@micron.com>,
 "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek
 <michals@xilinx.com>, "nagasureshkumarrelli@gmail.com"
 <nagasureshkumarrelli@gmail.com>
Subject: RE: [LINUX PATCH v10 2/2] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Date: Mon, 24 Sep 2018 08:42:28 +0000
Message-ID: <MWHPR02MB2623E91C84E9762E12DCD73BAF170@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1534511964-20342-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1534511964-20342-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180820184013.57fd7b5c@bbrezillon>
 <MWHPR02MB2623A761C40745AD4AE2A295AF040@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20180922095340.4fe373f8@xps13> <20180922101326.6f139da2@bbrezillon>
In-Reply-To: <20180922101326.6f139da2@bbrezillon>
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

SGkgQm9yaXMgJiBNaXF1ZWwsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogQm9yaXMgQnJlemlsbG9uIFttYWlsdG86Ym9yaXMuYnJlemlsbG9uQGJvb3RsaW4uY29tXQ0K
PiBTZW50OiBTYXR1cmRheSwgU2VwdGVtYmVyIDIyLCAyMDE4IDE6NDMgUE0NCj4gVG86IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+DQo+IENjOiBOYWdhIFN1cmVzaGt1
bWFyIFJlbGxpIDxuYWdhc3VyZUB4aWxpbnguY29tPjsgcmljaGFyZEBub2QuYXQ7IGR3bXcyQGlu
ZnJhZGVhZC5vcmc7DQo+IGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbTsgbWFyZWsudmFzdXRA
Z21haWwuY29tOyBreXVuZ21pbi5wYXJrQHNhbXN1bmcuY29tOw0KPiBhYnNhaHVAY29kZWF1cm9y
YS5vcmc7IHBldGVycGFuZG9uZ0BtaWNyb24uY29tOyBmcmllZGVyLnNjaHJlbXBmQGV4Y2VldC5k
ZTsgbGludXgtDQo+IG10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBNaWNoYWwgU2ltZWsgPG1pY2hhbHNAeGlsaW54LmNvbT47DQo+IG5hZ2FzdXJl
c2hrdW1hcnJlbGxpQGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW0xJTlVYIFBBVENIIHYxMCAy
LzJdIG10ZDogcmF3bmFuZDogYXJhc2FuOiBBZGQgc3VwcG9ydCBmb3IgQXJhc2FuIE5BTkQNCj4g
Rmxhc2ggQ29udHJvbGxlcg0KPiANCj4gT24gU2F0LCAyMiBTZXAgMjAxOCAwOTo1Mzo0MCArMDIw
MA0KPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToNCj4g
DQo+ID4gSGkgTmFnYSwNCj4gPg0KPiA+IE5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkgPG5hZ2FzdXJl
QHhpbGlueC5jb20+IHdyb3RlIG9uIFR1ZSwgMTEgU2VwIDIwMTgNCj4gPiAwNToyMzowOSArMDAw
MDoNCj4gPg0KPiA+ID4gSGkgQm9yaXMsDQo+ID4gPg0KPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+ID4gPiBGcm9tOiBCb3JpcyBCcmV6aWxsb24gW21haWx0bzpib3Jpcy5i
cmV6aWxsb25AYm9vdGxpbi5jb21dDQo+ID4gPiA+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDIwLCAy
MDE4IDEwOjEwIFBNDQo+ID4gPiA+IFRvOiBOYWdhIFN1cmVzaGt1bWFyIFJlbGxpIDxuYWdhc3Vy
ZUB4aWxpbnguY29tPg0KPiA+ID4gPiBDYzogbWlxdWVsLnJheW5hbEBib290bGluLmNvbTsgcmlj
aGFyZEBub2QuYXQ7DQo+ID4gPiA+IGR3bXcyQGluZnJhZGVhZC5vcmc7IGNvbXB1dGVyc2ZvcnBl
YWNlQGdtYWlsLmNvbTsNCj4gPiA+ID4gbWFyZWsudmFzdXRAZ21haWwuY29tOyBreXVuZ21pbi5w
YXJrQHNhbXN1bmcuY29tOw0KPiA+ID4gPiBhYnNhaHVAY29kZWF1cm9yYS5vcmc7IHBldGVycGFu
ZG9uZ0BtaWNyb24uY29tOw0KPiA+ID4gPiBmcmllZGVyLnNjaHJlbXBmQGV4Y2VldC5kZTsgbGlu
dXgtIG10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiA+ID4gPiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBNaWNoYWwgU2ltZWsgPG1pY2hhbHNAeGlsaW54LmNvbT47DQo+ID4gPiA+IG5h
Z2FzdXJlc2hrdW1hcnJlbGxpQGdtYWlsLmNvbQ0KPiA+ID4gPiBTdWJqZWN0OiBSZTogW0xJTlVY
IFBBVENIIHYxMCAyLzJdIG10ZDogcmF3bmFuZDogYXJhc2FuOiBBZGQNCj4gPiA+ID4gc3VwcG9y
dCBmb3IgQXJhc2FuIE5BTkQgRmxhc2ggQ29udHJvbGxlcg0KPiA+ID4gPg0KPiA+ID4gPiBIaSBO
YWdhLA0KPiA+ID4gPg0KPiA+ID4gPiBPbiBGcmksIDE3IEF1ZyAyMDE4IDE4OjQ5OjI0ICswNTMw
IE5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkNCj4gPiA+ID4gPG5hZ2Euc3VyZXNoa3VtYXIucmVsbGlA
eGlsaW54LmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IEkgaGF2ZW4ndCBm
aW5pc2hlZCByZXZpZXdpbmcgdGhlIGRyaXZlciBidXQgdGhlcmUgYXJlIHN0aWxsIGENCj4gPiA+
ID4gYnVuY2ggb2YgdGhpbmdzIHRoYXQgbG9vayBzdHJhbmdlLCBmb3IgaW5zdGFuY2UsIHlvdXIN
Cj4gPiA+ID4gLT5yZWFkL3dyaXRlX3BhZ2UoKSBpbXBsZW1lbnRhdGlvbiBsb29rcyBzdXNwaWNp
b3VzLiBMZXQncyBkaXNjdXNzIHRoYXQgYmVmb3JlIHlvdSBzZW5kIGENCj4gbmV3IHZlcnNpb24u
DQo+IA0KPiBTb3JyeSwgSSd2ZSBiZWVuIHRvbyBidXN5IHRvIGZpbmlzaCBteSByZXZpZXcgOi0v
LiBQbGVhc2Ugc3VibWl0IHRoZSBuZXcgdmVyc2lvbiBhcyBNaXF1ZWwNCj4gc3VnZ2VzdGVkLg0K
T2ssIEkgd2lsbCBkby4NCg0KVGhhbmtzLA0KTmFnYSBTdXJlc2hrdW1hciBSZWxsaQ0KPiANCj4g
PiA+IENvdWxkIHlvdSBwbGVhc2UgcmV2aWV3IHRoZSByZW1haW5pbmcgc3R1ZmY/DQo+ID4gPiBJ
IGhhdmUgdGhlIGNoYW5nZXMgcmVhZHkgd2l0aCBtZSB3aGljaCB3aWxsIGFkZHJlc3MgYWxsIHlv
dXIgY29tbWVudHMgZ2l2ZW4gdG8gdGhpcyBzZXJpZXMuDQo+ID4gPg0KPiA+ID4gVGhhbmtzLA0K
PiA+ID4gTmFnYSBTdXJlc2hrdW1hciBSZWxsaQ0KPiA+DQo+ID4gUGxlYXNlIHN1Ym1pdCB0aGUg
bmV3IHZlcnNpb24gdGhhdCBpcyByZWFkeSwgdGhlIHJlc3Qgb2YgdGhlIHJldmlldw0KPiA+IHdp
bGwgY29tZS4NCj4gPg0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IE1pcXXDqGwNCg0K
