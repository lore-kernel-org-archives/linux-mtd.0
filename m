Received: from mail-vi1eur04on070e.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::70e]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTjgg-0001vl-7j
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 08:34:44 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Marek
 Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] mtd: spi-nor: Provide default address width and latency
 for map selection
Date: Mon, 3 Dec 2018 08:34:27 +0000
Message-ID: <0393f881-bc90-a872-f58c-3226bce62b8b@nokia.com>
References: <20181129181519.15681-1-alexander.sverdlin@nokia.com>
 <20181130114019.175ab7ec@bbrezillon>
 <f11c7ab4-ee19-ad4e-7943-d6359ac58249@nokia.com>
 <20181203092337.52817e0e@bbrezillon>
In-Reply-To: <20181203092337.52817e0e@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2231D27AB62BE14EABC904EF9521882A@eurprd07.prod.outlook.com>
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

SGkhDQoNCk9uIDAzLzEyLzIwMTggMDk6MjMsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToNCj4+IFRo
aXMgaXMgdGhlIHNhbWUgaW5zdHJ1Y3Rpb24gNjVoIHdoaWNoIGlzIHVzZWQgdG8gcmVhZCByZWdz
IGFuZCB3aGljaA0KPj4gYXBwZWFycyBpbiBTTVBUIGhlYWRlcnMsIGl0IGlzIGEgY2hpY2tlbi1l
Z2cgcHJvYmxlbS4NCj4gT2gsIHJpZ2h0LCBJIHJlbWVtYmVyIG5vdy4gTm90IGEgc21hcnQgZGVj
aXNpb24gZnJvbSBTcGFuc2lvbiA6LS8uDQo+IA0KPj4gVGhlcmVmb3JlLCBJIGRvbid0IGtub3cg
aWYgaXQncyBwb3NzaWJsZSB0byBwcm92aWRlIHNtYXJ0ZXIgaGV1cmlzdGljcw0KPj4gaGVyZS4N
Cj4gTWF5YmU6DQo+IA0KPiByZWZfY3IxID0gcmVhZF9DUjFfdXNpbmdfUkRDUigpDQo+IA0KPiBm
b3JfZWFjaF9wb3NzaWJsZV9kdW1teV9hbmRfYWRkcl93aWR0aA0KPiAJY3IxID0gcmVhZF9DUjFf
dXNpbmdfUkRBUigpDQo+IAlpZiAoY3IxID09IHJlZl9jcjEpDQo+IAkJYnJlYWs7DQo+IA0KPiAN
Cj4+IEJ1dCB3aXRob3V0IGl0IFNwYW5zaW9uIFMyNUZTLVMgRmFtaWx5IGlzIG5vdyBicm9rZW4g
YnkgU0ZEUC4NCj4gRG8geW91IGhhdmUgWzFdIGluIHlvdXIgdHJlZT8gSUlSQywgdGhpcyBmaXhl
ZCBZb2dlc2ggaXNzdWUuDQo+IA0KPiBbMV1odHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Bh
dGNoLzk5NDc2NS8NCg0KVGhpcyBpcyBkZWZpbml0ZWx5IHVucmVsYXRlZCwgaW4gbXkgY2FzZSBT
TVBUIGlzIGhhcHBpbHkgcHJvY2Vzc2VkIGxlYWRpbmcNCnRvIGNvbXBsZXRlbHkgd3JvbmcgbWFw
cGluZyBiZWNhdXNlIGNvbW1hbmQgNjVoIHdpdGggYWRkcl93aWR0aCA9PSAwIGFsd2F5cw0KcmV0
dXJucyAwLg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkFsZXhhbmRlciBTdmVyZGxpbi4NCg==
