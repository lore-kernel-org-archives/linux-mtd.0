Received: from mail-am1on0054.outbound.protection.outlook.com ([157.56.112.54]
 helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aIsYS-0006P9-JX
 for linux-mtd@lists.infradead.org; Tue, 12 Jan 2016 06:35:47 +0000
From: Zhiqiang Hou <zhiqiang.hou@nxp.com>
To: Michal Suchanek <hramrach@gmail.com>
CC: Andrew Murray <amurray@embedded-bits.co.uk>, Huang Shijie
 <shijie.huang@intel.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>, Rafa? Mi?ecki
 <zajec5@gmail.com>, Huang Shijie <b32955@freescale.com>, Ben Hutchings
 <ben@decadent.org.uk>, Marek Vasut <marex@denx.de>, Gabor Juhos
 <juhosg@openwrt.org>, =?gb2312?B?QmVhbiBIdW8gu/Sx87HzLA==?=
 <beanhuo@micron.com>, MTD Maling List <linux-mtd@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 7/7] mtd: spi-nor: add read loop
Date: Tue, 12 Jan 2016 06:35:21 +0000
Message-ID: <CY1PR0301MB078027133F88A76F2FE2E5FA8B060@CY1PR0301MB0780.namprd03.prod.outlook.com>
References: <cover.1439543572.git.hramrach@gmail.com>
 <1592668a061137b33c9a6392dfccc67c69fc1fe6.1439543572.git.hramrach@gmail.com>
 <CAPcvp5HB7m47ZTqQ0fE7EV42kNWO=i1EQaysNtgXw6V+oWoUdA@mail.gmail.com>
 <CAOMqctQOU91hbt+2O0qQe3tjMn=3pSYE8E4xPpeS3iGG2A5h8w@mail.gmail.com>
 <CY1PR0301MB0780A9588AA9348DCEA4823F8B290@CY1PR0301MB0780.namprd03.prod.outlook.com>
 <CAOMqctRYGjhSeKtDQ3JuRV3Dvom3qW=tLxSOJmPF8r7gF93JiQ@mail.gmail.com>
In-Reply-To: <CAOMqctRYGjhSeKtDQ3JuRV3Dvom3qW=tLxSOJmPF8r7gF93JiQ@mail.gmail.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-ID: <2B21577ED0205646B386D15AE7781A14@eurprd04.prod.outlook.com>
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

SGkgTWljaGFsLA0KDQpUaGFua3MgZm9yIHlvdXIgaW5mbywgYW5kIEkgc2VlIHlvdSBoYXZlIHVw
ZGF0ZWQgdGhlIHBhdGNoc2V0IG9uIERlYy4wMi4gSXMgaXQgdGhlIGNvbmNsdXNpb24sIHJpZ2h0
Pw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hhbCBTdWNoYW5l
ayBbbWFpbHRvOmhyYW1yYWNoQGdtYWlsLmNvbV0NCj4gU2VudDogMjAxNcTqMTHUwjIxyNUgMzox
OQ0KPiBUbzogSG91IFpoaXFpYW5nLUI0ODI4Ng0KPiBDYzogQW5kcmV3IE11cnJheTsgSHVhbmcg
U2hpamllOyBEYXZpZCBXb29kaG91c2U7IEJyaWFuIE5vcnJpczsgWHUgSGFuLQ0KPiBCNDU4MTU7
IFJhZmE/IE1pP2Vja2k7IEh1YW5nIFNoaWppZTsgQmVuIEh1dGNoaW5nczsgTWFyZWsgVmFzdXQ7
IEdhYm9yDQo+IEp1aG9zOyBCZWFuIEh1byC79LHzsfMsOyBNVEQgTWFsaW5nIExpc3Q7IExLTUwN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCA3LzddIG10ZDogc3BpLW5vcjogYWRkIHJlYWQgbG9v
cA0KPiANCj4gSGVsbG8sDQo+IA0KPiBPbiA1IE5vdmVtYmVyIDIwMTUgYXQgMDQ6MzksIEhvdSBa
aGlxaWFuZyA8QjQ4Mjg2QGZyZWVzY2FsZS5jb20+IHdyb3RlOg0KPiA+IEhpIE1pY2hhbCwNCj4g
Pg0KPiA+IERvZXMgdGhpcyBoYXZlIGFueSB1cGRhdGVzPw0KPiANCj4gSSB3aWxsIHRyeSB0byB1
cGRhdGUgdGhpcyBwYXRjaHNldCB3aGVuIGl0J3MgYWdyZWVkIGhvdyB0aGUgbGltaXQgb24NCj4g
dHJhbnNmZXIgc2l6ZSBpcyBoYW5kbGVkLiBXcml0aW5nIGxlc3MgZGF0YSB0aGFuIHdhcyByZXF1
ZXN0ZWQgaXMNCj4gYWNjZXB0YWJsZSBmb3Igc3BpLW5vciBidXQgbWlnaHQgZGlzcnVwdCBvdGhl
ciBkcml2ZXJzIHNvIHBlcmhhcHMgc29tZQ0KPiBwcmVlbXB0aXZlIG1lY2hhbmlzbSB3aXRoIHRo
ZSBTUEkgbWFzdGVyIHNheWluZyBob3cgbXVjaCBkYXRhIGl0IGNhbg0KPiB0cmFuc2ZlciBhbmQg
dGhlIGRyaXZlcnMgbG9va2luZyBhdCB0aGF0IHZhbHVlIHdvdWxkIGJlIHByZWZlcnJlZC4NCj4g
DQoNClRoYW5rcywNClpoaXFpYW5nDQo=
