Received: from mail-dm3nam03on0085.outbound.protection.outlook.com
 ([104.47.41.85] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIdZf-0004Db-SU
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 17:17:38 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "ikegami@allied-telesis.co.jp" <ikegami@allied-telesis.co.jp>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "chris.packham@alliedtelesis.co.nz" <chris.packham@alliedtelesis.co.nz>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
Subject: Re: [PATCH v3] mtd: cfi_cmdset_0002: Change write buffer to check
 correct value
Date: Tue, 15 May 2018 17:17:07 +0000
Message-ID: <51f23b5e418cf661c5241dde84622b33ede5862c.camel@infinera.com>
References: <TY1PR01MB0954946451074852ED6D5C8FDC9F0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <1b71023b0bee95d86739bb9c62767fa4579ceadb.camel@infinera.com>
 <TY1PR01MB095460AF2CF409DBDA1354EFDC930@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <2d4162ade8f4559b5ec90d4e575a593f9de32405.camel@infinera.com>
 <TY1PR01MB0954F99A60324130F6BE4112DC930@TY1PR01MB0954.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB0954F99A60324130F6BE4112DC930@TY1PR01MB0954.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B83647EE1E23E40AEACEA0B19D42196@namprd10.prod.outlook.com>
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

T24gVHVlLCAyMDE4LTA1LTE1IGF0IDE2OjQ5ICswMDAwLCBJS0VHQU1JIFRva3Vub3JpIHdyb3Rl
Og0KPiANCj4gSGkgSm9ja2Utc2FuLA0KDQpIaSBJa2VnYW1pLXNhbiwNCg0KPiANCj4gPiBUaGVu
IEkgZ290IHJlYWxseSBjdXJpb3VzLCBkb3MgdGhlIHNhbWUgd29yayBmb3IgeW91ciBlcmFzZSBw
cm9ibGVtPw0KPiA+IFJlcGxhY2UgY2hpcF9yZWFkeSguLi4pIHdpdGggY2hpcF9nb29kKG1hcCwg
YWRyLCBtYXBfd29yZF9mZihtYXApID8NCj4gPiBEb24ndCB5b3UgaGF2ZSBhbnkgc3RhdHVzIGJp
dHMgd2hlbiBlcmFzZS93cml0ZSBmYWlscz8NCj4gDQo+ICAgWWVzIHRoaXMgYWxzbyB5b3UgYXJl
IHJpZ2h0Lg0KPiAgIEkgaGF2ZSBqdXN0IHRlc3RlZCB0aGUgZWZmZWN0IGFzIGJlbG93Lg0KPiAg
IFRoZSBmbGFzaCBlcmFzZSBlcnJvciBhbHNvIGRvZXMgbm90IG9jY3VyIGJ5IGNoZWNraW5nIGNo
aXBfZ29vZCBpbnN0ZWFkIG9mIGNoaXBfcmVhZHkuDQo+ICAgVGhpcyBoYXMgYmVlbiB0ZXN0ZWQg
YnkgdGhlIHNhbWUgcmVwcm9kdWN0aW9uIG1ldGhvZC4NCj4gICBJdCBsb29rcyB0aGF0IHRoZSBm
bGFzaCBlcmFzZSBlcnJvciBpcyBhbHNvIGFibGUgdG8gYmUgcmVzb2x2ZWQgYnkgY2hpcF9nb29k
Lg0KPiAgIFNvIEkgd2lsbCBkbyB1cGRhdGUgdGhlIHBhdGNoIHNlcmllcyB0byBjaGFuZ2UgdXNl
IGNoaXBfZ29vZCBpbnN0ZWFkIG9mIGNoaXBfcmVhZHkuDQo+ICAgQnV0IHRvIG1ha2Ugc3VyZSBJ
IHdvdWxkIGxpa2UgcmVtYWluIHRoZSBjaGFuZ2VzIHRvIHJldHJ5IHRoZSBlcnJvci4NCj4gICBB
bHNvIEkgd2lsbCBjb21iaW5lIHRoZSBjaGFuZ2VzIGZvciB0aGUgZmxhc2ggd3JpdGUgZXJyb3Ig
YWxzbyBhcyBzYW1lIHNlcmllcy4NCg0KTmljZSA6KSBJIGp1c3QgaGFkIGEgbG9vayBhdCBjaGlw
X2dvb2QoKSBhbmQgc2F3IHRoYXQgaXQgaXMgYWN0dWFsbHkgYm90aA0KdG9nZ2xlIGFuZCBEUTcs
IGJlbHQgYW5kIHN1c3BlbmRlcnMgOikgDQpJIHRob3VnaHQgY2hpcF9nb29kKCkgd2FzIG9ubHkg
RFE3LCBhbnlob3csIEkgZ3Vlc3MgdGhpcyBtYWtlcyB0aGUgdGVzdCB2ZXJ5IHJvYnVzdCBidXQg
YSBiaXQgc2xvdy4gDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IElrZWdhbWkNCj4gDQo=
