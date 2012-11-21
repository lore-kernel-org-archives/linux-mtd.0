Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tb4Kh-0007qw-BA
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 07:02:54 +0000
From: "Philip, Avinash" <avinashphilip@ti.com>
To: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>
Subject: RE: [PATCH v2 0/3] mtd: nand: OMAP: ELM error correction support
 for BCH ecc
Date: Wed, 21 Nov 2012 07:01:25 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3E9EC70D@DBDE01.ent.ti.com>
References: <1351667307-447-1-git-send-email-avinashphilip@ti.com>
 <1352978534.2221.33.camel@sauron.fi.intel.com>
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

T24gTW9uLCBOb3YgMTksIDIwMTIgYXQgMTg6MTM6NTYsIFBoaWxpcCwgQXZpbmFzaCB3cm90ZToN
Cj4gDQo+IE9uIFRodSwgTm92IDE1LCAyMDEyIGF0IDE2OjUyOjE0LCBBcnRlbSBCaXR5dXRza2l5
IHdyb3RlOg0KPiA+IE9uIFdlZCwgMjAxMi0xMC0zMSBhdCAxMjozOCArMDUzMCwgUGhpbGlwLCBB
dmluYXNoIHdyb3RlOg0KPiA+ID4gU3VwcG9ydCB0byB1c2UgRUxNIGFzIEJDSCA0ICYgOCBiaXQg
ZXJyb3IgY29ycmVjdGlvbiBtb2R1bGUuIEFsc28gcGVyZm9ybWFuY2UNCj4gPiA+IGVuaGFuY2Vt
ZW50IGJ5IGFkZGluZyBzaW5nbGUgc2hvdCByZWFkX3BhZ2UgYW5kIHdyaXRlX3BhZ2UgZnVuY3Rp
b25zIGZvciB0aGUNCj4gPiA+IG5hbmQgZmxhc2hlcyB3aXRoIHBhZ2Ugc2l6ZSBsZXNzIHRoYW4g
NCBLQi4NCj4gPiA+IA0KPiA+ID4gRUxNIG1vZHVsZSBjYW4gYmUgdXNlZCB0byBjb3JyZWN0IGVy
cm9ycyByZXBvcnRlZCBieSBCQ0ggNCwgOCAmIDE2IGJpdA0KPiA+ID4gRUNDIHNjaGVtZS4gRm9y
IG5vdyBvbmx5IDQgJiA4IGJpdCBzdXBwb3J0IGlzIGFkZGVkLg0KPiA+ID4gDQo+ID4gPiBCQ0gg
NCAmIDggYml0IGVycm9yIGRldGVjdGlvbiBzdXBwb3J0IGlzIGFscmVhZHkgYXZhaWxhYmxlIGlu
IG1haW5saW5lDQo+ID4gPiBrZXJuZWwgYW5kIHdvcmtzIHdpdGggc29mdHdhcmUgZXJyb3IgY29y
cmVjdGlvbi4NCj4gPiA+IA0KPiA+ID4gVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gWzFdIGFuZCB0
ZXN0ZWQgd2l0aCBSRkM6IE9NQVAgR1BNQyBiaW5kaW5ncw0KPiA+ID4gcGF0Y2ggc2VyaWVzDQo+
ID4gPiANCj4gPiA+IDEuIGxpbnV4LW5leHQvMjAxMjEwMzANCj4gPiANCj4gPiBXb3VsZCB5b3Ug
cGxlYXNlIHJlLXNlbmQgYSB2ZXJzaW9uIHdoaWNoIGNsZWFubHkgYXBwbGllcyB0byB0aGUNCj4g
PiBsMi1tdGQuZ2l0IHRyZWU/IFRoaXMgc2VyaWVzIGhhcyBtYW55IGNvbmZsaWN0cy4gVGhhbmtz
IQ0KPiANCj4gQXJ0ZW0sDQo+IA0KPiBPbWFwIG5hbmQgZHJpdmVyIGlzIGJlaW5nIGNoYW5nZWQg
Y29uc2lkZXJhYmx5IHdpdGggQWZ6YWwncyBvbWFwLWdwbWMgY2xlYW51cA0KPiBzZXJpZXMgZm9y
IGNvbW1vbiBhcm0gekltYWdlIFsyXSBhbmQgdGhvc2UgY2hhbmdlcyBtb3ZlIG1hbnkNCj4gb2Yg
dGhlIG5hbmQgcmVsYXRlZCBjb2RlIGZyb20gcGxhdGZvcm0gZm9sZGVycyB0byBvbWFwIG5hbmQg
ZHJpdmVyLg0KPiANCj4gT21hcC1ncG1jIGNoYW5nZXMgYXJlIHByZXNlbnQgaW4gVG9ueSdzICIg
b21hcC1mb3ItdjMuOC9jbGVhbnVwLWhlYWRlcnMtZ3BtYyINCj4gYnJhbmNoIFszXWFuZCBpcyBw
cmVzZW50IGluIGxpbnV4LW5leHQgYWxzbywgYnV0IGlzIG5vdCBwcmVzZW50IGluIGwyLW10ZC4N
Cj4gVG9ueSBoYXMgc2lnbmVkIHRhZyBpbmNsdWRpbmcgb21hcC1ncG1jIGNsZWFudXAgc2VyaWVz
LA0KPiAib21hcC1mb3ItdjMuOC9jbGVhbnVwLWhlYWRlcnMtcHJlcGFyZS1tdWx0aXBsYXRmb3Jt
LXYzLXNpZ25lZCIgWzRdDQo+IA0KPiBJZiB0aGlzIHNlcmllcyBpcyBtYWRlIG92ZXIgbDItbXRk
LCBhbmQgaXQgd291bGQgY2F1c2UgbG90IG9mIGNvbmZsaWN0DQo+IHdpdGggb21hcC1ncG1jIGNs
ZWFudXAgc2VyaWVzLg0KPiANCj4gSSBhbSBub3Qgc3VyZSBob3cgdGhpcyBkZXBlbmRlbmN5IGhh
cyB0byBiZSBoYW5kbGVkIGZvciB0aGlzIHNlcmllcywNCj4gbGV0IG1lIGtub3cgd2hldGhlciB5
b3Ugc3RpbGwgd2FudCBpdCB0byBiZSBtYWRlIG92ZXIgbDItbXRkPw0KDQpBcnRlbSwNCg0KSXMg
aXQgcG9zc2libGUgZm9yIHlvdSB0byBnaXZlIGFjayBmb3IgdGhlc2UgcGF0Y2hlcyBzbyB0aGF0
IHRoZXNlIHBhdGNoZXMNCmNhbiBnbyBpbiBUb255J3MgdHJlZSB3aGVyZSBPbWFwLWdwbWMgY2hh
bmdlcyBhcmUgcHJlc2VudD8NCg0KVGhhbmtzDQpBdmluYXNoDQo+IA0KPiAyLiBodHRwOi8vbWFy
a21haWwub3JnL21lc3NhZ2UvZXY2N3dtN2lyZ2MycWM1ZCNxdWVyeTorcGFnZToxK21pZDp3Z2pk
djZmc2ZnaG51YTV6K3N0YXRlOnJlc3VsdHMNCj4gMy4gaHR0cDovL2dpdC5rZXJuZWwub3JnLz9w
PWxpbnV4L2tlcm5lbC9naXQvdG1saW5kL2xpbnV4LW9tYXAuZ2l0O2E9c2hvcnRsb2c7aD1yZWZz
L2hlYWRzL29tYXAtZm9yLXYzLjgvY2xlYW51cC1oZWFkZXJzLWdwbWMNCj4gNC4gaHR0cDovL2dp
dC5rZXJuZWwub3JnLz9wPWxpbnV4L2tlcm5lbC9naXQvdG1saW5kL2xpbnV4LW9tYXAuZ2l0O2E9
dGFnO2g9cmVmcy90YWdzL29tYXAtZm9yLXYzLjgvY2xlYW51cC1oZWFkZXJzLXByZXBhcmUtbXVs
dGlwbGF0Zm9ybS12My1zaWduZWQNCj4gDQo+IA0KPiBUaGFua3MNCj4gQXZpbmFzaA0KPiANCj4g
PiANCj4gPiBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vycy9kZWRla2luZC9sMi1tdGQuZ2l0
DQo+ID4gDQo+ID4gLS0gDQo+ID4gQmVzdCBSZWdhcmRzLA0KPiA+IEFydGVtIEJpdHl1dHNraXkN
Cj4gPiANCj4gDQo+IA0KDQo=
