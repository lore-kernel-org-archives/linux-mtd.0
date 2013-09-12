Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VK5X3-0005Jm-MK
 for linux-mtd@lists.infradead.org; Thu, 12 Sep 2013 11:57:58 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Olof Johansson <olof@lixom.net>
Subject: RE: [PATCH v5 1/4] ARM: OMAP2+: cleaned-up DT support of various
 ECC schemes
Date: Thu, 12 Sep 2013 11:57:20 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA0EF9D@DBDE04.ent.ti.com>
References: <1373748891-7779-1-git-send-email-pekon@ti.com>
 <1373748891-7779-2-git-send-email-pekon@ti.com>
 <20130822045452.GA5151@quad.lixom.net>
 <20980858CB6D3A4BAE95CA194937D5E73E9F9E94@DBDE04.ent.ti.com>
 <20130827170442.GB22852@quad.lixom.net>
In-Reply-To: <20130827170442.GB22852@quad.lixom.net>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "N, Mugunthan V" <mugunthanvnm@ti.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>, "zonque@gmail.com" <zonque@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "benoit.cousson@linaro.org" <benoit.cousson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DQo+IE9uIFRodSwgQXVnIDIyLCAyMDEzIGF0IDA3OjU2OjU3QU0gKzAwMDAsIEd1cHRhLCBQZWtv
biB3cm90ZToNCg0KPiBJZiBhbnl0aGluZywgdGhlIGRldmljZSBlbnRyeSBzaG91bGQgc29tZWhv
dyBkZXNjcmliZSB0aGUgdmFyaW91cyBlY2MNCj4gb3B0aW9ucw0KPiB0aGF0IHRoZSBoYXJkd2Fy
ZSBpbXBsZW1lbnRzIChpZiB5b3UgY2FuJ3QgZGVyaXZlIHRoYXQgZnJvbSB0aGUgY29tcGF0aWJs
ZQ0KPiB2YWx1ZSwgd2hpY2ggSSB0aGluayB5b3UgY2FuPykuDQo+IA0KPiA+IEFsc28gSSdsbCB0
cnkgdG8gZXhwbGFpbiBob3cgYmVsb3cgZWNjLXNjaGVtZSBzZWxlY3Rpb24gaXMgbGlua2VkIHRv
IFRJDQo+IEhhcmR3YXJlLg0KPiA+IFRJIFNvQyB1c2VzIHR3byBzZXBhcmF0ZSBIL1cgZW5naW5l
cyBmb3IgY2FsY3VsYXRpbmcgYW5kIGNvcnJlY3RpbmcgRUNDLg0KPiA+IChhKSBHUE1DOiBHZW5l
cmFsIFB1cnBvc2UgTWVtb3J5IENvbnRyb2xsZXIgd2hpY2ggY2FsY3VsYXRlcyBFQ0MgYWxzby4N
Cj4gPiAoYikgRUxNOiBFcnJvciBMb2NhdG9yIE1vZHVsZSB3aGljaCBqdXN0IGxvY2F0ZXMgZXJy
b3JzIGluIEJDSHggY29kZSBvbmx5Lg0KPiA+DQo+ID4gKlJlYXNvbi0xKjogQWxsIE9NQVAgcGxh
dGZvcm1zIGhhdmUgKGEpIEdQTUMgaC93IGVuZ2luZSwgYnV0IHNvbWUNCj4gPiBsZWdhY3kgT01B
UCAgcGxhdGZvcm1zIGRvIG5vdCBoYXZlIChiKSBFTE0gaC93IGVuZ2luZS4gU3VjaCBvbGRlcg0K
PiA+IHBsYXRmb3JtcyB1c2UgUy9XIGxpYi9iY2guYyBsaWJyYXJpZXMgZm9yIEVDQyBlcnJvciBk
ZXRlY3Rpb24uDQo+IA0KPiBPaywgc28gdGhlbiB5b3UganVzdCBuZWVkIGEgYmluYXJ5ICJlbG0t
ZW5naW5lIiBwcm9wZXJ0eSB0byBpbmRpY2F0ZQ0KPiB0aGF0IHRoZSBoYXJkd2FyZSBkb2VzIGhh
dmUgdGhlIGVuZ2luZS4NCj4gDQo+ID4gVGhlcmVmb3JlIGluLW9yZGVyIHRvIGtlZXAgdGhlIGRy
aXZlciBjb25zaXN0ZW50IGZvciBhbGwgcGxhdGZvcm1zIHdlDQo+ID4gbmVlZGVkIHRvIGtlZXAg
c28gbWFueSBFQ0Mgb3B0aW9ucyBhbGl2ZS4gTGlrZSBiZWxvdyB5b3Ugd291bGQgc2VlDQo+ID4g
dHdvIHZlcnNpb25zIG9mIEJDSDggYW5kIEJDSDQNCj4gPiAtIGJjaDhfY29kZV9odyAoc3VwcG9y
dGVkIG9uIG5ldyBkZXZpY2VzIHdpdGggRUxNIGgvdyBlbmdpbmUpDQo+ID4gLSBiY2g4X2NvZGVf
aHdfZGV0ZWN0aW9uX3N3IChrZXB0IGZvciBsZWdhY3kgZGV2aWNlcykNCj4gDQo+IEFsbCB5b3Ug
bmVlZCB0byBzcGVjaWZ5IGlzIHdoYXQgRUNDIGZvcm1hdCBpcyB1c2VkLiBJLmUuIEJDSDguIFdo
ZXRoZXIgdGhlDQo+IGhhcmR3YXJlIG9yIHNvZnR3YXJlIHdpbGwgYmUgdXNlZCB0byBjYWxjdWxh
dGUgdGhlIGNoZWNrc3VtcyBhbmQNCj4gZGV0ZWN0L2NvcnJlY3QNCj4gZXJyb3JzIGlzIGEgZHJp
dmVyIGRlY2lzaW9uLCBhbmQgbm90IHNvbWV0aGluZyB0aGF0IHRoZSBkZXZpY2UgdHJlZSBuZWVk
cyB0bw0KPiBzcGVjaWZ5Lg0KPiANCj4gPiAqUmVhc29uLTIqOiBBbHNvIEgvVyBFQ0Mgc2NoZW1l
cyBoYXZlIGRpZmZlcmVudCBFQ0MgbGF5b3V0LCB3aGljaCBpcw0KPiA+IGNvbXBhdGlibGUgdG8g
Uk9NIGNvZGUuIFRodXMgZW5kLXRvLWVuZCBOQU5EIGJvb3Qgd291bGQgd29yaw0KPiA+IG9ubHkg
d2l0aCB4eF9jb2RlX2h3IHNjaGVtZXMgb25seS4NCj4gDQo+IFNvIHlvdSBzaG91bGQgZGVzY3Jp
YmUgd2hhdCB0aGUgbGF5b3V0IGluIHVzZSBpcy4gV291bGRuJ3QgaXQgYmUNCj4gcG9zc2libGUg
dG8gbWFrZSB0aGUgc29mdHdhcmUgaGFuZGxlIHRoZSBzYW1lIGxheW91dCBhcyB0aGUgaGFyZHdh
cmUNCj4gZW5naW5lIGlmIG5lZWRlZD8gSS5lLiB0aGUgZGVjaXNpb24gb2YgdXNpbmcgSFcgb3Ig
U1cgaXMgbm90IGEgcHJvcGVydHkNCj4gb2YgdGhlIGhhcmR3YXJlIGFuZCBzaG91bGRuJ3QgYmUg
ZGVzY3JpYmVkIGluIHRoZSBkZXZpY2UgdHJlZS4NCj4gDQoNClNvcnJ5IEkgd2FzIGNhdWdodCB1
cCBpbiBzb21lIG90aGVyIHByaW9yaXR5IHdvcmssIHRoZXJlZm9yZSBjb3VsZCBub3QNCnVwZGF0
ZSB0aGlzLiBCdXQgSSBoYXZlIHJlY2VudGx5IHBvc3RlZCBhbm90aGVyIHZlcnNpb24gd2l0aCB5
b3VyIGZlZWRiYWNrcw0KaW5jb3Jwb3JhdGVkLiBQbGVhc2UgcmV2aWV3IHRoZW0sIHdoZW5ldmVy
IHBvc3NpYmxlLg0KaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10
ZC8yMDEzLVNlcHRlbWJlci8wNDg2MTEuaHRtbA0KDQpQYXRjaCBzZXJpZXMgYXQ6IA0KaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDEzLVNlcHRlbWJlci8w
NDg2MTMuaHRtbA0KDQoNClRoYW5rIHlvdSANCldpdGggcmVnYXJkcywgcGVrb24NCg==
