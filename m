Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TaQjS-0003dZ-JT
 for linux-mtd@lists.infradead.org; Mon, 19 Nov 2012 12:45:48 +0000
From: "Philip, Avinash" <avinashphilip@ti.com>
To: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>
Subject: RE: [PATCH v2 0/3] mtd: nand: OMAP: ELM error correction support
 for BCH ecc
Date: Mon, 19 Nov 2012 12:44:22 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3E9E8178@DBDE01.ent.ti.com>
References: <1351667307-447-1-git-send-email-avinashphilip@ti.com>
 <1352978534.2221.33.camel@sauron.fi.intel.com>
In-Reply-To: <1352978534.2221.33.camel@sauron.fi.intel.com>
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

DQpPbiBUaHUsIE5vdiAxNSwgMjAxMiBhdCAxNjo1MjoxNCwgQXJ0ZW0gQml0eXV0c2tpeSB3cm90
ZToNCj4gT24gV2VkLCAyMDEyLTEwLTMxIGF0IDEyOjM4ICswNTMwLCBQaGlsaXAsIEF2aW5hc2gg
d3JvdGU6DQo+ID4gU3VwcG9ydCB0byB1c2UgRUxNIGFzIEJDSCA0ICYgOCBiaXQgZXJyb3IgY29y
cmVjdGlvbiBtb2R1bGUuIEFsc28gcGVyZm9ybWFuY2UNCj4gPiBlbmhhbmNlbWVudCBieSBhZGRp
bmcgc2luZ2xlIHNob3QgcmVhZF9wYWdlIGFuZCB3cml0ZV9wYWdlIGZ1bmN0aW9ucyBmb3IgdGhl
DQo+ID4gbmFuZCBmbGFzaGVzIHdpdGggcGFnZSBzaXplIGxlc3MgdGhhbiA0IEtCLg0KPiA+IA0K
PiA+IEVMTSBtb2R1bGUgY2FuIGJlIHVzZWQgdG8gY29ycmVjdCBlcnJvcnMgcmVwb3J0ZWQgYnkg
QkNIIDQsIDggJiAxNiBiaXQNCj4gPiBFQ0Mgc2NoZW1lLiBGb3Igbm93IG9ubHkgNCAmIDggYml0
IHN1cHBvcnQgaXMgYWRkZWQuDQo+ID4gDQo+ID4gQkNIIDQgJiA4IGJpdCBlcnJvciBkZXRlY3Rp
b24gc3VwcG9ydCBpcyBhbHJlYWR5IGF2YWlsYWJsZSBpbiBtYWlubGluZQ0KPiA+IGtlcm5lbCBh
bmQgd29ya3Mgd2l0aCBzb2Z0d2FyZSBlcnJvciBjb3JyZWN0aW9uLg0KPiA+IA0KPiA+IFRoaXMg
c2VyaWVzIGlzIGJhc2VkIG9uIFsxXSBhbmQgdGVzdGVkIHdpdGggUkZDOiBPTUFQIEdQTUMgYmlu
ZGluZ3MNCj4gPiBwYXRjaCBzZXJpZXMNCj4gPiANCj4gPiAxLiBsaW51eC1uZXh0LzIwMTIxMDMw
DQo+IA0KPiBXb3VsZCB5b3UgcGxlYXNlIHJlLXNlbmQgYSB2ZXJzaW9uIHdoaWNoIGNsZWFubHkg
YXBwbGllcyB0byB0aGUNCj4gbDItbXRkLmdpdCB0cmVlPyBUaGlzIHNlcmllcyBoYXMgbWFueSBj
b25mbGljdHMuIFRoYW5rcyENCg0KQXJ0ZW0sDQoNCk9tYXAgbmFuZCBkcml2ZXIgaXMgYmVpbmcg
Y2hhbmdlZCBjb25zaWRlcmFibHkgd2l0aCBBZnphbCdzIG9tYXAtZ3BtYyBjbGVhbnVwDQpzZXJp
ZXMgZm9yIGNvbW1vbiBhcm0gekltYWdlIFsyXSBhbmQgdGhvc2UgY2hhbmdlcyBtb3ZlIG1hbnkN
Cm9mIHRoZSBuYW5kIHJlbGF0ZWQgY29kZSBmcm9tIHBsYXRmb3JtIGZvbGRlcnMgdG8gb21hcCBu
YW5kIGRyaXZlci4NCg0KT21hcC1ncG1jIGNoYW5nZXMgYXJlIHByZXNlbnQgaW4gVG9ueSdzICIg
b21hcC1mb3ItdjMuOC9jbGVhbnVwLWhlYWRlcnMtZ3BtYyINCmJyYW5jaCBbM11hbmQgaXMgcHJl
c2VudCBpbiBsaW51eC1uZXh0IGFsc28sIGJ1dCBpcyBub3QgcHJlc2VudCBpbiBsMi1tdGQuDQpU
b255IGhhcyBzaWduZWQgdGFnIGluY2x1ZGluZyBvbWFwLWdwbWMgY2xlYW51cCBzZXJpZXMsDQoi
b21hcC1mb3ItdjMuOC9jbGVhbnVwLWhlYWRlcnMtcHJlcGFyZS1tdWx0aXBsYXRmb3JtLXYzLXNp
Z25lZCIgWzRdDQoNCklmIHRoaXMgc2VyaWVzIGlzIG1hZGUgb3ZlciBsMi1tdGQsIGFuZCBpdCB3
b3VsZCBjYXVzZSBsb3Qgb2YgY29uZmxpY3QNCndpdGggb21hcC1ncG1jIGNsZWFudXAgc2VyaWVz
Lg0KDQpJIGFtIG5vdCBzdXJlIGhvdyB0aGlzIGRlcGVuZGVuY3kgaGFzIHRvIGJlIGhhbmRsZWQg
Zm9yIHRoaXMgc2VyaWVzLA0KbGV0IG1lIGtub3cgd2hldGhlciB5b3Ugc3RpbGwgd2FudCBpdCB0
byBiZSBtYWRlIG92ZXIgbDItbXRkPw0KDQoyLiBodHRwOi8vbWFya21haWwub3JnL21lc3NhZ2Uv
ZXY2N3dtN2lyZ2MycWM1ZCNxdWVyeTorcGFnZToxK21pZDp3Z2pkdjZmc2ZnaG51YTV6K3N0YXRl
OnJlc3VsdHMNCjMuIGh0dHA6Ly9naXQua2VybmVsLm9yZy8/cD1saW51eC9rZXJuZWwvZ2l0L3Rt
bGluZC9saW51eC1vbWFwLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFkcy9vbWFwLWZvci12My44
L2NsZWFudXAtaGVhZGVycy1ncG1jDQo0LiBodHRwOi8vZ2l0Lmtlcm5lbC5vcmcvP3A9bGludXgv
a2VybmVsL2dpdC90bWxpbmQvbGludXgtb21hcC5naXQ7YT10YWc7aD1yZWZzL3RhZ3Mvb21hcC1m
b3ItdjMuOC9jbGVhbnVwLWhlYWRlcnMtcHJlcGFyZS1tdWx0aXBsYXRmb3JtLXYzLXNpZ25lZA0K
DQoNClRoYW5rcw0KQXZpbmFzaA0KDQo+IA0KPiBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vy
cy9kZWRla2luZC9sMi1tdGQuZ2l0DQo+IA0KPiAtLSANCj4gQmVzdCBSZWdhcmRzLA0KPiBBcnRl
bSBCaXR5dXRza2l5DQo+IA0KDQo=
