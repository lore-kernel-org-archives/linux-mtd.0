Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfOLT-0005Wh-7b
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 08:27:07 +0000
From: =?utf-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>, Stefan Roese
 <sr@denx.de>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn
 (jlauruhn)" <jlauruhn@micron.com>, "dedekind1@gmail.com"
 <dedekind1@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "shuangshuo@gmail.com" <shuangshuo@gmail.com>, "rnd4@dave-tech.it"
 <rnd4@dave-tech.it>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 =?utf-8?B?S2FybCBaaGFuZyDlvKDlj4zplKMgKGthcmx6aGFuZyk=?=
 <karlzhang@micron.com>
Subject: RE: UBI/UBIFS: dealing with MLC's paired pages
Date: Fri, 25 Sep 2015 08:25:44 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF4CBFC@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CAA8@NTXXIAMBX02.xacn.micron.com>
 <20150925093023.113ceeb1@bbrezillon>
In-Reply-To: <20150925093023.113ceeb1@bbrezillon>
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

PiBCZWFuIEh1byDpnI3mlozmlowgKGJlYW5odW8pIDxiZWFuaHVvQG1pY3Jvbi5jb20+IHdyb3Rl
Og0KPiANCj4gPiA+IEFuZCAzOg0KPiA+ID4gT25seSBOQU5EIHByb3ZpZGVzIGFuIE9PQiBhcmVh
LiBPdGhlciBmbGFzaCBkZXZpY2VzIGxpa2UgcGFyYWxsZWwgb3INCj4gPiA+IFNQSSBOT1IgZG9u
J3QuIEFuZCB3ZSBkZWZpbml0ZWx5IHdhbnQgdG8gY29udGludWUgc3VwcG9ydGluZw0KPiA+ID4g
cGxhdGZvcm1zIHdpdGggc3VjaCBmbGFzaCBkZXZpY2VzIGFuZCBVQkkgKGFuZCBVQklGUykuDQo+
ID4gPg0KPiA+ID4gVGhhbmtzLA0KPiA+ID4gU3RlZmFuDQo+ID4gPg0KPiA+IEZvciBNTEMgTkFO
RCBwYWlyZWQgcGFnZXMgaXNzdWUsIHdlIGhhdmUgZGV2ZWxvcGVkIHR3byBtZXRob2RzIHRvDQo+
ID4gc29sdmUgaXQgaW4gVUJJIGxheWVyLCBXZSBob3BlIHRoYXQgZXZlcnkgZXhwZXJ0IG9uIFVC
SS9VQklGUyBjYW4gZ2l2ZSBtb3JlDQo+IHN1Z2dlc3Rpb25zIGFib3V0IGhvdyB0byBpbXByb3Zl
IGFuZCBwZXJmZWN0IGl0Lg0KPiA+IEkgdGhpbmsgLHRoaXMgd2VlaywgSSBjYW4gc3VibWl0IGZp
cnN0IHNvbHV0aW9uIHBhdGNoIG91dC4gQ3VycmVudGx5IGRvIGNvZGluZw0KPiBzdHlsZS4NCj4g
DQo+IEFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoZSBzdWdnZXN0aW9uIHByb3Bvc2VkIGJ5IEthcmwg
KHVzaW5nIHRoZSBPT0IgYXJlYSB0bw0KPiBzdG9yZSBVQkkgbWV0YWRhdGEpLCBvciBpcyB0aGlz
IHNvbWV0aGluZyBlbHNlPw0KPiANCj4gQmVzdCBSZWdhcmRzLA0KPiANCj4gQm9yaXMNCj4gDQo+
IC0tDQo+IEJvcmlzIEJyZXppbGxvbiwgRnJlZSBFbGVjdHJvbnMNCj4gRW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPiBodHRwOi8vZnJlZS1lbGVjdHJvbnMuY29tDQoNCkhp
LCBCb3Jpcw0KRm9yIE5BTkQgT09CIGFyZWEsIGl0IGlzIGRlZGljYXRlZCBmb3IgRUNDIHZhbHVl
LCBhdCB0aGUgc2FtZSB0aW1lLA0KVXNlciBhdmFpbGFibGUgYXJlYSBpbiBPT0IgaXMgbm90IGNv
dmVyZWQgYnkgRUNDIHByb3RlY3Rpb24gbWVjaGFuaXNtLg0Kc28gc2F2aW5nIEVDIG9yIFZJRCBp
bmZvcm1hdGlvbiBpbiBPT0IgaXMgbm90IGEgcGVyZmVjdCBzb2x1dGlvbi4NCkJ1dCBpZiB0aGVy
ZSBpcyBhZGRpdGlvbmFsIHNwYWNlLCBhbmQgdGhpcyBzcGFjZSBjYW4gYmUgY292ZXJlZCBieSBF
Q0MsDQpXZSBjYW4gdHJ5IGl0Lg0KQnkgdGhlIHdheSwgSSB3YW50IHRvIGFsbG9jYXRlIGEgbmV3
IGludGVybmFsIHZvbHVtZSB0byBzb2x2ZSBwYWlyZWQgcGFnZXMgaXNzdWUuDQpIb3cgZG8geW91
IHRoaW5rIGFib3V0IHRoaXMgPw0K
