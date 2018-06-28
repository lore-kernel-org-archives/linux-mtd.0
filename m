Received: from mail-cys01nam02on0052.outbound.protection.outlook.com
 ([104.47.37.52] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYVo2-00005w-LF
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2018 12:13:49 +0000
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
Date: Thu, 28 Jun 2018 12:13:31 +0000
Message-ID: <MWHPR02MB26232270DED605627B2CF22FAF4F0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1529563351-2241-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1529563351-2241-5-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <CACRpkdaEsEAiGpieJK1AA8HHLzZc7Tdc932rhdayg06rFU1hNA@mail.gmail.com>
In-Reply-To: <CACRpkdaEsEAiGpieJK1AA8HHLzZc7Tdc932rhdayg06rFU1hNA@mail.gmail.com>
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
V2FsbGVpaiBbbWFpbHRvOmxpbnVzLndhbGxlaWpAbGluYXJvLm9yZ10NCj4gU2VudDogVGh1cnNk
YXksIEp1bmUgMjgsIDIwMTggMToxNCBQTQ0KPiBUbzogTmFnYSBTdXJlc2hrdW1hciBSZWxsaSA8
bmFnYXN1cmVAeGlsaW54LmNvbT4NCj4gQ2M6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemls
bG9uQGJvb3RsaW4uY29tPjsgUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD47DQo+
IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz47IEJyaWFuIE5vcnJpcw0KPiA8
Y29tcHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tPjsgTWFyayBWYXN1dCA8bWFyZWsudmFzdXRAZ21h
aWwuY29tPjsgRmxvcmlhbiBGYWluZWxsaQ0KPiA8Zi5mYWluZWxsaUBnbWFpbC5jb20+OyBNYXJr
dXMgTWF5ZXIgPG1tYXllckBicm9hZGNvbS5jb20+OyBSb2dlciBRdWFkcm9zDQo+IDxyb2dlcnFA
dGkuY29tPjsgTGFkaXNsYXYgTWljaGwgPGxhZGlzQGxpbnV4LW1pcHMub3JnPjsgYWRhQHRob3Jz
aXMuY29tOw0KPiBob25naHVpLnpoYW5nQG1lZGlhdGVrLmNvbTsgTWlxdcOobCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+OyBsaW51eC0NCj4gbXRkQGxpc3RzLmluZnJhZGVhZC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IG5hZ2FzdXJlc2hrdW1hcnJlbGxpQGdt
YWlsLmNvbTsNCj4gTWljaGFsIFNpbWVrIDxtaWNoYWxzQHhpbGlueC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbW0xJTlVYIFBBVENIIHYxMF0gNC80XSBtdGQ6IHJhd25hbmQ6IHBsMzUzOiBBZGQgYmFz
aWMgZHJpdmVyIGZvciBhcm0NCj4gcGwzNTMgc21jIG5hbmQgaW50ZXJmYWNlDQo+IA0KPiBPbiBU
aHUsIEp1biAyMSwgMjAxOCBhdCA4OjQzIEFNIE5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkNCj4gPG5h
Z2Euc3VyZXNoa3VtYXIucmVsbGlAeGlsaW54LmNvbT4gd3JvdGU6DQo+IA0KPiBUaGFuayB5b3Ug
Zm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IEFkZCBkcml2ZXIgZm9yIGFybSBwbDM1MyBzdGF0aWMg
bWVtb3J5IGNvbnRyb2xsZXIgbmFuZCBpbnRlcmZhY2Ugd2l0aA0KPiA+IEhXIEVDQyBzdXBwb3J0
LiBUaGlzIGNvbnRyb2xsZXIgaXMgdXNlZCBpbiBYaWxpbnggWnlucSBTb0MgZm9yDQo+ID4gaW50
ZXJmYWNpbmcgdGhlIE5BTkQgZmxhc2ggbWVtb3J5Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
TmFnYSBTdXJlc2hrdW1hciBSZWxsaQ0KPiA+IDxuYWdhLnN1cmVzaGt1bWFyLnJlbGxpQHhpbGlu
eC5jb20+DQo+IA0KPiBUaGlzIGRyaXZlciBoYXMgdGhlIHNhbWUgcHJvYmxlbSBhcyB0aGUgb3Ro
ZXIgcGF0Y2hlczoNCj4gdXNlIHRoZSBBUk1fQU1CQSBwcmltZWNlbGwgbWFnaWMgbnVtYmVycyBk
ZXRlY3Rpb24sIGFuZCB0aGUgUHJpbWVDZWxsIGJ1cy4NCkhlcmUgdGhlIGNoaWxkIGlzIE5BTkQg
Y29udHJvbGxlciBhbmQgdGhlIHBhcmVudCBpcyBQTDM1MyBTTUMsIA0Kc28gZG8gd2UgbmVlZCB0
byB1cGRhdGUgdGhpcyBhbHNvIGFzIEFNQkEgZHJpdmVyPw0KDQpUaGFua3MsDQpOYWdhIFN1cmVz
aGt1bWFyIFJlbGxpDQoNCg0KPiANCj4gT3RoZXJ3aXNlIGl0IGxvb2tzIGdvb2QgdG8gbWUhDQo+
IA0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0K
