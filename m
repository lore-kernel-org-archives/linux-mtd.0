Received: from mail-eopbgr740082.outbound.protection.outlook.com
 ([40.107.74.82] helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gX0RS-0006BL-5E
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2018 09:04:32 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Boris Brezillon <boris.brezillon@bootlin.com>, "robh@kernel.org"
 <robh@kernel.org>, "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>, Michal Simek
 <michals@xilinx.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: RE: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Date: Wed, 12 Dec 2018 09:04:16 +0000
Message-ID: <MWHPR02MB26236CEF8A2110B20C825198AFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <MWHPR02MB26234433484426F333E9B60EAFDC0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181118204324.373ca9cc@bbrezillon>
 <MWHPR02MB2623AAEC160F40F061E23194AFD80@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181119090246.49060019@bbrezillon>
 <BN6PR02MB2610C7D048E4A192E041BE14AFD90@BN6PR02MB2610.namprd02.prod.outlook.com>
 <20181120120244.7d2442b5@bbrezillon>	<20181120133624.3fa4742d@xps13>
 <MWHPR02MB26238A2271B33470ABFA1023AFD40@MWHPR02MB2623.namprd02.prod.outlook.com>
 <MWHPR02MB26239C2B2A7050310BEF1E9CAFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181212091135.1d0cc9a6@xps13>
In-Reply-To: <20181212091135.1d0cc9a6@xps13>
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
bCBSYXluYWwgW21haWx0bzptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tXQ0KPiBTZW50OiBXZWRu
ZXNkYXksIERlY2VtYmVyIDEyLCAyMDE4IDE6NDIgUE0NCj4gVG86IE5hZ2EgU3VyZXNoa3VtYXIg
UmVsbGkgPG5hZ2FzdXJlQHhpbGlueC5jb20+DQo+IENjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlz
LmJyZXppbGxvbkBib290bGluLmNvbT47IHJvYmhAa2VybmVsLm9yZzsgcmljaGFyZEBub2QuYXQ7
IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBtYXJlay52YXN1dEBnbWFpbC5jb207
IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBuYWdhc3VyZXNoMTJAZ21haWwuY29t
OyBNaWNoYWwgU2ltZWsgPG1pY2hhbHNAeGlsaW54LmNvbT47DQo+IGNvbXB1dGVyc2ZvcnBlYWNl
QGdtYWlsLmNvbTsgZHdtdzJAaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW0xJTlVYIFBB
VENIIHYxMiAzLzNdIG10ZDogcmF3bmFuZDogYXJhc2FuOiBBZGQgc3VwcG9ydCBmb3IgQXJhc2Fu
DQo+IE5BTkQgRmxhc2ggQ29udHJvbGxlcg0KPiANCj4gSGkgTmFnYSwNCj4gDQo+IE5hZ2EgU3Vy
ZXNoa3VtYXIgUmVsbGkgPG5hZ2FzdXJlQHhpbGlueC5jb20+IHdyb3RlIG9uIFdlZCwgMTIgRGVj
IDIwMTgNCj4gMDU6Mjc6MDMgKzAwMDA6DQo+IA0KPiA+IEhpIEJvcmlzICYgTWlxdWVsLA0KPiA+
DQo+ID4gQW4gdXBkYXRlIHRvIG15IGNvbW1lbnRzIG9uIHRocmVhZCBodHRwczovL2xrbWwub3Jn
L2xrbWwvMjAxOC8xMS8xNS82NTYuDQo+ID4gSW4gdGhpcyBJIHNhaWQsIHdpbGwgdGFrZSBhIGRl
ZmF1bHQgZXJyb3IgY291bnQgdmFsdWUgYXMgMTYgYW5kIGR1cmluZw0KPiA+IHBhZ2UgcmVhZCwg
d2lsbCBjaGVjayB0aGUgZXJyb3IgY291bnQgUmVnaXN0ZXIgdmFsdWUgd2l0aCB0aGlzIGFuZCBp
Zg0KPiA+IGl0IGlzIGVxdWFsIHRvIG9yIGdyZWF0ZXIgdGhhbiB0aGUgZGVmYXVsdCBjb3VudCgx
NikgdGhlbiBJIGFtIGNoZWNraW5nIGZvciBFcmFzZWQgcGFnZXMuDQo+ID4gQnV0IGJpdFs3OjBd
IGluIEVDQ19FcnJvcl9Db3VudF9SZWdpc3RlcigweDM4KSB3aWxsIHVwZGF0ZSBmb3IgZWFjaCBl
cnJvciBvY2N1cnJlZC4NCj4gPiBMaW5rOg0KPiA+IGh0dHBzOi8vd3d3LnhpbGlueC5jb20vaHRt
bF9kb2NzL3JlZ2lzdGVycy91ZzEwODcvdWcxMDg3LXp5bnEtdWx0cmFzY2FsZS0NCj4gcmVnaXN0
ZXJzLmh0bWwgYW5kIGNoZWNrIGZvciBOQU5EIG1vZHVsZSwgRUNDX0Vycm9yX0NvdW50X1JlZ2lz
dGVyLg0KPiA+DQo+ID4gSSBtZWFuIHByZXZpb3VzbHkgSSBkZXBlbmRlbnQgb24gVG90YWwgZXJy
b3IgY291bnQgdmFsdWUgKGJpdFsxNjo4XSksDQo+ID4gYnV0IHdlIGNhbiBzaW1wbHkgY2hlY2sg
Zm9yIGJpdFs3OjBdIFRvIHNlZSB0aGUgZXJyb3Igb2NjdXJyZWQgb3Igbm90Lg0KPiA+IEkgdHJp
ZWQgd2l0aCB0aGlzIGFwcHJvYWNoIGFuZCBJIGRvbid0IHNlZSBhbnkgaXNzdWVzIHdpdGggdGhh
dC4NCj4gPiBJIHJhbiB1YmlmcyB3aXRoIHRoaXMgYW5kIEkgYW0gYWJsZSB0byBzZWUgdGhlIGJp
dFs3OjBdIGNvdW50IGlzDQo+ID4gdXBkYXRlZCBmb3IgZXJhc2VkIHBhZ2UgcmVhZCBhbmQgdGhl
biB3aWxsIFVzZSBuYW5kX2NoZWNoX2VyYXNlZF9lY2NfY2h1bmsoKSB0byBzZWUgdGhlDQo+IGJp
dGZsaXBzLg0KPiA+DQo+ID4gSWYgaXQgaXMgb2ssIEkgd2lsbCB1cGRhdGUgdGhlIGRyaXZlciBh
bmQgd2lsbCBzZW5kIG5ldyBwYXRjaCwgYnV0IGRvIHlvdSBoYXZlIGFueSBvdGhlcg0KPiBjb21t
ZW50cyBvbiB2MTI/DQo+IA0KPiBJcyAnbmFuZGJpdGVycnMgLWknIHJ1bm5pbmcgY29ycmVjdGx5
IG5vdz8NClllcywgYnV0IHdpdGggc29tZSBjaGFuZ2VzIGluIGRyaXZlci4NCkkgaGF2ZSBhZGRl
ZCB0aGUgbG9nIGFuZCBjaGFuZ2VzIGRvbmUgaW4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgv
MTEvMjMvNzA1Lg0KRG8geW91IHNlZSBhbnkgaXNzdWVzIHdpdGggdGhhdCBhcHByb2FjaD8NCg0K
VGhhbmtzLA0KTmFnYSBTdXJlc2hrdW1hciBSZWxsaS4NCg==
