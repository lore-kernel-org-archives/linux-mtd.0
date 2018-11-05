Received: from mail-bl2nam02on0056.outbound.protection.outlook.com
 ([104.47.38.56] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJdbF-00042L-Bm
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 12:03:23 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "ikegami@allied-telesis.co.jp" <ikegami@allied-telesis.co.jp>
CC: "fbettoni@gmail.com" <fbettoni@gmail.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "hauke@hauke-m.de" <hauke@hauke-m.de>, "chris.packham@alliedtelesis.co.nz"
 <chris.packham@alliedtelesis.co.nz>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "koen.vandeputte@ncentric.com"
 <koen.vandeputte@ncentric.com>
Subject: Re: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change do_write_oneword()
 to use chip_good()
Date: Mon, 5 Nov 2018 12:03:04 +0000
Message-ID: <403739a3578a37c517626091535fa4574bee0171.camel@infinera.com>
References: <20181025163219.25788-1-ikegami@allied-telesis.co.jp>
 <20181025163219.25788-2-ikegami@allied-telesis.co.jp>
 <20181105111544.4e511ed9@bbrezillon>
In-Reply-To: <20181105111544.4e511ed9@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A0B7254057FCF4486602146D8E78B61@namprd10.prod.outlook.com>
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

T24gTW9uLCAyMDE4LTExLTA1IGF0IDExOjE1ICswMTAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6
DQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9y
Z2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0K
PiANCj4gDQo+IE9uIEZyaSwgMjYgT2N0IDIwMTggMDE6MzI6MDkgKzA5MDANCj4gVG9rdW5vcmkg
SWtlZ2FtaSA8aWtlZ2FtaUBhbGxpZWQtdGVsZXNpcy5jby5qcD4gd3JvdGU6DQo+IA0KPiA+IElu
IE9wZW5XcnQgUHJvamVjdCB0aGUgZmxhc2ggd3JpdGUgZXJyb3IgY2F1c2VkIG9uIHNvbWUgcHJv
ZHVjdHMuDQo+IA0KPiBJdCdzIG9rYXkgdG8gbWVudGlvbiB0aGF0IHRoZSBpc3N1ZSB3YXMgZGlz
Y292ZXJlZCBieSB0aGUgT3BlbldSVCB0ZWFtLA0KPiBidXQgSSdkIHJlcGhyYXNlIGl0IGRpZmZl
cmVudGx5Lg0KPiANCj4gIkFzIHJlcG9ydGVkIGJ5IHRoZSBPcGVuV1JUIHRlYW0sIHdyaXRlIHJl
cXVlc3RzIHNvbWV0aW1lcyBmYWlsIG9uIHNvbWUNCj4gcGxhdGZvcm1zIi4NCj4gDQo+ID4gQWxz
byB0aGUgaXNzdWUgY2FuIGJlIGZpeGVkIGJ5IHVzaW5nIGNoaXBfZ29vZCgpIGluc3RlYWQgb2Yg
Y2hpcF9yZWFkeSgpLg0KPiA+IFRoZSBjaGlwX3JlYWR5KCkganVzdCBjaGVja3MgdGhlIHZhbHVl
IGZyb20gZmxhc2ggbWVtb3J5IHR3aWNlLg0KPiA+IEFuZCB0aGUgY2hpcF9nb29kKCkgY2hlY2tz
IHRoZSB2YWx1ZSB3aXRoIHRoZSBleHBlY3RlZCB2YWx1ZS4NCj4gPiBQcm9iYWJseSB0aGUgaXNz
dWUgY2FuIGJlIGZpeGVkIGFzIGNoZWNrZWQgY29ycmVjdGx5IGJ5IHRoZSBjaGlwX2dvb2QoKS4N
Cj4gPiBTbyBjaGFuZ2UgdG8gdXNlIGNoaXBfZ29vZCgpIGluc3RlYWQgb2YgY2hpcF9yZWFkeSgp
Lg0KPiANCj4gV2VsbCwgdGhhdCdzIG5vdCByZWFsbHkgZXhwbGFpbmluZyB3aHkgeW91IHRoaW5r
IGNoaXBfZ29vZCgpIHNob3VsZCBiZQ0KPiB1c2VkIGluc3RlYWQgb2YgY2hpcF9yZWFkeSgpLiBT
byBJIHdlbnQgb24gYW5kIGxvb2tlZCBhdCB0aGUNCj4gY2hpcF9nb29kKCksIGNoaXBfcmVhZHko
KSBhbmQgZG9fd3JpdGVfb25ld29yZCgpIGltcGxlbWVudGF0aW9uLCBhbmQNCj4gYWxzbyBsb29r
ZWQgYXQgdXNlcnMgb2YgZG9fd3JpdGVfb25ld29yZCgpLiBJdCBzZWVtcyB0aGlzIGZ1bmN0aW9u
IGlzDQo+IHVzZWQgdG8gd3JpdGUgZGF0YSB0byB0aGUgZmxhc2gsIGFuZCBhcHBhcmVudGx5IHRo
ZSAib25lIGJpdCBzaG91bGQNCj4gdG9nZ2xlIHRvIHJlZmxlY3QgYSBidXN5IHN0YXRlIiBkb2Vz
IG5vdCBhcHBseSB3aGVuIHdyaXRpbmcgdGhpbmdzIHRvDQo+IHRoZSBtZW1vcnkgYXJyYXkgKGl0
J3MgcHJvYmFibHkgd29ya2luZyBmb3Igb3RoZXIgQ0ZJIGNvbW1hbmRzLCBidXQgSQ0KPiBndWVz
cyBpdCB0YWtlcyBtb3JlIHRpbWUgdG8gYWN0dWFsbHkgY2hhbmdlIHRoZSBsZXZlbCBvZiBhIE5P
UiBjZWxsLA0KPiBoZW5jZSB0aGUgcmVzdWx0IG9mIDIgaWRlbnRpY2FsIHJlYWRzIGRvZXMgbm90
IG1lYW4gdGhhdCB0aGUgd3JpdGUgaXMNCj4gZG9uZSkuDQo+IA0KPiBBbHNvLCBpdCBzZWVtcyB0
aGF0IGNtZHNldF8wMDAxIGlzIG5vdCBpbXBsZW1lbnRpbmcgY2hpcF9yZWFkeSgpIHRoZQ0KPiBz
YW1lIHdheSwgYW5kIEkgd29uZGVyIGlmIGNtZHNldF8wMDAyIGltcGxlbWVudGF0aW9uIGlzIGNv
cnJlY3QgdG8NCj4gc3RhcnQgd2l0aC4gT3IgbWF5YmUgSSBkb24ndCBnZXQgd2hhdCBjaGlwX3Jl
YWR5KCkgaXMgZm9yLg0KPiANClRoZSAwMDAxIGNtZCBzZXQgaXMgcXVpdGUgZGlmZmVyZW50IHRv
IDAwMDIgYW5kIDAwMDEgaXMgdGhlIHN1cGVyaW9yIG9uZS4NCklmIHlvdSBsb29rIGF0IHJlY2Vu
dCAwMDAyIGNtZCBzZXRzIHRoZXkgb2ZmZXIgYW4gYWx0ZXJuYXRpdmUgY21kDQpzZXQgdG8gcmVw
bGFjZSB0aGUgYWxsIHRoZSAidG9nZ2xlIiBvbmVzIHdpdGggc29tZXRoaW5nIHRoYXQgaXMNCnNh
bWUvc2ltaWxhciB0byB3aGF0IDAwMDEgb2ZmZXJzLg0KDQogSm9ja2UNCg==
