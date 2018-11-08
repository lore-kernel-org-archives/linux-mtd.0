Received: from mail-ty1jpn01on0713.outbound.protection.outlook.com
 ([2a01:111:f400:fe9d::713]
 helo=JPN01-TY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKhbC-0001qh-BL
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 10:31:44 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Richard Weinberger <richard@nod.at>, Boris
 Brezillon <boris.brezillon@bootlin.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Marek
 Vasut <marek.vasut@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, linux-spi <linux-spi@vger.kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, MTD Maling List
 <linux-mtd@lists.infradead.org>, Chris Paterson
 <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 3/4] ARM: dts: r8a77470: Add QSPI support
Date: Thu, 8 Nov 2018 10:31:12 +0000
Message-ID: <TY1PR01MB1770AD277B0A1C5DF1776F60C0C50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1541075705-1333-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1541075705-1333-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181102114946.5tqk2lyisaey475w@verge.net.au>
 <TY1PR01MB1770FA3764370E7AEA5D30C6C0C50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdX=L9d=1dq24WErcjYLv987=yKL2K7hxnS7hhsZpbKEBA@mail.gmail.com>
In-Reply-To: <CAMuHMdX=L9d=1dq24WErcjYLv987=yKL2K7hxnS7hhsZpbKEBA@mail.gmail.com>
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

SGVsbG8gR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDMvNF0gQVJNOiBkdHM6IHI4YTc3NDcwOiBBZGQgUVNQSSBzdXBwb3J0DQo+
DQo+IEhpIEZhYnJpemlvLA0KPg0KPiBPbiBUaHUsIE5vdiA4LCAyMDE4IGF0IDExOjIyIEFNIEZh
YnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToN
Cj4gPiA+IEZyb206IFNpbW9uIEhvcm1hbiA8aG9ybXNAdmVyZ2UubmV0LmF1Pg0KPiA+ID4gU2Vu
dDogMDIgTm92ZW1iZXIgMjAxOCAxMTo1MA0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzRd
IEFSTTogZHRzOiByOGE3NzQ3MDogQWRkIFFTUEkgc3VwcG9ydA0KPiA+ID4NCj4gPiA+IE9uIFRo
dSwgTm92IDAxLCAyMDE4IGF0IDEyOjM1OjA0UE0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90
ZToNCj4gPiA+ID4gQWRkIFFTUElbMDFdIHN1cHBvcnQgdG8gdGhlIFJaL0cxQyBTb0Mgc3BlY2lm
aWMgZGV2aWNlIHRyZWUuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlv
IENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiAtLS0NCj4g
PiA+ID4gIGFyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDcwLmR0c2kgfCAzNCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0
aW9ucygrKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMv
cjhhNzc0NzAuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDcwLmR0c2kNCj4gPiA+ID4g
aW5kZXggZTY0MDdlNS4uMDRhODg3NyAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvcjhhNzc0NzAuZHRzaQ0KPiA+ID4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9yOGE3
NzQ3MC5kdHNpDQo+ID4gPiA+IEBAIC0yMCw2ICsyMCw4IEBADQo+ID4gPiA+ICBpMmMyID0gJmky
YzI7DQo+ID4gPiA+ICBpMmMzID0gJmkyYzM7DQo+ID4gPiA+ICBpMmM0ID0gJmkyYzQ7DQo+ID4g
PiA+ICtzcGkwID0gJnFzcGkwOw0KPiA+ID4gPiArc3BpMSA9ICZxc3BpMTsNCj4gPiA+ID4gIH07
DQo+ID4gPg0KPiA+ID4gR2VlcnQgY2FuIGNvbW1lbnQgYnV0IEkgYmVsaWV2ZSB3ZSBhcmUgbW92
aW5nIGF3YXkgZnJvbSB1c2luZyBhbGlhc2VzDQo+ID4gPiBpbiB0aGlzIHdheSBhbmQgdGhhdCBp
dCB3b3VsZCBiZSBiZXN0IGlmIHRoZSBhYm92ZSBodW5rIHdhcyBkcm9wcGVkDQo+ID4gPiBmcm9t
IHRoaXMgcGF0Y2guDQo+ID4gPg0KPiA+ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
YXRjaC8xMDY0NDE1OS8NCj4gPg0KPiA+IEdlZXJ0LCB3aGF0IGRvIHlvdSB3YW50IG1lIHRvIGRv
IGhlcmU/DQo+DQo+IFBsZWFzZSBkcm9wIHRoZSBhbGlhc2VzLiBUaGFua3MhDQoNCldpbGwgZG8s
IHdpbGwgc2VuZCBhIG5ldyB2ZXJzaW9uIHdpdGhvdXQgdGhlIGFkZGl0aW9uYWwgYWxpYXNlcy4N
Ck15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB5b3VyIHBlcnNvbmFsIHByZWZlcmVuY2UgaXMgdG8g
b25seSBsZWF2ZSBkZWJ1ZyBjb25zb2xlIGFuZCBldGhlcm5ldCwNCnNoYWxsIEkgYWxzbyAgZ2V0
IHJpZCBvZiB3aGF0IHdhcyBhbHJlYWR5IHVwc3RyZWFtZWQgZm9yIFJaL0cgcmVsYXRlZCBib2Fy
ZHMgdGhhdCBpcyBub3QgaW4gbGluZQ0Kd2l0aCB0aGUgbmV3IHBvbGljeT8NCg0KVGhhbmtzLA0K
RmFiDQoNCj4NCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+DQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIEdlZXJ0DQo+DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4NCj4gSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg0KDQoNClJlbmVzYXMgRWxlY3Ry
b25pY3MgRXVyb3BlIEx0ZCwgRHVrZXMgTWVhZG93LCBNaWxsYm9hcmQgUm9hZCwgQm91cm5lIEVu
ZCwgQnVja2luZ2hhbXNoaXJlLCBTTDggNUZILCBVSy4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5kICYg
V2FsZXMgdW5kZXIgUmVnaXN0ZXJlZCBOby4gMDQ1ODY3MDkuDQo=
