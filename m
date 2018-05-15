Received: from mail-cys01nam02on0619.outbound.protection.outlook.com
 ([2a01:111:f400:fe45::619]
 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIXLU-0004SK-GV
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 10:38:18 +0000
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
Date: Tue, 15 May 2018 10:38:00 +0000
Message-ID: <2d4162ade8f4559b5ec90d4e575a593f9de32405.camel@infinera.com>
References: <TY1PR01MB0954946451074852ED6D5C8FDC9F0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <1b71023b0bee95d86739bb9c62767fa4579ceadb.camel@infinera.com>
 <TY1PR01MB095460AF2CF409DBDA1354EFDC930@TY1PR01MB0954.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB095460AF2CF409DBDA1354EFDC930@TY1PR01MB0954.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <62B30854651F4847B310839EFEF34D1B@namprd10.prod.outlook.com>
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

T24gVHVlLCAyMDE4LTA1LTE1IGF0IDA5OjA4ICswMDAwLCBJS0VHQU1JIFRva3Vub3JpIHdyb3Rl
Og0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBv
cmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4N
Cj4gDQo+IA0KPiBIaSBKb2NrZS1zYW4sDQo+IA0KPiBUaGFuayB5b3Ugc28gbXVjaCBmb3IgeW91
ciBjb21tZW50cy4NCj4gDQo+ID4gV2hhdCBnb2VzIG9uIGhlcmUsIEkgdGhpbmssIGlzIHRoYXQg
dGhlIFRvZ2dsZSBiaXQgaXMgbm90IHJlbGlhYmxlIGFuZA0KPiA+IGFkZGluZyBjaGlwX2dvb2Qo
KQ0KPiA+IGJhc2ljYWxseSB0ZXN0cyBEUTcgdG9vLg0KPiA+IElmIHRoYXQgaXMgdGhlIGNhc2Us
IG9uZSBzaG91bGQgb25seSBuZWVkIGNoaXBfZ29vZCgpLCBoYXZlIHlvdSB0ZXN0ZWQNCj4gPiB0
aGF0Pw0KPiA+IA0KPiA+IEluIGdlbmVyYWwgSSB0aGluayB0b2dnbGUgYml0IGlzIGF3a3dhcmQg
YW5kIG1vdmluZyB0byBEUTcgd291bGQgc2ltcGx5DQo+ID4gdGhpbmdzIG9uY2UNCj4gPiB0ZXN0
cyBmb3Igb3RoZXIgc3RhdHVzIGJpdHMgYXJlIGFkZGVkLg0KPiANCj4gICBZZXMgeW91IGFyZSBy
aWdodC4NCj4gICBTaW5jZSBJIGhhdmUganVzdCBjb25maXJtZWQgdGhhdCB0aGUgZmxhc2ggd3Jp
dGUgaXNzdWUgY2FuIGJlIHJlc29sdmVkIGJ5IGNoZWNraW5nIGNoaXBfZ29vZCgpIG9ubHkuDQo+
ICAgU28gSSB3aWxsIGRvIHVwZGF0ZSB0aGUgcGF0Y2ggYXMgc28uDQoNClRoZW4gSSBnb3QgcmVh
bGx5IGN1cmlvdXMsIGRvcyB0aGUgc2FtZSB3b3JrIGZvciB5b3VyIGVyYXNlIHByb2JsZW0/DQpS
ZXBsYWNlIGNoaXBfcmVhZHkoLi4uKSB3aXRoIGNoaXBfZ29vZChtYXAsIGFkciwgbWFwX3dvcmRf
ZmYobWFwKSA/DQpEb24ndCB5b3UgaGF2ZSBhbnkgc3RhdHVzIGJpdHMgd2hlbiBlcmFzZS93cml0
ZSBmYWlscz8NCg0KIEpvY2tl
