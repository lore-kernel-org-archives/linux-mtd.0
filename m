Received: from mail-db3on0079.outbound.protection.outlook.com ([157.55.234.79]
 helo=emea01-db3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMXbK-0001n4-Ka
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2016 09:01:53 +0000
From: Yao Yuan <yao.yuan@nxp.com>
To: Han Xu <xhnjupt@gmail.com>, Yuan Yao <yao.yuan@freescale.com>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, "han.xu@freescale.com" <han.xu@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: mtd: spi-nor: fsl-quadspi: add support for ls1021a
Date: Fri, 22 Jan 2016 09:01:26 +0000
Message-ID: <AM2PR04MB072287A0E9C83F507FDF282389C40@AM2PR04MB0722.eurprd04.prod.outlook.com>
References: <1453362836-44377-1-git-send-email-yao.yuan@freescale.com>
 <CA+EcR20=OaZOOPMKVys-NDbTeXhEDCzre8L_vv53s+Ukv3XQLw@mail.gmail.com>
In-Reply-To: <CA+EcR20=OaZOOPMKVys-NDbTeXhEDCzre8L_vv53s+Ukv3XQLw@mail.gmail.com>
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

T24gVGh1LCBKYW4gMjEsIDIwMTYgYXQgMTE6NDIgUE0sIEhhbiBYdSA8IHhobmp1cHRAZ21haWwu
Y29tID4gd3JvdGU6DQo+IE9uIFRodSwgSmFuIDIxLCAyMDE2IGF0IDE6NTMgQU0sIFl1YW4gWWFv
IDx5YW8ueXVhbkBmcmVlc2NhbGUuY29tPiB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIHNldCBpcyB1
c2VkIGZvciBhZGQgdGhlIGZzbC1xdWFkc3BpIHN1cHBvcnQgZm9yIGxzMTAyMWEgYW5kDQo+ID4g
bHMxMDQzYSwgc28gcmVtb3ZlIHRoZSBwYXRjaDoNCj4gPiBtdGQ6IHNwaS1ub3I6IGZzbC1xdWFk
c3BpOiBleHRlbmQgc3VwcG9ydCBmb3Igc29tZSBzcGVjaWFsIHJlcXVlcm1lbnQuDQo+IA0KPiBQ
bGVhc2UgdXNlIC0tY292ZXItbGV0dGVyIHRvIGdlbmVyYXRlIGNvdmVyIGxldHRlci4NCj4gDQo+
ID4NCj4gPiBUaGlzIHBhdGNoIHdpbGwgYmUgc2VuZCB3aXRoIGFudGhlciBwYXRjaCBzZXQgZm9y
IGFkZCBRU1BJIHN1cHBvcnQgb24gTFMyMDgwQS4NCj4gPg0KPiA+IEFsbCB0aGUgbmV3IHByb3Bl
cnR5IGFyZSBkb2N1bWVudCBpbiBhbnRoZXIgcGF0Y2ggc2V0IHdoaWNoIGlzIGFscmVhZHkNCj4g
PiBzZW5kIHRvIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgYW5kIGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnLg0KPiA+IEhlcmUgaXMgdGhlIHBhdGNoIG5hbWU6DQo+ID4gMDAwMS1Eb2N1
bWVudGF0aW9uLWZzbC1xdWFkc3BpLUFkZC1mc2wtbHMyMDgwYS1kc3BpLWNvbXBhLnBhdGNoDQo+
ID4gMDAwMi1Eb2N1bWVudGF0aW9uLWZzbC1xdWFkc3BpLUFkZC1mc2wtbHMyMDgwYS1xc3BpLWNv
bXBhLnBhdGNoDQo+ID4gMDAwMy1kdHMtbHMyMDgwYS11cGRhdGUtdGhlLURUUy1mb3ItUVNQSS1h
bmQtRFNQSS1zdXBwb3J0LnBhdGNoDQo+ID4gMDAwNC1Eb2N1bWVudGF0aW9uLWZzbC1xdWFkc3Bp
LUFkZC1vcHRpb25hbC1wcm9wZXJ0aWVzLnBhdGNoDQo+ID4NCj4gPiBBbnkgZXh0cmEgaW5mb3Jt
YXRpb24geW91IGNhbiBmaW5kIHRoZW0gb24gdGhlIHBhdGNod29yazoNCj4gPiBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3BhdGNoLzgwNzg5MzEvDQo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wYXRjaC84MDc4OTUxLw0KPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcGF0Y2gvODA3OTA5MS8NCj4gPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNo
LzgwNzg5NDEvDQo+IA0KPiBQbGVhc2Ugc2VuZCBhbGwgcGF0Y2hlcyBpbiBvbmUgcGF0Y2ggc2V0
LCB0aGlzIGlzIG5vdCBhY2NlcHRhYmxlLg0KPiANCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4N
CkJ1dCB0aG9zZSBwYXRjaGVzIGFyZSBkdHMgYmluZGluZyBwYXRjaC4gQW5kIHdpbGwgc2VuZCB0
byAgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcgYW5kIHNvbWUgY29ycmVzcG9uZGluZyBtYWlu
dGFpbmVyLg0KDQpUaG9zZSB0d28gcGF0Y2ggc2V0cyB3aWxsIHNlbmQgdG8gZGlmZmVyZW50IG1h
aWwtbGlzdCBhbmQgbWFpbnRhaW5lcnMgc2VwYXJhdGVseS4NCg0KU28sIG1heWJlIGl0J3MgYmV0
dGVyIHRvIHNlbmQgdGhlIHBhdGNoIHRvIHRoZSBtYWludGFpbmVyIGFjY29yZGluZ2x5IGFuZCB0
aHVzIEkgdGhpbmsgY2FuIGFsc28gcmVkdWNlIHRoZSB3b3JrbG9hZCBvZiBtYWludGFpbmVyLg0K
DQpIb3cgYWJvdXQgeW91ciB0aGluaz8NCg0KVGhhbmtzLg0KDQpZdWFuIFlhby4NCg==
