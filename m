Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNi3H-0005CG-Pt
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2018 17:37:10 +0000
From: <Tudor.Ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <boris.brezillon@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: fix selection of uniform erase type in
 flexible conf
Date: Fri, 16 Nov 2018 17:36:53 +0000
Message-ID: <3c2c7a76-c7da-5c6e-0bb3-8963132f79d4@microchip.com>
References: <20181116111708.30259-1-tudor.ambarus@microchip.com>
In-Reply-To: <20181116111708.30259-1-tudor.ambarus@microchip.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <919A3535DA42CE42B2CDBA943C69B46D@namprd11.prod.outlook.com>
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

DQoNCk9uIDExLzE2LzIwMTggMDE6MTcgUE0sIFR1ZG9yIEFtYmFydXMgLSBNMTgwNjQgd3JvdGU6
DQoNCltjdXRdDQo+IEBAIC0yNzI5LDkgKzI3NTEsOCBAQCBzdGF0aWMgaW50IHNwaV9ub3JfcGFy
c2VfYmZwdChzdHJ1Y3Qgc3BpX25vciAqbm9yLA0KPiAgCSAqIHVuaWZvcm1fZXJhc2VfdHlwZSBi
aXRtYXNrLiBUaGUgYml0bWFzayB3aWxsIGJlIHVzZWQgbGF0ZXIgb24gd2hlbg0KPiAgCSAqIHNl
bGVjdGluZyB0aGUgdW5pZm9ybSBlcmFzZS4NCj4gIAkgKi8NCj4gLQlzcGlfbm9yX3JlZ2lvbnNf
c29ydF9lcmFzZV90eXBlcyhtYXApOw0KPiAtCW1hcC0+dW5pZm9ybV9lcmFzZV90eXBlID0gbWFw
LT51bmlmb3JtX3JlZ2lvbi5vZmZzZXQgJg0KPiAtCQkJCSAgU05PUl9FUkFTRV9UWVBFX01BU0s7
DQo+ICsJbWFwLT51bmlmb3JtX2VyYXNlX3R5cGUgPSBzcGlfbm9yX3NvcnRfZXJhc2VfbWFzayht
YXAsDQo+ICsJCQkJCQltYXAtPnVuaWZvcm1fZXJhc2VfdHlwZSk7DQoNCkV2ZW4gaWYgdGhpcyBw
YXJ0aWN1bGFyIGNoYW5nZSBkb2VzIG5vdCBhZmZlY3QgaG93IGVyYXNlIHdvcmtzIGluIHVuaWZv
cm0gY2FzZSwNCml0IGlzIG5vdCBxdWl0ZSBnb29kIGJlY2F1c2UgbWFwLT51bmlmb3JtX2VyYXNl
X3R5cGUgd2lsbCBub3QgcmVmbGVjdCB3aGF0IGlzIGluDQptYXAtPnVuaWZvcm1fcmVnaW9uLm9m
ZnNldCAmIFNOT1JfRVJBU0VfVFlQRV9NQVNLLg0KDQpUaGlzIGNoYW5nZSB3aWxsIGJlIHJlbW92
ZWQgaW4gdjIuDQoNCkNoZWVycywNCnRhDQo=
