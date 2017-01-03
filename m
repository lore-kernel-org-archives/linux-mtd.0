From: Alison Wang <alison.wang@nxp.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Alison Wang
 <b18965@freescale.com>
CC: kbuild test robot <lkp@intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "kbuild-all@01.org" <kbuild-all@01.org>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] mtd: nand: Update dependency of IFC for LS1021A
Date: Tue, 3 Jan 2017 01:24:48 +0000
Message-ID: <DB6PR0401MB25848CE3435451BFF3E722D4F46E0@DB6PR0401MB2584.eurprd04.prod.outlook.com>
References: <1482973102-47659-1-git-send-email-b18965@freescale.com>
 <201612291704.0tMw9Uis%fengguang.wu@intel.com>
 <20170102100124.78ca7d7e@bbrezillon>
In-Reply-To: <20170102100124.78ca7d7e@bbrezillon>
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

SGksIEJvcmlzLA0KDQo+IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPiB3cm90ZToN
Cj4gDQo+ID4gSGkgQWxpc29uLA0KPiA+DQo+ID4gW2F1dG8gYnVpbGQgdGVzdCBXQVJOSU5HIG9u
IG10ZC9tYXN0ZXJdIFthbHNvIGJ1aWxkIHRlc3QgV0FSTklORyBvbg0KPiA+IHY0LjEwLXJjMSBu
ZXh0LTIwMTYxMjI0XSBbaWYgeW91ciBwYXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQN
Cj4gPiB0cmVlLCBwbGVhc2UgZHJvcCB1cyBhIG5vdGUgdG8gaGVscCBpbXByb3ZlIHRoZSBzeXN0
ZW1dDQo+ID4NCj4gPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2Nv
bW1pdHMvQWxpc29uLVdhbmcvbXRkLQ0KPiBuYW5kLVVwZGF0ZS1kZXBlbmRlbmN5LW9mLUlGQy1m
b3ItTFMxMDIxQS8yMDE2MTIyOS0xMjUyMzMNCj4gPiBiYXNlOiAgIGdpdDovL2dpdC5pbmZyYWRl
YWQub3JnL2xpbnV4LW10ZC5naXQgbWFzdGVyDQo+ID4gY29uZmlnOiBhcm0tYWxsbW9kY29uZmln
IChhdHRhY2hlZCBhcyAuY29uZmlnKQ0KPiA+IGNvbXBpbGVyOiBhcm0tbGludXgtZ251ZWFiaS1n
Y2MgKERlYmlhbiA2LjEuMS05KSA2LjEuMSAyMDE2MDcwNQ0KPiA+IHJlcHJvZHVjZToNCj4gPiAg
ICAgICAgIHdnZXQgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQv
d2ZnL2xrcC0NCj4gdGVzdHMuZ2l0L3BsYWluL3NiaW4vbWFrZS5jcm9zcyAtTyB+L2Jpbi9tYWtl
LmNyb3NzDQo+ID4gICAgICAgICBjaG1vZCAreCB+L2Jpbi9tYWtlLmNyb3NzDQo+ID4gICAgICAg
ICAjIHNhdmUgdGhlIGF0dGFjaGVkIC5jb25maWcgdG8gbGludXggYnVpbGQgdHJlZQ0KPiA+ICAg
ICAgICAgbWFrZS5jcm9zcyBBUkNIPWFybQ0KPiA+DQo+ID4gQWxsIHdhcm5pbmdzIChuZXcgb25l
cyBwcmVmaXhlZCBieSA+Pik6DQo+ID4NCj4gPiB3YXJuaW5nOiAoTVREX05BTkRfRlNMX0lGQykg
c2VsZWN0cyBGU0xfSUZDIHdoaWNoIGhhcyB1bm1ldCBkaXJlY3QNCj4gPiBkZXBlbmRlbmNpZXMg
KE1FTU9SWSAmJiAoRlNMX1NPQyB8fCBBUkNIX0xBWUVSU0NBUEUpKQ0KPiANCj4gRG8geW91IGhh
dmUgYW5vdGhlciBwYXRjaCBhZGRpbmcgdGhlICd8fMKgU09DX0xTMTAyMUEnIGRlcGVuZGVuY3kg
b24NCj4gRlNMX0lGQz8gSWYgc28sIHBsZWFzZSBzZW5kIGJvdGggcGF0Y2hlcyBpbiB0aGUgc2Ft
ZSBzZXJpZXMuDQo+IA0KW0FsaXNvbiBXYW5nXSBUaGFua3MgZm9yIHlvdXIgcmVtaW5kZXIuIFll
cywgSSBoYXZlIGFub3RoZXIgcGF0Y2guIEkgd2lsbCBzZW5kIGl0IHNvb24uDQoNCg0KQmVzdCBS
ZWdhcmRzLA0KQWxpc29uIFdhbmcNCg==
