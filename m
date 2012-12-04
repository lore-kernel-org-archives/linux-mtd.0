Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TfsNh-00041e-MQ
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2012 13:17:50 +0000
From: "Philip, Avinash" <avinashphilip@ti.com>
To: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>
Subject: RE: [PATCH v2 3/3] mtd: nand: omap2: Support for hardware BCH error
 correction
Date: Tue, 4 Dec 2012 13:16:27 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3EA108A9@DBDE01.ent.ti.com>
References: <1351667307-447-1-git-send-email-avinashphilip@ti.com>
 <1351667307-447-4-git-send-email-avinashphilip@ti.com>
 <1354278480.30168.116.camel@sauron.fi.intel.com>
In-Reply-To: <1354278480.30168.116.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "Mohammed, Afzal" <afzal@ti.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>,
 "Nori, Sekhar" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hebbar,
 Gururaja" <gururaja.hebbar@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "rmk+kernel@arm.linux.org.uk" <rmk+kernel@arm.linux.org.uk>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T24gRnJpLCBOb3YgMzAsIDIwMTIgYXQgMTc6NTg6MDAsIEFydGVtIEJpdHl1dHNraXkgd3JvdGU6
DQo+IE9uIFdlZCwgMjAxMi0xMC0zMSBhdCAxMjozOCArMDUzMCwgUGhpbGlwLCBBdmluYXNoIHdy
b3RlOg0KPiA+ICtzdGF0aWMgaW50IGVyYXNlZF9zZWN0b3JfYml0ZmxpcHModV9jaGFyICpkYXRh
LCB1X2NoYXIgKm9vYiwNCj4gPiArICAgICAgICAgICAgICAgc3RydWN0IG9tYXBfbmFuZF9pbmZv
ICppbmZvKQ0KPiA+ICt7DQo+ID4gKyAgICAgICBpbnQgZmxpcF9iaXRzID0gMCwgaTsNCj4gPiAr
DQo+ID4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgaW5mby0+bmFuZC5lY2Muc2l6ZTsgaSsrKSB7
DQo+ID4gKyAgICAgICAgICAgICAgIGZsaXBfYml0cyArPSBod2VpZ2h0OCh+ZGF0YVtpXSk7DQo+
ID4gKyAgICAgICAgICAgICAgIGlmIChmbGlwX2JpdHMgPiBpbmZvLT5uYW5kLmVjYy5zdHJlbmd0
aCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gPiArICAgICAgIH0N
Cj4gPiArDQo+ID4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgaW5mby0+bmFuZC5lY2MuYnl0ZXMg
LSAxOyBpKyspIHsNCj4gPiArICAgICAgICAgICAgICAgZmxpcF9iaXRzICs9IGh3ZWlnaHQ4KH5v
b2JbaV0pOw0KPiA+ICsgICAgICAgICAgICAgICBpZiAoZmxpcF9iaXRzID4gaW5mby0+bmFuZC5l
Y2Muc3RyZW5ndGgpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ID4g
KyAgICAgICB9DQo+IA0KPiBXaHkgZG8geW91IG5lZWQgdGhlIHNlY29uZCBmb3IgbG9vcD8NCg0K
QkNIIGVjYyBpcyBzZWxmIHByb3RlY3RlZCAmIGNhbiBjb3JyZWN0IGJpdCBmbGlwcyBpbiBlY2Mg
Ynl0ZXMuDQpTbyBoZXJlIGNoZWNraW5nIGJpdCBmbGlwcyBpbiByZWFkX2VjYy4gSSB3aWxsIHJl
bmFtZSB2YXJpYWJsZQ0KIm9vYiIgdG8gInJlYWRfZWNjIg0KDQpUaGFua3MNCkF2aW5hc2gNCg0K
PiANCj4gLS0gDQo+IEJlc3QgUmVnYXJkcywNCj4gQXJ0ZW0gQml0eXV0c2tpeQ0KPiANCg0K
