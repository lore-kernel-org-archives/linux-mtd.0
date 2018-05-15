Received: from mail1.bemta12.messagelabs.com ([216.82.251.13])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fId8c-00085c-EN
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 16:49:25 +0000
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
Date: Tue, 15 May 2018 16:49:06 +0000
Message-ID: <TY1PR01MB0954F99A60324130F6BE4112DC930@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <TY1PR01MB0954946451074852ED6D5C8FDC9F0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <1b71023b0bee95d86739bb9c62767fa4579ceadb.camel@infinera.com>
 <TY1PR01MB095460AF2CF409DBDA1354EFDC930@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <2d4162ade8f4559b5ec90d4e575a593f9de32405.camel@infinera.com>
In-Reply-To: <2d4162ade8f4559b5ec90d4e575a593f9de32405.camel@infinera.com>
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

SGkgSm9ja2Utc2FuLA0KDQo+IFRoZW4gSSBnb3QgcmVhbGx5IGN1cmlvdXMsIGRvcyB0aGUgc2Ft
ZSB3b3JrIGZvciB5b3VyIGVyYXNlIHByb2JsZW0/DQo+IFJlcGxhY2UgY2hpcF9yZWFkeSguLi4p
IHdpdGggY2hpcF9nb29kKG1hcCwgYWRyLCBtYXBfd29yZF9mZihtYXApID8NCj4gRG9uJ3QgeW91
IGhhdmUgYW55IHN0YXR1cyBiaXRzIHdoZW4gZXJhc2Uvd3JpdGUgZmFpbHM/DQoNCiAgWWVzIHRo
aXMgYWxzbyB5b3UgYXJlIHJpZ2h0Lg0KICBJIGhhdmUganVzdCB0ZXN0ZWQgdGhlIGVmZmVjdCBh
cyBiZWxvdy4NCiAgVGhlIGZsYXNoIGVyYXNlIGVycm9yIGFsc28gZG9lcyBub3Qgb2NjdXIgYnkg
Y2hlY2tpbmcgY2hpcF9nb29kIGluc3RlYWQgb2YgY2hpcF9yZWFkeS4NCiAgVGhpcyBoYXMgYmVl
biB0ZXN0ZWQgYnkgdGhlIHNhbWUgcmVwcm9kdWN0aW9uIG1ldGhvZC4NCiAgSXQgbG9va3MgdGhh
dCB0aGUgZmxhc2ggZXJhc2UgZXJyb3IgaXMgYWxzbyBhYmxlIHRvIGJlIHJlc29sdmVkIGJ5IGNo
aXBfZ29vZC4NCiAgU28gSSB3aWxsIGRvIHVwZGF0ZSB0aGUgcGF0Y2ggc2VyaWVzIHRvIGNoYW5n
ZSB1c2UgY2hpcF9nb29kIGluc3RlYWQgb2YgY2hpcF9yZWFkeS4NCiAgQnV0IHRvIG1ha2Ugc3Vy
ZSBJIHdvdWxkIGxpa2UgcmVtYWluIHRoZSBjaGFuZ2VzIHRvIHJldHJ5IHRoZSBlcnJvci4NCiAg
QWxzbyBJIHdpbGwgY29tYmluZSB0aGUgY2hhbmdlcyBmb3IgdGhlIGZsYXNoIHdyaXRlIGVycm9y
IGFsc28gYXMgc2FtZSBzZXJpZXMuDQoNClJlZ2FyZHMsDQpJa2VnYW1pDQoNCg==
