From: =?utf-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [V6 PATCH 1/1] driver:mtd:spi-nor: Add quad I/O support for
 Micron spi nor
Date: Wed, 17 Dec 2014 04:47:11 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315F1993@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315EF2C5@NTXXIAMBX02.xacn.micron.com>
 <20141217032952.GV9759@ld-irv-0074>
In-Reply-To: <20141217032952.GV9759@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pj4gKwl7ICJuMjVxMDMyIiwJIElORk8oMHgyMGJhMTYsIDAsIDY0ICogMTAyNCwgICA2NCwgU1BJ
X05PUl9RVUFEX1JFQUQpIH0sDQo+PiArCXsgIm4yNXEwNjQiLCAgICAgSU5GTygweDIwYmExNywg
MCwgNjQgKiAxMDI0LCAgMTI4LCBTUElfTk9SX1FVQURfUkVBRCkgfSwNCj4+ICsJeyAibjI1cTEy
OGExMSIsICBJTkZPKDB4MjBiYjE4LCAwLCA2NCAqIDEwMjQsICAyNTYsIFNQSV9OT1JfUVVBRF9S
RUFEKSB9LA0KPj4gKwl7ICJuMjVxMTI4YTEzIiwgIElORk8oMHgyMGJhMTgsIDAsIDY0ICogMTAy
NCwgIDI1NiwgU1BJX05PUl9RVUFEX1JFQUQpIH0sDQo+PiArCXsgIm4yNXEyNTZhIiwgICAgSU5G
TygweDIwYmExOSwgMCwgNjQgKiAxMDI0LCAgNTEyLCBTRUNUXzRLIHwgU1BJX05PUl9RVUFEX1JF
QUQpIH0sDQo+PiArCXsgIm4yNXE1MTJhIiwgICAgSU5GTygweDIwYmIyMCwgMCwgNjQgKiAxMDI0
LCAxMDI0LCBTRUNUXzRLIHwgVVNFX0ZTUiB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9LA0KPj4gKwl7
ICJuMjVxNTEyYXgzIiwgIElORk8oMHgyMGJhMjAsIDAsIDY0ICogMTAyNCwgMTAyNCwgU0VDVF80
SyB8IFVTRV9GU1IgfCBTUElfTk9SX1FVQURfUkVBRCkgfSwNCj4+ICsJeyAibjI1cTAwIiwgICAg
ICBJTkZPKDB4MjBiYTIxLCAwLCA2NCAqIDEwMjQsIDIwNDgsIFNFQ1RfNEsgfCBVU0VfRlNSIHwg
U1BJX05PUl9RVUFEX1JFQUQpIH0sDQoNCj5BcmUgeW91IHN1cmUgKmFsbCogb2YgdGhlc2Ugc3Vw
cG9ydCBxdWFkIG1vZGU/IEkga25vdyBzb21lIG1hbnVmYWN0dXJlcnMNCj5oYXZlIGJlZW4ga25v
d24gdG8gcmV1c2UgSURzLCBhbmQgSSB3b3VsZG4ndCB3YW50IGEgZmFsc2UgcG9zaXRpdmUgdG8g
c2xpcA0KPmluIGhlcmUsIHdoZXJlIGFuIG9sZCBwYXJ0IG1pZ2h0IG5vdCBzdXBwb3J0IGl0IGJ1
dCB0aGUgbmV3IG9uZSBkb2VzLi4uDQoNClllcyxJIGFtIHN1cmUgdGhhdCBhbGwgTWljcm9uIHNw
aSBub3IgaW4gYWJvdmUgdGFibGUgc3VwcG9ydCBxdWFkIG1vZGUsdGhleSBhcmUNCmFsbCBOMjVR
IHNlcmlhbCBzcGkgbm9yLkFzIGZvciBvdXIgTWljcm9uIHNwaSBub3Igd2l0aG91dCBxdWFkIG1v
ZGUsIA0KSSBkb24ndCBhZGQgdGhlbSBpbiB0aGUgYWJvdmUgdGFibGUsYW5kIHRoZXkgaGF2ZSBk
aWZmZXJlbnQgSUQgd2l0aCBhYm92ZSBkZXZpY2UuDQoNCg0KPldpdGggaW50IHZzLiB1OCBmaXhl
ZCB1cCwgdGhpcyBsb29rcyBnb29kLiBIb3BlZnVsbHkgSSBjYW4gdGFrZSB2NyENCg0KVGhhbmtz
ICxpdCdzIHZlcnkgbmljZSBvZiB5b3UuDQoNCj5UaGFua3MsDQo+QnJpYW4NCg==
