From: "Philip, Avinash" <avinashphilip@ti.com>
To: "Nori, Sekhar" <nsekhar@ti.com>
Subject: RE: [PATCH v3 1/3] mtd: nand: omap2: Update nerrors using ecc.strength
Date: Mon, 10 Dec 2012 06:44:02 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3EA1FA1B@DBDE01.ent.ti.com>
References: <1354189595-12784-1-git-send-email-avinashphilip@ti.com>
 <1354189595-12784-2-git-send-email-avinashphilip@ti.com>
 <50BF3819.9010200@ti.com>
 <518397C60809E147AF5323E0420B992E3EA1139B@DBDE01.ent.ti.com>
 <50C1C784.4040209@ti.com>
In-Reply-To: <50C1C784.4040209@ti.com>
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hebbar,
 Gururaja" <gururaja.hebbar@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

T24gRnJpLCBEZWMgMDcsIDIwMTIgYXQgMTY6MTA6MDQsIE5vcmksIFNla2hhciB3cm90ZToNCj4g
T24gMTIvNS8yMDEyIDY6MTMgUE0sIFBoaWxpcCwgQXZpbmFzaCB3cm90ZToNCj4gPiBPbiBXZWQs
IERlYyAwNSwgMjAxMiBhdCAxNzozMzozNywgTm9yaSwgU2VraGFyIHdyb3RlOg0KPiA+PiBIaSBB
dmluYXNoLA0KPiA+Pg0KPiA+PiBPbiAxMS8yOS8yMDEyIDU6MTYgUE0sIFBoaWxpcCwgQXZpbmFz
aCB3cm90ZToNCj4gPj4+IFVwZGF0ZSBudW1iZXIgb2YgZXJyb3JzIHVzaW5nIG5hbmQgZWNjIHN0
cmVuZ3RoLg0KPiA+Pj4gQWxzbyBhZGQgbWFjcm8gZGVmaW5pdGlvbnMgQkNIOF9FUlJPUl9NQVgg
JiBCQ0g0X0VSUk9SX01BWA0KPiA+Pg0KPiA+PiBDYW4geW91IHBsZWFzZSBkZXNjcmliZSB3aHkg
dGhlIG9yaWdpbmFsIG1ldGhvZCBvZiBzZXR0aW5nIG5lcnJvcnMgd2FzDQo+ID4+IGluY29ycmVj
dD8gV2FzIGl0IGNhdXNpbmcgYW55IGlzc3VlcyBpbiBhbnkgcGFydGljdWxhciBjb25maWd1cmF0
aW9uPw0KPiA+IA0KPiA+IEl0IGFmZmVjdHMgdGhlIHJldXNhYmlsaXR5IG9mIHRoZSBjb2RlLiBG
b3IgZXhhbXBsZSBCQ0g4IHdpdGggQU0zMzV4IFJCTCANCj4gPiBjb21wYXRpYmlsaXR5IHJlcXVp
cmVzICAxNCBieXRlcyBpbnN0ZWFkIG9mIDEzIGJ5dGUuIFNvIHNldHRpbmcgbmVycm9ycw0KPiA+
IHdpdGgNCj4gPiAJbmVycm9ycyA9IChpbmZvLT5uYW5kLmVjYy5ieXRlcyA9PSAxMykgPyA4IDog
NDsNCj4gPiB3aWxsIGJyZWFrIGFtMzM1eCBSQkwgY29tcGF0aWJpbGl0eS4NCj4gDQo+IFRoaXMg
c2hvdWxkIGJlIHN1bW1hcml6ZWQgaW4gdGhlIHBhdGNoIGRlc2NyaXB0aW9uIHNvIHRoZSBtb3Rp
dmF0aW9uIGlzDQo+IGNsZWFyIHRvIHRob3NlIHdobyByZWFkIHRoZSBoaXN0b3J5IGxhdGVyLg0K
DQpPayBJIHdpbGwgYWRkIHRoZSBkZXRhaWxzIGluIHBhdGNoIGRlc2NyaXB0aW9uIGluIG5leHQg
dmVyc2lvbi4NCg0KVGhhbmtzDQpBdmluYXNoDQoNCj4gDQo+IFRoYW5rcywNCj4gU2VraGFyDQo+
IA0KDQo=
