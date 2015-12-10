Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6rXr-0001ML-Lf
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 03:05:28 +0000
From: =?gb2312?B?S2FybCBaaGFuZyDVxcurwuAgKGthcmx6aGFuZyk=?=
 <karlzhang@micron.com>
To: Brian Norris <computersforpeace@gmail.com>, Karl Zhang
 <shuangshuo@gmail.com>
CC: =?gb2312?B?UGV0ZXIgUGFuIMXLtrAgKHBldGVycGFuZG9uZyk=?=
 <peterpandong@micron.com>, "Zoltan Szubbocsev (zszubbocsev)"
 <zszubbocsev@micron.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>,
 =?gb2312?B?QmVhbiBIdW8gu/Sx87HzIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: RE: [PATCH 0/2] mtd: spi-nor: add new device MT35X
Date: Thu, 10 Dec 2015 03:04:21 +0000
Message-ID: <D067BF0533BDBE4F821CF557AAAE784484958732@NTXXIAMBX01.xacn.micron.com>
References: <1449712740-22900-1-git-send-email-karlzhang@micron.com>
 <20151210024623.GB29459@google.com>
In-Reply-To: <20151210024623.GB29459@google.com>
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

PiA+IE1pY3JvbiBoYXMgYW5ub3VuY2VkIGEgbmV3IFNQSSBOT1IgZGV2aWNlIE1UMzVYIChYVFJN
Rmxhc2gpLg0KPiANCj4gQW5ub3VuY2VkPyBEbyB5b3UgaGF2ZSBhIGZsYXNoIHNhbXBsZT8gRGlk
IHlvdSB0ZXN0Pw0KPiANCj4gQnJpYW4NCj4gDQpZZXMsIHdlIGhhdmUgc2FtcGxlcywgYW5kIHRl
c3RlZCBpdCB3aXRoIFNQSSB4MSBJL08uDQoNCkthcmwNCg0KPiA+IFRoaXMgZGV2aWNlJ3MgbWFu
dWZhY3R1cmVyIElEIGlzIHVzaW5nIDJDaCB3aGljaCBhcnJhbmdlZCBieSBKRURFQy4NCj4gPiBU
aGUgMjBoIGlzIGFsc28gTWljcm9uJ3MgSUQgZHVlIHRvIHRoZSBoaXN0b3J5Lg0KPiA+DQo+ID4g
VGhpcyBuZXcgZGV2aWNlIHN1cHBvcnQgaGlnaCBzcGVlZCBJL08gaW50ZXJmYWNlLiBUaGUgY2xv
Y2sgZnJlcXVlbmN5DQo+ID4gY291bGQgdXAgdG8gMjAwIE1IeiAoTUFYKSBpbiBERFIgKDQwMCBN
Qi9zKSB3aXRoIERRUy4gVGhlIGRldmljZSBidXMNCj4gPiB3aWR0aCBjb3VsZCBiZSAxIG9yIDgs
IGFuZCBpdCdzIGRlZmF1bHQgd2lkdGggaXMgY29uZmlndXJhYmxlLg0KPiA+DQo+ID4gS2FybCBa
aGFuZyAoMik6DQo+ID4gICBtdGQ6IHNwaS1ub3I6IGFkZCBNYW51ZmFjdHVyZXIgSUQgZm9yIE1p
Y3Jvbg0KPiA+ICAgbXRkOiBzcGktbm9yOiBhZGQgbmV3IGRldmljZSBNVDM1WA0KPiA+DQo+ID4g
IGRyaXZlcnMvbXRkL2RldmljZXMvbTI1cDgwLmMgIHwgMSArDQo+ID4gIGRyaXZlcnMvbXRkL3Nw
aS1ub3Ivc3BpLW5vci5jIHwgMiArKw0KPiA+ICBpbmNsdWRlL2xpbnV4L210ZC9jZmkuaCAgICAg
ICB8IDEgKw0KPiA+ICBpbmNsdWRlL2xpbnV4L210ZC9zcGktbm9yLmggICB8IDIgKysNCj4gPiAg
NCBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IC0tDQo+ID4gMS45LjEN
Cj4gPg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdA0KPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8NCg==
