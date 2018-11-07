Received: from mail-bn3nam04on061c.outbound.protection.outlook.com
 ([2a01:111:f400:fe4e::61c]
 helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKJxT-0006pg-Ch
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 09:17:08 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "nkela@cisco.com" <nkela@cisco.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] jffs2: implement mount option to configure endianness
Date: Wed, 7 Nov 2018 09:16:39 +0000
Message-ID: <1e4c066d1896e2a0b8b146253d34d05cc4f9ab36.camel@infinera.com>
References: <20181106214928.40020-1-nkela@cisco.com>
 <921b0f78cf67d7307a0555e1fd6f2c2976310adc.camel@infradead.org>
In-Reply-To: <921b0f78cf67d7307a0555e1fd6f2c2976310adc.camel@infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <160E64C7430E3C47BF2A92CFF2BD7CB2@namprd10.prod.outlook.com>
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

T24gV2VkLCAyMDE4LTExLTA3IGF0IDEwOjA1ICswMTAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6
DQo+IA0KPiBPbiBUdWUsIDIwMTgtMTEtMDYgYXQgMTM6NDkgLTA4MDAsIE5pa3VuaiBLZWxhIHdy
b3RlOg0KPiA+IFRoaXMgcGF0Y2ggYWxsb3dzIHRoZSBlbmRpYW5uZXNzIG9mIHRoZSBKRlNTMiBm
aWxlc3lzdGVtIHRvIGJlDQo+ID4gc3BlY2lmaWVkIGJ5IG1vdW50IG9wdGlvbiAnZm9yY2VfZW5k
aWFuPWJpZ3xsaXR0bGV8bmF0aXZlJy4gSWYNCj4gPiBlbmRpYW5uZXNzIGlzIG5vdCBzcGVjaWZp
ZWQsIGl0IGRlZmF1bHRzIHRvICduYXRpdmUnIGVuZGlhbm5lc3MNCj4gPiB0aHVzIHJldGFpbmlu
ZyB0aGUgZXhpc3RpbmcgYmVoYXZpb3IuDQo+ID4gDQo+ID4gU29tZSBhcmNoaXRlY3R1cmVzIGJl
bmVmaXQgZnJvbSBoYXZpbmcgYSBzaW5nbGUga25vd24gZW5kaWFubmVzcw0KPiA+IG9mIEpGRlMy
IGZpbGVzeXN0ZW0gKGZvciBkYXRhLCBub3QgZXhlY3V0YWJsZXMpIGluZGVwZW5kZW50IG9mIHRo
ZQ0KPiA+IGVuZGlhbm5lc3Mgb2YgdGhlIHByb2Nlc3NvciAoQVJNIHByb2Nlc3NvcnMgY2FuIGJl
IHN3aXRjaGVkIHRvIGVpdGhlcg0KPiA+IGVuZGlhbm5lc3MgYXQgcnVuLXRpbWUpLg0KPiA+IA0K
PiA+IFdlIGhhdmUgYm9hcmRzIHRoYXQgYXJlIHNoaXBwZWQgd2l0aCBCRSBqZmZzMiBhbmQgQkUg
a2VybmVsLiBXZSBhcmUNCj4gPiBub3cgbWlncmF0aW5nIHRvIExFIGtlcm5lbC4gVGhpcyBtb3Vu
dCBvcHRpb24gaGVscHMgdXMgaW4gbW91bnRpbmcNCj4gPiBCRSBqZmZzMiBvbiBMRSBrZXJuZWwu
DQo+IA0KPiBUaGFua3MgZm9yIGltcGxlbWVudGluZyB0aGlzLiBKRkZTMiBoYXMgb2Z0ZW4gYmVl
biB2ZXJ5IHNlbnNpdGl2ZSB0bw0KPiBwZXJmb3JtYW5jZSBhdCBtb3VudCB0aW1lIOKAlCBJJ2Qg
bG92ZSB0byBzZWUgaG93IHRoaXMgYWZmZWN0cyB0aGUgdGltZQ0KPiB0YWtlbiB0byBtb3VudCBh
IGxhcmdlIGZpbGUgc3lzdGVtLiBJZiBpdCdzIHNpZ25pZmljYW50LCB3ZSBtYXkgd2FudCBhDQo+
IGNvbmZpZyBvcHRpb24gdG8gbWFrZSB0aGlzIGNvbmRpdGlvbmFsPw0KDQpZZXMsIHRoaXMgbWF5
IHNsb3cgdGhpbmdzIGRvd24uIEkgYW0gbm90IHN1cmUgSSBhZ3JlZSB3aXRoIHRoZSBpbXBsLiBl
aXRoZXIuDQpDb3VsZCBvbmUgbm90IG1ha2UgY3B1X3RvX2plX1gvamVYX3RvX2NwdSBhIGZ1bmN0
aW9uIHB0ciB3aGljaCBpcyBzZXQgdG8NCmEgZnVuYy4gd2l0aCB0aGUgY29ycmVjdCBlbmRpYW4/
DQoNClRoYXQgd2F5IGl0IHNob3VsZCBhbHNvIGJlIGVhc3kgdG8gaGF2ZSBhIGNvbmZpZyBvcHRp
b24gZm9yIGVuZGlhbjogTmF0aXZlL0JFL0xFIG9yIER5bmFtaWMNCg0KIEpvY2tlDQo=
