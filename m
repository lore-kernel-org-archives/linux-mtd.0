From: bpqw <bpqw@micron.com>
To: Rafal Milecki <zajec5@gmail.com>
Subject: RE: [PATCH 1/1 v2] driver:mtd:spi-nor:fix spi_nor_scan overwrite
 platform ID point
Date: Thu, 16 Oct 2014 08:41:54 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315E6FE5@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315E62CB@NTXXIAMBX02.xacn.micron.com>
 <CACna6rw4g1wWPv+VgL8WeA9rz-j8A6k+4bN7D=MQ9OU-BinToA@mail.gmail.com>
 <A765B125120D1346A63912DDE6D8B6315E6F6F@NTXXIAMBX02.xacn.micron.com>
 <CACna6rxNbPzSYbe9GjQCSAeB8FgVi6ZpgKo=AB=6nYc4QcqN1g@mail.gmail.com>
In-Reply-To: <CACna6rxNbPzSYbe9GjQCSAeB8FgVi6ZpgKo=AB=6nYc4QcqN1g@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
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

DQo+SSByZWFsbHkgd2Fzbid0IGxvb2tpbmcgaW50byBkZXRhaWxzIHlldCBhbmQgSSdtIGF3YXJl
IG15IHBhdGNoIGRvZXMgc29tZXRoaW5nIGVsc2UuIEkganVzdCBzYXkgd2Ugc2hvdWxkIGZpcnN0
IGZpeCB0aGUgcmVncmVzc2lvbiBhbmQgdGhlbiBiYXNlIG5leHQgcGF0Y2hlcyBvbiB0b3Agb2Yg
dGhhdCByZWdyZXNzaW9uIGZpeC4gSSdtIG5vdCBOQUNLaW5nIHlvdXIgY2hhbmdlcyA6KQ0KDQpJ
IHdpbGwgdGFrZSBpbnRvIGFjY291bnQgZm9yIHlvdXIgcGF0Y2gsYW5kIHdpbGwgY292ZXIgYWxs
IHRoZXNlIGlzc2UgaW4gbXkgbmV4dCB2ZXJzaW9uIHBhdGNoLg0KDQpCeSB0aGUgd2F5ICxJIHN0
aWxsIGRvbid0IHVuZGVyc3RhbmQgd2h5IHlvdSBzcGVjaWZ5IGlkIE5VTEwgaW4geW91IHBhdGNo
Og0KDQorCWlmIChpZCkgew0KKwkJaW5mbyA9ICh2b2lkICopaWQtPmRyaXZlcl9kYXRhOw0KKwkJ
aWYgKGluZm8tPmplZGVjX2lkKSB7DQorCQkJZGV2X3dhcm4oZGV2LA0KKwkJCQkgInBhc3NlZCBT
UEkgZGV2aWNlIElEICglcykgY29udGFpbnMgSkVERUMsIGlnbm9yaW5nIGl0LCBkcml2ZXIgc2hv
dWxkIGJlIGZpeGVkIVxuIiwNCisJCQkJIGlkLT5uYW1lKTsNCisJCQlpZCA9IE5VTEw7DQogCQl9
DQogCX0NCiANCisJaWYgKCFpZCkgew0KKwkJaWQgPSBub3ItPnJlYWRfaWQobm9yKTsNCisJCWlm
IChJU19FUlIoaWQpKQ0KKwkJCXJldHVybiBQVFJfRVJSKGlkKTsNCisJfQ0KKwlpbmZvID0gKHZv
aWQgKilpZC0+ZHJpdmVyX2RhdGE7DQorDQo=
