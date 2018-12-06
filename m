Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUtoE-0003Bb-AK
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2018 13:35:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>, <marek.vasut@gmail.com>
CC: <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <linux-mtd@lists.infradead.org>, <richard@nod.at>
Subject: Re: [PATCH v3 3/5] mtd: spi-nor: Stop passing flash_info around
Date: Thu, 6 Dec 2018 13:35:02 +0000
Message-ID: <cc9e8b2a-be27-b614-8ac5-1aff7fbf231c@microchip.com>
References: <20181206104120.6280-1-boris.brezillon@bootlin.com>
 <20181206104120.6280-4-boris.brezillon@bootlin.com>
In-Reply-To: <20181206104120.6280-4-boris.brezillon@bootlin.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF078CA82004454BA39273E2A12B2BE4@namprd11.prod.outlook.com>
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

DQoNCk9uIDEyLzA2LzIwMTggMTI6NDEgUE0sIEJvcmlzIEJyZXppbGxvbiB3cm90ZToNCj4gQEAg
LTM1MzksMTAgKzM1MzcsMTEgQEAgc3RhdGljIGludCBzcGlfbm9yX3NlbGVjdF9lcmFzZShzdHJ1
Y3Qgc3BpX25vciAqbm9yLCB1MzIgd2FudGVkX3NpemUpDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+
ICANCj4gLXN0YXRpYyBpbnQgc3BpX25vcl9zZXR1cChzdHJ1Y3Qgc3BpX25vciAqbm9yLCBjb25z
dCBzdHJ1Y3QgZmxhc2hfaW5mbyAqaW5mbywNCj4gK3N0YXRpYyBpbnQgc3BpX25vcl9zZXR1cChz
dHJ1Y3Qgc3BpX25vciAqbm9yLA0KPiAgCQkJIGNvbnN0IHN0cnVjdCBzcGlfbm9yX2ZsYXNoX3Bh
cmFtZXRlciAqcGFyYW1zLA0KPiAgCQkJIGNvbnN0IHN0cnVjdCBzcGlfbm9yX2h3Y2FwcyAqaHdj
YXBzKQ0KPiAgew0KPiArCWNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvICppbmZvID0gbm9yLT5pbmZv
Ow0KDQpwbGVhc2UgZHJvcCB0aGlzIGxvY2FsIHZhcmlhYmxlIGFuZCB1c2Ugbm9yLT5pbmZvLT5z
ZWN0b3Jfc2l6ZSBpbnN0ZWFkDQoNClJldmlld2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5h
bWJhcnVzQG1pY3JvY2hpcC5jb20+DQo=
