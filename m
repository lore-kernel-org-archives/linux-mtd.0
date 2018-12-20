From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>
CC: arm-soc <arm@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, "Sascha
 Hauer" <kernel@pengutronix.de>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>, linux-mtd
 <linux-mtd@lists.infradead.org>, linux-spi <linux-spi@vger.kernel.org>
Subject: Re: [GIT PULL] FSL QSPI device tree cleanup for 4.21
Date: Thu, 20 Dec 2018 16:03:00 +0000
Message-ID: <a73f86ff-15ce-9512-bbf0-be852cf39a35@kontron.de>
References: <20181216084854.GJ13243@dragon>
 <CAK8P3a34R+Gv+H8_jjGP452i2kSqq+u0PsE-4pDnRRtY14SG0w@mail.gmail.com>
In-Reply-To: <CAK8P3a34R+Gv+H8_jjGP452i2kSqq+u0PsE-4pDnRRtY14SG0w@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <81C3C2577D791D4FA423DF89163C052B@snt-world.com>
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

SGkgQXJuZCwNCg0KT24gMjAuMTIuMTggMTY6NTAsIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+IE9u
IFN1biwgRGVjIDE2LCAyMDE4IGF0IDk6NTAgQU0gU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwu
b3JnPiB3cm90ZToNCj4+DQo+PiBIaSwNCj4+DQo+PiBBcyB0aGUgc2VyaWVzIGNsZWFucyB1cCBi
b3RoIGkuTVgvRnJlZXNjYWxlIGFybTMyIGFuZCBhcm02NCBkZXZpY2UNCj4+IHRyZWVzLCB0aGUg
cHVsbCByZXF1ZXN0IGlzIGJhc2VkIG9uIGEgbWVyZ2Ugb2YgdGFnIGlteC1kdC00LjIxIGFuZA0K
Pj4gaW14LWR0NjQtNC4yMSB0aGF0IGhhdmUgYWxyZWFkeSBiZWVuIHB1bGxlZCBpbnRvIGFybS1z
b2MgbmV4dC9kdCBicmFuY2guDQo+PiBUaGlzIGNvbWVzIGEgYml0IGxhdGUsIGFuZCB3ZSBhcHBy
ZWNpYXRlIGl0IGlmIHlvdSBjYW4gcHVsbCBpdCBmb3IgNC4yMSwNCj4+IGFzIGl0IHBhdmVzIHRo
ZSB3YXkgZm9yIG5ldyBRU1BJIGRyaXZlciB1bmRlciBTUEkgZnJhbWV3b3JrIHRvIGxhbmQgaW4N
Cj4+IHRoZSBuZXh0IHJlbGVhc2UgY3ljbGUuICBUaGFua3MuDQo+IA0KPiBQdWxsZWQgaW50byBu
ZXh0L2R0LiBGb3IgbXkgdW5kZXJzdGFuZGluZywgd2hhdCBpcyBnb2luZyB0byBoYXBwZW4NCj4g
d2l0aCB0aGUgZnNsLXF1YWRzcGkgbXRkIGRyaXZlcj8gV2lsbCBpdCByZW1haW4gYXMgcGFydCBv
ZiB0aGUga2VybmVsDQo+IHRvIHN1cHBvcnQgb2xkIERUQiBmaWxlcywgb3Igd2lsbCB0aGF0IHRy
YW5zaXRpb25zIG1lYW4gdGhvc2Ugc3RvcA0KPiB3b3JraW5nIHdpdGggbmV3IGtlcm5lbHMgYW5k
IGhhdmUgdG8gYmUgdXBkYXRlZCB0aGUgc2FtZSB3YXk/DQoNClRoYW5rcyBmb3IgcHVsbGluZyB0
aGVzZSBsYXRlIGNoYW5nZXMuIFRoZSBvbGQgU1BJIE5PUiBkcml2ZXIgDQooZnNsLXF1YWRzcGku
Yykgd2lsbCBiZSByZXBsYWNlZCBieSB0aGUgbmV3IFNQSSBkcml2ZXIuIE9sZCBkdGIgZmlsZXMg
DQp3aWxsIHdvcmsgd2l0aCB0aGUgbmV3IGRyaXZlciBpZiB0aGV5IGFscmVhZHkgaGF2ZSB0aGUg
cmVnIHByb3BlcnRpZXMgDQpzZXQgdXAgY29ycmVjdGx5ICh3aGljaCBzaG91bGQgYmUgdGhlIGNh
c2UsIGJ1dCB3aG8ga25vd3Mgd2hhdCBzZXR1cHMgDQpleGlzdCBvdXQtb2YtdHJlZSkuDQpUaGVy
ZSB3aWxsIGJlIGEgcGVyZm9ybWFuY2UgcGVuYWx0eSB0aG91Z2ggaWYgeW91IGRvIG5vdCBzZXQg
DQpzcGktW3R4L3J4XS1idXMtd2lkdGggdG8gNC4NCg0KRm9yIHJlZmVyZW5jZSBoZXJlIGlzIHRo
ZSBsYXRlc3Qgc2V0IG9mIHBhdGNoZXM6IA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9j
b3Zlci8xMDA3NjQxLw0KDQpUaGFua3MsDQpGcmllZGVy
