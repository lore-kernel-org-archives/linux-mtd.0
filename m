Received: from smtp6-v.fe.bosch.de ([2a03:cc00:ff0:100::2])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UheDb-00034t-Dm
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 11:07:01 +0000
From: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Wed, 29 May 2013 13:06:16 +0200
Subject: RE: UBIFS failure & stable page writes
Message-ID: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91E12F@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <4BE1E71893EF1E4F9E9DD99FB4EBF0032C02EA2D44@SI-MBX02.de.bosch.com>
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
In-Reply-To: <1369810158.5446.208.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jan Kara <jack@suse.cz>, Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rmlyc3QgSSB3aWxsIGNoZWNrIHdoZW4sIGhvdyBvZnRlbiBhbmQgd2hpY2ggbm9kZXMgYXJlIHdy
aXR0ZW4gdG8gdGhlIG9ycGhhbiBhcmVhLg0KSSBndWVzcyB0aGV5ICgwICYgMSkgbXVzdCBiZSBs
aXN0ZWQgaW4gdGhlIG9ycGhhbiBhcmVhIHRvIGdldCB0aGlzIHJlY292ZXJ5IG1lc3NhZ2VzLi4u
DQoNCkl0IG1lYW5zIEkgY3VycmVudGx5IGxvb2sgdG8gYSByZXN1bHRpbmcgc2l0dWF0aW9uIChh
ZnRlciBwb3dlci1jeWNsZSkgYW5kIEkgc3VwcG9zZSBub3QgdGhlIHByb2JsZW0gaXRzZWxmLg0K
DQpIb3cgY2FuIEkgZGV0ZXJtaW5lIHRoZSBsb2NhdGlvbiBvZiB0aGUgb3JwaGFuIGFyZWE/DQoN
Ck1ldCB2cmllbmRlbGlqa2UgZ3JvZXRlbiB8IEJlc3QgUmVnYXJkcywgDQpBbnRvbiBQcmlucw0K
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBcnRlbSBCaXR5dXRza2l5IFtt
YWlsdG86ZGVkZWtpbmQxQGdtYWlsLmNvbV0gDQpTZW50OiB3b2Vuc2RhZyAyOSBtZWkgMjAxMyA4
OjQ5DQpUbzogUHJpbnMgQW50b24gKFNULUNPL0VORzEuMSkNCkNjOiBKYW4gS2FyYTsgQWRyaWFu
IEh1bnRlcjsgbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcNClN1YmplY3Q6IFJlOiBVQklG
UyBmYWlsdXJlICYgc3RhYmxlIHBhZ2Ugd3JpdGVzDQoNCk9uIFR1ZSwgMjAxMy0wNS0yOCBhdCAx
MzoxMyArMDIwMCwgUHJpbnMgQW50b24gKFNULUNPL0VORzEuMSkgd3JvdGU6DQo+IFdpbGwgYWRk
IHRoZSBDRkxBRyAtRERFQlVHIGFuZCBkZWJ1ZyBmdXJ0aGVyIQ0KPiAoSSBob3BlIGF0IHRoaXMg
a2VybmVsLXJlY292ZXJ5IHN0YWdlIHRoZXJlIGFyZSBub3QgZGVidWcgbWVzc2FnZXMgb2YgbXVs
dGlwbGUgcGFydGl0aW9ucyBiZWNhdXNlIHRoZXJlIGFyZSBtb3JlIFVCSUZTIHBhcnRpdGlvbnMu
KQ0KPiANCj4gRG9pbmcgdGhpcyBJIHNhdyBzb21lIHN1c3BpY2lvdXMgbWVzc2FnZXMgbGlrZToN
Cj4gVUJJRlMgREJHIHJjdnJ5OiBkZWxldGluZyBvcnBoYW5lZCBpbm9kZSAwDQo+IC4uLg0KPiBV
QklGUyBEQkcgcmN2cnk6IGRlbGV0aW5nIG9ycGhhbmVkIGlub2RlIDENCj4gLi4uDQoNClRoZXNl
IGFyZSB2ZXJ5IHN0cmFuZ2UgbWVzc2FnZXMuIElub2RlIDAgc2hvdWxkIG5vdCBleGlzdC4gSW5v
ZGUgMQ0Kc2hvdWxkIGJlIGltcG9zc2libGUgdG8gZXZlciBkZWxldGUuIFNtZWxscyBsaWtlIHNv
bWUga2luZCBvZiBtZW1vcnkNCmNvcnJ1cHRpb24uIENhbiB5b3Ugc2hhcmUgeW91ciBpbWFnZT8g
T3IgYXQgbGVhc3QgdGhlIG9ycGhhbiBhcmVhcyBvZg0KdGhlIGltYWdlPyBXZSBkbyBub3QgaGF2
ZSBtdWNoIHRpbWUsIGJ1dCB3b3VsZCBwcm9iYWJseSB0YWtlIGEgbG9vay4NCg0KV291bGQgYWxz
byBiZSB1c2VmdWwgdG8gaGF2ZSB0aGUgZnMvdWJpZnMvKiBhbmQgZHJpdmVycy9tdGQvdWJpLyog
b2YNCnlvdXJzLg0KDQotLSANCkJlc3QgUmVnYXJkcywNCkFydGVtIEJpdHl1dHNraXkNCg0K
