From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, "David Woodhouse
 (dwmw2@infradead.org)" <dwmw2@infradead.org>
Subject: RE: [PATCH] mtd: nand: auto-detection of NAND bus-width from ONFI
 param or nand_id[]
Date: Tue, 26 Nov 2013 07:59:07 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA4ECB8@DBDE04.ent.ti.com>
References: <1385382728-7913-1-git-send-email-pekon@ti.com>
 <20131125125647.GF2408@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA4E675@DBDE04.ent.ti.com>
 <20131125145217.GA14485@localhost>
In-Reply-To: <20131125145217.GA14485@localhost>
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

DQo+IEZyb206IEV6ZXF1aWVsIEdhcmNpYSBbbWFpbHRvOmV6ZXF1aWVsLmdhcmNpYUBmcmVlLWVs
ZWN0cm9ucy5jb21dDQpbLi4uXQ0KPiBNeSBwb2ludCBpczogd2h5IGRvbid0IHdlICpyZW1vdmUq
IHRoZSBkZXZpY2V0cmVlIHByb3BlcnR5IG5hbmQtYnVzLQ0KPiB3aWR0aCBhbmQgDQo+IA0KV2Ug
Y2Fubm90IHJlbW92ZSBEVCBwcm9wZXJ0eSBsaWtlIHRoaXMsIHdlIGNhbiBvbmx5IGRlcHJlY2F0
ZSBpdHMgdXNlLA0Kd2hpbGUgbm90IGJyZWFraW5nIHRoZSBmdW5jdGlvbmFsaXR5LCB3aGljaCBp
cyB3aGF0IEknbSB0cnlpbmcgaGVyZS4uDQpUbyBjb21wbGV0ZWx5IHJlbW92ZSBhIERUIGJpbmRp
bmcgaXQgbmVlZHMgYXBwcm92YWwgYW5kIEFjayBieSBEVA0KbWFpbnRhaW5lcnMuIEFuZCBvdmVy
IHRoYXQgRFQgYmluZGluZyBoYXMgdG9vIHN0aWxsIHJlbWFpbiBkZXByZWNhdGVkIGZvcg0Kc29t
ZXRpbWUgdGlsbCBhbGwgdXNlcnMgaGF2ZSBtaWdyYXRlZCB0byBuZXdlciB2ZXJzaW9uIG9mIGtl
cm5lbC4NCihob3BlIHlvdSByZW1lbWJlciByZXZpZXdzIG9mIG15IGVhcmxpZXIgb21hcC1uYW5k
IHBhdGNoZXMgd2hpY2gNCnVwZGF0ZWQgZmV3IERUIGJpbmRpbmdzIDotKSApLi4uDQoNCkhvd2V2
ZXIgdGhlcmUgc2hvdWxkIGJlIHNvbWUgbGlmZXRpbWUgYXNzb2NpYXRlZCB3aXRoIERUIGJpbmRp
bmdzLA0KSSBoZWFyZCBEYXZpZCBXLiBwYXJ0aWNpcGF0ZWQgaW4gc29tZSBEVCBiaW5kaW5nIHJl
bGF0ZWQgZGlzY3Vzc2lvbiBpbg0Kc29tZSBsaW51eCBjb25mZXJlbmNlLiBNYXkgYmUgaGUgY2Fu
IHRocm93IG1vcmUgbGlnaHQgb24gImhvdyB0byANCnBoYXNlIG91dCB1bnVzZWQgRFQgYmluZGlu
Z3M/Ig0KDQoNCj4gdGhlIE5BTkRfQlVTV0lEVEhfMTYgZW50aXJlbHksIHRvZ2V0aGVyIHdpdGgg
dGhpcyBwYXRjaD8NCj4gDQpXZSBuZWVkIHRoaXMgTWFjcm9zLCBhcyBtYXkgZHJpdmVyIHVzZSB0
aGlzIGFmdGVyIG5hbmRfc2Nhbl9pZGVudCgpDQp0byBjb25maWd1cmUgdGhlaXIgY3VzdG9tIGNh
bGxiYWNrcyBsaWtlOg0KCWlmIChjaGlwLT5vcHRpb25zICYgTkFORF9CVVNXSURUSF8xNikNCgkJ
Y2hpcC0+cmVhZF9idWYgPSBvbWFwX3JlYWRfYnVmMTY7DQoJZWxzZSANCgkJY2hpcC0+cmVhZF9i
dWYgPSBvbWFwX3JlYWRfYnVmODsNCg0KDQo+IFNvdW5kcyBsaWtlIHRoZSB1c2VyIHNob3VsZG4n
dCBuZWVkIHRvIG1lc3Mgd2l0aCBhbnkgb2YgdGhlc2UsIHNpbmNlIHdlDQo+IGFyZSBhYmxlIHRv
IGF1dG8tY29uZmlndXJlIHRoaW5ncyBmb3IgaGltLg0KPiANClllcywgZW5kLXVzZXIgaXMgZnJl
ZS4uIEJ1dCBkcml2ZXIgc3RpbGwgbmVlZHMgdG8geDE2IGFuZCB4OCBpbmZvcm1hdGlvbg0KdG8g
ZG8gc29tZSBjb250cm9sbGVyIGxldmVsIG9wdGltaXphdGlvbnMuLg0KDQoNCndpdGggcmVnYXJk
cywgcGVrb24NCg==
