Received: from mail-sn1nam01on0108.outbound.protection.outlook.com
 ([104.47.32.108] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eWS5g-0002HS-Eh
 for linux-mtd@lists.infradead.org; Tue, 02 Jan 2018 19:19:14 +0000
From: Trent Piepho <tpiepho@impinj.com>
To: "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>
CC: "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "radu.pirea@microchip.com" <radu.pirea@microchip.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: atmel-quadspi: add an optional
 property 'dmacap,memcpy'
Date: Tue, 2 Jan 2018 19:18:58 +0000
Message-ID: <1514920738.26695.171.camel@impinj.com>
References: <cover.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <143542c61ca674d53da4985bbabc142e8e6ebefc.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <20171226232330.trljk2ofyvu4ly3n@rob-hp-laptop>
 <0149ba05-64b1-2739-e61f-78d5170775fb@wedev4u.fr>
 <20180102102234.GG2612@rfolt0960.corp.atmel.com>
In-Reply-To: <20180102102234.GG2612@rfolt0960.corp.atmel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3810E1B0D4C84545933E0F2072FEFB05@namprd06.prod.outlook.com>
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

T24gVHVlLCAyMDE4LTAxLTAyIGF0IDExOjIyICswMTAwLCBMdWRvdmljIERlc3JvY2hlcyB3cm90
ZToNCj4gT24gV2VkLCBEZWMgMjcsIDIwMTcgYXQgMTA6NDA6MDBQTSArMDEwMCwgQ3lyaWxsZSBQ
aXRjaGVuIHdyb3RlOg0KPiANCj4gPiBPciBtYXliZSBubyBjaGFuZ2UgYXQgYWxsIGlzIHJlcXVp
cmVkIGF0IHRoZSBhdF94ZG1hYy5jIGRyaXZlciBzaWRlOiB3ZQ0KPiA+IGp1c3QgZG9uJ3QgY2Fy
ZSBhYm91dCB0aGUgcHJvdmlkZWQgZmxhZ3MgaW4gdGhlICJkbWFzIiBwcm9wZXJ0eSwgZXNwZWNp
YWxseQ0KPiA+IHRoZSAicGVyaXBoZXJhbCBpZCIuIFRoZXkgd291bGQgYmUgaWdub3JlZCBhbnl3
YXkgd2hlbiB0aGUgYXRtZWwtcXVhZHNwaS5jDQo+ID4gZHJpdmVyIGxhdGVyIGNhbGxzIGRtYWVu
Z2luZV9wcmVwX2RtYV9tZW1jcHkoKS4gU28gSSBjb3VsZCBzaW1wbHkgc2V0IHRoZQ0KPiA+IGRt
YSBjZWxscyB0byAwIGluIHRoZSBkZXZpY2UtdHJlZT8NCj4gPiANCj4gPiBMdWRvdmljLCB3aGF0
IGRvIHlvdSB0aGluayBhYm91dCB0aGF0ID8NCj4gDQo+IEl0IG1heSB3b3JrIGJ1dCBJIHdvbid0
IGRvIHRoaXMuIFVzdWFsbHksIGNoYW5uZWxzIHJlcXVlc3RlZCB0aHJvdWdoIHRoZSB4bGF0ZQ0K
PiBmdW5jdGlvbiBoYXZlIHVzdWFsbHkgdGhlaXIgY2FwYWlibGl0aWVzIHNldCB0byBETUFfU0xB
VkUgYW5kIG5vdCBETUFfTUVNQ1BZLg0KPiBJbiB0aGUgYXRfeGRtYWMgY2FzZSwgaXQgd29uJ3Qg
YmUgYW4gaXNzdWUgYnV0IGlmIHlvdSBoYXZlIGEgY29udHJvbGxlcg0KPiB3aGljaCBoYXMgY2hh
bm5lbHMgd2hpY2ggY2FuIHN1cHBvcnQgb25seSBtZW0tdG8tbWVtIG9yIHBlcmlwaGVyYWwsIGl0
DQo+IHdvbid0IHdvcmsuDQoNCk1heWJlIG9uZSBjb3VsZCBjcmVhdGUgYW4gIkFUOTFfWERNQUNf
RFRfIiBtYWNybyB0byBpbmRpY2F0ZSBhIG1lbWNweQ0KY2hhbm5lbC4gIFRoZXJlIGFyZSBzdGls
bCB1bnVzZWQgYml0cyBmb3IgYW5vdGhlciBmbGFnLiAgSXQgYWxzbyBsb29rcw0KbGlrZSBhdF94
ZG1hIHVzZXMgcGVyaXBoZXJhbCBpZCAweDNmIGZvciBtZW1jcHkgdHJhbnNmZXJzICh3aWxsIHRo
YXQNCndvcmsgd2l0aCBtZW1jcHkgRE1BIG9uIG11bHRpcGxlIGNoYW5uZWxzIGF0IHRoZSBzYW1l
IHRpbWU/KS4gIFNvDQpwZXJoYXBzIHBlcmlkIDB4M2YgY291bGQgYmUgdGhlIGluZGljYXRpb24g
b2Ygd2FudGluZyBhIG1lbWNweSBjaGFubmVsLA0KcmF0aGVyIHRoYW4gYW5vdGhlciBmbGFnIGJp
dC4gIEJ1dCBob3dldmVyIGl0J3MgZG9uZSwgb25lIHdyaXRlczoNCg0KZG1hcyA9IDwmZG1hMCBB
VDkxX1hETUFDX0RUX01FTUNQWT47IGRtYS1uYW1lcyA9ICJyeC10eCI7DQoNCkkgdGhpbmsgb25l
IGNvdWxkIGhhdmUgdGhlIHF1YWRzcGkgZHJpdmVyIGF1dG9tYXRpY2FsbHkgZmlsbCBpbiB0aGUg
ZG1hDQpjZWxsIGluIHRoZSBkbWEgc3BlY2lmaWVyIGlmIGl0IGlzIG5vdCBwcmVzZW50IGluIHRo
ZSBkZXZpY2UgdHJlZS4gIFNvDQpvbmUgY291bGQgd3JpdGUgImRtYXMgPSA8JmRtYTA+IiBhbmQg
dGhlIGRyaXZlciBhZGRzIHRoZQ0KQVQ5MV9YRE1BQ19EVF9NRU1DUFkgY2VsbCBiZWZvcmUgeGxh
dGluZy4gIEknbSBub3Qgc3VyZSBpZiB0aGF0J3MgYQ0KZ29vZCBpZGVhIG9yIG5vdC4=
