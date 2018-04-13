Received: from mail-ve1eur01on0054.outbound.protection.outlook.com
 ([104.47.1.54] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f76hq-0001on-MT
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2018 21:58:08 +0000
From: Han Xu <han.xu@nxp.com>
To: Stefan Agner <stefan@agner.ch>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>
CC: "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "max.oss.09@gmail.com" <max.oss.09@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: mtd: rawnand: gpmi: document specific
 ECC strength
Date: Fri, 13 Apr 2018 21:57:51 +0000
Message-ID: <1a657c4a-5f2c-e2bd-3d7c-9efb978ea469@nxp.com>
References: <20180304200602.11475-1-stefan@agner.ch>
 <20180304200602.11475-2-stefan@agner.ch>
In-Reply-To: <20180304200602.11475-2-stefan@agner.ch>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6FB1C7FC0942C489754DAA825075C2D@eurprd04.prod.outlook.com>
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

DQoNCk9uIDAzLzA0LzIwMTggMDI6MDYgUE0sIFN0ZWZhbiBBZ25lciB3cm90ZToNCj4gRG9jdW1l
bnQgbmV3bHkgc3VwcG9ydGVkIGRldmljZSB0cmVlIHByb3BlcnRpZXMgbmFuZC1lY2Mtc3RyZW5n
dGgvDQo+IG5hbmQtZWNjLXN0ZXAtc2l6ZSB0byBzcGVjaWZ5IEVDQyBzdHJlbmd0aC9zaXplLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+DQo+IC0t
LQ0KPiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvZ3BtaS1uYW5kLnR4
dCB8IDUgKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9ncG1pLW5h
bmQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9ncG1pLW5hbmQu
dHh0DQo+IGluZGV4IGIyODllZjNjMWI3ZS4uMzkzNTg4Mzg1YzZlIDEwMDY0NA0KPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2dwbWktbmFuZC50eHQNCj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9ncG1pLW5hbmQudHh0DQo+
IEBAIC00Nyw2ICs0NywxMSBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFydGl0aW9ucyB3cml0dGVuIGZyb20gTGludXggd2l0aCB0aGlzIGZlYXR1
cmUNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIHR1cm5lZCBvbiBtYXkgbm90IGJlIGFjY2Vz
c2libGUgYnkgdGhlIEJvb3RST00NCj4gICAgICAgICAgICAgICAgICAgICAgICAgIGNvZGUuDQo+
ICsgIC0gbmFuZC1lY2Mtc3RyZW5ndGg6IGludGVnZXIgcmVwcmVzZW50aW5nIHRoZSBudW1iZXIg
b2YgYml0cyB0byBjb3JyZWN0DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHBlciBFQ0Mgc3Rl
cC4gTmVlZHMgdG8gYmUgYSBtdWx0aXBsZSBvZiAyLg0KPiArICAtIG5hbmQtZWNjLXN0ZXAtc2l6
ZTogaW50ZWdlciByZXByZXNlbnRpbmcgdGhlIG51bWJlciBvZiBkYXRhIGJ5dGVzDQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHRoYXQgYXJlIGNvdmVyZWQgYnkgYSBzaW5nbGUgRUNDIHN0ZXAu
IFRoZSBkcml2ZXINCj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3VwcG9ydHMgNTEyIGFuZCAx
MDI0Lg0KPiAgIA0KPiAgIFRoZSBkZXZpY2UgdHJlZSBtYXkgb3B0aW9uYWxseSBjb250YWluIHN1
Yi1ub2RlcyBkZXNjcmliaW5nIHBhcnRpdGlvbnMgb2YgdGhlDQo+ICAgYWRkcmVzcyBzcGFjZS4g
U2VlIHBhcnRpdGlvbi50eHQgZm9yIG1vcmUgZGV0YWlsLg0KPiANCg0KQWNrZWQtYnk6IEhhbiBY
dSA8aGFuLnh1QG54cC5jb20+
