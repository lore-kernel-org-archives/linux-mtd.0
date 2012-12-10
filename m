From: "Philip, Avinash" <avinashphilip@ti.com>
To: "Nori, Sekhar" <nsekhar@ti.com>
Subject: RE: [PATCH v3 2/3] mtd: devices: elm: Add support for ELM error
 correction
Date: Mon, 10 Dec 2012 06:43:17 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3EA1FA14@DBDE01.ent.ti.com>
References: <1354189595-12784-1-git-send-email-avinashphilip@ti.com>
 <1354189595-12784-3-git-send-email-avinashphilip@ti.com>
 <50C1C6E3.5020300@ti.com>
In-Reply-To: <50C1C6E3.5020300@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "Mohammed, Afzal" <afzal@ti.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <rob.herring@calxeda.com>, "Hebbar,
 Gururaja" <gururaja.hebbar@ti.com>, Grant Likely <grant.likely@secretlab.ca>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Rob Landley <rob@landley.net>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rmk+kernel@arm.linux.org.uk" <rmk+kernel@arm.linux.org.uk>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T24gRnJpLCBEZWMgMDcsIDIwMTIgYXQgMTY6MDc6MjMsIE5vcmksIFNla2hhciB3cm90ZToNCj4g
T24gMTEvMjkvMjAxMiA1OjE2IFBNLCBQaGlsaXAsIEF2aW5hc2ggd3JvdGU6DQo+ID4gVGhlIEVM
TSBoYXJkd2FyZSBtb2R1bGUgY2FuIGJlIHVzZWQgdG8gc3BlZWR1cCBCQ0ggNC84LzE2IEVDQyBz
Y2hlbWUNCj4gPiBlcnJvciBjb3JyZWN0aW9uLg0KPiA+IEZvciBub3cgb25seSA0ICYgOCBiaXQg
c3VwcG9ydCBpcyBhZGRlZA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcCwgQXZpbmFz
aCA8YXZpbmFzaHBoaWxpcEB0aS5jb20+DQo+ID4gQ2M6IEdyYW50IExpa2VseSA8Z3JhbnQubGlr
ZWx5QHNlY3JldGxhYi5jYT4NCj4gPiBDYzogUm9iIEhlcnJpbmcgPHJvYi5oZXJyaW5nQGNhbHhl
ZGEuY29tPg0KPiA+IENjOiBSb2IgTGFuZGxleSA8cm9iQGxhbmRsZXkubmV0Pg0KDQpbLi4uXQ0K
LyoqDQo+ID4gKyAqIGVsbV9jb25maWcgLSBDb25maWd1cmUgRUxNIG1vZHVsZQ0KPiA+ICsgKiBA
aW5mbzoJZWxtIGluZm8NCj4gPiArICovDQo+ID4gK3N0YXRpYyB2b2lkIGVsbV9jb25maWcoc3Ry
dWN0IGVsbV9pbmZvICppbmZvKQ0KPiANCj4gVGhpcyBpcyBjYWxsZWQgImNvbmZpZyIsIGJ1dCB0
aGVyZSBpcyBubyBjb25maWd1cmF0aW9uIGluZm9ybWF0aW9uDQo+IHBhc3NlZCB3aGljaCBsb29r
cyBvZGQuLg0KDQpUaGUgY29uZmlnIGluZm9ybWF0aW9uIGlzIGJjaF90eXBlLCBlbmNhcHN1bGF0
ZWQgaW4gc3RydWN0IGVsbV9pbmZvLg0KDQo+IA0KPiA+ICt7DQo+ID4gKwl1MzIgcmVnX3ZhbDsN
Cj4gPiArDQo+ID4gKwlyZWdfdmFsID0gKGluZm8tPmJjaF90eXBlICYgRUNDX0JDSF9MRVZFTF9N
QVNLKSB8IChFTE1fRUNDX1NJWkUgPDwgMTYpOw0KPiA+ICsJZWxtX3dyaXRlX3JlZyhpbmZvLCBF
TE1fTE9DQVRJT05fQ09ORklHLCByZWdfdmFsKTsNCj4gPiArfQ0KPiANCj4gSXMgdGhlcmUgYSB1
c2UgY2FzZSB3aGVyZSBCQ0ggdHlwZSBuZWVkcyB0byBiZSBjaGFuZ2VkIGFmdGVyIE5BTkQgaGFz
DQo+IGJlZW4gcHJvYmVkPw0KDQpObywgSSB0aGluayBrZXJuZWwgaGFuZGxlcyB0aGUgZW50aXJl
IE5BTkQgcGFydCB3aXRoIGEgc2luZ2xlIGVjYyBsYXlvdXQuDQpIZW5jZSB0aGVyZSBpcyBubyBy
dW4gdGltZSBCQ0ggc3dpdGNoaW5nLiBCdXQgRUxNIGRyaXZlciBzaG91bGQgc3VwcG9ydCBCQ0gN
CjQgJiA4LiBTZWxlY3Rpb24gb2YgQkNIIGluZm9ybWF0aW9uIGNvbWVzIGZyb20gRFQgb2YgTkFO
RCBkcml2ZXIuDQoNCkFzIE5BTkQgZHJpdmVyIHN1cHBvcnRpbmcgQkNINCAmIDggZWNjIHNjaGVt
ZSBFTE0gbW9kdWxlIHN1cHBvcnQNCmNvbmZpZ3VyYXRpb24gb2YgYm90aC4gIENvbmZpZ3VyYXRp
b24gb2YgRUxNIG1vZHVsZSBzaG91bGQgZG9uZSBhcyBwYXJ0DQpvZiBOQU5EIGRyaXZlciBwcm9i
aW5nLg0KDQoNCj4gWW91IHdpbGwgaGF2ZSB0byBlcmFzZSBhbnkgZXhpc3RpbmcgZGF0YSB3cml0
dGVuIHRvIE5BTkQgaWYNCj4geW91IGNoYW5nZSB0aGUgRUNDIHR5cGUuIFRoYXQgc291bmRzIGRl
c3RydWN0aXZlIGVub3VnaCB0byBhdm9pZCBzdWNoIGENCj4gdGhpbmcuDQoNClRoZXJlIGlzIG5v
IHN1cHBvcnQgZm9yIEJDSCBzd2l0Y2hpbmcgYWZ0ZXIgTkFORCBkcml2ZXIgcHJvYmluZy4NCg0K
Wy4uLl0NCj4gPiArc3RydWN0IGRldmljZSAqZWxtX3JlcXVlc3QoZW51bSBiY2hfZWNjIGJjaF90
eXBlKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgZWxtX2luZm8gKmluZm87DQo+ID4gKw0KPiA+ICsJ
bGlzdF9mb3JfZWFjaF9lbnRyeShpbmZvLCAmZWxtX2RldmljZXMsIGxpc3QpIHsNCj4gPiArCQlp
ZiAoaW5mbyAmJiBpbmZvLT5kZXYpIHsNCj4gPiArCQkJCWluZm8tPmJjaF90eXBlID0gYmNoX3R5
cGU7DQo+ID4gKwkJCQllbG1fY29uZmlnKGluZm8pOw0KPiA+ICsJCQkJcmV0dXJuIGluZm8tPmRl
djsNCj4gPiArCQl9DQo+ID4gKwl9DQo+IA0KPiBUaGlzIHdpbGwgYWx3YXlzIHJldHVybiB0aGUg
Zmlyc3QgRUxNIGRldmljZSBwcm9iZWQgc2luY2UgeW91IG5ldmVyDQo+IHJlbW92ZSB0aGUgYWxs
b2NhdGVkIGRldmljZSBmcm9tIHRoZSBsaXN0Lg0KDQpCdXQgbm93IEkgcmVhbGl6ZWQgdGhhdCwg
dGhlcmUgaXMgbm8gbWVjaGFuaXNtIG9mIGZyZWVpbmcgdGhlIHJlcXVlc3RlZA0KcmVzb3VyY2Uu
DQoNClNvIEkgd2lsbCBhZGQgbWVjaGFuaXNtIHRvIHJlcXVlc3QgRUxNIG1vZHVsZSBzdWNjZXNz
ZnVsbHkgb25seSBpZiBFTE0NCm1vZHVsZSBpcyBub3QgcmVxdWVzdGVkIGFscmVhZHkgYW5kIGFk
ZCBtZWNoYW5pc20gdG8gZnJlZSBpdCwgb24gTkFORA0KZHJpdmVyIG1vZHVsZSB1bmxvYWQgKGxv
YWRhYmxlIG1vZHVsZSBzdXBwb3J0KS4gVGhpcyB3YXkgRUxNIGRyaXZlcg0KY2FuIGFjaGlldmUg
bXVsdGkgaW5zdGFuY2Ugc3VwcG9ydC4NCg0KPiBJIHdvbmRlciB3aHkgeW91IHJlYWxseSBuZWVk
IGEgbGlzdD8NCg0KVGhlIHByaW1lIG1vdGl2YXRpb24gZm9yIHRoZSBsaXN0IGlzIHRoZSBkcml2
ZXIgc2hvdWxkIHN1cHBvcnQgbXVsdGkNCmluc3RhbmNlcyBvZiBFTE0gYnkgcmVtb3ZpbmcgZ2xv
YmFsIHN5bWJvbHMuDQoNClRoYW5rcw0KQXZpbmFzaA0KDQo+IA0KPiBUaGFua3MsDQo+IFNla2hh
cg0KPiANCg0K
