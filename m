Received: from mail-sn1nam01on0081.outbound.protection.outlook.com
 ([104.47.32.81] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYkos-0003q7-GS
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2018 04:15:40 +0000
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
Date: Fri, 29 Jun 2018 04:15:24 +0000
Message-ID: <MWHPR02MB26239876530B0F5C95289A56AF4E0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1529563351-2241-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1529563351-2241-5-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <CACRpkdaEsEAiGpieJK1AA8HHLzZc7Tdc932rhdayg06rFU1hNA@mail.gmail.com>
 <MWHPR02MB26232270DED605627B2CF22FAF4F0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <CACRpkdZb6NMHtai1DBa+7m2ieZJZiAB7d1vSuP376rHQKpOf+A@mail.gmail.com>
In-Reply-To: <CACRpkdZb6NMHtai1DBa+7m2ieZJZiAB7d1vSuP376rHQKpOf+A@mail.gmail.com>
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
YXksIEp1bmUgMjgsIDIwMTggMTE6NDQgUE0NCj4gVG86IE5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkg
PG5hZ2FzdXJlQHhpbGlueC5jb20+DQo+IENjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXpp
bGxvbkBib290bGluLmNvbT47IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Ow0K
PiBEYXZpZCBXb29kaG91c2UgPGR3bXcyQGluZnJhZGVhZC5vcmc+OyBCcmlhbiBOb3JyaXMNCj4g
PGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbT47IE1hcmsgVmFzdXQgPG1hcmVrLnZhc3V0QGdt
YWlsLmNvbT47IEZsb3JpYW4gRmFpbmVsbGkNCj4gPGYuZmFpbmVsbGlAZ21haWwuY29tPjsgTWFy
a3VzIE1heWVyIDxtbWF5ZXJAYnJvYWRjb20uY29tPjsgUm9nZXIgUXVhZHJvcw0KPiA8cm9nZXJx
QHRpLmNvbT47IExhZGlzbGF2IE1pY2hsIDxsYWRpc0BsaW51eC1taXBzLm9yZz47IGFkYUB0aG9y
c2lzLmNvbTsNCj4gaG9uZ2h1aS56aGFuZ0BtZWRpYXRlay5jb207IE1pcXXDqGwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjsgbGludXgtDQo+IG10ZEBsaXN0cy5pbmZyYWRlYWQu
b3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBuYWdhc3VyZXNoa3VtYXJyZWxsaUBn
bWFpbC5jb207DQo+IE1pY2hhbCBTaW1layA8bWljaGFsc0B4aWxpbnguY29tPg0KPiBTdWJqZWN0
OiBSZTogW1tMSU5VWCBQQVRDSCB2MTBdIDQvNF0gbXRkOiByYXduYW5kOiBwbDM1MzogQWRkIGJh
c2ljIGRyaXZlciBmb3IgYXJtDQo+IHBsMzUzIHNtYyBuYW5kIGludGVyZmFjZQ0KPiANCj4gT24g
VGh1LCBKdW4gMjgsIDIwMTggYXQgMjoxMyBQTSBOYWdhIFN1cmVzaGt1bWFyIFJlbGxpIDxuYWdh
c3VyZUB4aWxpbnguY29tPiB3cm90ZToNCj4gDQo+IA0KPiA+ID4gVGhpcyBkcml2ZXIgaGFzIHRo
ZSBzYW1lIHByb2JsZW0gYXMgdGhlIG90aGVyIHBhdGNoZXM6DQo+ID4gPiB1c2UgdGhlIEFSTV9B
TUJBIHByaW1lY2VsbCBtYWdpYyBudW1iZXJzIGRldGVjdGlvbiwgYW5kIHRoZSBQcmltZUNlbGwg
YnVzLg0KPiA+DQo+ID4gSGVyZSB0aGUgY2hpbGQgaXMgTkFORCBjb250cm9sbGVyIGFuZCB0aGUg
cGFyZW50IGlzIFBMMzUzIFNNQywgc28gZG8NCj4gPiB3ZSBuZWVkIHRvIHVwZGF0ZSB0aGlzIGFs
c28gYXMgQU1CQSBkcml2ZXI/DQo+IA0KPiBObywgc29ycnkuIFRoZSBwYXJlbnQgaXMgc3Bhd25p
bmcgYW5vdGhlciBkZXZpY2UgYW5kIHlvdSBzaG91bGQgaW5kZWVkIHVzZSBhIHBsYXRmb3JtIGRl
dmljZQ0KPiBmb3IgdGhhdC4NCj4gDQpPaywgeW91IG1lYW4gcGxhdGZvcm0gZHJpdmVyIG1vZGVs
IGlzIHN1ZmZpY2llbnQgZm9yIGJvdGggcGwzNTMtc21jLmMgYW5kIHBsMzUzX25hbmQuYyBkcml2
ZXJzPw0KT3IgQU1CQSBtb2RlbCBpcyBmb3IgcGwzNTMtc21jIGFuZCBwbGF0Zm9ybSBkcml2ZXIg
bW9kZWwgaXMgZm9yIHBsMzUzLW5hbmQ/DQoNClRoYW5rcywNCk5hZ2EgU3VyZXNoa3VtYXIgUmVs
bGkuDQoNCj4gRm9yZ2V0IHRoaXMgY29tbWVudC4NCj4gDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxs
ZWlqDQo=
