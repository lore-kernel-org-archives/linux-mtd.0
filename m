Received: from mail-eopbgr680067.outbound.protection.outlook.com
 ([40.107.68.67] helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhWmy-0002tJ-6z
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 09:05:58 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "mmayer@broadcom.com" <mmayer@broadcom.com>, "rogerq@ti.com" <rogerq@ti.com>,
 "ladis@linux-mips.org" <ladis@linux-mips.org>, "ada@thorsis.co"
 <ada@thorsis.co>, "honghui.zhang@mediatek.com" <honghui.zhang@mediatek.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nagasureshkumarrelli@gmail.com" <nagasureshkumarrelli@gmail.com>, Michal
 Simek <michals@xilinx.com>
Subject: RE: [LINUX PATCH v11 3/3] mtd: rawnand: pl353: Add basic driver for
 arm pl353 smc nand interface
Date: Mon, 23 Jul 2018 09:05:39 +0000
Message-ID: <MWHPR02MB262381A5BE3BE24EEF060F41AF560@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1531294612-29526-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1531294612-29526-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <MWHPR02MB2623DFB0D13FF25DECC16027AF570@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20180723093038.5f6933d3@xps13>
In-Reply-To: <20180723093038.5f6933d3@xps13>
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
YXksIEp1bHkgMjMsIDIwMTggMTowMSBQTQ0KPiBUbzogTmFnYSBTdXJlc2hrdW1hciBSZWxsaSA8
bmFnYXN1cmVAeGlsaW54LmNvbT4NCj4gQ2M6IGJvcmlzLmJyZXppbGxvbkBib290bGluLmNvbTsg
cmljaGFyZEBub2QuYXQ7IGR3bXcyQGluZnJhZGVhZC5vcmc7DQo+IGNvbXB1dGVyc2ZvcnBlYWNl
QGdtYWlsLmNvbTsgbWFyZWsudmFzdXRAZ21haWwuY29tOyBmLmZhaW5lbGxpQGdtYWlsLmNvbTsN
Cj4gbW1heWVyQGJyb2FkY29tLmNvbTsgcm9nZXJxQHRpLmNvbTsgbGFkaXNAbGludXgtbWlwcy5v
cmc7IGFkYUB0aG9yc2lzLmNvOw0KPiBob25naHVpLnpoYW5nQG1lZGlhdGVrLmNvbTsgbGludXMu
d2FsbGVpakBsaW5hcm8ub3JnOyBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgt
DQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IG5hZ2FzdXJlc2hrdW1hcnJlbGxpQGdtYWlsLmNv
bTsgTWljaGFsIFNpbWVrDQo+IDxtaWNoYWxzQHhpbGlueC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
TElOVVggUEFUQ0ggdjExIDMvM10gbXRkOiByYXduYW5kOiBwbDM1MzogQWRkIGJhc2ljIGRyaXZl
ciBmb3IgYXJtIHBsMzUzDQo+IHNtYyBuYW5kIGludGVyZmFjZQ0KPiANCj4gSGkgTmFnYSwNCj4g
DQo+IE5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkgPG5hZ2FzdXJlQHhpbGlueC5jb20+IHdyb3RlIG9u
IFN1biwgMjIgSnVsIDIwMTgNCj4gMDc6MDQ6NDEgKzAwMDA6DQo+IA0KPiA+IEhpIE1pcXVlbCwN
Cj4gPg0KPiA+IENvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSB5b3VyIHJldmlldyBjb21tZW50cz8N
Cj4gPiBJIHdpbGwgYWRkcmVzcyBpZiBhbnkuDQo+IA0KPiBXZSBhcmUgYWxtb3N0IGF0IHRoZSBl
bmQgb2YgYSBwcmV0dHkgYmlnIHJlbGVhc2UsIEkgcmFuIG91dCBvZiB0aW1lIHRvIGRvIGFub3Ro
ZXIgcmV2aWV3IG9mIHlvdXINCj4gc2VyaWVzLCBzb3JyeSBmb3IgdGhlIGRlbGF5Lg0KTm8gcHJv
YmxlbSwgYW5kIHRoYW5rcyBmb3IgeW91ciByZXBseS4NCg0KVGhhbmtzLA0KTmFnYSBTdXJlc2hr
dW1hciBSZWxsaQ0KPiANCj4gUmVnYXJkcywNCj4gTWlxdcOobA0K
