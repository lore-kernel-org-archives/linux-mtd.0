From: =?utf-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
To: Rafal Milecki <zajec5@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: RE: [V6 PATCH 1/1] driver:mtd:spi-nor: Add quad I/O support for
 Micron spi nor
Date: Mon, 15 Dec 2014 14:24:44 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315F15FC@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315EF2C5@NTXXIAMBX02.xacn.micron.com>
 <A765B125120D1346A63912DDE6D8B6315F03C4@NTXXIAMBX02.xacn.micron.com>
 <CACna6rz8K1PcfPXCogbWtGd=zS9cRCEZVZ=wC_dUYHO1S5S28w@mail.gmail.com>
In-Reply-To: <CACna6rz8K1PcfPXCogbWtGd=zS9cRCEZVZ=wC_dUYHO1S5S28w@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "shijie8@gmail.com" <shijie8@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pj4gKyAgICAgICB7ICJuMjVxMjU2YSIsICAgIElORk8oMHgyMGJhMTksIDAsIDY0ICogMTAyNCwg
IDUxMiwgU0VDVF80SyB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9LA0KPj4gKyAgICAgICB7ICJuMjVx
NTEyYSIsICAgIElORk8oMHgyMGJiMjAsIDAsIDY0ICogMTAyNCwgMTAyNCwgU0VDVF80SyB8IFVT
RV9GU1IgfCBTUElfTk9SX1FVQURfUkVBRCkgfSwNCj4+ICsgICAgICAgeyAibjI1cTUxMmF4MyIs
ICBJTkZPKDB4MjBiYTIwLCAwLCA2NCAqIDEwMjQsIDEwMjQsIFNFQ1RfNEsgfCBVU0VfRlNSIHwg
U1BJX05PUl9RVUFEX1JFQUQpIH0sDQo+PiArICAgICAgIHsgIm4yNXEwMCIsICAgICAgSU5GTygw
eDIwYmEyMSwgMCwgNjQgKiAxMDI0LCAyMDQ4LCBTRUNUXzRLIHwgVVNFX0ZTUiB8IFNQSV9OT1Jf
UVVBRF9SRUFEKSB9LA0KDQo+RXZlbiB0aGUgQ29kaW5nU3R5bGUgc2F5cyBleGNlZWRpbmcgODAg
Y29sdW1ucyBjYW4gYmUgYWNjZXB0ZWQ6DQoNCj4+IFN0YXRlbWVudHMgbG9uZ2VyIHRoYW4gODAg
Y29sdW1ucyB3aWxsIGJlIGJyb2tlbiBpbnRvIHNlbnNpYmxlIGNodW5rcywgDQo+PiB1bmxlc3Mg
ZXhjZWVkaW5nIDgwIGNvbHVtbnMgc2lnbmlmaWNhbnRseSBpbmNyZWFzZXMgcmVhZGFiaWxpdHkg
YW5kIA0KPj4gZG9lcyBub3QgaGlkZSBpbmZvcm1hdGlvbi4NCg0KPiBWYXJpb3VzIGhhcmR3YXJl
IHRhYmxlcyBvZnRlbiBoYXBwZW4gdG8gdXNlIG1vcmUgY2hhcnMvbGluZS4NCg0KVGhhbmtzIGZv
ciByZXNwb25zZS4NCg0KRGVhciBNVEQgbWFpbnRhaW5lcjoNCg0KSG93IGFib3V0IHRoaXMgcGF0
Y2g/IEFuZCBpdCBoYXMgdXBkYXRlZCB0byBzaXh0aCB2ZXJzaW9uLg0KSXMgdGhlcmUgb3RoZXIg
c3BhY2VzIHRvIGJlIHVwZGF0ZWQ/DQoNCg==
