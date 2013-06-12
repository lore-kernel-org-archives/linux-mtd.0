Received: from smtp6-v.fe.bosch.de ([2a03:cc00:ff0:100::2])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Umjh7-0004Yx-OE
 for linux-mtd@lists.infradead.org; Wed, 12 Jun 2013 11:58:30 +0000
From: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Date: Wed, 12 Jun 2013 13:57:54 +0200
Subject: RE: UBIFS failure & stable page writes
Message-ID: <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3590@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBA85@SI-MBX14.de.bosch.com>
 <20130527121828.GA32625@quack.suse.cz>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBB8D@SI-MBX14.de.bosch.com>
 <1369709828.5446.89.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBD81@SI-MBX14.de.bosch.com>
 <1369727042.5446.112.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBE33@SI-MBX14.de.bosch.com>
 <1369732266.5446.117.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91DC9C@SI-MBX14.de.bosch.com>
 <1369810158.5446.208.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91E697@SI-MBX14.de.bosch.com>
 <1370239282.21714.21.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3EA0F38E@SI-MBX14.de.bosch.com>
 <51B82A1D.30009@intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3508@SI-MBX14.de.bosch.com>
 <51B862D6.2080807@intel.com>
In-Reply-To: <51B862D6.2080807@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T2sgY2xlYXIhDQoNClJlZ2FyZGluZyBtb3VudCBkZWJ1ZzogSSBzdXBwb3NlIEkgb25seSB3aWxs
IHNlZSB0aGlzIG9uIHRoZSAnZmlyc3QnIGJvb3QgYWZ0ZXIgdGhlIHByb2JsZW0gaXMgaW4gdGhl
IHBlcnNpc3RlbmNlIHN0b3JhZ2U/DQooVXAgdG8gbm93IEknbSBub3QgYWJsZSB0byBzaWduYWwg
dGhlIHBvaW50LW9mLWZhaWx1cmUuLi4gSSdtIG9ubHkgbG9va2luZyB0byBhbiAocG9zc2libHkp
IGFmdGVyIHJlY292ZXJ5IHNpdHVhdGlvbikuDQoNCk9yIG1ha2VzIHRoaXMgc2Vuc2UgdG8gZG8g
dGhpcyBtb3VudCBkZWJ1ZyBvbiB0aGUgZXhpc3RpbmcgZmFpbGluZyBkZXZpY2U/DQoNCkZZSTog
DQotIHdpdGggMTAwIGRldmljZXMgcG93ZXIgY3ljbGluZyBldmVyeSA1IG1pbnV0ZXMgZm9yIGEg
d2Vla2VuZCB3ZSBET04nVCBzZWUgYSBwcm9ibGVtLg0KLSB3aXRoIDEwMCBkZXZpY2VzIHBvd2Vy
ZWQgb24gZm9yIGEgd2Vla2VuZCBhbmQgYWZ0ZXIgdGhhdCBnaXZlIGEgc2luZ2xlIHBvd2VyLWN5
Y2xlIHNob3dzIG1heWJlIDEgb3IgMiBmYWlsaW5nIGRldmljZXMgKGJ1dCBzb21ldGltZXMgJzAn
KS4NCg0KU28gYSBtYWluIHByb2JsZW0gaW4gYW5hbHl6aW5nIGlzIHRoZSAnbW9tZW50IG9mIGZh
aWx1cmUnIGFuZCAncmVwcm9kdWN0aW9uIChyYXRlKScuDQoNCk1ldCB2cmllbmRlbGlqa2UgZ3Jv
ZXRlbiB8IEJlc3QgUmVnYXJkcywgDQpBbnRvbiBQcmlucw0KDQpNZXQgdnJpZW5kZWxpamtlIGdy
b2V0ZW4gfCBCZXN0IFJlZ2FyZHMsIA0KQW50b24gUHJpbnMNCg0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogQWRyaWFuIEh1bnRlciBbbWFpbHRvOmFkcmlhbi5odW50ZXJAaW50
ZWwuY29tXSANClNlbnQ6IHdvZW5zZGFnIDEyIGp1bmkgMjAxMyAxNDowMA0KVG86IFByaW5zIEFu
dG9uIChTVC1DTy9FTkcxLjEpDQpDYzogZGVkZWtpbmQxQGdtYWlsLmNvbTsgbGludXgtbXRkQGxp
c3RzLmluZnJhZGVhZC5vcmcNClN1YmplY3Q6IFJlOiBVQklGUyBmYWlsdXJlICYgc3RhYmxlIHBh
Z2Ugd3JpdGVzDQoNCk9uIDEyLzA2LzEzIDE0OjEzLCBQcmlucyBBbnRvbiAoU1QtQ08vRU5HMS4x
KSB3cm90ZToNCj4gRG9lcyBpdCBtYWtlIHNlbnNlIHRvIHVzZSBjaGtfb3JwaGFucz8NCg0KVGhh
dCBjaGVja3MgZm9yIG1pc3Npbmcgb3JwaGFucyBidXQgdGhlIHByb2JsZW0gaXMgdGhlIG9wcG9z
aXRlOiB0aGUNCnByZXNlbmNlIG9mIG9ycGhhbnMgdGhhdCBzaG91bGQgbm90IGJlIHRoZXJlLg0K
DQo+DQo+IEkgc3VwcG9zZSBJIGhhdmUgdG8gZG86ICQgZWNobyAiMSIgPiBjaGtfb3JwaGFucw0K
Pg0KPiBPciBhbSBJIHdyb25nPw0KPg0KPiBNZXQgdnJpZW5kZWxpamtlIGdyb2V0ZW4gfCBCZXN0
IFJlZ2FyZHMsIA0KPiBBbnRvbiBQcmlucw0KPg0KDQo=
