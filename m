Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWQua-0005q8-BB
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2017 16:59:09 +0000
From: "Langer, Thomas" <thomas.langer@intel.com>
To: Seb <sebtx452@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Subject: RE: [PATCH] mtd: maps: lantiq-flash: Check if the EBU endianness
 swap is enabled
Date: Wed, 25 Jan 2017 16:58:44 +0000
Message-ID: <0DAF21CFE1B20740AE23D6AF6E54843F1E6F607C@IRSMSX101.ger.corp.intel.com>
References: <1484904834-14980-1-git-send-email-sebtx452@gmail.com>
 <3304d64f-38aa-1a3c-0b5d-edb493abd61a@hauke-m.de>
 <CA+hF=GdKLEN2ue=Q7KpBp+W+bTnj5O_OAoPjuDOScga2efnjPA@mail.gmail.com>
In-Reply-To: <CA+hF=GdKLEN2ue=Q7KpBp+W+bTnj5O_OAoPjuDOScga2efnjPA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PiBIZWxsbywNCg0KSGkgU2ViYXN0aWFuDQoNCj4gDQo+IA0KPiA+IEkgd291bGQgcHJlZmVyIHRv
IHVzZSBhIGRldmljZSB0cmVlIG9wdGlvbiB0byBhY3RpdmF0ZSB0aGlzIGNoZWNrIGFuZA0KPiA+
IG9ubHkgYWNjZXNzIExUUV9FQlVfQlVTQ09OMCB3aGVuIHRoaXMgcHJvcGVydHkgaXMgc2V0Lg0K
PiANCj4gSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgSSBoYXZlIHRvIG1ha2Ugc29tZXRoaW5n
IGxpa2UgdGhpcyA6DQo+IA0KPiAtLS0NCj4gDQo+IGJvb2wgbXRkX2FkZHJfc3dhcD10cnVlOw0K
PiANCj4gICAgICAgICBpZiAoIW9mX21hY2hpbmVfaXNfY29tcGF0aWJsZSgibGFudGlxLGZhbGNv
biIpICYmDQo+ICAgICAgICAgICAgICAgICBvZl9maW5kX3Byb3BlcnR5KHBkZXYtPmRldi5vZl9u
b2RlLA0KPiAibGFudGlxLGVidV9zd2FwX2NoZWNrIiwgTlVMTCkpDQo+ICAgICAgICAgICAgICAg
ICBpZiAobHRxX2VidV9yMzIoTFRRX0VCVV9CVVNDT04wKSAmIEVCVV9GTEFTSF9FTkRJQU5fU1dB
UCkNCj4gICAgICAgICAgICAgICAgICAgICAgICAgbXRkX2FkZHJfc3dhcCA9IGZhbHNlOw0KPiAN
Cg0KTm8sIHBsZWFzZSBhdm9pZCAib2ZfbWFjaGluZV9pc19jb21wYXRpYmxlIiBpbiBkcml2ZXJz
Lg0KDQo+IC0tLQ0KPiANCj4gQW5kIHRoZW4gc2V0IHRoaXMgcHJvcGVydHkgZGlyZWN0bHkgb24g
bXkgZGV2aWNlLXNwZWNpZmljIGR0cyBmaWxlID8NCg0KV2Ugc2hvdWxkIGludHJvZHVjZSBzcGVj
aWZpYyBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIHRoaXMgZHJpdmVyLCB3aGljaCB0cmlnZ2VyIHRo
aXMsDQplLmcuICJsYW50aXEsbm9yLXZyOSIgb3IgImxhbnRpcSxub3ItYXIxMCIgKG9yIGJldHRl
ciB1c2luZyBmYW1pbHkgbmFtZXMgInhyeDIwMCIgYW5kICJ4cngzMDAiKQ0KDQpSZWdhcmRzLA0K
VGhvbWFzDQo=
