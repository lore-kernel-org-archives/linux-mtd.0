Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQSHq-0006yF-Qx
 for linux-mtd@lists.infradead.org; Thu, 29 Jun 2017 05:46:44 +0000
From: =?gb2312?B?UGV0ZXIgUGFuIMXLtrAgKHBldGVycGFuZG9uZyk=?=
 <peterpandong@micron.com>
To: Arnaud Mouiche <arnaud.mouiche@gmail.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, "richard@nod.at"
 <richard@nod.at>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "thomas.petazzoni@free-electrons.com"
 <thomas.petazzoni@free-electrons.com>, "marex@denx.de" <marex@denx.de>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "peterpansjtu@gmail.com" <peterpansjtu@gmail.com>,
 "linshunquan1@hisilicon.com" <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v6 11/15] nand: spi: add basic operations support
Date: Thu, 29 Jun 2017 05:45:01 +0000
Message-ID: <BE234BB2-6035-4FDF-8C85-CF7DC9025CE2@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-12-git-send-email-peterpandong@micron.com>
 <20170530001152.1d8beb72@bbrezillon>
 <B7799737-B040-4824-BBAF-5A0510CD553C@micron.com>
 <20170627221552.6e4efff9@bbrezillon>,
 <07de9ec3-4ac5-2bfa-eea1-e996a4db1bba@gmail.com>
In-Reply-To: <07de9ec3-4ac5-2bfa-eea1-e996a4db1bba@gmail.com>
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

SGkgQXJuYXVkLA0KDQo+INTaIDIwMTfE6jbUwjI4yNWjrDE3OjQ4o6xBcm5hdWQgTW91aWNoZSA8
YXJuYXVkLm1vdWljaGVAZ21haWwuY29tPiDQtLXAo7oNCj4gDQo+IEhlbGxvIEJvcmlzLA0KPiAN
Cj4+IE9uIDI3LzA2LzIwMTcgMjI6MTUsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToNCj4+ICAgSG0s
IGFjdHVhbGx5IEkgd29uZGVyIGlmIHRoaXMgLT5wcmVwYXJlX29wKCkgbWV0aG9kIGlzIHJlYWxs
eSB3aGF0IHdlDQo+PiB3YW50LiBJdCBzZWVtcyB0byBiZSBoZXJlIHRvIHNldCB0aGUgcHJvcGVy
IHBsYW5lIG51bWJlciBhbmQgdGhlDQo+PiBudW1iZXIgb2YgZHVtbXkgYnl0ZXMgYWZ0ZXIgdGhl
IGFkZHJlc3MgY3ljbGVzLg0KPj4gSSdkIHNheSBkZWR1Y2luZyB0aGUgcGxhbmUgZnJvbSB0aGUg
cGFnZSBpcyBzb21ldGhpbmcgc3RhbmRhcmQuIFdoZXRoZXINCj4+IHdlIG5lZWQgaXQgb3Igbm90
IGRlcGVuZHMgb24gdGhlIGluZm9ybWF0aW9uIHByb3ZpZGUgaW4gdGhlIG1lbW9yZw0KPj4gb2Jq
ZWN0ICgtPm5wbGFuZXMpLg0KPj4gDQo+PiBSZWdhcmRpbmcgdGhlIGR1bW15IGJ5dGUsIGRvIHlv
dSBoYXZlIGV4YW1wbGVzIG9mIFNQSSBOQU5EcyByZXF1aXJpbmcNCj4+IGxlc3Mgb3IgbW9yZSBk
dW1teSBieXRlcyBpbiB0aGlzIHJlYWQvd3JpdGUgZnJvbS90byBjYWNoZSB1c2UgY2FzZT8NCj4+
IElmIG5vdCwgSSdkIHByZWZlciB0byBrZWVwIGl0IGhhcmRjb2RlZCBpbiB0aGUgY29yZSBmb3Ig
a25vdywgYW5kIGFkZA0KPj4gYSBob29rIHdoZW4gdGhlIG5lZWQgYXBwZWFycy4NCj4gSGVyZSBp
cyB0aGUgcGFnZSByZWFkIGRlc2NyaXB0aW9uIGZvciB2YXJpb3VzIGRldmljZXMgSSBoYXZlOg0K
PiANCj4gTVQyOUZ4RzAxQUFBREQNCj4gLSBmZXRjaCB0byBpbnRlcm5hbDogQ01EX1JFQUQgKDB4
MTMpICsgKDMgYnl0ZXMgcGFnZV9pZCkNCj4gLSByZWFkIGZyb20gaW50ZXJuYWw6IENNRF9SRUFE
X1JETSAoMHgwMykgKyAoMiBieXRlcyBhZGRyZXNzICsgcGFuZSBzZWxlY3Rpb24gQCBiaXQgMTIp
ICsgMSBkdW1teSBieXRlDQo+IA0KPiBHRDVGeHhRNHhDDQo+IC0gZmV0Y2ggdG8gaW50ZXJuYWw6
IENNRF9SRUFEICgweDEzKSArICgzIGJ5dGVzIHBhZ2VfaWQpDQo+IC0gcmVhZCBmcm9tIGludGVy
bmFsOiBDTURfRkFTVF9SRUFEICgweDBCKSArIDEgZHVtbXkgYnl0ZSArICgyIGJ5dGVzIGFkZHJl
c3MpICsgMSBkdW1teSBieXRlDQo+IA0KPiBNWDM1TEZ4R0U0QUINCj4gRjUwTDFHNDFBDQo+IFcy
NU4wMUdWWkVJRw0KPiAtIGZldGNoIHRvIGludGVybmFsOiBDTURfUkVBRCAoMHgxMykgKyAoMyBi
eXRlcyBwYWdlX2lkKQ0KPiAtIHJlYWQgZnJvbSBpbnRlcm5hbDogQ01EX1JFQURfUkRNICgweDAz
KSArICgyIGJ5dGVzIGFkZHJlc3MpICsgMSBkdW1teSBieXRlDQo+IA0KDQpZb3UgaGF2ZSBtdWNo
IG1vcmUgaW5mb3JtYXRpb24gdGhhbiBtZTopIHRoYW5rcyBmb3IgdGhlIHNoYXJpbmcuDQoNClRo
YW5rcw0KUGV0ZXIgUGFuDQoNCj4gQnV0IHlvdSBhcmUgcmlnaHQuIEl0J3MgdGltZSB0byBoYXZl
IGFuIGFkb3B0ZWQgaW1wbGVtZW50YXRpb24gZm9yIE1pY3JvbiBhcyBwcm9wb3NlZCBieSBQZXRl
ciwgYW5kIHdlIHdpbGwgYWRhcHQgaXQgbGF0ZXIgZm9yIG90aGVycy4NCj4gDQo+IEFybmF1ZA0K
