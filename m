From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: RE: [PATCH v10 10/10] mtd: nand: omap: remove selection of BCH
 ecc-scheme via KConfig
Date: Wed, 23 Oct 2013 13:55:58 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA2A130@DBDE04.ent.ti.com>
References: <1382172254-12448-1-git-send-email-pekon@ti.com>
 <1382172254-12448-11-git-send-email-pekon@ti.com>
 <20131023134450.GE2458@localhost>
In-Reply-To: <20131023134450.GE2458@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "Pawel.Moll@arm.com" <Pawel.Moll@arm.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>, "Balbi,
 Felipe" <balbi@ti.com>, "robherring2@gmail.com" <robherring2@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "olof@lixom.net" <olof@lixom.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PiBGcm9tOiBFemVxdWllbCBHYXJjaWEgW21haWx0bzplemVxdWllbC5nYXJjaWFAZnJlZS1lbGVj
dHJvbnMuY29tXQ0KPiANCj4gR3VwdGEsDQo+IA0KUGxlYXNlIGNhbGwgbWUgJ1Bla29uJyA6LSkN
Cg0KWy4uLl0NCg0KPiANCj4gSSdtIHdvbmRlcmluZyBob3cgYXJlIHlvdSB0ZXN0aW5nIHRoaXMg
aW4geW91ciBTT0NfQU0zM1hYIGJvYXJkICh3aGljaA0KPiBpcyBub3QgQVJDSF9PTUFQMykuIFlv
dSBwcm9iYWJseSBoYXZlIEFSQ0hfT01BUDMgYWx3YXlzIHNlbGVjdGVkPw0KPiANClllcywgb21h
cDJwbHVzX2RlZmNvbmZpZyBpcyBhIHN1cGVyIHNldC4uDQphcmNoL2FybS9jb25maWdzL29tYXAy
cGx1c19kZWZjb25maWcgYXV0b21hdGljYWxseSBlbmFibGVzIEFSQ0hfT01BUDMuDQoNCj4gSU1P
LCBubyBuZWVkIHRvIGRlcGVuZCBvbiBhbnkgQVJDSF94eHgsIGp1c3QgbWFrZSBpdCBkZXBlbmQg
b24gdGhlDQo+IGRyaXZlciANCj4gb3B0aW9uIGl0c2VsZiwgd2hpY2ggYWxyZWFkeSBkZXBlbmRz
IG9uIEFSQ0hfT01BUDJQTFVTICh3aGljaCBpcyB0aGUNCj4gYmlnZ2VyIFNvQyBmYW1pbHkpLg0K
PiANCj4gQ2FyZSB0byBzZW5kIGEgb25lLXBhdGNoIGZpeCBmb3IgdGhhdCwgc28gdGhpcyAqaW5k
ZXBlbmRlbnQqIGJ1ZyBjYW4gYmUNCj4gdGFrZW4gYnkgQnJpYW4/IFBsZWFzZSBhZGQgbXkgUmVw
b3J0ZWQtYnkgd2hlbiB5b3UgZG8gc28uDQo+IA0KVGhhbmtzLiBJdCdzIGdvb2QgdG8gY2xlYW4g
dGhpcyBkZXBlbmRlbmN5Li4NClllcywgc3VyZWx5IEknbGwgc2VuZCBhIGluZGVwZW5kZW50IHBh
dGNoIHdpdGggeW91ciByZXBvcnRlZC1ieS4uDQoNCg0Kd2l0aCByZWdhcmRzLCBwZWtvbg0K
