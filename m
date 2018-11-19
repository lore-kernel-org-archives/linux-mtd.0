From: Eugeniy Paltsev <eugeniy.paltsev@synopsys.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "alexey.brodkin@synopsys.com" <alexey.brodkin@synopsys.com>,
 "vineet.gupta1@synopsys.com" <vineet.gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "richard@nod.at" <richard@nod.at>
Subject: Re: [PATCH v2 0/2] MTD: spi-nor: add support for sst26wf016,
 sst26wf032
Date: Mon, 19 Nov 2018 15:25:34 +0000
Message-ID: <1542641133.4940.5.camel@synopsys.com>
References: <20180910114628.19156-1-Eugeniy.Paltsev@synopsys.com>
 <1540216028.19916.6.camel@synopsys.com>
 <20181022155635.2175a595@bbrezillon>
In-Reply-To: <20181022155635.2175a595@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <792B627031D4524B90B1F069409F72FB@internal.synopsys.com>
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

SGkgQm9yaXMsDQoNCkFzIDQuMjAtcmMxIGlzIGFscmVhZHkgb3V0IEkgZ3Vlc3MgeW91IGNhbiBw
aWNrIHRoaXMgcGF0Y2hlcyB0byBzcGktbm9yL25leHQ/DQoNClRoYW5rcy4NCg0KT24gTW9uLCAy
MDE4LTEwLTIyIGF0IDE1OjU2ICswMjAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6DQo+ICtUdWRv
cg0KPiANCj4gSGkgRXVnZW5peSwNCj4gDQo+IFNvcnJ5LCBpdCdzIGFscmVhZHkgdG9vIGxhdGUg
Zm9yIDQuMjAsIGFuZCBJIHdvbid0IGFwcGx5IHBhdGNoZXMgdG8gdGhlDQo+IHNwaS1ub3IvbmV4
dCBicmFuY2ggYmVmb3JlIDQuMjAtcmMxIGlzIG91dC4NCj4gDQo+IFR1ZG9yLCBNYXJlaywgY2Fu
IEkgaGF2ZSBhIFJldmlld2VkLWJ5L0Fja2VkLWJ5IG9uIHRoaXMgcGF0Y2hzZXQ/DQo+IA0KPiBU
aGFua3MsDQo+IA0KPiBCb3Jpcw0KPiANCj4gPiANCj4gPiBPbiBNb24sIDIwMTgtMDktMTAgYXQg
MTQ6NDYgKzAzMDAsIEV1Z2VuaXkgUGFsdHNldiB3cm90ZToNCj4gPiA+IEFkZCBzdXBwb3J0IGZv
ciB0aGUgU1NUIHNzdDI2d2YwMTYgYW5kIHNzdDI2d2YwMzIgZmxhc2ggSUM6DQo+ID4gPiANCj4g
PiA+IHNzdDI2d2YqKiogZmxhc2ggc2VyaWVzIGJsb2NrIHByb3RlY3Rpb24gaW1wbGVtZW50YXRp
b24gZGlmZmVycyBmcm9tIG90aGVyDQo+ID4gPiBTU1Qgc2VyaWVzLCBzbyB3ZSBhZGQgaW1wbGVt
ZW50YXRpb24gZm9yIHNzdDI2d2YqKiogbG9jay91bmxvY2svaXNfbG9ja2VkDQo+ID4gPiBmdW5j
dGlvbnMuDQo+ID4gPiANCj4gPiA+IEFkZCBzc3QyNndmMDE2IGFuZCBzc3QyNndmMDMyIGZsYXNo
IElDIGluZm8gdG8gc3BpX2ZsYXNoX2lkcyBsaXN0Lg0KPiA+ID4gDQo+ID4gPiBFdWdlbml5IFBh
bHRzZXYgKDIpOg0KPiA+ID4gICBtdGQ6IHNwaS1ub3I6IEFkZCBzdXBwb3J0IG9mIHNzdDI2d2Yq
IGZsYXNoIElDcyBwcm90ZWN0aW9uIG9wcw0KPiA+ID4gICBtdGQ6IHNwaS1ub3I6IGFkZCBzdXBw
b3J0IGZvciBzc3QyNndmMDE2LCBzc3QyNndmMDMyDQo+ID4gPiANCj4gPiA+ICBkcml2ZXJzL210
ZC9zcGktbm9yL3NwaS1ub3IuYyB8IDE3OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4gPiA+ICBpbmNsdWRlL2xpbnV4L210ZC9zcGktbm9yLmggICB8ICAgNCAr
DQo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxODMgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gICANCj4g
DQo+IA0KLS0gDQogRXVnZW5peSBQYWx0c2V2
