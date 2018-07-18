Received: from mail-eopbgr50114.outbound.protection.outlook.com
 ([40.107.5.114] helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffhYo-00071o-A3
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 08:11:48 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
CC: "bpringlemeir@gmail.com" <bpringlemeir@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stefan@agner.ch" <stefan@agner.ch>, "miquel.raynal@free-electrons.com"
 <miquel.raynal@free-electrons.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "richard@nod.at" <richard@nod.at>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>
Subject: Re: [PATCH v8 1/3] mtd: rawnand: vf610_nfc: make use of ->exec_op()
Date: Wed, 18 Jul 2018 08:11:20 +0000
Message-ID: <1531901478.16896.6.camel@toradex.com>
References: <20180318155929.16561-1-stefan@agner.ch>
 <20180318155929.16561-2-stefan@agner.ch>
 <14d062b2c92a70f2b16e0837696e0ff2@agner.ch>
 <20180712234105.47ed95d1@bbrezillon> <20180712235725.1dc96dea@bbrezillon>
 <20180717230318.2a302556@xps13>
In-Reply-To: <20180717230318.2a302556@xps13>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AE98D4B6B8CBC4C93F3DBA50E5F3694@eurprd05.prod.outlook.com>
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

SGkgTWlxdcOobA0KDQpPbiBUdWUsIDIwMTgtMDctMTcgYXQgMjM6MDMgKzAyMDAsIE1pcXVlbCBS
YXluYWwgd3JvdGU6DQo+IEhpIFN0ZWZhbiwNCj4gDQo+IENvdWxkIHlvdSBnZXQgc29tZSB0aW1l
IHRvIGNoZWNrIHRoZSBhYm92ZSBhZHZpY2U/DQoNClN0ZWZhbiBpcyBjdXJyZW50bHkgb24gdmFj
YXRpb24gYnV0IEkgd2lsbCBtYWtlIHN1cmUgaGUgaGFzIGEgbG9vayBhdA0KaXQgbmV4dCB3ZWVr
Lg0KDQo+IFRoYW5rcywNCj4gTWlxdcOobA0KDQpDaGVlcnMNCg0KTWFyY2Vs
