Received: from mail-bl2on0135.outbound.protection.outlook.com ([65.55.169.135]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ4qW-0007bc-Rv
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 02:35:53 +0000
From: Hou Zhiqiang <B48286@freescale.com>
To: =?gb2312?B?QmVhbiBIdW8gu/Sx87HzIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "jonatas.rech@datacom.ind.br"
 <jonatas.rech@datacom.ind.br>, "Jane.Wan@gainspeed.com"
 <Jane.Wan@gainspeed.com>, "shijie.huang@intel.com" <shijie.huang@intel.com>,
 "valentin.longchamp@keymile.com" <valentin.longchamp@keymile.com>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "hramrach@gmail.com"
 <hramrach@gmail.com>
CC: Hu Vincent <Mingkai.Hu@freescale.com>
Subject: RE: [PATCH] RFC: mtd/spi-nor: add checking for the spi_nor_read
Date: Fri, 14 Aug 2015 02:35:28 +0000
Message-ID: <CY1PR0301MB07800576D22614945251F2358B7C0@CY1PR0301MB0780.namprd03.prod.outlook.com>
References: <1437479828-30826-1-git-send-email-B48286@freescale.com>
 <CY1PR0301MB0780E3F6E2A1170A7A56A8538B8A0@CY1PR0301MB0780.namprd03.prod.outlook.com>
 <CY1PR0301MB0780204E22E93D42F596043D8B7D0@CY1PR0301MB0780.namprd03.prod.outlook.com>
 <A765B125120D1346A63912DDE6D8B6310BF447C2@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF447C2@NTXXIAMBX02.xacn.micron.com>
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVhbiBIdW8gu/Sx87Hz
IChiZWFuaHVvKSBbbWFpbHRvOmJlYW5odW9AbWljcm9uLmNvbV0NCj4gU2VudDogMjAxNcTqONTC
MTPI1SAyMzozOQ0KPiBUbzogSG91IFpoaXFpYW5nLUI0ODI4NjsgbGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7DQo+IGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbTsgZHdtdzJAaW5mcmFk
ZWFkLm9yZzsNCj4gam9uYXRhcy5yZWNoQGRhdGFjb20uaW5kLmJyOyBKYW5lLldhbkBnYWluc3Bl
ZWQuY29tOw0KPiBzaGlqaWUuaHVhbmdAaW50ZWwuY29tOyB2YWxlbnRpbi5sb25nY2hhbXBAa2V5
bWlsZS5jb207DQo+IGhrYWxsd2VpdDFAZ21haWwuY29tOyBocmFtcmFjaEBnbWFpbC5jb20NCj4g
Q2M6IEh1IE1pbmdrYWktQjIxMjg0DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIFJGQzogbXRkL3Nw
aS1ub3I6IGFkZCBjaGVja2luZyBmb3IgdGhlIHNwaV9ub3JfcmVhZA0KPiANCj4gDQo+IEhpLA0K
PiBJcyBpdCBjb252ZW5pZW50IHRvIHRlbGwgbWUgdGhhdCB3aGljaCB2ZW5kb3IncyBzcGkgbm9y
Pw0KPiBGb3IgY3VycmVudCBzcGkgbm9yIHN0cnVjdHVyZSwgd3JpdGUgb3BlcmF0aW9uIGhhcyBi
ZWVuIGFscmVhZHkgc3BsaXQNCj4gdHJhbnNhY3Rpb24gbGVuZ3RoIEJ5IHBhZ2Ugc2l6ZSgyNTYg
Qnl0ZXMpLiBCdXQgc2VlbXMgInJldGxlbiIgbm90DQo+IHJlYXNvbmFibGUuDQo+IA0KPiBTcGkg
bm9yIHJlYWQgb3BlcmF0aW9uIGluZGVlZCBkb2VzIG5vdCB0YWtlIHNwaSBjb250cm9sbGVyJ3Mg
dHJhbnNhY3Rpb24NCj4gYWJpbGl0eSBpbnRvIEFjY291bnQuYnV0IGZvciBzcGkgbm9yLCBvbmUt
dGltZSByZWFkIGxlbmd0aCBpcyBub24tDQo+IHJlc3RyaWN0aXZlLg0KPiANCg0KSSdtIHNvcnJ5
IGZvciBteSB1bmNsZWFyIGV4cGxhbmF0aW9uLg0KWWVzLCBmb3IgU1BJIE5PUiBGbGFzaCwgdGhl
IG9uZS10aW1lIHJlYWQgbGVuZ3RoIGlzIG5vbi1yZXN0cmljdGl2ZSwgYnV0IGZvciB0aGUgU1BJ
DQpDb250cm9sbGVyIHRoZXJlIGFyZSBzb21lIGxpbWl0cywgZS5nLiA2NEtpQiBvbmUtdGltZSB0
cmFuc2ZlciBsZW5ndGggbGltaXQgZm9yIA0KRnJlZXNjYWxlIGVTUEkgY29udHJvbGxlciwgYW5k
IGFzIHlvdSBrbm93biB0aGUgc3BpIG5vciByZWFkIG9wZXJhdGlvbiBpbmRlZWQgZG9lcw0Kbm90
IHRha2Ugc3BpIGNvbnRyb2xsZXIncyB0cmFuc2FjdGlvbiBhYmlsaXR5IGludG8gYWNjb3VudC4N
Cg0KPiAtLUJlYW5odW8NCg0KQi5SDQpaaGlxaWFuZw0K
