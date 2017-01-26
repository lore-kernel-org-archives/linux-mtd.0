Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWmUJ-0001Nl-89
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2017 16:01:29 +0000
From: "Langer, Thomas" <thomas.langer@intel.com>
To: Seb <sebtx452@gmail.com>
CC: Hauke Mehrtens <hauke@hauke-m.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-mips@linux-mips.org"
 <linux-mips@linux-mips.org>
Subject: RE: [PATCH] mtd: maps: lantiq-flash: Check if the EBU endianness
 swap is enabled
Date: Thu, 26 Jan 2017 16:01:04 +0000
Message-ID: <0DAF21CFE1B20740AE23D6AF6E54843F1E6F9DE6@IRSMSX101.ger.corp.intel.com>
References: <1484904834-14980-1-git-send-email-sebtx452@gmail.com>
 <3304d64f-38aa-1a3c-0b5d-edb493abd61a@hauke-m.de>
 <CA+hF=GdKLEN2ue=Q7KpBp+W+bTnj5O_OAoPjuDOScga2efnjPA@mail.gmail.com>
 <0DAF21CFE1B20740AE23D6AF6E54843F1E6F607C@IRSMSX101.ger.corp.intel.com>
 <CA+hF=GcW2W6T08BZYXoZQcpe=+QuPp0H7kT2ci+6Td-ZZL+ouQ@mail.gmail.com>
In-Reply-To: <CA+hF=GcW2W6T08BZYXoZQcpe=+QuPp0H7kT2ci+6Td-ZZL+ouQ@mail.gmail.com>
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

SGkgU2ViYXN0aWFuLA0KDQo+IA0KPiA+IFdlIHNob3VsZCBpbnRyb2R1Y2Ugc3BlY2lmaWMgY29t
cGF0aWJsZSBzdHJpbmdzIGZvciB0aGlzIGRyaXZlciwgd2hpY2gNCj4gdHJpZ2dlciB0aGlzLA0K
PiA+IGUuZy4gImxhbnRpcSxub3ItdnI5IiBvciAibGFudGlxLG5vci1hcjEwIiAob3IgYmV0dGVy
IHVzaW5nIGZhbWlseSBuYW1lcw0KPiAieHJ4MjAwIiBhbmQgInhyeDMwMCIpDQo+IA0KPiBZb3Ug
bWVhbiB3ZSBjYW4gdXNlIHRoZSBzYW1lIHdheSBhcyBvdGhlciBkcml2ZXJzLCBmb3IgZXhhbXBs
ZSBpbiB0aGUNCj4gcGh5c21hcF9vZl92ZXJzYXRpbGUuYyBmaWxlIDoNCj4gDQo+IHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN5c2Nvbl9tYXRjaFtdID0gew0KPiAgICAgICAgIHsN
Cj4gICAgICAgICAgICAgICAgIC5jb21wYXRpYmxlID0gImFybSxpbnRlZ3JhdG9yLWFwLXN5c2Nv
biIsDQo+ICAgICAgICAgICAgICAgICAuZGF0YSA9ICh2b2lkICopSU5URUdSQVRPUl9BUF9GTEFT
SFBST1QsDQo+ICAgICAgICAgfSwNCj4gICAgICAgICB7DQo+ICAgICAgICAgICAgICAgICAuY29t
cGF0aWJsZSA9ICJhcm0saW50ZWdyYXRvci1jcC1zeXNjb24iLA0KPiAgICAgICAgICAgICAgICAg
LmRhdGEgPSAodm9pZCAqKUlOVEVHUkFUT1JfQ1BfRkxBU0hQUk9ULA0KPiAgICAgICAgIH0sDQo+
IA0KPiBldGMuLi4NCj4gDQo+IA0KPiBXZSBjYW4ndCBmaWx0ZXIgb24geHJ4MjAwIG9yIHZyOSwg
YnV0IHdlIGhhdmUgdG8ga25vdyB0aGUgVlI5IHZlcnNpb24NCj4gKGFzIHRoZSBWUjkgPCAxLjIg
aXMgbm90IGNvbXBhdGlibGUgd2l0aCB0aGlzIHBhdGNoKS4NCg0KVGhlbiBleHRlbmQgdGhlIGNv
bXBhdGlibGUgc3RyaW5ncyB3aXRoIHZlcnNpb25zICh3aGVyZSBuZWNlc3NhcnkpLg0KVGhpcyBy
ZXF1aXJlcyB0byBrbm93IHRoZSBTb0MgdmVyc2lvbiBmb3IgZWFjaCBib2FyZCwgYnV0IGl0IHNo
b3VsZCBiZSANCm9rYXkgYW5kIGlzIGRvbmUgZm9yIG90aGVyIHN5c3RlbSBhbHJlYWR5IHRoaXMg
d2F5Lg0KDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gU2ViYXN0aWVuDQoNClJlZ2FyZHMsDQpUaG9t
YXMNCg==
