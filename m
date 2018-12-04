Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUHFU-0001KU-Jm
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2018 20:24:53 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 6/6] mtd: spi-nor: Move the nor->info assignment
 earlier in the scan func
Date: Tue, 4 Dec 2018 20:24:37 +0000
Message-ID: <8991c6c1-f5dc-affe-0478-60f0280ed2c2@microchip.com>
References: <20181129141026.24892-1-boris.brezillon@bootlin.com>
 <20181129141026.24892-7-boris.brezillon@bootlin.com>
 <fe3646e0-bb44-92d4-b524-e00f7db9c73e@nokia.com>
In-Reply-To: <fe3646e0-bb44-92d4-b524-e00f7db9c73e@nokia.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D014EE4D9071042B13CF330F02FDFAE@namprd11.prod.outlook.com>
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

SGksIEFsZXhhbmRlciwNCg0KT24gMTEvMjkvMjAxOCAwNjozNSBQTSwgU3ZlcmRsaW4sIEFsZXhh
bmRlciAoTm9raWEgLSBERS9VbG0pIHdyb3RlOg0KPiBSZXZpZXdlZC1ieTogQWxlYXhhbmRlciBT
dmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQG5va2lhLmNvbT4NCg0KdGhlcmUncyBhIHR5cG8g
aW4geW91ciBuYW1lLCBoZXJlIGFuZCBpbiBhbGwgdGhlIG90aGVyIHJiIHRhZ3MgZnJvbSB0aGlz
IHBhdGNoIHNldC4NCg0KQ2hlZXJzLA0KdGENCg==
