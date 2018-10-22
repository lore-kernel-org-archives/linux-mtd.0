From: Eugeniy Paltsev <eugeniy.paltsev@synopsys.com>
To: "Eugeniy.Paltsev@synopsys.com" <Eugeniy.Paltsev@synopsys.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 Vineet Gupta <vineet.gupta1@synopsys.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "richard@nod.at" <richard@nod.at>
Subject: Re: [PATCH v2 0/2] MTD: spi-nor: add support for sst26wf016,
 sst26wf032
Date: Mon, 22 Oct 2018 13:47:09 +0000
Message-ID: <1540216028.19916.6.camel@synopsys.com>
References: <20180910114628.19156-1-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20180910114628.19156-1-Eugeniy.Paltsev@synopsys.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CFE53BA8EFEEA49BA7AE581DDEAF3EF@internal.synopsys.com>
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

SGkhDQoNCk1heWJlIHlvdSBoYXZlIGFueSBjb21tZW50cyBvciByZW1hcmtzIGFib3V0IHRoaXMg
cGF0Y2g/QW5kIGlmIHlvdSBkb24ndCBjb3VsZCB5b3UgcGxlYXNlIGFwcGx5IGl0LiBUaGFua3Mh
DQoNCk9uIE1vbiwgMjAxOC0wOS0xMCBhdCAxNDo0NiArMDMwMCwgRXVnZW5peSBQYWx0c2V2IHdy
b3RlOg0KPiBBZGQgc3VwcG9ydCBmb3IgdGhlIFNTVCBzc3QyNndmMDE2IGFuZCBzc3QyNndmMDMy
IGZsYXNoIElDOg0KPiANCj4gc3N0MjZ3ZioqKiBmbGFzaCBzZXJpZXMgYmxvY2sgcHJvdGVjdGlv
biBpbXBsZW1lbnRhdGlvbiBkaWZmZXJzIGZyb20gb3RoZXINCj4gU1NUIHNlcmllcywgc28gd2Ug
YWRkIGltcGxlbWVudGF0aW9uIGZvciBzc3QyNndmKioqIGxvY2svdW5sb2NrL2lzX2xvY2tlZA0K
PiBmdW5jdGlvbnMuDQo+IA0KPiBBZGQgc3N0MjZ3ZjAxNiBhbmQgc3N0MjZ3ZjAzMiBmbGFzaCBJ
QyBpbmZvIHRvIHNwaV9mbGFzaF9pZHMgbGlzdC4NCj4gDQo+IE5PVEU6DQo+IHRoZXNlIHBhdGNo
ZXMgaXMgYmFzaWNhbGx5IGZvbGxvd2luZyBtaW5lIHUtYm9vdCBjb21taXRzIHBvcnQ6DQo+IGh0
dHA6Ly9naXQuZGVueC5kZS8/cD11LWJvb3QuZ2l0O2E9Y29tbWl0ZGlmZjtoPTNkNGZlZDg3YTVm
YTNmZmVkZjY0ZmYyODExY2Q5NWM1YWM0NTAzYWMNCj4gaHR0cDovL2dpdC5kZW54LmRlLz9wPXUt
Ym9vdC5naXQ7YT1jb21taXRkaWZmO2g9YTE5ZTk3MTU3YzM3MjFlZjljNGIxNWM2OGMxNzczNDY3
YTNiNGE5OA0KPiANCj4gQ2hhbmdlcyB2MS0+djI6DQo+ICAqIENoZWNrIHJldHVybiB2YWx1ZSBv
ZiB7cmVhZCB8IHdyaXRlfV9yZWcgY2FsbGJhY2tzLg0KPiANCj4gRXVnZW5peSBQYWx0c2V2ICgy
KToNCj4gICBtdGQ6IHNwaS1ub3I6IEFkZCBzdXBwb3J0IG9mIHNzdDI2d2YqIGZsYXNoIElDcyBw
cm90ZWN0aW9uIG9wcw0KPiAgIG10ZDogc3BpLW5vcjogYWRkIHN1cHBvcnQgZm9yIHNzdDI2d2Yw
MTYsIHNzdDI2d2YwMzINCj4gDQo+ICBkcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyB8IDE3
OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIGluY2x1ZGUv
bGludXgvbXRkL3NwaS1ub3IuaCAgIHwgICA0ICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTgzIGlu
c2VydGlvbnMoKykNCj4gDQotLSANCiBFdWdlbml5IFBhbHRzZXY=
