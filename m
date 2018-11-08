Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKlne-0002Ww-Vy
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 15:00:53 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>
CC: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yogeshnarayan.gaur@nxp.com>, <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 3/7] mtd: spi-nor: add restriction for nmaps in smpt parser
Date: Thu, 8 Nov 2018 15:00:34 +0000
Message-ID: <e6e7b441-9dff-1265-4820-e29ad2ae0e0b@microchip.com>
References: <20181108110653.21063-1-tudor.ambarus@microchip.com>
 <20181108110653.21063-4-tudor.ambarus@microchip.com>
 <20181108135447.36a0314c@bbrezillon>
 <86d16e39-15df-c12c-7bf3-25996db0c3a9@microchip.com>
 <20181108151509.364e3a85@bbrezillon>
 <4de81d92-ca8e-34f1-55b2-ef1b6b9dcec7@microchip.com>
 <20181108155414.48b64084@bbrezillon>
In-Reply-To: <20181108155414.48b64084@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <273C3E1FA3093547980F297270F06D0C@namprd11.prod.outlook.com>
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

DQoNCk9uIDExLzA4LzIwMTggMDQ6NTQgUE0sIEJvcmlzIEJyZXppbGxvbiB3cm90ZToNCj4gT24g
VGh1LCA4IE5vdiAyMDE4IDE0OjQ4OjExICswMDAwDQo+IDxUdWRvci5BbWJhcnVzQG1pY3JvY2hp
cC5jb20+IHdyb3RlOg0KPiAgIA0KPj4+Pj4+ICsgICAgDQo+Pj4+Pg0KPj4+Pj4gTWF5YmUgSSBt
aXNzZWQgc29tZXRoaW5nIGJ1dCBpdCBzb3VuZHMgbGlrZSB0aGlzIGNoYW5nZSBpcyBqdXN0DQo+
Pj4+PiBvcHRpbWl6aW5nIHRoZSBTUE1UIHBhcnNpbmcgYSBiaXQsIGFuZCB0byBiZSBob25lc3Qs
IEknbSBub3Qgc3VyZSB0aGlzDQo+Pj4+PiBpcyByZWFsbHkgbmVlZGVkLiBNb3N0IG9mIHRoZSB0
aW1lLCBzbXB0X2xlbiB3aWxsIGJlIHJhdGhlciBzbWFsbCwgc28NCj4+Pj4+IHRyeWluZyB0byBi
YWlsIG91dCBlYXJsaWVyIGlzIG5vdCBicmluZ2luZyBtdWNoIHBlcmYgaW1wcm92ZW1lbnRzLiAg
ICANCj4+Pj4NCj4+Pj4gSXQncyByYXRoZXIgYSBzbXRwIHZhbGlkaXR5IGNoZWNrLiBJIHdhbnQg
dG8gcmV0dXJuIGFuIGVycm9yIGlmIHRoZXJlIGFyZSBub3QNCj4+Pj4gZW5vdWdoIGRldGVjdGlv
biBjb21tYW5kcyB0byBpZGVudGlmeSB0aGUgbWFwIGlkLiAgDQo+Pj4NCj4+PiBZb3Ugd291bGQg
aGF2ZSBmYWlsZWQgdGhlIHNhbWUgd2F5IHdpdGhvdXQgdGhpcyB2YWxpZGl0eSBjaGVjayBhZnRl
ciBhDQo+Pj4gbWF4aW11bSBvZiBzbXB0X2xlbiBpdGVyYXRpb25zLCByaWdodD8NCj4+PiAgIA0K
Pj4NCj4+IFJpZ2h0LiBUaGUgY29ycmVjdCBmaXggd291bGQgYmUgdG8gY291bnQgbm1hcHMgaW4g
YSBsb29wLCB0aGVuIGRvIHRoZXNlIGNoZWNrcywNCj4+IGFuZCBpZiBhbGwgb2ssIHNlYXJjaCBm
b3IgdGhlIG1hcF9pZCBpbiBhbm90aGVyIGxvb3AgOikuDQo+IA0KPiBPciBqdXN0IGVycm9yIG91
dCB3aGVuICFuY21kcyAmJiBubWFwcyA+IDEuDQoNClNvbHZlcyBwYXJ0aWFsbHkgdGhlIHByb2Js
ZW0uDQoNCj4gDQo+IElmIHlvdSBpbnNpc3Qgb24ga2VlcGluZyB0aGUgbmNtZHMgJiYgbm1hcHMg
Pj0gKDEgPDwgKG5jbWRzICsgMSkpDQo+IGNoZWNrLCB0aGF0J3MgZmluZSwgYnV0IGl0J3Mgbm90
IHJlcGxhY2luZyB0aGUgY29uc2lzdGVuY3kgY2hlY2sgSSB3YXMNCj4gZG9pbmcgOy0pLg0KPiAN
Cg0KSSBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24gb24gdGhpcywgd2UgY2FuIGxpdmUgd2l0
aG91dCB0aGVzZSBjaGVja3MgYXMgd2VsbC4NCg==
