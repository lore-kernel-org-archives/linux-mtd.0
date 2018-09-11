Received: from mail-sn1nam01on0049.outbound.protection.outlook.com
 ([104.47.32.49] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fzbAk-0002ks-5V
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2018 05:25:12 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Markus Mayer <mmayer@broadcom.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Ladislav Michl <ladis@linux-mips.org>, Linus Walleij
 <linus.walleij@linaro.org>
CC: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Mark Vasut <marek.vasut@gmail.com>, Roger
 Quadros <rogerq@ti.com>, "ada@thorsis.co" <ada@thorsis.co>,
 "honghui.zhang@mediatek.com" <honghui.zhang@mediatek.com>,
 =?utf-8?B?TWlxdcOobCBSYXluYWw=?= <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nagasureshkumarrelli@gmail.com" <nagasureshkumarrelli@gmail.com>, Michal
 Simek <michals@xilinx.com>
Subject: RE: [LINUX PATCH v11 1/3] dt-bindings: memory: Add pl353 smc
 controller devicetree binding information
Date: Tue, 11 Sep 2018 05:24:56 +0000
Message-ID: <MWHPR02MB2623EB3C27CE14C08EC45ACDAF040@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1531294612-29526-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1531294612-29526-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <CACRpkdZOwgj4hCy=L6kKiQOpGNpvFXJk666pauyRv-fdHizMtg@mail.gmail.com>
In-Reply-To: <CACRpkdZOwgj4hCy=L6kKiQOpGNpvFXJk666pauyRv-fdHizMtg@mail.gmail.com>
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

SGksDQoNCltMSU5VWCBQQVRDSCB2MTEgMS8zXSBkdC1iaW5kaW5nczogbWVtb3J5OiBBZGQgcGwz
NTMgc21jIGNvbnRyb2xsZXIgZGV2aWNldHJlZSBiaW5kaW5nIGluZm9ybWF0aW9uDQpbTElOVVgg
UEFUQ0ggdjExIDIvM10gbWVtb3J5OiBwbDM1MzogQWRkIGRyaXZlciBmb3IgYXJtIHBsMzUzIHN0
YXRpYyBtZW1vcnkgY29udHJvbGxlcg0KDQpDYW4gc29tZWJvZHkgYXBwbHkgdGhlIGFib3ZlIHBh
dGNoZXM/DQpUaGUgYWJvdmUgcGF0Y2hlcyBhcmUgYWxyZWFkeSByZXZpZXdlZC4gDQoNClRoYW5r
cywNCk5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogTGludXMgV2FsbGVpaiBbbWFpbHRvOmxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Z10NCj4gU2VudDogRnJpZGF5LCBKdWx5IDEzLCAyMDE4IDE6MDcgUE0NCj4gVG86IE5hZ2EgU3Vy
ZXNoa3VtYXIgUmVsbGkgPG5hZ2FzdXJlQHhpbGlueC5jb20+DQo+IENjOiBCb3JpcyBCcmV6aWxs
b24gPGJvcmlzLmJyZXppbGxvbkBib290bGluLmNvbT47IFJpY2hhcmQgV2VpbmJlcmdlciA8cmlj
aGFyZEBub2QuYXQ+Ow0KPiBEYXZpZCBXb29kaG91c2UgPGR3bXcyQGluZnJhZGVhZC5vcmc+OyBC
cmlhbiBOb3JyaXMNCj4gPGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbT47IE1hcmsgVmFzdXQg
PG1hcmVrLnZhc3V0QGdtYWlsLmNvbT47IEZsb3JpYW4gRmFpbmVsbGkNCj4gPGYuZmFpbmVsbGlA
Z21haWwuY29tPjsgTWFya3VzIE1heWVyIDxtbWF5ZXJAYnJvYWRjb20uY29tPjsgUm9nZXIgUXVh
ZHJvcw0KPiA8cm9nZXJxQHRpLmNvbT47IExhZGlzbGF2IE1pY2hsIDxsYWRpc0BsaW51eC1taXBz
Lm9yZz47IGFkYUB0aG9yc2lzLmNvOw0KPiBob25naHVpLnpoYW5nQG1lZGlhdGVrLmNvbTsgTWlx
dcOobCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+OyBsaW51eC0NCj4gbXRkQGxp
c3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IG5hZ2FzdXJl
c2hrdW1hcnJlbGxpQGdtYWlsLmNvbTsNCj4gTWljaGFsIFNpbWVrIDxtaWNoYWxzQHhpbGlueC5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbTElOVVggUEFUQ0ggdjExIDEvM10gZHQtYmluZGluZ3M6IG1l
bW9yeTogQWRkIHBsMzUzIHNtYyBjb250cm9sbGVyDQo+IGRldmljZXRyZWUgYmluZGluZyBpbmZv
cm1hdGlvbg0KPiANCj4gT24gV2VkLCBKdWwgMTEsIDIwMTggYXQgOTozNyBBTSBOYWdhIFN1cmVz
aGt1bWFyIFJlbGxpDQo+IDxuYWdhLnN1cmVzaGt1bWFyLnJlbGxpQHhpbGlueC5jb20+IHdyb3Rl
Og0KPiANCj4gPiBBZGQgcGwzNTMgc3RhdGljIG1lbW9yeSBjb250cm9sbGVyIGRldmljZXRyZWUg
YmluZGluZyBpbmZvcm1hdGlvbi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE5hZ2EgU3VyZXNo
a3VtYXIgUmVsbGkNCj4gPiA8bmFnYS5zdXJlc2hrdW1hci5yZWxsaUB4aWxpbnguY29tPg0KPiA+
IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjExOg0KPiANCj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gVGhhbmtzIQ0KPiANCj4gWW91cnMsDQo+IExp
bnVzIFdhbGxlaWoNCg==
