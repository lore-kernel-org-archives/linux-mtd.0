Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OsR6J-0004LX-1R
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 02:06:27 +0000
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Mon, 6 Sep 2010 10:05:47 +0800
Subject: RE: [PATCH 1/1]nand/denali: Add runtime pm framework for MRST
	Denali NAND controller
Message-ID: <5D8008F58939784290FAB48F54975198278A379469@shsmsx502.ccr.corp.intel.com>
References: <20100826081201.GA11565@intel.com>
	<1283172159.12995.64.camel@brekeke>
In-Reply-To: <1283172159.12995.64.camel@brekeke>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>, "Van De Ven,
	Arjan" <arjan.van.de.ven@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgQXJ0ZW0NClRoYW5rcyBmb3IgeW91ciBjb21tZW50LiBFeGNlcHQgdGhlIERFTkFMSV9QTSBt
YWNybyBwcm9ibGVtLCBkbyB5b3UgaGF2ZSBhbnkgb3RoZXIgY29tbWVudA0KYWJvdXQgdGhlIGlt
cGxlbWVudCBvZiBydW50aW1lIHBtPw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IEFydGVtIEJpdHl1dHNraXkgW21haWx0bzpkZWRla2luZDFAZ21haWwuY29tXQ0KPiBT
ZW50OiBNb25kYXksIEF1Z3VzdCAzMCwgMjAxMCA4OjQzIFBNDQo+IFRvOiBEb25nLCBDaHVhbnhp
YW8NCj4gQ2M6IGR3bXcyQGluZnJhZGVhZC5vcmc7IFZhbiBEZSBWZW4sIEFyamFuOyBsaW51eC1t
dGRAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMV1uYW5kL2Rl
bmFsaTogQWRkIHJ1bnRpbWUgcG0gZnJhbWV3b3JrIGZvciBNUlNUIERlbmFsaQ0KPiBOQU5EIGNv
bnRyb2xsZXINCj4gDQo+IEhpLA0KPiANCj4gT24gVGh1LCAyMDEwLTA4LTI2IGF0IDE2OjEyICsw
ODAwLCBDaHVhbnhpYW8uRG9uZyB3cm90ZToNCj4gPiArc3RhdGljIHN0cnVjdCBkZXZfcG1fb3Bz
IGRlbmFsaV9wbSA9IHsNCj4gPiArCS5ydW50aW1lX3N1c3BlbmQgPSBkZW5hbGlfcnVudGltZV9z
dXNwZW5kLA0KPiA+ICsJLnJ1bnRpbWVfcmVzdW1lID0gZGVuYWxpX3J1bnRpbWVfcmVzdW1lLA0K
PiA+ICsJLnJ1bnRpbWVfaWRsZSA9IGRlbmFsaV9ydW50aW1lX2lkbGUsDQo+ID4gK307DQo+ID4g
KyNkZWZpbmUgREVOQUxJX1BNICgmZGVuYWxpX3BtKQ0KPiANCj4gSSB0aGluayBpdCBpcyBjb25m
dXNpbmcgdG8gdXNlIHRoaXMgc3R5bGUuIFBsZWFzZSwgZG8gbm90IGRlZmluZSB0aGlzDQo+IERF
TkFMSV9QTSBtYWNybywgdW5sZXNzIHRoaXMgaXMgYSBzdGFuZGFyZCBwcmFjdGljZSwgd2hpY2gg
SSBkb3VidCwgYnV0DQo+IG5vdCBzdXJlLg0KPiANCj4gLi4uIHNuaXAgLi4uDQo+IA0KPiA+ICsj
ZWxzZQ0KPiA+ICsjZGVmaW5lIERFTkFMSV9QTSBOVUxMDQo+IERpdHRvLg0KPiA+ICtzdGF0aWMg
aW5saW5lIHZvaWQgZGVuYWxpX3RpbWVyX2FkZChzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVu
YWxpKSB7fQ0KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgZGVuYWxpX3RpbWVyX2Z1bmModW5zaWdu
ZWQgbG9uZyBwdHIpIHt9DQo+ID4gKyNlbmRpZg0KPiANCj4gI2VuZGlmIC8qICFDT05GSUdfUE1f
UlVOVElNRSAqLw0KPiANCj4gLi4gc25pcCAuLg0KPiANCj4gPiAgc3RhdGljIHN0cnVjdCBwY2lf
ZHJpdmVyIGRlbmFsaV9wY2lfZHJpdmVyID0gew0KPiA+ICsJLmRyaXZlciA9IHsNCj4gPiArCQku
cG0gPSBERU5BTElfUE0sDQo+ID4gKwl9LA0KPiANCj4gVGhpcyBpcyB0aGUgb25seSBwbGFjZSB3
aGVyZSB5b3UgdXNlIHRoaXMgbWFjcm8sIGp1c3QgZG8NCj4gDQo+ICNpZmRlZiBDT05GSUdfUE1f
UlVOVElNRQ0KPiAJLmRyaXZlciA9IHsNCj4gCQkucG0gPSBERU5BTElfUE0sDQo+IAl9LA0KPiAj
ZW5kaWYNCj4gDQo+IEFuZCBpdCB3aWxsIGJlIG1vcmUgcmVhZGFibGUuDQo+IA0KPiAtLQ0KPiBC
ZXN0IFJlZ2FyZHMsDQo+IEFydGVtIEJpdHl1dHNraXkgKNCR0LjRgtGO0YbQutC40Lkg0JDRgNGC
0ZHQvCkNCg0K
