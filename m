Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQSdu-0006la-5h
 for linux-mtd@lists.infradead.org; Thu, 29 Jun 2017 06:09:31 +0000
From: =?gb2312?B?UGV0ZXIgUGFuIMXLtrAgKHBldGVycGFuZG9uZyk=?=
 <peterpandong@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Arnaud Mouiche
 <arnaud.mouiche@gmail.com>
CC: "richard@nod.at" <richard@nod.at>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "thomas.petazzoni@free-electrons.com"
 <thomas.petazzoni@free-electrons.com>, "marex@denx.de" <marex@denx.de>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "peterpansjtu@gmail.com" <peterpansjtu@gmail.com>,
 "linshunquan1@hisilicon.com" <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v6 11/15] nand: spi: add basic operations support
Date: Thu, 29 Jun 2017 06:07:51 +0000
Message-ID: <C3581AD4-9CFE-489B-91E7-B923217DDCBD@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-12-git-send-email-peterpandong@micron.com>
 <20170530001152.1d8beb72@bbrezillon>
 <B7799737-B040-4824-BBAF-5A0510CD553C@micron.com>,
 <20170627221552.6e4efff9@bbrezillon>
In-Reply-To: <20170627221552.6e4efff9@bbrezillon>
Content-Language: zh-CN
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

SGkgQm9yaXMsDQoNCj4g1NogMjAxN8TqNtTCMjjI1aOsMDQ6MTajrEJvcmlzIEJyZXppbGxvbiA8
Ym9yaXMuYnJlemlsbG9uQGZyZWUtZWxlY3Ryb25zLmNvbT4g0LS1wKO6DQo+IA0KPiANCj4+Pj4g
DQo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmggYi9pbmNsdWRl
L2xpbnV4L210ZC9zcGluYW5kLmgNCj4+Pj4gaW5kZXggZGQ5ZGE3MS4uMDRhZDFkZCAxMDA2NDQN
Cj4+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oDQo+Pj4+ICsrKyBiL2luY2x1
ZGUvbGludXgvbXRkL3NwaW5hbmQuaA0KPj4+PiBAQCAtMTAzLDExICsxMDMsMTQgQEAgc3RydWN0
IHNwaW5hbmRfY29udHJvbGxlcl9vcHMgew0KPj4+PiAqICAgICAgICAgIHJldHVybiBkaXJlY3Rs
eSBhbmQgbGV0IG90aGVycyB0byBkZXRlY3QuDQo+Pj4+ICogQGluaXQ6IGluaXRpYWxpemUgU1BJ
IE5BTkQgZGV2aWNlLg0KPj4+PiAqIEBjbGVhbnVwOiBjbGVhbiBTUEkgTkFORCBkZXZpY2UgZm9v
dHByaW50Lg0KPj4+PiArICogQHByZXBhcmVfb3A6IHByZXBhcmEgcmVhZC93cml0ZSBvcGVyYXRp
b24uICANCj4+PiANCj4+PiAgICAgICAgICBeIHByZXBhcmUNCj4+PiANCj4+PiANCj4+PiANCj4+
Pj4gKi8NCj4+Pj4gc3RydWN0IHNwaW5hbmRfbWFudWZhY3R1cmVyX29wcyB7DQo+Pj4+ICAgYm9v
bCAoKmRldGVjdCkoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKTsNCj4+Pj4gICBpbnQg
KCppbml0KShzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpOw0KPj4+PiAgIHZvaWQgKCpj
bGVhbnVwKShzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpOw0KPj4+PiArICAgIHZvaWQg
KCpwcmVwYXJlX29wKShzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsDQo+Pj4+ICsgICAg
ICAgICAgICAgICBzdHJ1Y3Qgc3BpbmFuZF9vcCAqb3AsIHUzMiBwYWdlLCB1MzIgY29sdW1uKTsg
IA0KPj4+IA0KPj4+IEl0IHNlZW1zIHRvIGJlIGhlcmUgdG8gcHJlcGFyZSByZWFkL3dyaXRlIHBh
Z2Ugb3BlcmF0aW9ucywgc28gSSdkIGxpa2UNCj4+PiB0byByZW5hbWUgdGhpcyBtZXRob2QgLT5w
cmVwYXJlX3BhZ2Vfb3AoKSBpZiB5b3UgZG9uJ3QgbWluZC4gIA0KPj4gDQo+PiBJJ20gb2sgd2l0
aCB0aGUgbmV3IG5hbWUNCj4gDQo+IEhtLCBhY3R1YWxseSBJIHdvbmRlciBpZiB0aGlzIC0+cHJl
cGFyZV9vcCgpIG1ldGhvZCBpcyByZWFsbHkgd2hhdCB3ZQ0KPiB3YW50LiBJdCBzZWVtcyB0byBi
ZSBoZXJlIHRvIHNldCB0aGUgcHJvcGVyIHBsYW5lIG51bWJlciBhbmQgdGhlDQo+IG51bWJlciBv
ZiBkdW1teSBieXRlcyBhZnRlciB0aGUgYWRkcmVzcyBjeWNsZXMuDQo+IEknZCBzYXkgZGVkdWNp
bmcgdGhlIHBsYW5lIGZyb20gdGhlIHBhZ2UgaXMgc29tZXRoaW5nIHN0YW5kYXJkLiBXaGV0aGVy
DQo+IHdlIG5lZWQgaXQgb3Igbm90IGRlcGVuZHMgb24gdGhlIGluZm9ybWF0aW9uIHByb3ZpZGUg
aW4gdGhlIG1lbW9yZw0KPiBvYmplY3QgKC0+bnBsYW5lcykuDQoNCkZvciBNaWNyb24gc3BpIG5h
bmQsIGl0J3MgdHJ1ZS4gQnV0IEkgZG9uJ3Qga25vdyB3aGV0aGVyIG90aGVyIHZlbmRvcnMnDQpz
cGkgbmFuZCBuZWVkIHNldCBwbGFuZSBudW1iZXIgd2hlbiB0aGUgY2hpcCBoYXMgbW9yZSB0aGFu
IG9uZQ0KcGxhbmVzLiBUaGUgcmVhc29uIE1pY3JvbiBzcGkgbmFuZCBuZWVkIHRvIHNldCBwbGFu
ZSBudW1iZXIgaXMNCmludGVybmFsIGNhY2hlIHJlZ2lzdGVyIGlzIHBlciBwbGFuZS4NCg0KQXJu
YXVkLA0KRG8geW91IGhhdmUgaW5mbyBhYm91dCB0aGlzPw0KDQpUaGFua3MgDQpQZXRlciBQYW4g
DQoNCj4gDQo+IFJlZ2FyZGluZyB0aGUgZHVtbXkgYnl0ZSwgZG8geW91IGhhdmUgZXhhbXBsZXMg
b2YgU1BJIE5BTkRzIHJlcXVpcmluZw0KPiBsZXNzIG9yIG1vcmUgZHVtbXkgYnl0ZXMgaW4gdGhp
cyByZWFkL3dyaXRlIGZyb20vdG8gY2FjaGUgdXNlIGNhc2U/DQo+IElmIG5vdCwgSSdkIHByZWZl
ciB0byBrZWVwIGl0IGhhcmRjb2RlZCBpbiB0aGUgY29yZSBmb3Iga25vdywgYW5kIGFkZA0KPiBh
IGhvb2sgd2hlbiB0aGUgbmVlZCBhcHBlYXJzLg0K
