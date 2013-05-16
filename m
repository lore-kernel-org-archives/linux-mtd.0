Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UctvA-0003hT-Ep
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 08:52:21 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: jean-philippe francois <jp.francois@cynove.com>
Subject: RE: [PATCH 2/2] ARM: OMAP2+: cleaned-up DT support of various ECC
 schemes
Date: Thu, 16 May 2013 08:51:46 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9C4F04@DBDE04.ent.ti.com>
References: <1368684720-26763-1-git-send-email-pekon@ti.com>
 <1368684720-26763-3-git-send-email-pekon@ti.com>
 <CAGGh5h16kxdPRtPQ4vRzLA4iMxjTurPpdzBiEHaM9zb+y8fJBg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9C4EC5@DBDE04.ent.ti.com>
 <CAGGh5h3WGGRcQgpns7EOso1yqvrzKmCAbQo9XZoMyhv0Q1KT4Q@mail.gmail.com>
In-Reply-To: <CAGGh5h3WGGRcQgpns7EOso1yqvrzKmCAbQo9XZoMyhv0Q1KT4Q@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "arnd@arndb.de" <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

IA0KPiAyMDEzLzUvMTYgR3VwdGEsIFBla29uIDxwZWtvbkB0aS5jb20+Og0KPiA+PiA+DQo+ID4+
DQo+ID4+IE9NQVBfRUNDX0JDSDRfQ09ERV9IV19ERVRFQ1RJT05fU1cgYW5kDQo+ID4+IE9NQVBf
RUNDX0JDSDRfQ09ERV9IVw0KPiA+PiBzZWVtcyB0byBleGlzdCBpbiB0aGUgY29kZSwgYnV0IGFy
ZSBub3QgaW4gdGhlIGNoYW5nZWxvZywgYW5kIG5vdCBpbg0KPiA+PiB0aGUgZGV2aWNlIHRyZWUg
YmluZGluZyBkb2N1bWVudGF0aW9uLg0KPiA+Pg0KPiA+DQo+ID4gWWVzLCBJIHBsYW4gdG8gb21p
dCB0aGVtIGZyb20gY29kZSBhbHNvLCBpbiBuZXh0IHNlcmllcyBhcyBpdCBkb2VzIG5vdA0KPiA+
IG1ha2Ugc2Vuc2UgdG8gc3VwcG9ydCBib3RoIEJDSDQgYW5kIEJDSDggYXQgc2FtZSB0aW1lLCB3
aGVuIG1vc3QNCj4gPiB1c2VycyB3b3VsZCBvcHQgZm9yIEJDSDguDQo+ID4gQWxzbywgQkNINCB3
YXMga2VwdCBmb3IgbGVnYWN5IHB1cnBvc2VzLCBhbmQgd2FzIG5vdCB0ZXN0ZWQgb24gYWxsDQo+
IGRldmljZXMuDQo+ID4gVGhlcmVmb3JlIEkgaGF2ZSBwdXJwb3NlbHkgb21pdHRlZCBpdCBmcm9t
IGRvY3VtZW50YXRpb24uDQo+ID4NCj4gDQo+IFdlIGhhdmUgc2hpcHBlZCBkZXZpY2VzIHdpdGgg
QkNINCBuYW5kLiAgVGhpcyB3b3VsZCBiZSBhIHJlZ3Jlc3Npb24NCj4gZm9yIHVzLg0KPiANCltQ
ZWtvbl06IE1heSBJIGtub3cgdGhlIGZvbGxvd2luZyBkZXRhaWxzIHNvIHRoYXQgSSBjYW4gcHJp
b3JpdGl6ZSBCQ0g0IHRlc3RpbmcNCi0gV2hpY2ggVEkgZGV2aWNlIGhhdmUgeW91IHByb2R1Y3Rp
emVkID8NCi0gV2hpY2gga2VybmVsIHZlcnNpb24geW91IGFyZSB1c2luZyA/IChJcyBpdCBmcm9t
IG1haW5saW5lIG9yIFNESyByZWxlYXNlKQ0KLSBXaGljaCBCQ0g0IEVDQyBpbXBsZW1lbnRhdGlv
biB5b3UgYXJlIHVzaW5nID8NCglCQ0g0X0hXICh1c2luZyBib3RoIEdQTUMgYW5kIEVMTSBIL1cg
ZW5naW5lcykNCglCQ0g0X0hXX0RFVEVDVElPTl9TVyAodXNpbmcgR1BNQyBIL1cgYW5kIGJjaC5o
IFMvVyBsaWJyYXJpZXMpDQotIElzIHRoZXJlIGEgc3BlY2lmaWMgcmVhc29uIHdoeSAJeW91IG9w
dGVkIGZvciBCQ0g0IGluc3RlYWQgb2YgQkNIOCA/DQoJKFRob3VnaCBpdHMgb25seSByZWNlbnQg
dGhhdCBPTUFQX0VDQ19CQ0h4IHN1cHBvcnQgaXMgbWFpbmxpbmVkIA0KCUJ1dCwgQkNIOCBzdXBw
b3J0IHdhcyBhdmFpbGFibGUgaW4gVEkgU0RLIHJlbGVhc2VzIGZyb20gcXVpdGUgc29tZXRpbWUu
KQ0KDQpJJ2xsIHRyeSB0byBzZWUgaWYgSSBjYW4gaGVscCB5b3UgaGVyZSwgYnV0IGdvaW5nIGZv
cndhcmQgaXRzIGFsd2F5cyByZWNvbW1lbmRlZCANCnRvIHVzZSBoaWdoZXIgRUNDIHNjaGVtZXMg
KGxpa2UgQkNIOCksIHNvIHRoYXQgZmxhc2gncyBsaWZldGltZSBpcyBleHRlbmRlZCBvbiBmaWVs
ZC4NCg0KDQo+IFJlZ2FyZHMsDQo+IEplYW4tUGhpbGlwcGUgRnJhbsOnb2lzLg0KPiANCndpdGgg
cmVnYXJkcywgcGVrb24NCg==
