Received: from mail-eopbgr10066.outbound.protection.outlook.com ([40.107.1.66]
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMs6k-0007lE-Vv
 for linux-mtd@lists.infradead.org; Thu, 07 Dec 2017 09:05:09 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 Rajat Srivastava
 <rajat.srivastava@nxp.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [RFC 09/10] mtd: spi-nor: Disable hybrid mode for SPANSION
 S25FS-S family
Date: Thu, 7 Dec 2017 09:04:17 +0000
Message-ID: <HE1PR04MB124174B958E2B0BBAC58E53697330@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <1512548141-3319-10-git-send-email-prabhakar.kushwaha@nxp.com>
 <c764fd31-29c4-865c-656f-23c758af0640@wedev4u.fr>
In-Reply-To: <c764fd31-29c4-865c-656f-23c758af0640@wedev4u.fr>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ3lyaWxsZSBQaXRjaGVu
IFttYWlsdG86Y3lyaWxsZS5waXRjaGVuQHdlZGV2NHUuZnJdDQo+IFNlbnQ6IFdlZG5lc2RheSwg
RGVjZW1iZXIgMDYsIDIwMTcgNDoyOCBQTQ0KPiBUbzogUHJhYmhha2FyIEt1c2h3YWhhIDxwcmFi
aGFrYXIua3VzaHdhaGFAbnhwLmNvbT47IGxpbnV4LQ0KPiBtdGRAbGlzdHMuaW5mcmFkZWFkLm9y
Zw0KPiBDYzogYm9yaXMuYnJlemlsbG9uQGZyZWUtZWxlY3Ryb25zLmNvbTsgY29tcHV0ZXJzZm9y
cGVhY2VAZ21haWwuY29tOyBSYWphdA0KPiBTcml2YXN0YXZhIDxyYWphdC5zcml2YXN0YXZhQG54
cC5jb20+OyBkZWRla2luZDFAZ21haWwuY29tDQo+IFN1YmplY3Q6IFJlOiBbUkZDIDA5LzEwXSBt
dGQ6IHNwaS1ub3I6IERpc2FibGUgaHlicmlkIG1vZGUgZm9yIFNQQU5TSU9OIFMyNUZTLQ0KPiBT
IGZhbWlseQ0KPiANCj4gSGkgUHJhYmhha2FyLA0KPiANCj4gTGUgMDYvMTIvMjAxNyDDoCAwOTox
NSwgUHJhYmhha2FyIEt1c2h3YWhhIGEgw6ljcml0wqA6DQo+ID4gVGhlIFMyNUZTLVMgZmFtaWx5
IHBoeXNpY2FsIHNlY3RvcnMgbWF5IGJlIGNvbmZpZ3VyZWQgYXMgYSBoeWJyaWQNCj4gPiBjb21i
aW5hdGlvbiBvZiBlaWdodCA0LWtCIHBhcmFtZXRlciBzZWN0b3JzIGF0IHRoZSB0b3Agb3IgYm90
dG9tDQo+ID4gb2YgdGhlIGFkZHJlc3Mgc3BhY2Ugd2l0aCBhbGwgYnV0IG9uZSBvZiB0aGUgcmVt
YWluaW5nIHNlY3RvcnMNCj4gPiBiZWluZyB1bmlmb3JtIHNpemUuDQo+ID4gVGhlIGRlZmF1bHQg
c3RhdHVzIG9mIHRoZSBmbGFzaCBpcyB0aGUgaHlicmlkIGFyY2hpdGVjdHVyZS4NCj4gPiBUaGUg
cGFyYW1ldGVyIHNlY3RvcnMgYW5kIHRoZSB1bmlmb3JtIHNlY3RvcnMgaGF2ZSBkaWZmZXJlbnQg
ZXJhc2UNCj4gPiBjb21tYW5kcy4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggZGlzYWJsZXMgdGhlIGh5
YnJpZCBzZWN0b3IgYXJjaGl0ZWN0dXJlIHdoaWNoIG1ha2VzIHRoZQ0KPiA+IGZsYXNoIGhhdmUg
dW5pZm9ybSBzZWN0b3Igc2l6ZSBhbmQgdW5pZm9ybSBlcmFzZSBjb21tYW5kLg0KPiA+DQo+IA0K
PiBUaGlzIGlzc3VlIHNob3VsZCBiZSBhZGRyZXNzZWQgaW4gYSBnZW5lcmljIHdheSwgbm90IFNw
YW5zaW9uIHNwZWNpZmljLA0KPiBieSBhZGRpbmcgc3VwcG9ydCBvZiB0aGUgb3B0aW9uYWwgU2Vj
dG9yIE1hcCBQYXJhbWV0ZXIgVGFibGUgKFNGRFApLg0KPiBJbiBjYXNlIG9mIG5vbiB1bmlmb3Jt
IG1lbW9yaWVzLCBsaWtlIHRoaXMgU3BhbnNpb24gUzI1RlMtUyBmYW1pbHkgb3INCj4gU1NUMjYs
IHRoZSBTZWN0b3IgTWFwIFBhcmFtZXRlciBUYWJsZSBiZWNvbWVzIG1hbmRhdG9yeSBhcyBhIFNG
RFAgdGFibGUuDQo+IA0KPiBGcm9tIHRoZSBKRVNEMjE2QiBzcGVjaWZpY2F0aW9uLCBhYm91dCB0
aGUgSkVERUMgU2VjdG9yIE1hcCBQYXJhbWV0ZXIgVGFibGU6DQo+ICIiIg0KPiBUaGlzIHRhYmxl
IGlzIHJlcXVpcmVkIHdoZW4gYSBtZW1vcnkgZGV2aWNlOg0KPiAqIEhhcyBzZWN0b3JzIG9mIG1v
cmUgdGhhbiBvbmUgc2l6ZQ0KPiAqIE9yLCBkb2VzIG5vdCBhbGxvdyBhbGwgRXJhc2UgVHlwZSBj
b21tYW5kcyB0byBiZSBhcHBsaWVkIHRvIGFsbCBzZWN0b3JzLg0KPiAiIiINCj4gDQoNClRoYW5r
cyBmb3IgdGhlIGd1aWRhbmNlLiBMZXQgbWUgZXhwbG9yZSBTZWN0b3IgTWFwIFBhcmFtZXRlciBU
YWJsZSAoU0ZEUCkNCg0KLS1way4NCg0K
