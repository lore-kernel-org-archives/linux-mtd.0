Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUa9J-0005tU-B4
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2018 16:35:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>, <marek.vasut@gmail.com>
CC: <alexandre.belloni@bootlin.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v4 2/3] mtd: spi-nor: Add a post BFPT parsing fixup hook
Date: Wed, 5 Dec 2018 16:35:15 +0000
Message-ID: <6d2f2c1d-9c95-296e-6907-a8aa8b7b80ef@microchip.com>
References: <20181129144143.26079-1-boris.brezillon@bootlin.com>
 <20181129144143.26079-3-boris.brezillon@bootlin.com>
In-Reply-To: <20181129144143.26079-3-boris.brezillon@bootlin.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5242D9551FC217438FC71F6DB00172BA@namprd11.prod.outlook.com>
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

DQoNCk9uIDExLzI5LzIwMTggMDQ6NDEgUE0sIEJvcmlzIEJyZXppbGxvbiB3cm90ZToNCj4gK3N0
cnVjdCBzcGlfbm9yX2ZpeHVwcyB7DQo+ICsJaW50ICgqcG9zdF9iZnB0KShzdHJ1Y3Qgc3BpX25v
ciAqbm9yLA0KPiArCQkJIGNvbnN0IHN0cnVjdCBzZmRwX3BhcmFtZXRlcl9oZWFkZXIgKmJmcHRf
aGVhZGVyLA0KPiArCQkJIGNvbnN0IHN0cnVjdCBzZmRwX2JmcHQgKmJmcHQsDQo+ICsJCQkgc3Ry
dWN0IHNwaV9ub3JfZmxhc2hfcGFyYW1ldGVyICpwYXJhbXMpOw0KPiArfTsNCg0KSSBsaWtlIHRo
ZSBpZGVhLiBUaGUgY29kZSBsb29rcyBnb29kLiBXaGF0IEkgbm90aWNlZCBpcyB0aGF0IHRoZSBz
ZmRwIGxvZ2ljIGlzDQpub3cgc3BsaXQgaW4gZGlmZmVyZW50IHNlY3Rpb25zIG9mIHNwaS1ub3Ig
ZmlsZS4gSW4gb3JkZXIgdG8gYXZvaWQgdGhlIGJ1cmRlbiBvZg0KbW92aW5nIHRoZSBzZmRwIGNv
ZGUgaW5zaWRlIHNwaS1ub3IsIHlvdSBjYW4gaGF2ZSB0aGVzZSAzIGZvcndhcmQgZGVjbGFyYXRp
b25zDQphbmQgZG8gdGhlIHNmZHAgbW92ZSBsYXRlciBvbiwgaW4gYSBzZXBhcmF0ZSBmaWxlLg0K
DQp0YQ0K
