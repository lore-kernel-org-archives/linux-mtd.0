Received: from mail-co1nam05on062f.outbound.protection.outlook.com
 ([2a01:111:f400:fe50::62f]
 helo=NAM05-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faCmZ-00076m-GX
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2018 04:19:18 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Mark Vasut <marek.vasut@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Markus Mayer <mmayer@broadcom.com>, Roger
 Quadros <rogerq@ti.com>, Ladislav Michl <ladis@linux-mips.org>,
 "ada@thorsis.com" <ada@thorsis.com>, "honghui.zhang@mediatek.com"
 <honghui.zhang@mediatek.com>, =?utf-8?B?TWlxdcOobCBSYXluYWw=?=
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nagasureshkumarrelli@gmail.com"
 <nagasureshkumarrelli@gmail.com>, Michal Simek <michals@xilinx.com>
Subject: RE: [[LINUX PATCH v10] 4/4] mtd: rawnand: pl353: Add basic driver for
 arm pl353 smc nand interface
Date: Tue, 3 Jul 2018 04:19:00 +0000
Message-ID: <MWHPR02MB26231E0F420D423E60196452AF420@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1529563351-2241-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1529563351-2241-5-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <CACRpkdaEsEAiGpieJK1AA8HHLzZc7Tdc932rhdayg06rFU1hNA@mail.gmail.com>
 <MWHPR02MB26232270DED605627B2CF22FAF4F0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <CACRpkdZb6NMHtai1DBa+7m2ieZJZiAB7d1vSuP376rHQKpOf+A@mail.gmail.com>
 <MWHPR02MB26239876530B0F5C95289A56AF4E0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <CACRpkdZp+8ZFRF2c+pAy47ZSWjavu3Qo5fz6A41zDty444MWCg@mail.gmail.com>
In-Reply-To: <CACRpkdZp+8ZFRF2c+pAy47ZSWjavu3Qo5fz6A41zDty444MWCg@mail.gmail.com>
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

SGkgTGludXMsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMg
V2FsbGVpaiBbbWFpbHRvOmxpbnVzLndhbGxlaWpAbGluYXJvLm9yZ10NCj4gU2VudDogTW9uZGF5
LCBKdWx5IDIsIDIwMTggNzoxOCBQTQ0KPiBUbzogTmFnYSBTdXJlc2hrdW1hciBSZWxsaSA8bmFn
YXN1cmVAeGlsaW54LmNvbT4NCj4gQ2M6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9u
QGJvb3RsaW4uY29tPjsgUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD47DQo+IERh
dmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz47IEJyaWFuIE5vcnJpcw0KPiA8Y29t
cHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tPjsgTWFyayBWYXN1dCA8bWFyZWsudmFzdXRAZ21haWwu
Y29tPjsgRmxvcmlhbiBGYWluZWxsaQ0KPiA8Zi5mYWluZWxsaUBnbWFpbC5jb20+OyBNYXJrdXMg
TWF5ZXIgPG1tYXllckBicm9hZGNvbS5jb20+OyBSb2dlciBRdWFkcm9zDQo+IDxyb2dlcnFAdGku
Y29tPjsgTGFkaXNsYXYgTWljaGwgPGxhZGlzQGxpbnV4LW1pcHMub3JnPjsgYWRhQHRob3JzaXMu
Y29tOw0KPiBob25naHVpLnpoYW5nQG1lZGlhdGVrLmNvbTsgTWlxdcOobCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+OyBsaW51eC0NCj4gbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IG5hZ2FzdXJlc2hrdW1hcnJlbGxpQGdtYWls
LmNvbTsNCj4gTWljaGFsIFNpbWVrIDxtaWNoYWxzQHhpbGlueC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbW0xJTlVYIFBBVENIIHYxMF0gNC80XSBtdGQ6IHJhd25hbmQ6IHBsMzUzOiBBZGQgYmFzaWMg
ZHJpdmVyIGZvciBhcm0NCj4gcGwzNTMgc21jIG5hbmQgaW50ZXJmYWNlDQo+IA0KPiBPbiBGcmks
IEp1biAyOSwgMjAxOCBhdCA2OjE1IEFNIE5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkgPG5hZ2FzdXJl
QHhpbGlueC5jb20+IHdyb3RlOg0KPiA+ID4gT24gVGh1LCBKdW4gMjgsIDIwMTggYXQgMjoxMyBQ
TSBOYWdhIFN1cmVzaGt1bWFyIFJlbGxpIDxuYWdhc3VyZUB4aWxpbnguY29tPg0KPiB3cm90ZToN
Cj4gPiA+DQo+ID4gPg0KPiA+ID4gPiA+IFRoaXMgZHJpdmVyIGhhcyB0aGUgc2FtZSBwcm9ibGVt
IGFzIHRoZSBvdGhlciBwYXRjaGVzOg0KPiA+ID4gPiA+IHVzZSB0aGUgQVJNX0FNQkEgcHJpbWVj
ZWxsIG1hZ2ljIG51bWJlcnMgZGV0ZWN0aW9uLCBhbmQgdGhlIFByaW1lQ2VsbCBidXMuDQo+ID4g
PiA+DQo+ID4gPiA+IEhlcmUgdGhlIGNoaWxkIGlzIE5BTkQgY29udHJvbGxlciBhbmQgdGhlIHBh
cmVudCBpcyBQTDM1MyBTTUMsIHNvDQo+ID4gPiA+IGRvIHdlIG5lZWQgdG8gdXBkYXRlIHRoaXMg
YWxzbyBhcyBBTUJBIGRyaXZlcj8NCj4gPiA+DQo+ID4gPiBObywgc29ycnkuIFRoZSBwYXJlbnQg
aXMgc3Bhd25pbmcgYW5vdGhlciBkZXZpY2UgYW5kIHlvdSBzaG91bGQNCj4gPiA+IGluZGVlZCB1
c2UgYSBwbGF0Zm9ybSBkZXZpY2UgZm9yIHRoYXQuDQo+ID4gPg0KPiA+IE9rLCB5b3UgbWVhbiBw
bGF0Zm9ybSBkcml2ZXIgbW9kZWwgaXMgc3VmZmljaWVudCBmb3IgYm90aCBwbDM1My1zbWMuYyBh
bmQgcGwzNTNfbmFuZC5jDQo+IGRyaXZlcnM/DQo+ID4gT3IgQU1CQSBtb2RlbCBpcyBmb3IgcGwz
NTMtc21jIGFuZCBwbGF0Zm9ybSBkcml2ZXIgbW9kZWwgaXMgZm9yIHBsMzUzLW5hbmQ/DQo+IA0K
PiBUaGUgbGF0dGVyLCBBTUJBIHByaW1lY2VsbCBidXMgZm9yIHBsMzUzLXNtYyBhbmQgcGxhdGZv
cm0gZGV2aWNlIGZvciB0aGUgbmFuZCBzdWJkZXZpY2UuDQo+IA0KPiBQbGF0Zm9ybSBkZXZpY2Ug
aXMgZm9yIGFueXRoaW5nIHRoYXQgY2Fubm90IGJlIGF1dG9kZXRlY3RlZCB3aXRoIGUuZy4NCj4g
bWFnaWMgaGFyZGFyZSBudW1iZXJzLCBhbmQgdGhlIGZpcnN0IGRldmljZSBjYW4gYmUgYXV0b2Rl
dGVjdGVkIGFzIGEgcHJpbWUgY2VsbCBidXQgbm90IHRoZQ0KPiBzdWJkZXZpY2UuDQpUaGFua3Mg
Zm9yIHlvdXIgaW5wdXRzLCBJIGFscmVhZHkgc3RhcnRlZCB1cGRhdGluZyB0aGlzLg0KSSB3aWxs
IHNlbmQgdjExLg0KDQpUaGFua3MsDQpOYWdhIFN1cmVzaGt1bWFyIFJlbGxpLg0KPiANCj4gWW91
cnMsDQo+IExpbnVzIFdhbGxlaWoNCg==
