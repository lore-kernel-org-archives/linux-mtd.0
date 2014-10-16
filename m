From: =?utf-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
To: Rafal Milecki <zajec5@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: RE: [PATCH 1/1 v2] driver:mtd:spi-nor:fix spi_nor_scan overwrite
 platform ID point
Date: Thu, 16 Oct 2014 08:00:51 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315E6F6F@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315E62CB@NTXXIAMBX02.xacn.micron.com>
 <CACna6rw4g1wWPv+VgL8WeA9rz-j8A6k+4bN7D=MQ9OU-BinToA@mail.gmail.com>
In-Reply-To: <CACna6rw4g1wWPv+VgL8WeA9rz-j8A6k+4bN7D=MQ9OU-BinToA@mail.gmail.com>
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

PlRoZXJlIGFyZSBhIGxvdCBvZiBjaGFuZ2VzIGhhcHBlbmluZy9yZXF1ZXN0ZWQgYXJvdW5kIHRo
aXMgY29kZS4gSSBhbHNvIHByb3Bvc2VkIHNvbWUgcGF0Y2ggdG91Y2hpbmcgdGhpcyBjb2RlLCBz
ZWUgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8zNzc5MTcvDQoNCj5SaWdodCBu
b3cgdGhlcmUgaXMgYSBzbG93IG9uZ29pbmcgd29yayBvbiBmaXhpbmcgc29tZSBtMjVwODAgcmVn
cmVzc2lvbiwgd2hpY2ggYWxzbyBtYXkgdG91Y2ggdGhlIGNvZGUgeW91IGNoYW5nZS4gU28gSSds
bCBzdWdnZXN0IHBvc3Rwb25pbmcgdGhpcyBwYXRjaCB1bnRpbCB3ZSBnZXQgYSByZWdyZXNzaW9u
IGZpeGVkIGFuZCB0aGVuIHdvcmsgb24gdGhpcyBoYWNreSBjb2RlIGFnYWluLg0KDQoNClRoYW5r
cyBmb3IgeW91ciBjb25jZXJucy5CdXQgZm9yIHRoZSBzYW1lIGRlaXZjZSBpZCB3aXRoIHRoZSBk
aWZmZXJlbnQgZXh0ZW5kZWQgaWQgYW5kDQp0aGUgc2FtZSBkZXZpY2UgbmFtZSB3aXRoIHRoZSBk
aWZmZXJlbnQgZGV2aWNlIGlkIGlzc3VlLCBpbiB5b3VyIHBhdGNoLHRoaXMgZG9lc24ndCB0YWtl
DQppbnRvIGFjY291bnQuIEkgaGF2ZSBlbmNvdW50ZXJlZCB0aGlzIHNpdHVhdGlvbi4gZm9yIGV4
YW1wbGU6DQoNCg0KZmlyc3QgY29uZGl0aW9uIChmb3IgdGhlIHNhbWUgZGVpdmNlIGlkIHdpdGgg
dGhlIGRpZmZlcmVudCBleHRlbmRlZCBpZCk6DQoNCgl7ICJuMjVxMDY0IiwgICAgIElORk8oMHgy
MGJhMTcsIDAsIDY0ICogMTAyNCwgIDEyOCwgMCkgfSwNCgl7ICJuMjVtbDA2NCIsICAgIElORk8o
MHgyMGJhMTcsIDB4MTIzNCwgNjQgKiAxMDI0LCAgMjU2LCAwKSB9LC8vcmlnaHQgZGV2aWNlIGRh
dGENCgl7ICJuMjVxMTI4YTEzIiwgIElORk8oMHgyMGJhMTgsIDAsIDY0ICogMTAyNCwgIDI1Niwg
MCkgfSwNCgl7ICJuMjVxMjU2YSIsICAgIElORk8oMHgyMGJhMTksIDAsIDY0ICogMTAyNCwgIDUx
MiwgU0VDVF80SykgfSwNCgl7ICJuMjVxNTEyYSIsICAgIElORk8oMHgyMGJiMjAsIDAsIDY0ICog
MTAyNCwgMTAyNCwgU0VDVF80SykgfSwNCg0Kc2Vjb25kIGNvbmRpdGlvbih0aGUgc2FtZSBkZXZp
Y2UgaWQgd2l0aCB0aGUgZGlmZmVyZW50IGRldmljZSBuYW1lKToNCg0KIAl7ICJuMjV0bDI4Iiwg
ICAgIElORk8oMHgyMGJhMTcsIDAsIDY0ICogMTAyNCwgIDEyOCwgMCkgfSwNCgl7ICJuMjVtbDAy
OCIsICAgICBJTkZPKDB4MjBiYTE3LCAwLCA2NCAqIDEwMjQsICAyNTYsIDApIH0sLy9yaWdodCBk
ZXZpY2UgZGF0YQ0KCXsgIm4yNXExMjhhMTMiLCAgSU5GTygweDIwYmExOCwgMCwgNjQgKiAxMDI0
LCAgMjU2LCAwKSB9LA0KCXsgIm4yNXEyNTZhIiwgICAgSU5GTygweDIwYmExOSwgMCwgNjQgKiAx
MDI0LCAgNTEyLCBTRUNUXzRLKSB9LA0KCXsgIm4yNXE1MTJhIiwgICAgSU5GTygweDIwYmIyMCwg
MCwgNjQgKiAxMDI0LCAxMDI0LCBTRUNUXzRLKSB9LA0K
