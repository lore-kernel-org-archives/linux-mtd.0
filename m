From: Alison Wang <alison.wang@nxp.com>
To: Marek Vasut <marek.vasut@gmail.com>, Alison Wang <b18965@freescale.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
Subject: RE: [PATCH v2 2/2] mtd: nand: Update dependency of IFC for LS1021A
Date: Thu, 5 Jan 2017 02:02:30 +0000
Message-ID: <DB6PR0401MB2584DBE5D6496F44B7169B49F4600@DB6PR0401MB2584.eurprd04.prod.outlook.com>
References: <1483411266-45875-1-git-send-email-b18965@freescale.com>
 <1483411266-45875-2-git-send-email-b18965@freescale.com>
 <4e04eb5e-fb53-f71e-ee49-0872a6c11e97@gmail.com>
 <DB6PR0401MB2584606EC932BF1FAED788E1F4610@DB6PR0401MB2584.eurprd04.prod.outlook.com>
 <ffb2c20d-3aeb-6f5a-1880-3bed0c964821@gmail.com>
In-Reply-To: <ffb2c20d-3aeb-6f5a-1880-3bed0c964821@gmail.com>
Content-Language: zh-CN
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

PiBPbiAwMS8wNC8yMDE3IDAyOjQ2IEFNLCBBbGlzb24gV2FuZyB3cm90ZToNCj4gPj4gT24gMDEv
MDMvMjAxNyAwMzo0MSBBTSwgQWxpc29uIFdhbmcgd3JvdGU6DQo+ID4+PiBBcyBOQU5EIHN1cHBv
cnQgZm9yIEZyZWVzY2FsZS9OWFAgSUZDIGNvbnRyb2xsZXIgaXMgYXZhaWxhYmxlIG9uDQo+ID4+
PiBMUzEwMjFBLCB0aGUgZGVwZW5kZW5jeSBmb3IgTFMxMDIxQSBpcyBhZGRlZC4NCj4gPj4NCj4g
Pj4gRG9lcyBMUyBzdGFuZCBmb3IgTGF5ZXJTY2FwZSA/IFllcyBpdCBkb2VzLiBTbyB3aHkgZG9l
cw0KPiA+PiBBUkNIX0xBWUVSU0NBUEUgbm90IGNvdmVyIExTMTAyMSA/DQo+ID4gW0FsaXNvbiBX
YW5nXSBMUzEwMjFBIGlzIGFuIGVhcmxpZXIgcHJvZHVjdCBhbmQgaXMgbm90IGNvbXBhdGlibGUN
Cj4gd2l0aCBsYXRlciBMYXllcnNjYXBlIGFyY2hpdGVjdHVyZS4gU28gQVJDSF9MQVlFUlNDQVBF
IGNhbid0IGNvdmVyDQo+IExTMTAyMUEuDQo+IA0KPiBBaCBvaywgSSBzZWUuIFRoYXQgaW5mb3Jt
YXRpb24gd291bGQgYmUgdXNlZnVsIGluIHRoZSBjb21taXQgbWVzc2FnZSA7LSkNCj4gDQpbQWxp
c29uIFdhbmddIE9rLiA6KQ0KPiA+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogQWxpc29uIFdhbmcg
PGFsaXNvbi53YW5nQG54cC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+IENoYW5nZXMgaW4gdjI6DQo+
ID4+PiAtIE5vbmUNCj4gPj4+DQo+ID4+PiAgZHJpdmVycy9tdGQvbmFuZC9LY29uZmlnIHwgMiAr
LQ0KPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
PiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL0tjb25maWcgYi9kcml2
ZXJzL210ZC9uYW5kL0tjb25maWcNCj4gPj4gaW5kZXgNCj4gPj4+IDM1M2E5ZGQuLjg1ZTM4NjAg
MTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL0tjb25maWcNCj4gPj4+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvS2NvbmZpZw0KPiA+Pj4gQEAgLTQ0MSw3ICs0NDEsNyBAQCBjb25m
aWcgTVREX05BTkRfRlNMX0VMQkMNCj4gPj4+DQo+ID4+PiAgY29uZmlnIE1URF9OQU5EX0ZTTF9J
RkMNCj4gPj4+ICAJdHJpc3RhdGUgIk5BTkQgc3VwcG9ydCBmb3IgRnJlZXNjYWxlIElGQyBjb250
cm9sbGVyIg0KPiA+Pj4gLQlkZXBlbmRzIG9uIEZTTF9TT0MgfHwgQVJDSF9MQVlFUlNDQVBFDQo+
ID4+PiArCWRlcGVuZHMgb24gRlNMX1NPQyB8fCBBUkNIX0xBWUVSU0NBUEUgfHwgU09DX0xTMTAy
MUENCj4gPj4+ICAJc2VsZWN0IEZTTF9JRkMNCj4gPj4+ICAJc2VsZWN0IE1FTU9SWQ0KPiA+Pj4g
IAloZWxwDQo+ID4+Pg0KPiA+DQo+ID4gQmVzdCBSZWdhcmRzLA0KPiA+IEFsaXNvbiBXYW5nDQo+
ID4NCj4gDQo+IA0KPiAtLQ0KPiBCZXN0IHJlZ2FyZHMsDQo+IE1hcmVrIFZhc3V0DQoNCkJlc3Qg
UmVnYXJkcywNCkFsaXNvbiBXYW5nDQo=
