From: "Yang, Wenyou" <Wenyou.Yang@atmel.com>
To: Rob Herring <robh@kernel.org>
CC: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown
 <broonie@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "Kumar
 Gala" <galak@codeaurora.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "Ferre, Nicolas" <Nicolas.FERRE@atmel.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>, "Jean-Christophe
 Plagniol-Villard" <plagnioj@jcrosoft.com>, Russell King
 <linux@arm.linux.org.uk>, Josh Wu <rainyfeeling@outlook.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 0/2] mtd: atmel_nand: remove compatible "atmel,sama5d4-nfc"
Date: Tue, 10 May 2016 04:50:37 +0000
Message-ID: <B256D81BAE5131468A838E5D7A243641D6487F5A@penmbx01>
References: <1462776680-5284-1-git-send-email-wenyou.yang@atmel.com>
 <20160509201324.GA9845@rob-hp-laptop>
In-Reply-To: <20160509201324.GA9845@rob-hp-laptop>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgW21h
aWx0bzpyb2JoQGtlcm5lbC5vcmddDQo+IFNlbnQ6IDIwMTbE6jXUwjEwyNUgNDoxMw0KPiBUbzog
WWFuZywgV2VueW91IDxXZW55b3UuWWFuZ0BhdG1lbC5jb20+DQo+IENjOiBCcmlhbiBOb3JyaXMg
PGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbT47IERhdmlkIFdvb2Rob3VzZQ0KPiA8ZHdtdzJA
aW5mcmFkZWFkLm9yZz47IFBhd2VsIE1vbGwgPHBhd2VsLm1vbGxAYXJtLmNvbT47IE1hcmsgQnJv
d24NCj4gPGJyb29uaWVAa2VybmVsLm9yZz47IElhbiBDYW1wYmVsbCA8aWpjK2RldmljZXRyZWVA
aGVsbGlvbi5vcmcudWs+OyBLdW1hcg0KPiBHYWxhIDxnYWxha0Bjb2RlYXVyb3JhLm9yZz47IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBtdGRAbGlzdHMuaW5mcmFkZWFk
Lm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IEZlcnJlLCBOaWNvbGFzDQo+IDxOaWNv
bGFzLkZFUlJFQGF0bWVsLmNvbT47IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9u
aUBmcmVlLQ0KPiBlbGVjdHJvbnMuY29tPjsgSmVhbi1DaHJpc3RvcGhlIFBsYWduaW9sLVZpbGxh
cmQgPHBsYWduaW9qQGpjcm9zb2Z0LmNvbT47DQo+IFJ1c3NlbGwgS2luZyA8bGludXhAYXJtLmxp
bnV4Lm9yZy51az47IEpvc2ggV3UgPHJhaW55ZmVlbGluZ0BvdXRsb29rLmNvbT47DQo+IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAv
Ml0gbXRkOiBhdG1lbF9uYW5kOiByZW1vdmUgY29tcGF0aWJsZSAiYXRtZWwsc2FtYTVkNC0NCj4g
bmZjIg0KPiANCj4gT24gTW9uLCBNYXkgMDksIDIwMTYgYXQgMDI6NTE6MTdQTSArMDgwMCwgV2Vu
eW91IFlhbmcgd3JvdGU6DQo+ID4gSXQgaXMgYSBkYXRhc2hlZXQgYnVnLCBmb3IgY3VycmVudCBT
b0NzLCB0aGUgUkJfRURHRTMoaS5lLiBiaXQgMjcpIG9mDQo+ID4gSFNNQ19TUiByZWdpc3RlciBk
b2VzIG5vdCBleGlzdCwgdGhlIFJCX0VER0UwIChpLmUuIGJpdCAyNCkgaXMgdGhlDQo+ID4gcmVh
ZHkvYnVzeSBsaW5lIGVkZ2Ugc3RhdHVzIGJpdC4gU28gdGhlIGNvbXBhdGlibGUgImF0bWVsLHNh
bWE1ZDQtbmZjIg0KPiA+IGlzIHVubmVlZGVkLg0KPiANCj4gVGhlIGNvbXBhdGlibGUgaXMgbmVl
ZGVkIGlmIHRoZSBTT0Mgc3RpbGwgZXhpc3RzLiBZb3UgY2FuIGxpc3QgYm90aCBmb3IgdGhlIHNh
bWE1ZDQNCj4gaWYgdGhlIGJsb2NrIGlzIHRoZSBzYW1lLg0KDQpUaGUgTkZDIElQIG9mIFNBTUE1
RDQgaXMgc2FtZSBhcyBTQU1BNUQyJ3MsIFNBTUE1RDQgaGFzZSB0aGlzIGlzc3VlLiAgVGhpcyBj
b21wYXRpYmxlIGNhbiBiZSByZW1vdmVkLiANCg0KDQpCZXN0IFJlZ2FyZHMsDQpXZW55b3UgWWFu
Zw0K
