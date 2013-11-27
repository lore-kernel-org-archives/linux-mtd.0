From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: RE: [PATCH] mtd: nand: auto-detection of NAND bus-width from ONFI
 param or nand_id[]
Date: Wed, 27 Nov 2013 06:03:50 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA4F44B@DBDE04.ent.ti.com>
References: <1385382728-7913-1-git-send-email-pekon@ti.com>
 <20131125125647.GF2408@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA4E675@DBDE04.ent.ti.com>
 <20131125145217.GA14485@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA4ECB8@DBDE04.ent.ti.com>
 <20131126124251.GB2344@localhost>
In-Reply-To: <20131126124251.GB2344@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Brian
 Norris <computersforpeace@gmail.com>,
 "David Woodhouse \(dwmw2@infradead.org\)" <dwmw2@infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PiBGcm9tOiBFemVxdWllbCBHYXJjaWEgW21haWx0bzplemVxdWllbC5nYXJjaWFAZnJlZS1lbGVj
dHJvbnMuY29tXQ0KPiA+IE9uIFR1ZSwgTm92IDI2LCAyMDEzIGF0IDA3OjU5OjA3QU0gKzAwMDAs
IEd1cHRhLCBQZWtvbiB3cm90ZToNCj4gPiA+IEZyb206IEV6ZXF1aWVsIEdhcmNpYSBbbWFpbHRv
OmV6ZXF1aWVsLmdhcmNpYUBmcmVlLWVsZWN0cm9ucy5jb21dDQpbLi4uXQ0KPiA+ID4gdGhlIE5B
TkRfQlVTV0lEVEhfMTYgZW50aXJlbHksIHRvZ2V0aGVyIHdpdGggdGhpcyBwYXRjaD8NCj4gPiA+
DQo+ID4gV2UgbmVlZCB0aGlzIE1hY3JvcywgYXMgbWF5IGRyaXZlciB1c2UgdGhpcyBhZnRlciBu
YW5kX3NjYW5faWRlbnQoKQ0KPiA+IHRvIGNvbmZpZ3VyZSB0aGVpciBjdXN0b20gY2FsbGJhY2tz
IGxpa2U6DQo+ID4gCWlmIChjaGlwLT5vcHRpb25zICYgTkFORF9CVVNXSURUSF8xNikNCj4gPiAJ
CWNoaXAtPnJlYWRfYnVmID0gb21hcF9yZWFkX2J1ZjE2Ow0KPiA+IAllbHNlDQo+ID4gCQljaGlw
LT5yZWFkX2J1ZiA9IG9tYXBfcmVhZF9idWY4Ow0KPiA+DQo+ID4NCj4gPiA+IFNvdW5kcyBsaWtl
IHRoZSB1c2VyIHNob3VsZG4ndCBuZWVkIHRvIG1lc3Mgd2l0aCBhbnkgb2YgdGhlc2UsIHNpbmNl
IHdlDQo+ID4gPiBhcmUgYWJsZSB0byBhdXRvLWNvbmZpZ3VyZSB0aGluZ3MgZm9yIGhpbS4NCj4g
PiA+DQo+ID4gWWVzLCBlbmQtdXNlciBpcyBmcmVlLi4gQnV0IGRyaXZlciBzdGlsbCBuZWVkcyB0
byB4MTYgYW5kIHg4IGluZm9ybWF0aW9uDQo+ID4gdG8gZG8gc29tZSBjb250cm9sbGVyIGxldmVs
IG9wdGltaXphdGlvbnMuLg0KPiA+DQo+IA0KPiBSaWdodC4gU28sIHdlIHNob3VsZCBrZWVwIGl0
IGJ1dCByZW1vdmUgdGhlIGVmZmVjdCBvbiB0aGUgaW5pdGlhbA0KPiBjb25maWd1cmF0aW9uLiBB
RkFJQ1MsIHRoZSBidXMgd2lkdGggc2hvdWxkIGJlICpyZXBvcnRlZCogYnkgdGhlIE5BTkQNCj4g
Y29yZSBhbmQgdGhlbiBlYWNoIGRyaXZlciB3aWxsIGhhdmUgYWNjZXNzIHRvIHRoYXQgaW5mb3Jt
YXRpb24gdG8gc2V0DQo+IGFueSBhZGRpdGlvbmFsIGNvbmZpZ3VyYXRpb24uDQo+IA0KPiBPbiB0
aGUgb3RoZXIgc2lkZSwgbm8gZHJpdmVyIHNob3VsZCAqYWR2aXNlKiB0aGUgYnVzIHdpZHRoLg0K
PiANCj4gUmlnaHQ/DQoNClJpZ2h0IC4uIGJ1dCBzdGlsbCBtb3N0IGRyaXZlcnMgYXJlIHVzaW5n
IGNvbnZlbnRpb25hbCBhcHByb2FjaCBhbmQgaGFkIA0Kbm90IG1pZ3JhdGVkIHRvIE5BTkRfQlVT
V0lEVEhfQVVUTywgc28gdGhleSBzdGlsbCBzZXQgDQpjaGlwLT5vcHRpb25zICYgTkFORF9CVVNX
SURUSF8xNiBiZWZvcmUgY2FsbGluZyBuYW5kX3NjYW5faWRlbnQoKS4NClNvLCB3ZSBzaG91bGQg
c2ltcGx5IGlnbm9yZSB0aGF0LCBhbmQgbm90IHJldHVybiBlcnJvci4NCg0KDQpXaXRoIHJlZ2Fy
ZHMsIHBla29uDQo=
