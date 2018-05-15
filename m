Received: from mail1.bemta12.messagelabs.com ([216.82.251.10])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIjBV-00005x-EE
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 23:16:47 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "PACKHAM
 Chris" <chris.packham@alliedtelesis.co.nz>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "richard@nod.at" <richard@nod.at>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>
Subject: RE: [PATCH v3] mtd: cfi_cmdset_0002: Change write buffer to check
 correct value
Date: Tue, 15 May 2018 23:16:28 +0000
Message-ID: <TY1PR01MB0954345930962BAB71C037C9DC930@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <TY1PR01MB0954946451074852ED6D5C8FDC9F0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <1b71023b0bee95d86739bb9c62767fa4579ceadb.camel@infinera.com>
 <TY1PR01MB095460AF2CF409DBDA1354EFDC930@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <2d4162ade8f4559b5ec90d4e575a593f9de32405.camel@infinera.com>
 <TY1PR01MB0954F99A60324130F6BE4112DC930@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <51f23b5e418cf661c5241dde84622b33ede5862c.camel@infinera.com>
In-Reply-To: <51f23b5e418cf661c5241dde84622b33ede5862c.camel@infinera.com>
Content-Language: ja-JP
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

SGkgSm9ja2Utc2FuLA0KDQpUaGFua3MgZm9yIHRoZSBjb21tZW50cy4NCk5vdGVkIGl0Lg0KSSBh
bSBoYXBweSB3aXRoIGl0Oy0pDQoNClJlZ2FyZHMsDQpJa2VnYW1pDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9ha2ltIFRqZXJubHVuZCBbbWFpbHRvOkpvYWtpbS5U
amVybmx1bmRAaW5maW5lcmEuY29tXQ0KPiBTZW50OiBXZWRuZXNkYXksIE1heSAxNiwgMjAxOCAy
OjE3IEFNDQo+IFRvOiBib3Jpcy5icmV6aWxsb25AYm9vdGxpbi5jb207IElLRUdBTUkgVG9rdW5v
cmkNCj4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOyBQQUNLSEFNIENocmlzOw0K
PiBjeXJpbGxlLnBpdGNoZW5Ad2VkZXY0dS5mcjsgZHdtdzJAaW5mcmFkZWFkLm9yZzsNCj4gY29t
cHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tOyBib3Jpcy5icmV6aWxsb25AZnJlZS1lbGVjdHJvbnMu
Y29tOw0KPiByaWNoYXJkQG5vZC5hdDsgbWFyZWsudmFzdXRAZ21haWwuY29tDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjNdIG10ZDogY2ZpX2NtZHNldF8wMDAyOiBDaGFuZ2Ugd3JpdGUgYnVmZmVy
IHRvDQo+IGNoZWNrIGNvcnJlY3QgdmFsdWUNCj4gDQo+IE9uIFR1ZSwgMjAxOC0wNS0xNSBhdCAx
Njo0OSArMDAwMCwgSUtFR0FNSSBUb2t1bm9yaSB3cm90ZToNCj4gPg0KPiA+IEhpIEpvY2tlLXNh
biwNCj4gDQo+IEhpIElrZWdhbWktc2FuLA0KPiANCj4gPg0KPiA+ID4gVGhlbiBJIGdvdCByZWFs
bHkgY3VyaW91cywgZG9zIHRoZSBzYW1lIHdvcmsgZm9yIHlvdXIgZXJhc2UgcHJvYmxlbT8NCj4g
PiA+IFJlcGxhY2UgY2hpcF9yZWFkeSguLi4pIHdpdGggY2hpcF9nb29kKG1hcCwgYWRyLCBtYXBf
d29yZF9mZihtYXApID8NCj4gPiA+IERvbid0IHlvdSBoYXZlIGFueSBzdGF0dXMgYml0cyB3aGVu
IGVyYXNlL3dyaXRlIGZhaWxzPw0KPiA+DQo+ID4gICBZZXMgdGhpcyBhbHNvIHlvdSBhcmUgcmln
aHQuDQo+ID4gICBJIGhhdmUganVzdCB0ZXN0ZWQgdGhlIGVmZmVjdCBhcyBiZWxvdy4NCj4gPiAg
IFRoZSBmbGFzaCBlcmFzZSBlcnJvciBhbHNvIGRvZXMgbm90IG9jY3VyIGJ5IGNoZWNraW5nIGNo
aXBfZ29vZA0KPiBpbnN0ZWFkIG9mIGNoaXBfcmVhZHkuDQo+ID4gICBUaGlzIGhhcyBiZWVuIHRl
c3RlZCBieSB0aGUgc2FtZSByZXByb2R1Y3Rpb24gbWV0aG9kLg0KPiA+ICAgSXQgbG9va3MgdGhh
dCB0aGUgZmxhc2ggZXJhc2UgZXJyb3IgaXMgYWxzbyBhYmxlIHRvIGJlIHJlc29sdmVkIGJ5DQo+
IGNoaXBfZ29vZC4NCj4gPiAgIFNvIEkgd2lsbCBkbyB1cGRhdGUgdGhlIHBhdGNoIHNlcmllcyB0
byBjaGFuZ2UgdXNlIGNoaXBfZ29vZCBpbnN0ZWFkDQo+IG9mIGNoaXBfcmVhZHkuDQo+ID4gICBC
dXQgdG8gbWFrZSBzdXJlIEkgd291bGQgbGlrZSByZW1haW4gdGhlIGNoYW5nZXMgdG8gcmV0cnkg
dGhlIGVycm9yLg0KPiA+ICAgQWxzbyBJIHdpbGwgY29tYmluZSB0aGUgY2hhbmdlcyBmb3IgdGhl
IGZsYXNoIHdyaXRlIGVycm9yIGFsc28gYXMNCj4gc2FtZSBzZXJpZXMuDQo+IA0KPiBOaWNlIDop
IEkganVzdCBoYWQgYSBsb29rIGF0IGNoaXBfZ29vZCgpIGFuZCBzYXcgdGhhdCBpdCBpcyBhY3R1
YWxseSBib3RoDQo+IHRvZ2dsZSBhbmQgRFE3LCBiZWx0IGFuZCBzdXNwZW5kZXJzIDopDQo+IEkg
dGhvdWdodCBjaGlwX2dvb2QoKSB3YXMgb25seSBEUTcsIGFueWhvdywgSSBndWVzcyB0aGlzIG1h
a2VzIHRoZSB0ZXN0DQo+IHZlcnkgcm9idXN0IGJ1dCBhIGJpdCBzbG93Lg0KPiANCj4gPg0KPiA+
IFJlZ2FyZHMsDQo+ID4gSWtlZ2FtaQ0KPiA+DQo=
