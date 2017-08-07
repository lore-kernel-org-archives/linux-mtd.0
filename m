Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1deZ4Z-00081x-GD
 for linux-mtd@lists.infradead.org; Mon, 07 Aug 2017 03:51:21 +0000
From: <Wenyou.Yang@microchip.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] mtd: nand: atmel: fix of_irq_get() error check
Date: Mon, 7 Aug 2017 03:50:57 +0000
Message-ID: <F9F4555C4E01D7469D37975B62D0EFBB69CFA2@CHN-SV-EXMX07.mchp-main.com>
References: <20170805211436.181653483@cogentembedded.com>
 <244d6398-6fa9-17c2-43a4-7309fd080318@Microchip.com>
In-Reply-To: <244d6398-6fa9-17c2-43a4-7309fd080318@Microchip.com>
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

U29ycnksIG5vaXNlLCBwbGVhc2UgaWdub3JlLg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogV2VueW91IFlhbmcgLSBBNDE1MzUNCj4gU2VudDogMjAxN8TqONTCN8jV
IDExOjM5DQo+IFRvOiBXZW55b3UgWWFuZyAtIEE0MTUzNSA8V2VueW91LllhbmdAbWljcm9jaGlw
LmNvbT47IEJvcmlzIEJyZXppbGxvbg0KPiA8Ym9yaXMuYnJlemlsbG9uQGZyZWUtZWxlY3Ryb25z
LmNvbT47IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Ow0KPiBEYXZpZCBXb29k
aG91c2UgPGR3bXcyQGluZnJhZGVhZC5vcmc+OyBCcmlhbiBOb3JyaXMNCj4gPGNvbXB1dGVyc2Zv
cnBlYWNlQGdtYWlsLmNvbT47IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBnbWFpbC5jb20+Ow0K
PiBDeXJpbGxlIFBpdGNoZW4gPGN5cmlsbGUucGl0Y2hlbkB3ZWRldjR1LmZyPjsgbGludXgtbXRk
QGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gbXRkOiBuYW5kOiBh
dG1lbDogZml4IG9mX2lycV9nZXQoKSBlcnJvciBjaGVjaw0KPiANCj4gdGVzdGVkDQo+IA0KPiAN
Cj4gT24gMjAxNy84LzYgNToxNCwgU2VyZ2VpIFNodHlseW92IHdyb3RlOg0KDQpCZXN0IFJlZ2Fy
ZHMsDQpXZW55b3UgWWFuZw0KDQo=
