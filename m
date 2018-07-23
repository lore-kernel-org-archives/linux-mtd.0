Received: from mail-eopbgr80109.outbound.protection.outlook.com
 ([40.107.8.109] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhd0p-00015R-BJ
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 15:44:40 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "corbet@lwn.net" <corbet@lwn.net>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "krzk@kernel.org" <krzk@kernel.org>, "hsweeten@visionengravers.com"
 <hsweeten@visionengravers.com>, "boris.brezillon@bootlin.com"
 <boris.brezillon@bootlin.com>, "gregory.clement@bootlin.com"
 <gregory.clement@bootlin.com>, "vz@mleia.com" <vz@mleia.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: fix spelling in driver api documentation
Date: Mon, 23 Jul 2018 15:44:17 +0000
Message-ID: <1532360655.18760.2.camel@toradex.com>
References: <20180720075334.24254-1-marcel@ziswiler.com>
 <20180723093924.04af0e2f@lwn.net>
In-Reply-To: <20180723093924.04af0e2f@lwn.net>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3FA34BB246340429689E5A5F6E7908B@eurprd05.prod.outlook.com>
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

T24gTW9uLCAyMDE4LTA3LTIzIGF0IDA5OjM5IC0wNjAwLCBKb25hdGhhbiBDb3JiZXQgd3JvdGU6
DQo+IE9uIEZyaSwgMjAgSnVsIDIwMTggMDk6NTM6MzMgKzAyMDANCj4gTWFyY2VsIFppc3dpbGVy
IDxtYXJjZWxAemlzd2lsZXIuY29tPiB3cm90ZToNCj4gDQo+ID4gRnJvbTogTWFyY2VsIFppc3dp
bGVyIDxtYXJjZWwuemlzd2lsZXJAdG9yYWRleC5jb20+DQo+ID4gDQo+ID4gVGhpcyBmaXhlcyBz
b21lIHNwZWxsaW5nIG1pc3Rha2VzLg0KPiANCj4gU28gSSBoYXRlIHRvIGNvbXBsYWluIGFib3V0
IGEgZG9jdW1lbnRhdGlvbiBpbXByb3ZlbWVudCwgYnV0Li4uDQo+IA0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29tPg0K
PiA+IA0KPiA+IC0tLQ0KPiA+IA0KPiA+ICBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvbXRkbmFu
ZC5yc3QgfCA0ICsrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kcml2ZXIt
YXBpL210ZG5hbmQucnN0DQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvbXRkbmFuZC5y
c3QNCj4gPiBpbmRleCBkY2Q2MzU5OWY3MDAuLmM1NWE2MDM0YzM5NyAxMDA2NDQNCj4gPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvbXRkbmFuZC5yc3QNCj4gPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RyaXZlci1hcGkvbXRkbmFuZC5yc3QNCj4gPiBAQCAtMzc0LDcgKzM3NCw3IEBAIFRo
ZSBuYW5kIGRyaXZlciBzdXBwb3J0cyB0aHJlZSBkaWZmZXJlbnQgdHlwZXMNCj4gPiBvZiBoYXJk
d2FyZSBFQ0MuDQo+ID4gIA0KPiA+ICAtICBOQU5EX0VDQ19IVzhfNTEyDQo+ID4gIA0KPiA+IC0g
ICBIYXJkd2FyZSBFQ0MgZ2VuZXJhdG9yIHByb3ZpZGluZyA2IGJ5dGVzIEVDQyBwZXIgNTEyIGJ5
dGUuDQo+ID4gKyAgIEhhcmR3YXJlIEVDQyBnZW5lcmF0b3IgcHJvdmlkaW5nIDggYnl0ZXMgRUND
IHBlciA1MTIgYnl0ZS4NCj4gDQo+IFRoYXQncyBub3QgYSBzcGVsbGluZyBtaXN0YWtlLCB0aGF0
J3MgYSBmYWN0dWFsIGNoYW5nZS4gIEknbGwgYXBwbHkNCj4gdGhlDQo+IHBhdGNoIHNpbmNlIGl0
IGFwcGVhcnMgdG8gYmUgY29ycmVjdCwgYnV0IHdpbGwgYmUgdHdlYWtpbmcgdGhlDQo+IGNoYW5n
ZWxvZy4NCg0KWWVhaCwgcHJvYmFibHkgYSBjb3B5L3Bhc3RlIG1pc3Rha2UuIE5vIHB1biBpbnRl
bmRlZC4NCg0KPiBUaGFua3MsDQo+IA0KPiBqb24=
