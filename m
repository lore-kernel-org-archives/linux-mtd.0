Received: from devils.ext.ti.com ([198.47.26.153])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PpfsK-0006uI-Kv
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2011 11:48:54 +0000
From: "Rajashekhara, Sudhakar" <sudhakar.raj@ti.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>, "Dharmappa, Savinay"
	<savinay.dharmappa@ti.com>
Date: Wed, 16 Feb 2011 17:19:00 +0530
Subject: RE: [PATCH v4 1/2] mtd: NOR flash driver for OMAP-L137/AM17x
Message-ID: <B85A65D85D7EB246BE421B3FB0FBB5930248AAF048@dbde02.ent.ti.com>
References: <1291111325-25784-1-git-send-email-savinay.dharmappa@ti.com>
	<1291261815.14534.14.camel@koala>
In-Reply-To: <1291261815.14534.14.camel@koala>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Aleksey Makarov <amakarov@ru.mvista.com>,
	Sergei Shtylyov <sshtylyov@ru.mvista.com>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Griego <dgriego@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGksDQoNCk9uIFRodSwgRGVjIDAyLCAyMDEwIGF0IDA5OjIwOjE1LCBBcnRlbSBCaXR5dXRza2l5
IHdyb3RlOg0KPiBPbiBUdWUsIDIwMTAtMTEtMzAgYXQgMTU6MzIgKzA1MzAsIFNhdmluYXkgRGhh
cm1hcHBhIHdyb3RlOg0KPiA+IEZyb206IERhdmlkIEdyaWVnbyA8ZGdyaWVnb0BtdmlzdGEuY29t
Pg0KPiA+IA0KPiA+IE9NQVAtTDEzNy9BTTE3eCBoYXMgbGltaXRlZCBudW1iZXIgb2YgZGVkaWNh
dGVkIEVNSUZBIGFkZHJlc3MgcGlucywgDQo+ID4gZW5vdWdoIHRvIGludGVyZmFjZSBkaXJlY3Rs
eSB0byBhbiBTRFJBTS4NCj4gPiBJZiBhIGRldmljZSBzdWNoIGFzIGFuIGFzeW5jaHJvbm91cyBm
bGFzaCBuZWVkcyB0byBiZSBhdHRhY2hlZCB0byB0aGUgDQo+ID4gRU1JRkEsIHRoZW4gZWl0aGVy
IEdQSU8gcGlucyBvciBhIGNoaXAgc2VsZWN0IG1heSBiZSB1c2VkIHRvIGNvbnRyb2wgDQo+ID4g
dGhlIGZsYXNoIGRldmljZSdzIHVwcGVyIGFkZHJlc3MgbGluZXMuDQo+ID4gDQo+ID4gVGhpcyBw
YXRjaCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBOT1IgZmxhc2ggb24gdGhlIE9NQVAtTDEzNy8gQU0x
N3ggdXNlciANCj4gPiBpbnRlcmZhY2UgZGF1Z2h0ZXIgYm9hcmQgdXNpbmcgdGhlIGxhdGNoLWFk
ZHItZmxhc2ggTVREIG1hcHBpbmcgZHJpdmVyIA0KPiA+IHdoaWNoIGFsbG93cyBmbGFzaGVzIHRv
IGJlIHBhcnRpYWxseSBwaHlzaWNhbGx5IGFkZHJlc3NlZC4gVGhlIHVwcGVyIA0KPiA+IGFkZHJl
c3MgbGluZXMgYXJlIHNldCBieSBhIGJvYXJkIHNwZWNpZmljIGNvZGUgd2hpY2ggaXMgYSBzZXBh
cmF0ZSANCj4gPiBwYXRjaC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBHcmllZ28g
PGRncmllZ29AbXZpc3RhLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGVrc2V5IE1ha2Fyb3Yg
PGFtYWthcm92QHJ1Lm12aXN0YS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2VyZ2VpIFNodHls
eW92IDxzc2h0eWx5b3ZAcnUubXZpc3RhLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYXZpbmF5
IERoYXJtYXBwYSA8c2F2aW5heS5kaGFybWFwcGFAdGkuY29tPg0KPiANCj4gUHVzaGVkIHRoZXNl
IHRvIGwyLW10ZC0yLjYuZ2l0LCB0aGFua3MuDQo+IA0KDQpJIGRvIG5vdCBzZWUgdGhlc2UgcGF0
Y2hlcyBpbiBMaW51cydzIHRyZWUgWzFdIG9yIGF0IGwyLW10ZC0yLjYuZ2l0IHRyZWUgWzJdLg0K
SXMgdGhlcmUgYW55IHRyZWUgd2hlcmUgdGhlc2UgcGF0Y2hlcyBhcmUgYXZhaWxhYmxlPw0KDQpb
MV0gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LTIuNi5naXQNClsyXSBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vycy9kZWRla2lu
ZC9sMi1tdGQtMi42LmdpdA0KDQpUaGFua3MsDQpTdWRoYWthcg0K
