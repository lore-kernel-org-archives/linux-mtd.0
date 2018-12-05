Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUZQA-0005KX-8v
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2018 15:49:07 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>
CC: <alexandre.belloni@bootlin.com>, <richard@nod.at>,
 <marek.vasut@gmail.com>, <linux-mtd@lists.infradead.org>,
 <alexander.sverdlin@nokia.com>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>
Subject: Re: [PATCH v4 1/3] mtd: spi-nor: Add the SNOR_F_4B_OPCODES flag
Date: Wed, 5 Dec 2018 15:48:46 +0000
Message-ID: <1f244544-7f85-fa28-afcd-d6b7fae192fe@microchip.com>
References: <20181129144143.26079-1-boris.brezillon@bootlin.com>
 <20181129144143.26079-2-boris.brezillon@bootlin.com>
 <b6f66057-7b7c-8e9c-1a05-71bf6611ffaa@microchip.com>
 <20181205161902.0744f562@bbrezillon>
In-Reply-To: <20181205161902.0744f562@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <908367520D13D94C89A9E47640FEDD33@namprd11.prod.outlook.com>
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

DQoNCk9uIDEyLzA1LzIwMTggMDU6MTkgUE0sIEJvcmlzIEJyZXppbGxvbiB3cm90ZToNCj4+PiBA
QCAtMzc1MCw2ICszNzQ3LDEwIEBAIGludCBzcGlfbm9yX3NjYW4oc3RydWN0IHNwaV9ub3IgKm5v
ciwgY29uc3QgY2hhciAqbmFtZSwNCj4+PiAgCWlmIChpbmZvLT5mbGFncyAmIFNQSV9OT1JfTk9f
RlIpDQo+Pj4gIAkJcGFyYW1zLmh3Y2Fwcy5tYXNrICY9IH5TTk9SX0hXQ0FQU19SRUFEX0ZBU1Q7
DQo+Pj4gIA0KPj4+ICsJaWYgKGluZm8tPmZsYWdzICYgU1BJX05PUl80Ql9PUENPREVTIHx8DQo+
Pj4gKwkgICAgKEpFREVDX01GUihpbmZvKSA9PSBTTk9SX01GUl9TUEFOU0lPTiAmJiBtdGQtPnNp
emUgPiBTWl8xNk0pKQ0KPj4+ICsJCW5vci0+ZmxhZ3MgfD0gU05PUl9GXzRCX09QQ09ERVM7DQo+
Pj4gKyAgDQo+PiB5b3UgYXJlIHBvdGVudGlhbGx5IG92ZXJ3cml0aW5nIHRoZSBTTk9SX0ZfNEJf
T1BDT0RFUyB0aGF0IG1heSBiZSBzZXQgaW4gU0ZEUC4gSQ0KPj4gc3VnZ2VzdCB0byBzZXQgU05P
Ul9GXzRCX09QQ09ERVMgZmxhZyBpbnNpZGUgb2YgdGhlICJpZiAobXRkLT5zaXplID4gMHgxMDAw
MDAwKSINCj4+IGJsb2NrLg0KPiBTaG91bGRuJ3Qgd2Ugb3ZlcnJpZGUgdGhpcyB2YWx1ZSBhbnl3
YXk/IEkgbWVhbiwgSSB0aG91Z2h0IGZsYXNoX2luZm8NCj4gZmxhZ3MgaGFkIHByZWNlZGVuY2Ug
b24gdGhlIFNGRFAgb25lcy4gQWxzbywganVzdCBiZWNhdXNlIHRoZSBmbGFzaCBpcw0KDQpJIHRl
bmQgdG8gc2F5IHRoYXQgd2Ugc2hvdWxkbid0LiBXZSBoYXZlIHNvbWUgIkpFREVDIGtub3dzIGJl
dHRlciIgYXR0aXR1ZGUgaW4NCnRoZSBjb2RlOiB3ZSBhcmUgb3ZlcndyaXRpbmcgcGxhdGZvcm0g
SUQgaWYgd2UgZmluZCBhIGRpZmZlcmVudCBJRCBpbiBzZmRwLCB3ZQ0KY2hvb3NlIGFkZHJfd2lk
dGggZnJvbSBTRkRQIGV2ZW4gaWYgc2V0IGluIGluZm8tPmFkZHJfd2lkdGgsIGFuZCB3ZSBhcmUN
Cm92ZXJ3cml0aW5nIGFsbCB0aGUgc2V0dGluZ3MgYmFzZWQgb24gZmxhc2hfaW5mbyB3aGVuIHNm
ZHAgcGFyc2luZyBzdWNjZWVkcyBpbg0Kc3BpX25vcl9pbml0X3BhcmFtcygpLg0KDQo+IHNtYWxs
ZXIgdGhhbiAxNk1CLCBkb2Vzbid0IG1lYW4gaXQgZG9lcyBub3Qgc3VwcG9ydCA0QiBvcGNvZGVz
LiBXZQ0KPiBwcm9iYWJseSB3b24ndCB1c2UgdGhlIDRCIG9wY29kZXMgaW4gdGhhdCBjYXNlLCBi
dXQgc3RpbGwuDQo+IA0KDQpJIGFncmVlIHRoYXQgbWFudWZhY3R1cmVycyBoYXZlIGEgc2Vuc2Ug
b2YgaHVtb3IgYW5kIHRoaXMgbWlnaHQgYmUgcG9zc2libGUuIEJ1dA0KdGhlcmUncyBubyBuZWVk
IHRvIHVzZSA0QiBvcGNvZGVzIGluIHRoaXMgY2FzZSwgc28gYSBwb3N0X3NmZHAgZml4dXAgd2ls
bCBoZWxwDQpoZXJlIHRvby4NCg0KQ2hlZXJzLA0KdGENCg==
