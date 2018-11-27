Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRYlS-0000fl-BG
 for linux-mtd@lists.infradead.org; Tue, 27 Nov 2018 08:30:40 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: Fix memory allocation in nanddev_bbt_init()
Date: Tue, 27 Nov 2018 08:30:24 +0000
Message-ID: <9365718c-4993-7e3b-1519-8fef0c08c0db@kontron.de>
References: <1543304637-27308-1-git-send-email-frieder.schrempf@kontron.de>
 <20181127092232.3a6d1661@bbrezillon>
In-Reply-To: <20181127092232.3a6d1661@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FB3C31B07BFE1458731A2FD4C566831@snt-world.com>
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

T24gMjcuMTEuMTggMDk6MjIsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToNCj4gT24gVHVlLCAyNyBO
b3YgMjAxOCAwNzo0NDo1MiArMDAwMA0KPiBTY2hyZW1wZiBGcmllZGVyIDxmcmllZGVyLnNjaHJl
bXBmQGtvbnRyb24uZGU+IHdyb3RlOg0KPiANCj4+IEZpeCB0aGUgc2l6ZSBvZiB0aGUgYnVmZmVy
IGFsbG9jYXRlZCB0byBzdG9yZSB0aGUgaW4tbWVtb3J5IEJCVC4NCj4+IFRoaXMgYnVnIHdhcyBw
cmV2aW91c2x5IGhpZGRlbiBieSBhIGRpZmZlcmVudCBidWcsIHRoYXQgd2FzIGZpeGVkIGluDQo+
PiBkMDk4MDkzYmEwNmUuDQo+IA0KPiBPb3BzIDotLy4NCj4gDQo+Pg0KPj4gRml4ZXM6IDljMzcz
NmEzZGUyMSAoIm10ZDogbmFuZDogQWRkIGNvcmUgaW5mcmFzdHJ1Y3R1cmUgdG8gZGVhbCB3aXRo
IE5BTkQgZGV2aWNlcyIpDQo+PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBGcmllZGVyIFNjaHJlbXBmIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+
DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9tdGQvbmFuZC9iYnQuYyB8IDMgKystDQo+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9iYnQuYyBiL2RyaXZlcnMvbXRkL25hbmQvYmJ0LmMNCj4+
IGluZGV4IDU2Y2RlMzguLmMxMjQ5N2YgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L2JidC5jDQo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL2JidC5jDQo+PiBAQCAtMjcsNyArMjcs
OCBAQCBpbnQgbmFuZGRldl9iYnRfaW5pdChzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQpDQo+PiAg
IAl1bnNpZ25lZCBpbnQgbndvcmRzID0gRElWX1JPVU5EX1VQKG5ibG9ja3MgKiBiaXRzX3Blcl9i
bG9jaywNCj4+ICAgCQkJCQkgICBCSVRTX1BFUl9MT05HKTsNCj4+ICAgDQo+PiAtCW5hbmQtPmJi
dC5jYWNoZSA9IGt6YWxsb2MobndvcmRzLCBHRlBfS0VSTkVMKTsNCj4+ICsJbmFuZC0+YmJ0LmNh
Y2hlID0ga3phbGxvYyhud29yZHMgKiAoQklUU19QRVJfTE9ORyAvIEJJVFNfUEVSX0JZVEUpLA0K
PiANCj4gSSBwcmVmZXINCj4gDQo+IAkJCQkJICogc2l6ZW9mKCpuYW5kLT5iYnQuY2FjaGUpDQo+
IElmIHlvdSdyZSBva2F5IHdpdGggdGhpcyBjaGFuZ2UsIEknbGwgZml4IGl0IHdoZW4gYXBwbHlp
bmcgKG5vIG5lZWQgdG8NCj4gc2VuZCBhIG5ldyB2ZXJzaW9uKS4NCg0KU3VyZSwgdGhhdCdzIG9r
Lg==
