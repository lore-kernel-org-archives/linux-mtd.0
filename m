Received: from mail-sn1nam02on0051.outbound.protection.outlook.com
 ([104.47.36.51] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYVlC-0007bb-L6
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2018 12:10:59 +0000
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
Subject: RE: [[LINUX PATCH v10] 2/4] memory: pl353: Add driver for arm pl353
 static memory controller
Date: Thu, 28 Jun 2018 12:10:30 +0000
Message-ID: <MWHPR02MB2623C017D4A632F7A25FFD27AF4F0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1529563351-2241-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1529563351-2241-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <CACRpkdZiY2vAXQSuAgjKfHKtYT_UZD-apEbpS1RT5ZGFutYQeA@mail.gmail.com>
In-Reply-To: <CACRpkdZiY2vAXQSuAgjKfHKtYT_UZD-apEbpS1RT5ZGFutYQeA@mail.gmail.com>
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

SGkgTGludXgsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaW51cyBXYWxsZWlqIFttYWlsdG86bGludXMud2FsbGVpakBs
aW5hcm8ub3JnXQ0KPiBTZW50OiBUaHVyc2RheSwgSnVuZSAyOCwgMjAxOCAxMjoxOSBQTQ0KPiBU
bzogTmFnYSBTdXJlc2hrdW1hciBSZWxsaSA8bmFnYXN1cmVAeGlsaW54LmNvbT4NCj4gQ2M6IEJv
cmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGJvb3RsaW4uY29tPjsgUmljaGFyZCBXZWlu
YmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD47DQo+IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFk
ZWFkLm9yZz47IEJyaWFuIE5vcnJpcw0KPiA8Y29tcHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tPjsg
TWFyayBWYXN1dCA8bWFyZWsudmFzdXRAZ21haWwuY29tPjsgRmxvcmlhbiBGYWluZWxsaQ0KPiA8
Zi5mYWluZWxsaUBnbWFpbC5jb20+OyBNYXJrdXMgTWF5ZXIgPG1tYXllckBicm9hZGNvbS5jb20+
OyBSb2dlciBRdWFkcm9zDQo+IDxyb2dlcnFAdGkuY29tPjsgTGFkaXNsYXYgTWljaGwgPGxhZGlz
QGxpbnV4LW1pcHMub3JnPjsgYWRhQHRob3JzaXMuY29tOw0KPiBob25naHVpLnpoYW5nQG1lZGlh
dGVrLmNvbTsgTWlxdcOobCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+OyBsaW51
eC0NCj4gbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IG5hZ2FzdXJlc2hrdW1hcnJlbGxpQGdtYWlsLmNvbTsNCj4gTWljaGFsIFNpbWVrIDxtaWNo
YWxzQHhpbGlueC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbW0xJTlVYIFBBVENIIHYxMF0gMi80XSBt
ZW1vcnk6IHBsMzUzOiBBZGQgZHJpdmVyIGZvciBhcm0gcGwzNTMgc3RhdGljDQo+IG1lbW9yeSBj
b250cm9sbGVyDQo+IA0KPiBPbiBUaHUsIEp1biAyMSwgMjAxOCBhdCA4OjQzIEFNIE5hZ2EgU3Vy
ZXNoa3VtYXIgUmVsbGkNCj4gPG5hZ2Euc3VyZXNoa3VtYXIucmVsbGlAeGlsaW54LmNvbT4gd3Jv
dGU6DQo+IA0KPiA+IEFkZCBkcml2ZXIgZm9yIGFybSBwbDM1MyBzdGF0aWMgbWVtb3J5IGNvbnRy
b2xsZXIuIFRoaXMgY29udHJvbGxlciBpcw0KPiA+IHVzZWQgaW4gWGlsaW54IFp5bnEgU29DIGZv
ciBpbnRlcmZhY2luZyB0aGUgTkFORCBhbmQgTk9SL1NSQU0gbWVtb3J5IGRldmljZXMuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOYWdhIFN1cmVzaGt1bWFyIFJlbGxpDQo+ID4gPG5hZ2Euc3Vy
ZXNoa3VtYXIucmVsbGlAeGlsaW54LmNvbT4NCj4gDQo+ICguLi4pDQo+IA0KPiA+ICtjb25maWcg
UEwzNTNfU01DDQo+ID4gKyAgICAgICB0cmlzdGF0ZSAiQVJNIFBMMzVYIFN0YXRpYyBNZW1vcnkg
Q29udHJvbGxlcihTTUMpIGRyaXZlciINCj4gPiArICAgICAgIGRlZmF1bHQgeQ0KPiA+ICsgICAg
ICAgZGVwZW5kcyBvbiBBUk0NCj4gPiArICAgICAgIGRlcGVuZHMgb24gQVJDSF9aWU5RDQo+IA0K
PiBkZXBlbmRzIG9uIEFSTV9BTUJBDQpPay4gSSB3aWxsIGFkZCBpdCBuZXh0IHZlcnNpb24uDQo+
IA0KPiA+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+IA0KPiBUaGlzIGlz
IGEgUHJpbWVDZWxsIHdpdGggdGhlIEFSTSBwcmltZWNlbGwgSUQgcmVnaXN0ZXJzIHNwZWNpZmll
ZCwgc28gaXQgc2hvdWxkIG5vdCB1c2UNCj4gcGxhdGZvcm0gZGV2aWNlLg0KVGhhbmtzIGZvciBw
b2ludGluZyB0aGVzZSBkcml2ZXJzLiBMZXQgbWUgZ28gdGhyb3VnaCB0aGVzZS4NCg0KPiANCj4g
VXNlIDxsaW51eC9hbWJhL2J1cy5oPg0KPiANCj4gSXQgZnVydGhlciBuZWVkcyB0byBtYXRjaCBv
biB0aGVzZSBtYWdpYyB2YWx1ZXMgKGZvdW5kIGluDQo+IDB4ZmUwIGV0YykgYW5kIHVzZSB0aGUg
bmFtZSAiYXBiX3BjbGsiIGZvciB0aGUgcGVyaXBoZXJhbA0KPiAoc2lsaWNvbikgY2xvY2suDQo+
IA0KPiBTZWUgZXhhbXBsZXMgc3VjaCBhczoNCj4gZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMNCj4g
ZHJpdmVycy90dHkvc2VyaWFsL2FtYmEtcGwwMTEuYw0KPiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2Ft
YmEtY2xjZC5jDQo+IGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC8qDQo+IGV0YyBmb3IgZXhh
bXBsZXMuDQo+IA0KPiBBbHNvIHNlZSBhbmQgcmVmZXJlbmNlIHRoZSBzcGVjaWFsIFByaW1lQ2Vs
bCBEVCBiaW5kaW5nczoNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9w
cmltZWNlbGwudHh0DQpPay4gSSB3aWxsIGdvIHRocm91Z2ggdGhlc2UgYmluZGluZ3Mgb25jZS4N
Cj4gDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQoNClRoYW5rIGZvciB5b3VyIHJldmlldy4N
Cg0KUmVnYXJkcywNCk5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkuDQo=
