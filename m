Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adqfU-0006pd-9h
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 02:49:41 +0000
From: =?utf-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
To: Andrea Scian <rnd4@dave-tech.it>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Brian
 Norris" <computersforpeace@gmail.com>
Subject: RE: [PATCH 1/2] mtd: nand: use a lower value for badblockbits when
 working with MLC NAND
Date: Thu, 10 Mar 2016 02:48:36 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF6A695@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF69672@NTXXIAMBX02.xacn.micron.com>
 <20160309152638.0b5e9250@bbrezillon> <56E0513D.5000508@dave-tech.it>
In-Reply-To: <56E0513D.5000508@dave-tech.it>
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

PiA+PiBIaSwgQW5kcmVhIGFuZCBCb3Jpcw0KPiA+PiBUaGlzIGlzIGEgaGlzdG9yaWNhbCBzdWJq
ZWN0LCBhbmQgdGFsa2VkIGJlZm9yZS4NCj4gPj4gIEZyb20gb3VyIGZpZWxkIGlzc3VlcywgOCBi
aXRzIG9mIGJhZCBibG9jayBtYXJrIGZvciBNTEMgTkFORCBpcyBub3QNCj4gcmVhc29uYWJsZS4N
Cj4gPj4gQmVjYXVzZSBvZiBiaXRmbGlwIG9uIGJhZCBibG9jayBtYXJrLCByZWdhcmQgb25lIGdv
b2QgYmxvY2sgYXMgYSBiYWQNCj4gPj4gYmxvY2sgaXMgY29tbW9uIElzc3VlLiBFc3BlY2lhbGx5
IGZpcnN0IHRpbWUgYm9vdCBhZnRlciByZWZsb3cuIFRoZQ0KPiA+PiBzb2x1dGlvbiBpcyBtb2Rp
ZmllZCB0aGlzIHZhbHVlIHRvIDQgZm9yIE1MQyBOQU5EIGJ5IGhhbmQsIGFuZCB0aGUgZmFjdG9y
eQ0KPiBCQiBtYXJrIGlzIOKAnDB4MDDigJ0uDQo+ID4+IEkgdGhpbmssIDQgYml0cyBmb3IgTUxD
IE5BTkQgbWFrZSBzZW5zZS4NCj4gPg0KPiA+DQo+ID4gSSdtIHRlbXB0ZWQgdG8gc2F5ICJsZXQn
cyBzdGFydCB3aXRoIHRoaXMgdmFsdWUgYW5kIHNlZSB3aGF0IGhhcHBlbnMNCj4gPiBpbiByZWFs
IHdvcmxkIi4gSWYgd2Ugd2FudCB0byBiZSBhIGJpdCBtb3JlIGNvbnNlcnZhdGl2ZSB3ZSBjb3Vs
ZA0KPiA+IGRlY2lkZSB0byBjaG9zZSAyLCB3aGljaCBzaG91bGQgYWRkcmVzcyBtb3N0IHByb2Js
ZW1zIHRvbyAoZHVyaW5nIG15DQo+ID4gdGVzdHMsIEkgbmV2ZXIgc2VlbiBzdWNoIGEgaHVnZSBj
b25jZW50cmF0aW9uIG9mIGJpdGZsaXBzIGluIHRoZSBzYW1lIGJ5dGUpLg0KPiA+DQo+ID4gQnJp
YW4sIEFuZHJlYSwgd2hhdCBkbyB5b3UgdGhpbms/DQo+ID4NCj4gDQo+IEknbSBjdXJyZW50bHkg
dXNpbmcgNCBvbiBteSBjdXN0b20ga2VybmVsLg0KPiBPbiBhbGwgZGF0YXNoZWV0IEkndmUgc2Vl
biBmYWN0b3J5IGJhZCBibG9jayBtYXJrZXIgaXMgMHgwMCBhbmQgdGhlIHNhbWUgaXMNCj4gKEFG
QUlLKSB1c2VkIGJ5IE1URCB0byBtYXJrIGJhZCBibG9ja3MuDQo+IA0KPiBLaW5kIFJlZ2FyZHMs
DQo+IA0KPiAtLQ0KPiANCj4gQW5kcmVhIFNDSUFODQo+IA0KPiBEQVZFIEVtYmVkZGVkIFN5c3Rl
bXMNCk1pY3JvbiBmYWN0b3J5IGJhZCBibG9jayBtYXJrZXIgb2YgYWxsIE5BTkQgaXMgMHgwMC4N
CkJ1dCBmb3IgZ29vZCBiYWQsIGFmdGVyIHJlZmxvdywgbW9zdCBnb29kIGJsb2NrIHdpbGwgYmUN
Cm1hZGUgbWlzdGFrZSBvZiB0aGluayBiYWQgYmxvY2sganVzdCBCZWNhdXNlIG9mIGJpdGZsaXBz
IA0Kb24gbWFya2VyIGJ5dGVzLiBJIHdhbnQgdG8gY2xhcmlmeSB0aGlzIGlzIGZpcnN0IHRpbWUg
Ym9vdC4NCkN1cnJlbnRseSBubyBiYWQgYmxvY2sgdGFibGUuDQoNCg==
