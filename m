Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHqxN-0002o5-Al
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2018 13:54:51 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.De>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "david.wolfe@nxp.com" <david.wolfe@nxp.com>,
 "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "prabhakar.kushwaha@nxp.com"
 <prabhakar.kushwaha@nxp.com>, "yogeshnarayan.gaur@nxp.com"
 <yogeshnarayan.gaur@nxp.com>, "han.xu@nxp.com" <han.xu@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Subject: Re: [PATCH v2 00/12] Port the FSL QSPI driver to the SPI framework
Date: Wed, 31 Oct 2018 13:54:29 +0000
Message-ID: <dd4b9af1-82f3-469e-e70f-2858e85a5dfe@kontron.de>
References: <1530789310-16254-1-git-send-email-frieder.schrempf@exceet.de>
 <20181031144055.32e1c8f1@bbrezillon>
In-Reply-To: <20181031144055.32e1c8f1@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8A464B254D67E46BB8F7023CB26DF69@snt-world.com>
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

SGkgQm9yaXMsDQoNCk9uIDMxLjEwLjE4IDE0OjQwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6DQo+
IEhpIEZyaWVkZXIsIFlvZ2VzaCwNCj4gDQo+IE9uIFRodSwgIDUgSnVsIDIwMTggMTM6MTQ6NTYg
KzAyMDANCj4gRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBleGNlZXQuZGU+IHdy
b3RlOg0KPiANCj4+IE5vdyB0aGF0IHRoZSBTUEkgbWVtb3J5IGludGVyZmFjZSB3YXMgaW50cm9k
dWNlZCBieSBCb3JpcyBbMV0sIGl0IGlzDQo+PiBwb3NzaWJsZSB0byBtb3ZlIGRyaXZlcnMgZnJv
bSBtdGQvc3BpLW5vciB0byB0aGUgU1BJIGZyYW1ld29yayBpbiBvcmRlcg0KPj4gdG8gdXNlIHRo
ZW0gZm9yIGRpZmZlcmVudCB0eXBlIG9mIFNQSSBtZW1vcnkgY2hpcHMuDQo+Pg0KPj4gUGF0Y2gg
MSBhZGRzIGEgZnVuY3Rpb24gc3BpX21lbV9nZXRfbmFtZSgpIHRvIHRoZSBTUEkgbWVtb3J5IGlu
dGVyZmFjZQ0KPj4gYW5kIGEgLT5uYW1lIGZpZWxkIHRvIHN0cnVjdCBzcGlfbWVtLg0KPj4gUGF0
Y2ggMiB1c2VzIGl0IGluIG0yNXA4MC5jIHRvIG1ha2UgaXQgcG9zc2libGUgZm9yIFNQSSBjb250
cm9sbGVyDQo+PiBkcml2ZXJzIHRvIHByb3ZpZGUgYSBjdXN0b20gbmFtaW5nIHNjaGVtZSBmb3Ig
dGhlIGZsYXNoIGNoaXAuDQo+PiBUaGlzIGlzIG5lZWRlZCB0byBhdm9pZCBicmVha2luZyBjb21w
YXRpYmlsaXR5IG9mIG10ZHBhcnRzIHdoZW4gc3dpdGNoaW5nDQo+PiBmcm9tIHRoZSBvbGQgdG8g
dGhlIG5ldyBkcml2ZXIuDQo+Pg0KPj4gUGF0Y2ggMyBhZGRzIGEgZHJpdmVyIGZvciB0aGUgRnJl
ZXNjYWxlIFFTUEkgY29udHJvbGxlciB0byB0aGUgU1BJDQo+PiBmcmFtZXdvcmsuIFRvZ2V0aGVy
IHdpdGggbTI1cDgwLmMgaXQgY2FuIGJlIHVzZWQgdG8gaW50ZXJmYWNlIFNQSQ0KPj4gTk9SIGZs
YXNoZXMganVzdCBhcyB0aGUgb2xkIGRyaXZlciBkaWQuIEZvciB0aGlzIHRvIHdvcmsgcHJvcGVy
bHkgYSBmZXcNCj4+IG1pbm9yIGNoYW5nZXMgdG8gdGhlIGRldmljZXRyZWVzIGFyZSBuZWNlc3Nh
cnkgKHNlZSBwYXRjaGVzIDUgdG8gNykuDQo+Pg0KPj4gUGF0Y2ggOCBjaGFuZ2VzIHRoZSBkZWZj
b25maWdzIHRvIHVzZSB0aGUgbmV3IGRyaXZlciBhbmQgcGF0Y2ggOSByZW1vdmVzDQo+PiB0aGUg
b2xkIGRyaXZlci4NCj4+DQo+PiBQYXRjaCAxMCBhbmQgMTEgcmVtb3ZlICdmc2wscXNwaS1oYXMt
c2Vjb25kLWNoaXAnIGZyb20gdGhlIGRldmljZXRyZWVzLg0KPj4gUGF0Y2ggMTIgYWRqdXN0cyB0
aGUgTUFJTlRBSU5FUlMgZmlsZS4NCj4+DQo+PiBUaGUgbmV3IGRyaXZlciB3YXMgdGVzdGVkIHdp
dGggaS5NWDZVTCBhbmQgYSBNaWNyb24gU1BJIE5PUiBAIDYwTUh6Lg0KPj4gVGhlIHJlYWQgcGVy
Zm9ybWFuY2Ugb2YgdGhlIG5ldyBkcml2ZXIgaXMgYWxtb3N0IHRoZSBzYW1lIG9yIGV2ZW4gYmV0
dGVyDQo+PiB0aGFuIHRoZSBvbGQgZHJpdmVyLCBkZXBlbmRpbmcgb24gdGhlIGJsb2NrIHNpemUu
DQo+PiBUaGUgd3JpdGUgcGVyZm9ybWFuY2UgaXMgYSBiaXQgc2xvd2VyIG9uIGF2ZXJhZ2UgKH4x
MC0xNSUpLg0KPj4NCj4+IFRoZSBuZXcgZHJpdmVyIHdhcyBhbHNvIHRlc3RlZCB3aXRoIHRoZSBT
UEkgTkFORCBmcmFtZXdvcmsgWzJdIGFuZCBhDQo+PiBXaW5ib25kIFcyNU0wMkdWIGZsYXNoLg0K
Pj4NCj4+IElmIHNvbWVvbmUgaGFzIGEgYm9hcmQgdGhhdCB1c2VzIGJvdGggY2hpcHMgc2VsZWN0
cyBhbmQvb3IgYm90aCBidXNzZXMsDQo+PiBpdCB3b3VsZCBiZSByZWFsbHkgbmljZSB0byBoYXZl
IHRoZSBkcml2ZXIgYmUgdGVzdGVkIG9uIHN1Y2ggYSBzZXR1cC4NCj4gDQo+IEFueSBwcm9ncmVz
cyBvbiB0aGlzIGZyb250PyBZb2dlc2gsIGNhbiB5b3UgcGxlYXNlIHJlbWluZCB1cyB0aGUNCj4g
cmVtYWluaW5nIGlzc3Vlcz8gSSdkIHJlYWxseSBsaWtlIHRvIG1ha2Ugc29tZSBwcm9ncmVzcywg
b3RoZXJ3aXNlIHRoZQ0KPiBjb252ZXJzaW9uIHRvIHNwaS1tZW0gd2lsbCB0YWtlIGFnZXMuDQoN
CkkgZGVmaW5pdGVseSB3YW50IHRvIGNvbnRpbnVlIHRoaXMuIEkganVzdCBkaWQgbm90IGhhdmUg
dGhlIHRpbWUgdG8gd29yayANCm9uIGl0Lg0KDQpJIHRoaW5rIHRoZSBvbmx5IHJlbWFpbmluZyBi
bG9ja2luZyBpc3N1ZXMgaXMgdGhlIG9uZSB0aGF0IFlvZ2VzaCANCnJlcG9ydGVkIHdoaWxlIHRl
c3Rpbmcgd2l0aCB0d28gY2hpcHMgb24gdGhlIHNhbWUgYnVzLg0KDQpIYW4gYW5kIEkgaGF2ZSBi
b3RoIHN1Y2Nlc3NmdWxseSB0ZXN0ZWQgd2l0aCB0d28gY2hpcHMsIGJ1dCBvbiBzZXBhcmF0ZSAN
CmJ1c2VzLg0KDQpSZWdhcmRzLA0KRnJpZWRlcg==
