Received: from mail-by2on0107.outbound.protection.outlook.com
 ([207.46.100.107] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuBOo-0005KM-Af
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2015 03:39:43 +0000
From: Hou Zhiqiang <B48286@freescale.com>
To: Michal Suchanek <hramrach@gmail.com>, Andrew Murray
 <amurray@embedded-bits.co.uk>
CC: Huang Shijie <shijie.huang@intel.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Xu Han
 <han.xu@freescale.com>, Rafa? Mi?ecki <zajec5@gmail.com>, Huang Shijie
 <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>, Marek Vasut
 <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
 =?utf-8?B?QmVhbiBIdW8g6ZyN5paM5paMLA==?= <beanhuo@micron.com>, "MTD Maling
 List" <linux-mtd@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 7/7] mtd: spi-nor: add read loop
Date: Thu, 5 Nov 2015 03:39:18 +0000
Message-ID: <CY1PR0301MB0780A9588AA9348DCEA4823F8B290@CY1PR0301MB0780.namprd03.prod.outlook.com>
References: <cover.1439543572.git.hramrach@gmail.com>
 <1592668a061137b33c9a6392dfccc67c69fc1fe6.1439543572.git.hramrach@gmail.com>
 <CAPcvp5HB7m47ZTqQ0fE7EV42kNWO=i1EQaysNtgXw6V+oWoUdA@mail.gmail.com>
 <CAOMqctQOU91hbt+2O0qQe3tjMn=3pSYE8E4xPpeS3iGG2A5h8w@mail.gmail.com>
In-Reply-To: <CAOMqctQOU91hbt+2O0qQe3tjMn=3pSYE8E4xPpeS3iGG2A5h8w@mail.gmail.com>
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

SGkgTWljaGFsLA0KDQpEb2VzIHRoaXMgaGF2ZSBhbnkgdXBkYXRlcz8NCg0KVGhhbmtzLA0KWmhp
cWlhbmcNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWNoYWwgU3Vj
aGFuZWsgW21haWx0bzpocmFtcmFjaEBnbWFpbC5jb21dDQo+IFNlbnQ6IDIwMTXlubQ45pyIMTTm
l6UgMTg6MDgNCj4gVG86IEFuZHJldyBNdXJyYXkNCj4gQ2M6IEhvdSBaaGlxaWFuZy1CNDgyODY7
IEh1YW5nIFNoaWppZTsgRGF2aWQgV29vZGhvdXNlOyBCcmlhbiBOb3JyaXM7IFh1DQo+IEhhbi1C
NDU4MTU7IFJhZmHFgiBNacWCZWNraTsgSHVhbmcgU2hpamllOyBCZW4gSHV0Y2hpbmdzOyBNYXJl
ayBWYXN1dDsNCj4gR2Fib3IgSnVob3M7IEJlYW4gSHVvIOmcjeaWjOaWjCw7IE1URCBNYWxpbmcg
TGlzdDsgTEtNTA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDcvN10gbXRkOiBzcGktbm9yOiBh
ZGQgcmVhZCBsb29wDQo+IA0KPiBPbiAxNCBBdWd1c3QgMjAxNSBhdCAxMjowMiwgQW5kcmV3IE11
cnJheSA8YW11cnJheUBlbWJlZGRlZC1iaXRzLmNvLnVrPg0KPiB3cm90ZToNCj4gPiBPbiAxNCBB
dWd1c3QgMjAxNSBhdCAxMDoyMywgTWljaGFsIFN1Y2hhbmVrIDxocmFtcmFjaEBnbWFpbC5jb20+
IHdyb3RlOg0KPiA+PiBtdGRibG9jayBhbmQgdWJpIGRvIG5vdCBoYW5kbGUgdGhlIHNpdHVhdGlv
biB3aGVuIHJlYWQgcmV0dXJucyBsZXNzDQo+ID4+IGRhdGEgdGhhbiByZXF1ZXN0ZWQuIExvb3Ag
aW4gc3BpLW5vciB1bnRpbCBidWZmZXIgaXMgZmlsbGVkIG9yIGFuDQo+ID4+IGVycm9yIGlzIHJl
dHVybmVkLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgU3VjaGFuZWsgPGhyYW1y
YWNoQGdtYWlsLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICBkcml2ZXJzL210ZC9zcGktbm9yL3NwaS1u
b3IuYyB8IDIwICsrKysrKysrKysrKysrLS0tLS0tDQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMTQg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jDQo+ID4+IGIvZHJpdmVycy9tdGQvc3BpLW5vci9z
cGktbm9yLmMgaW5kZXggZTBhZTljZi4uMjQ2ZmFjNyAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCj4gPj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9z
cGktbm9yLmMNCj4gPj4gQEAgLTczOCwxNCArNzM4LDIyIEBAIHN0YXRpYyBpbnQgc3BpX25vcl9y
ZWFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLA0KPiBsb2ZmX3QgZnJvbSwgc2l6ZV90IGxlbiwNCj4g
Pj4gICAgICAgICBpZiAocmV0KQ0KPiA+PiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4g
Pj4NCj4gPj4gLSAgICAgICByZXQgPSBub3ItPnJlYWQobm9yLCBmcm9tLCBsZW4sIGJ1Zik7DQo+
ID4+ICsgICAgICAgd2hpbGUgKGxlbikgew0KPiA+PiArICAgICAgICAgICAgICAgcmV0ID0gbm9y
LT5yZWFkKG5vciwgZnJvbSwgbGVuLCBidWYpOw0KPiA+PiArICAgICAgICAgICAgICAgaWYgKHJl
dCA8PSAwKQ0KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHJlYWRfZXJyOw0KPiA+
PiArDQo+ID4+ICsgICAgICAgICAgICAgICBCVUdfT04ocmV0ID4gbGVuKTsNCj4gPj4gKyAgICAg
ICAgICAgICAgICpyZXRsZW4gKz0gcmV0Ow0KPiA+DQo+ID4gSXMgKnJldGxlbiBpbml0aWFsaXpl
ZCB0byAwIGFueXdoZXJlPw0KPiANCj4gSXQncyBpbml0aWFsaXplZCBpbiBtdGRjb3JlIGFuZCBw
YXNzZWQgaW50byBtdGQtPl9yZWFkLg0KPiANCj4gWWVzLCB0aGUgaW50ZXJmYWNlIGlzIHJlYWxs
eSBhd2t3YXJkLg0KPiANCj4gaW50IG10ZF9yZWFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2Zm
X3QgZnJvbSwgc2l6ZV90IGxlbiwgc2l6ZV90DQo+ICpyZXRsZW4sDQo+ICAgICAgICAgICAgICB1
X2NoYXIgKmJ1ZikNCj4gew0KPiAgICAgICAgIGludCByZXRfY29kZTsNCj4gICAgICAgICAqcmV0
bGVuID0gMDsNCj4gDQo+IA0KPiBUaGFua3MNCj4gDQo+IE1pY2hhbA0K
