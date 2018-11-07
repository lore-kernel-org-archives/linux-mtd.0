Received: from mail-by2nam03on0600.outbound.protection.outlook.com
 ([2a01:111:f400:fe4a::600]
 helo=NAM03-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKSmU-0005OZ-3w
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 18:42:23 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "danielwa@cisco.com" <danielwa@cisco.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nkela@cisco.com" <nkela@cisco.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "xe-linux-external@cisco.com"
 <xe-linux-external@cisco.com>
Subject: Re: [PATCH] jffs2: implement mount option to configure endianness
Date: Wed, 7 Nov 2018 18:41:47 +0000
Message-ID: <bee96cb5db73c325675881b180006e1382718abe.camel@infinera.com>
References: <20181106214928.40020-1-nkela@cisco.com>
 <921b0f78cf67d7307a0555e1fd6f2c2976310adc.camel@infradead.org>
 <1e4c066d1896e2a0b8b146253d34d05cc4f9ab36.camel@infinera.com>
 <8b08e8b992093453bb2b9caff8cff08c.squirrel@twosheds.infradead.org>
 <20181107173303.slnb3i2d6ufaonp7@zorba>
 <df9cdf1753ec7e6e20c12aa096b98453.squirrel@twosheds.infradead.org>
In-Reply-To: <df9cdf1753ec7e6e20c12aa096b98453.squirrel@twosheds.infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A5392B57406D64CBAD4DB958574B3E8@namprd10.prod.outlook.com>
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

T24gV2VkLCAyMDE4LTExLTA3IGF0IDE3OjU4ICswMDAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6
DQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9y
Z2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0K
PiANCj4gDQo+ID4gT24gV2VkLCBOb3YgMDcsIDIwMTggYXQgMDQ6MTI6MTRQTSAtMDAwMCwgRGF2
aWQgV29vZGhvdXNlIHdyb3RlOg0KPiA+ID4gPiBZZXMsIHRoaXMgbWF5IHNsb3cgdGhpbmdzIGRv
d24uIEkgYW0gbm90IHN1cmUgSSBhZ3JlZSB3aXRoIHRoZSBpbXBsLg0KPiA+ID4gPiBlaXRoZXIu
DQo+ID4gPiA+IENvdWxkIG9uZSBub3QgbWFrZSBjcHVfdG9famVfWC9qZVhfdG9fY3B1IGEgZnVu
Y3Rpb24gcHRyIHdoaWNoIGlzIHNldA0KPiA+ID4gdG8NCj4gPiA+ID4gYSBmdW5jLiB3aXRoIHRo
ZSBjb3JyZWN0IGVuZGlhbj8NCj4gPiA+IA0KPiA+ID4gT24geDg2IHJldHBvbGluZSB3b3VsZCBt
YWtlIHRoYXQgcXVpdGUgc2xvdy4NCg0KcmV0cG9saW5lIGFzaWRlLCB3b3VsZCBpdCBtYWtlIGEg
ZGlmZmVyZW5jZSA/DQoNCj4gPiANCj4gPiBJcyB4ODYgdGhlIGxhcmdlc3QgY29uc3VtZXIgb2Yg
amZmczIgPw0KPiANCj4gQ2VydGFpbmx5IG5vdC4gSSdtIG5vdCBzdXJlIHdoaWNoIGFyY2hpdGVj
dHVyZXMgZG8gaGF2ZSBTcGVjdHJlIFYyDQo+IG1pdGlnYXRpb25zIHdoaWNoIG1ha2UgaW5kaXJl
Y3QgYnJhbmNoZXMgZXhwZW5zaXZlIG5vdy4uLiBwZXJoYXBzIHRoZXJlIGlzDQo+IG5vIGludGVy
c2VjdGlvbiB3aXRoIHRoZSBjYXNlcyB3aGVyZSB3ZSByZWFsbHkgY2FyZSBhYm91dCBKRkZTMiBi
ZWluZw0KPiBDUFUtYm91bmQ/DQoNCkFsbCB0aGF0IHBhc3Npbmcgb2YgYSBuZXcgZXh0cmEgYXJn
IGFuZCBleHRyYSBpZiAuLiBlbGlmIC4uIGRvZXMgY29zdCB0b28uDQo=
