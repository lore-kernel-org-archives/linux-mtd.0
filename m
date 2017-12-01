Received: from mail-eopbgr00044.outbound.protection.outlook.com ([40.107.0.44]
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKiDb-0006xa-2E
 for linux-mtd@lists.infradead.org; Fri, 01 Dec 2017 10:06:53 +0000
From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at"
 <richard@nod.at>
Subject: RE: [PATCH 2/2] mtd: m25p80: restore the addressing mode when stop
 using the flash
Date: Fri, 1 Dec 2017 10:06:29 +0000
Message-ID: <AM5PR0402MB2771E30AB082C9AB415A55A784390@AM5PR0402MB2771.eurprd04.prod.outlook.com>
References: <20171124100848.1828-1-Zhiqiang.Hou@nxp.com>
 <20171124100848.1828-3-Zhiqiang.Hou@nxp.com>
 <b21e0615-9a64-7dc5-cbb2-f391a640273d@wedev4u.fr>
In-Reply-To: <b21e0615-9a64-7dc5-cbb2-f391a640273d@wedev4u.fr>
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

SGkgQ3lyaWxsZSwNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIQ0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEN5cmlsbGUgUGl0Y2hlbiBbbWFpbHRvOmN5cmlsbGUu
cGl0Y2hlbkB3ZWRldjR1LmZyXQ0KPiBTZW50OiAyMDE35bm0MTLmnIgx5pelIDE2OjU4DQo+IFRv
OiBaLnEuIEhvdSA8emhpcWlhbmcuaG91QG54cC5jb20+OyBsaW51eC1tdGRAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgY29tcHV0ZXJzZm9ycGVh
Y2VAZ21haWwuY29tOw0KPiBkd213MkBpbmZyYWRlYWQub3JnOyBib3Jpcy5icmV6aWxsb25AZnJl
ZS1lbGVjdHJvbnMuY29tOw0KPiBtYXJlay52YXN1dEBnbWFpbC5jb207IHJpY2hhcmRAbm9kLmF0
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBtdGQ6IG0yNXA4MDogcmVzdG9yZSB0aGUgYWRk
cmVzc2luZyBtb2RlIHdoZW4NCj4gc3RvcCB1c2luZyB0aGUgZmxhc2gNCj4gDQo+IEhpIEhvdSwN
Cj4gDQo+IExlIDI0LzExLzIwMTcgw6AgMTE6MDgsIFpoaXFpYW5nIEhvdSBhIMOpY3JpdMKgOg0K
PiA+IEZyb206IEhvdSBaaGlxaWFuZyA8WmhpcWlhbmcuSG91QG54cC5jb20+DQo+ID4NCj4gPiBB
ZGQgLnNodXRkb3duIGZ1bmN0aW9uIHRvIHJlc3RvcmUgdGhlIGFkZHJlc3NpbmcgbW9kZSBpbiBy
ZWJvb3QNCj4gPiBwcm9jZXNzLCBhbmQgYWRkIHRoZSBzYW1lIG9wZXJhdGlvbiB0byB0aGUgLnJl
bW92ZSBmdW5jdGlvbi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhvdSBaaGlxaWFuZyA8Wmhp
cWlhbmcuSG91QG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbXRkL2RldmljZXMvbTI1
cDgwLmMgfCA4ICsrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL20yNXA4MC5jDQo+ID4g
Yi9kcml2ZXJzL210ZC9kZXZpY2VzL20yNXA4MC5jIGluZGV4IGRiZTZhMWRlMmJiOC4uODY3YmQy
ZDVhMjY3DQo+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMvbTI1cDgwLmMN
Cj4gPiArKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL20yNXA4MC5jDQo+ID4gQEAgLTMwNywxMCAr
MzA3LDE3IEBAIHN0YXRpYyBpbnQgbTI1cF9yZW1vdmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkN
Cj4gPiB7DQo+ID4gIAlzdHJ1Y3QgbTI1cAkqZmxhc2ggPSBzcGlfZ2V0X2RydmRhdGEoc3BpKTsN
Cj4gPg0KPiA+ICsJc3BpX25vcl9yZXN0b3JlX2FkZHJfbW9kZSgmZmxhc2gtPnNwaV9ub3IpOw0K
PiANCj4gbWF5YmUgYWRkIGEgbmV3IGxpbmUgaGVyZS4NCj4gDQo+IE90aGVyd2lzZSwgdGhpcyBs
b29rcyBnb29kIDopDQoNClllcywgd2lsbCBhZGQgaW4gbmV4dCB2ZXJzaW9uLCB0aGFua3MgYSBs
b3QgZm9yIHRoZSBzdWdnZXN0aW9uIQ0KDQoNClRoYW5rcywNClpoaXFpYW5nDQoNCg==
