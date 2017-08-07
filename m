Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1deYz6-0005ua-0f
 for linux-mtd@lists.infradead.org; Mon, 07 Aug 2017 03:45:41 +0000
From: <Wenyou.Yang@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>, <rainyfeeling@outlook.com>,
 <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] mtd: nand: atmel: fix of_irq_get() error check
Date: Mon, 7 Aug 2017 03:45:09 +0000
Message-ID: <F9F4555C4E01D7469D37975B62D0EFBB69CF86@CHN-SV-EXMX07.mchp-main.com>
References: <20170805211436.181653483@cogentembedded.com>
In-Reply-To: <20170805211436.181653483@cogentembedded.com>
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2VyZ2VpIFNodHlseW92
IFttYWlsdG86c2VyZ2VpLnNodHlseW92QGNvZ2VudGVtYmVkZGVkLmNvbV0NCj4gU2VudDogMjAx
N8TqONTCNsjVIDU6MTQNCj4gVG86IFdlbnlvdSBZYW5nIC0gQTQxNTM1IDxXZW55b3UuWWFuZ0Bt
aWNyb2NoaXAuY29tPjsgSm9zaCBXdQ0KPiA8cmFpbnlmZWVsaW5nQG91dGxvb2suY29tPjsgQm9y
aXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AZnJlZS0NCj4gZWxlY3Ryb25zLmNvbT47IFJp
Y2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+OyBEYXZpZCBXb29kaG91c2UNCj4gPGR3
bXcyQGluZnJhZGVhZC5vcmc+OyBCcmlhbiBOb3JyaXMgPGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWls
LmNvbT47IE1hcmVrDQo+IFZhc3V0IDxtYXJlay52YXN1dEBnbWFpbC5jb20+OyBDeXJpbGxlIFBp
dGNoZW4gPGN5cmlsbGUucGl0Y2hlbkB3ZWRldjR1LmZyPjsNCj4gbGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmcNCj4gQ2M6IFNlcmdlaSBTaHR5bHlvdiA8c2VyZ2VpLnNodHlseW92QGNvZ2Vu
dGVtYmVkZGVkLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBtdGQ6IG5hbmQ6IGF0bWVsOiBmaXgg
b2ZfaXJxX2dldCgpIGVycm9yIGNoZWNrDQo+IA0KPiBvZl9pcnFfZ2V0KCkgbWF5IHJldHVybiAw
IGFzIHdlbGwgYXMgbmVnYXRpdmUgZXJyb3IgbnVtYmVyIG9uIGZhaWx1cmUsIHdoaWxlIHRoZQ0K
PiBkcml2ZXIgb25seSBjaGVja3MgZm9yIHRoZSBuZWdhdGl2ZSB2YWx1ZXMuICBUaGUgZHJpdmVy
IHdvdWxkIHRoZW4gY2FsbA0KPiBkZXZtX3JlcXVlc3RfaXJxKCkgZm9yIElSUTAgIGluIGl0cyBw
cm9iZSBtZXRob2QgYW5kIG5ldmVyIGdldCBhIHZhbGlkIGludGVycnVwdC4NCj4gDQo+IENoZWNr
IGZvciAnbmMtPmlycSA8PSAwJyBpbnN0ZWFkIGFuZCByZXR1cm4gLUVOWElPIGZyb20gdGhlIGRy
aXZlcidzIHByb2JlIGlmZg0KPiBvZl9pcnFfZ2V0KCkgcmV0dXJuZWQgMC4NCj4gDQo+IEZpeGVz
OiBmODhmYzEyMmNjMzQgKCJtdGQ6IG5hbmQ6IENsZWFudXAvcmV3b3JrIHRoZSBhdG1lbF9uYW5k
IGRyaXZlciIpDQo+IFNpZ25lZC1vZmYtYnk6IFNlcmdlaSBTaHR5bHlvdiA8c2VyZ2VpLnNodHls
eW92QGNvZ2VudGVtYmVkZGVkLmNvbT4NCj4gDQoNCkluZGVlZC4NCg0KQWNrZWQtYnk6IFdlbnlv
dSBZYW5nIDxXZW55b3UueWFuZ0BtaWNyb2NoaXAuY29tPg0KDQoNCkJlc3QgUmVnYXJkcywNCldl
bnlvdSBZYW5nDQo=
