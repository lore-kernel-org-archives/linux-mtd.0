Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UuRQR-0004MP-8j
 for linux-mtd@lists.infradead.org; Wed, 03 Jul 2013 18:05:08 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Arnd Bergmann <arnd@arndb.de>, "artem.bityutskiy@linux.intel.com"
 <artem.bityutskiy@linux.intel.com>, "sfr@canb.auug.org.au"
 <sfr@canb.auug.org.au>
Subject: RE: [PATCH v4 0/4] mtd:nand:omap2: clean-up of supported ECC schemes
Date: Wed, 3 Jul 2013 18:04:21 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9E47B4@DBDE04.ent.ti.com>
References: <1372764757-29511-1-git-send-email-pekon@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E46CA@DBDE04.ent.ti.com>
 <1372857987.9767.162.camel@sauron.fi.intel.com>
 <201307031527.17219.arnd@arndb.de>
In-Reply-To: <201307031527.17219.arnd@arndb.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "tony@atomide.com" <tony@atomide.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "benoit.cousson@linaro.org" <benoit.cousson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PiANCj4gT24gV2VkbmVzZGF5IDAzIEp1bHkgMjAxMywgQXJ0ZW0gQml0eXV0c2tpeSB3cm90ZToN
Cj4gPiBPbiBXZWQsIDIwMTMtMDctMDMgYXQgMTM6MTYgKzAwMDAsIEd1cHRhLCBQZWtvbiB3cm90
ZToNCj4gPiA+IFtQZWtvbl06IFllcywgSSdtIG5vdCBzZWVpbmcgdGhlc2UgYnVpbGQgaXNzdWVz
LCBhcyBJJ20gY2xlYW5seQ0KPiA+ID4gcmV0dXJuaW5nIGZyb20gcHJvYmUgd2l0aCBwcl9lcnIo
KSwgaWYgdGhlIHJlcXVpcmVkIGxpYnJhcmllcyAoL2xpYi9iY2guYykNCj4gPiA+IGFyZSBub3Qg
YnVpbGQtaW4gdGhlIHN5c3RlbS4NCj4gPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+IFtQ
YXRjaCB2NCAxLzRdOiBtdGQ6bmFuZDpvbWFwMjogY2xlYW4tdXAgQkNIeF9IVyBhbmQgQkNIeF9T
VyBFQ0MuLg0KPiA+ID4gQEBzdGF0aWMgaW50IG9tYXBfbmFuZF9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4gKwlkZWZhdWx0Og0KPiA+ID4gKwkJcHJfZXJyKCJzZWxl
Y3RlZCBFQ0Mgc2NoZW1lIG5vdCBzdXBwb3J0ZWQgb3Igbm90DQo+IGVuYWJsZWRcbiIpOw0KPiA+
ID4gKwkJZXJyID0gLUVJTlZBTDsNCj4gPiA+ICsJCWdvdG8gb3V0X3JlbGVhc2VfbWVtX3JlZ2lv
bjsNCj4gPiA+ICsJfQ0KPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ID4gSG93ZXZlciwg
aWYgeW91IGFyZSBzdGlsbCBzZWVpbmcgdGhpcywgY291bGQgeW91IHBsZWFzZSBzZW5kIG1lIHlv
dXINCj4gY29uZmlnPw0KPiA+DQo+ID4gSSBjb21waWxlIHRlc3RlZCB5b3VyIHBhdGNoZXMgdG9v
LCBhbmQgZGlkIG5vdCBzZWUgYW55IGlzc3VlcyB3aXRoIG15DQo+ID4gb21hcDJfZGVmY29uZmln
Lg0KPiANCj4gDQo+IFRvIGNsYXJpZnk6IEknbSBnZXR0aW5nIHRoaXMgZXJyb3Igd2l0aCByYW5k
Y29uZmlnIG9uIHRvZGF5J3MgbGludXgtbmV4dC4NCj4gSSB0aGluayBpdCBvbmx5IGhhcHBlbnMg
d2l0aCBNVERfTkFORF9FQ0NfQkNIIGVuYWJsZWQsIHdoaWNoIGlzIG5vdA0KPiB0aGUgZGVmYXVs
dCBpbiBvbWFwMl9kZWZjb25maWcuDQo+IA0KPiAJQXJuZA0KDQpIaSBBcm5kLCBBcnRlbSwgU3Rl
cGhlbiwNCg0KSSBzZWUgdGhlIGlzc3VlIGluIGxpbnV4LW5leHQvbWFzdGVyIHRyZWUuLg0KbGlu
dXgtbmV4dC9tYXN0ZXIgaGFzIG9ubHkgdGhlIGZpcnN0IFtQYXRjaCB2NCAxLzRdIGZyb20gdGhl
IHNlcmllcy4NCk90aGVyIHBhdGNoZXMgW1BhdGNoIHY0IDIvNC4uIDQvNF0gb2YgdGhpcyBzZXJp
ZXMgd2VyZSBkcm9wcGVkLA0KYXMgJ09sb2YgSm9oYW5zc29uJyBoYWQgc29tZSBhcHByZWhlbnNp
b25zIGFib3V0IERUIGJpbmRpbmdzLg0KaHR0cDovL3Blcm1hbGluay5nbWFuZS5vcmcvZ21hbmUu
bGludXgucG9ydHMuYXJtLmtlcm5lbC8yNDk2NjINCg0KQXMgdGhlc2UgcGF0Y2hlcyBhcmUgaW50
ZXItZGVwZW5kZW50LCBzbyBwbGVhc2UgZHJvcCB0aGUgd2hvbGUgc2VyaWVzDQppbmNsdWRpbmcg
dGhlIGNvbW1pdCBiZWxvdy4NCmZiMTU4NWIgIFtQYXRjaCB2NCAxLzRdIG10ZDogbmFuZDogb21h
cDI6IGNsZWFuLXVwIEJDSHhfSFcgYW5kIEJDSHhfU1cNCg0KSSdtIGF3YWl0aW5nIGZlZWRiYWNr
cyBmcm9tICdPbG9mIEpvaGFuc3Nvbicgb3Igb3RoZXIgRFQgbWFpbnRhaW5lcnMsDQpvbmNlIGFw
cHJvdmVkLCBJJ2xsIHJlc2VuZCB0aGUgd2hvbGUgc2VyaWVzLg0KDQoiW1BBVENIIHY0IDIvNF0g
QVJNOiBPTUFQMis6IGNsZWFuZWQtdXAgRFQgc3VwcG9ydCAiIGhhZCB0aGUNCmRlY2xhcmF0aW9u
cyB3aGljaCB3ZXJlIHJlcXVpcmVkIGZvciBhYm92ZSBidWlsZCBlcnJvcnMuDQotLS0tLS0tLS0t
LS0tLS0NCmluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9tdGQtbmFuZC1vbWFwMi5oDQplbnVt
IG9tYXBfZWNjIHsNCisJLyogNC1iaXQgIEVDQyBjYWxjdWxhdGlvbiBieSBHUE1DLCBFcnJvciBk
ZXRlY3Rpb24gYnkgU29mdHdhcmUgKi8NCisJT01BUF9FQ0NfQkNINF9DT0RFX0hXX0RFVEVDVElP
Tl9TVywNCi4uLg0KKwkvKiA4LWJpdCAgRUNDIGNhbGN1bGF0aW9uIGJ5IEdQTUMsIEVycm9yIGRl
dGVjdGlvbiBieSBTb2Z0d2FyZSAqLw0KKwlPTUFQX0VDQ19CQ0g4X0NPREVfSFdfREVURUNUSU9O
X1NXDQotLS0tLS0tLS0tLS0tLS0NCg0KDQp3aXRoIHJlZ2FyZHMsIHBla29uDQoNCg==
