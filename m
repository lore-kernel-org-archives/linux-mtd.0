Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VkwBU-0006pc-FK
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2013 13:26:41 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: RE: [PATCH] mtd: nand: auto-detection of NAND bus-width from ONFI
 param or nand_id[]
Date: Mon, 25 Nov 2013 13:26:11 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA4E675@DBDE04.ent.ti.com>
References: <1385382728-7913-1-git-send-email-pekon@ti.com>
 <20131125125647.GF2408@localhost>
In-Reply-To: <20131125125647.GF2408@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgRXplcXVpZWwsDQoNCg0KPiBGcm9tOiBFemVxdWllbCBHYXJjaWEgW21haWx0bzplemVxdWll
bC5nYXJjaWFAZnJlZS1lbGVjdHJvbnMuY29tXQ0KPiBUaGFua3MgZm9yIHRha2luZyBjYXJlIG9m
IHRoaXMhIDotKQ0KPiANClllcywgSSB3YXMgd2FpdGluZyBmb3IgLXJjMSB0byBiZSBUSS1HUE1D
IGRyaXZlciB3aGljaCBzdGlsbCBnZXRzIGNvbmZpZ3VyZWQNCmZyb20gRFQgaW5kZXBlbmRlbnRs
eS4gSG93ZXZlciB0aGF04oCZcyBhIHNlcGFyYXRlIGRpc2N1c3Npb24gYWxyZWFkeQ0KZ29pbmcg
aW4geW91ciBlYXJsaWVyIHRocmVhZC4NCg0KDQo+ID4gT24gTW9uLCBOb3YgMjUsIDIwMTMgYXQg
MDY6MDI6MDhQTSArMDUzMCwgUGVrb24gR3VwdGEgd3JvdGU6DQpbLi4uXQ0KPiA+ICsNCj4gPiAr
CS8qIHJlLWNvbmZpZ3VyZSBkcml2ZXIgaXMgYnVzLXdpZHRoIHdhcyBpbmNvcnJlY3RseSBjb25m
aWd1cmVkICovDQo+ID4gKwlpZiAoYnVzdyAhPSAoY2hpcC0+b3B0aW9ucyAmIE5BTkRfQlVTV0lE
VEhfMTYpKSB7DQo+ID4gKwkJcHJfd2FybigicmVjb25maWd1cmluZyBOQU5EIGJ1cyB3aWR0aCB0
byAlZCBpbnN0ZWFkICVkDQo+IGJpdFxuIiwNCj4gPiArCQkJICAgYnVzdyA/IDE2IDogOCwNCj4g
PiArCQkJICAgKGNoaXAtPm9wdGlvbnMgJiBOQU5EX0JVU1dJRFRIXzE2KSA/IDE2IDogOCk7DQo+
ID4gKwkJY2hpcC0+b3B0aW9ucyA9IChjaGlwLT5vcHRpb25zICYgfk5BTkRfQlVTV0lEVEhfMTYp
IHwNCj4gYnVzdzsNCj4gDQo+IExvb2tpbmcgYXQgdGhpcyBtYWtlcyBtZSB3b25kZXIgd2h5IGFy
ZSB3ZSAqcmUqIGNvbmZpZ3VyaW5nLCBpbnN0ZWFkIG9mDQo+IGp1c3QgY29uZmlndXJpbmcuIEkg
bWVhbiwgd2h5IGRvIHdlIGtlZXAgdGhlIE5BTkRfQlVTV0lEVEhfMTYgc2V0dGluZz8NCj4gDQo+
IFdoYXQgdXNlIGNhc2UgbWlnaHQgbmVlZCB0aGUgdXNlciB0byBzZXQgaXQsIGJlZm9yZSBoYW5k
Pw0KPiANCk5vdGhpbmcuLiBJIGp1c3Qgc2FpZCByZWNvbmZpZ3VyaW5nLCBiY296IHNvbWUgZHJp
dmVyIGFscmVhZHkgY29uZmlndXJlDQonY2hpcC0+b3B0aW9ucyAmIE5BTkRfQlVTV0lEVEhfMTYn
IHByZS1oYW5kIGJlZm9yZSBjYWxsaW5nDQpuYW5kX3NjYW5faWRlbnQoKS4gU28sIEkgd2FudGVk
IHRvIGNvbnZleSB0aGF0IHRoaXMgcGF0Y2ggc2hvdWxkIG5vdA0KYWZmZWN0IGFueSBvZiB0aGVp
ciBmdW5jdGlvbmFsaXR5LiBBbmQgbm8gY2hhbmdlIGlzIHNob3VsZCBiZSByZXF1aXJlZC4NCg0K
TmVlZCB0aGlzIHRvIGdldCB0ZXN0ZWQgd2l0aCAtdmUgdGVzdGluZyBvbiBkaWZmZXJlbnQgYm9h
cmRzLi4gDQoobGlrZSBzZXR0aW5nIGluLWNvcnJlY3QgRFQgYmluZGluZyBuYW5kLWJ1cy13aWR0
aCBhbmQgZHJpdmVyIHNob3VsZCBzdGlsbA0KYmUgYWJsZSB0byBkZXRlY3QgYW5kIHByb2JlIE9O
RkkgcGFyYW1zKSBUaGVuIG9ubHkgaXQgcHJvdmVzIHRoYXQgdGhpcw0KcGF0Y2ggaXMgYWN0dWFs
bHkgYXV0by1kZXRlY3RpbmcgYnVzLXdpZHRoIHVuZGVyIGFsbCBjYXNlcyBmb3IgYWxsIGNvbnRy
b2xsZXJzLg0KDQoNCndpdGggcmVnYXJkcywgcGVrb24NCg==
