From: "Philip, Avinash" <avinashphilip@ti.com>
To: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>
Subject: RE: [PATCH v4 0/3] mtd: nand: OMAP: ELM error correction support
 for BCH ecc
Date: Fri, 18 Jan 2013 03:54:51 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3EA5F353@DBDE01.ent.ti.com>
References: <1357286211-5012-1-git-send-email-avinashphilip@ti.com>
 <518397C60809E147AF5323E0420B992E3EA5DFA9@DBDE01.ent.ti.com>
 <1358424375.2731.234.camel@sauron.fi.intel.com>
In-Reply-To: <1358424375.2731.234.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "Mohammed, Afzal" <afzal@ti.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "Nori, Sekhar" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rob.herring@calxeda.com" <rob.herring@calxeda.com>,
 "zonque@gmail.com" <zonque@gmail.com>,
 "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "rob@landley.net" <rob@landley.net>,
 "rmk+kernel@arm.linux.org.uk" <rmk+kernel@arm.linux.org.uk>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Hebbar, Gururaja" <gururaja.hebbar@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T24gVGh1LCBKYW4gMTcsIDIwMTMgYXQgMTc6MzY6MTUsIEFydGVtIEJpdHl1dHNraXkgd3JvdGU6
DQo+IE9uIFdlZCwgMjAxMy0wMS0xNiBhdCAxMjoyMiArMDAwMCwgUGhpbGlwLCBBdmluYXNoIHdy
b3RlOg0KPiA+ID4gVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gbGludXggMy44LXJjMiBhbmQgdGVz
dGVkIHdpdGggWzFdLg0KPiA+ID4gQWxzbyB0aGlzIHBhdGNoIHNlcmllcyBkZXBlbmQgb24gWzFd
IGZvciBOQU5EIGZsYXNoIGRldmljZQ0KPiA+ID4gdHJlZSBkYXRhIGFuZCBncG1jIG5hbmQgZGV2
aWNlIHRyZWUgYmluZGluZyBkb2N1bWVudGF0aW9uIHVwZGF0ZXMuDQo+ID4gPiANCj4gPiA+IDEu
IFtQQVRDSCB2NyAwLzVdIE9NQVAgR1BNQyBEVCBiaW5kaW5ncw0KPiA+ID4gaHR0cDovL3d3dy5z
cGluaWNzLm5ldC9saXN0cy9saW51eC1vbWFwL21zZzgzNTA1Lmh0bWwNCj4gPiA+IA0KPiA+ID4g
VGVzdGVkIG9uIGFtMzM1eC1ldm0gZm9yIEJDSCA0IGFuZCA4IGJpdCBlcnJvciBjb3JyZWN0aW9u
Lg0KPiA+IA0KPiA+IENhbiB5b3UgYXBwbHkgdGhpcyBwYXRjaCBzZXJpZXMgb24gbDItbXRkIHRy
ZWUgYXMgaXQgd2lsbCBoZWxwIFJCTCBjb21wYXRpYmlsaXR5DQo+ID4gZWNjIGxheW91dCBmb3Ig
TkFORCBmbGFzaCBpbiBhbTMzNXgtcGxhdGZvcm1zIGFuZCBoYXJkd2FyZSBiYXNlZCBCQ0ggZXJy
b3INCj4gPiBjb3JyZWN0aW9uLg0KPiANCj4gT0ssIEkndmUgYXBwbGllZCB0aGVtLiBJIGRyb3Bw
ZWQgdGhlIHBhcnQgdGhhdCB1cGRhdGVzIHRoZQ0KPiBkb2N1bWVudGF0aW9uLiBQbGVhc2UsIGhh
bmRsZSBpdCBzZXBhcmF0ZWx5IHdoZW4gRGFuaWVsJ3MgcGF0Y2hlcyBhcmUNCj4gaW4uDQo+IA0K
PiBQdXNoZWQgdG8gbDItbXRkLmdpdCwgdGhhbmtzIQ0KDQpUaGFua3MgZm9yIGFwcGx5aW5nIHRo
aXMgcGF0Y2ggc2VyaWVzLg0KSSB3aWxsIHVwZGF0ZSBncG1jLW5hbmQgZG9jdW1lbnRhdGlvbiBw
YXJ0IGluIGEgc2VwYXJhdGUgcGF0Y2guDQoNClRoYW5rcywNCkF2aW5hc2gNCg0KPiANCj4gLS0g
DQo+IEJlc3QgUmVnYXJkcywNCj4gQXJ0ZW0gQml0eXV0c2tpeQ0KPiANCg0K
