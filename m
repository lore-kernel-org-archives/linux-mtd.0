From: bpqw <bpqw@micron.com>
To: Marek Vasut <marex@denx.de>
Subject: RE: [PATCH 1/1 v2] driver:mtd:spi-nor:fix spi_nor_scan overwrite
 platform ID point
Date: Thu, 16 Oct 2014 00:52:02 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315E6D82@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315E62CB@NTXXIAMBX02.xacn.micron.com>
 <201410150045.53976.marex@denx.de>
In-Reply-To: <201410150045.53976.marex@denx.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DQo+V29uJ3QgJGluZm8gY29udGFpbiBhbiB1bmRlZmluZWQgdmFsdWUgaW4gY2FzZSB0aGUgbmV3
bHkgYWRkZWQgY29uZGl0aW9uIGlzbid0IG1ldCA/IFRoZSBvbGQgY29kZSBpbml0aWFsaXplZCAk
aW5mbyB0byBhIGNlcnRhaW4gdmFsdWUgYWx3YXlzLCB0aGUgbmV3IGNvZGUgZG9lcyBub3QgZG8g
dGhhdC4NCg0KSGksTWFyZWsgVmFzdXQNCiBUaGFua3MudGhlICRpbmZvIGhhcyBiZWVuIGRlZmlu
ZWQgYmVmb3JlIGFzIGJlbG93Og0KDQogaW5mbyA9ICh2b2lkICopaWQtPmRyaXZlcl9kYXRhOw0K
ICANClVubGVzcyBpZCBoYXMgbm90IGJlZW4gaW5pdGlhbGl6ZWQgYmVmb3JlLklmIGhhdmluZyB0
aGUgZm9sbG93aW5nIHNpdHVhdGlvbiwNCmN1cnJlbnQgbGludXggY29kZXMgd2lsbCBub3QgcHJv
cGVybHkgbWF0Y2ggcGxhdGZvcm0gZGV2aWNlIGRhdGE6DQoNCkZvciBleGFtcGxlOg0KDQpjb25z
dCBzdHJ1Y3Qgc3BpX2RldmljZV9pZCBzcGlfbm9yX2lkc1tdID0gew0KLi4uLi4uDQouLi4uLi4N
Ci4uLi4uLg0KCXsgIm4yNXEwNjQiLCAgICAgSU5GTygweDIwYmExNywgMCwgNjQgKiAxMDI0LCAg
MTI4LCAwKSB9LA0KCXsgIm4yNXExMjhhMTEiLCAgSU5GTygweDIwYmIxOCwgMCwgNjQgKiAxMDI0
LCAgMjU2LCAwKSB9LC8vZm9ybWVyIHJpZ2h0IHBsYXRmb3JtIHBvaW50IHdpbGwgYmUgb3Zlcndy
b3RlIGJ5IHRoaXMgZGF0YSBpbmZvLg0KCXsgIm4yNXExMjhhMTMiLCAgSU5GTygweDIwYmIxOCwg
MHgxMjM0LCA2NCAqIDEwMjQsICA1MTIsIFNFQ1RfNEspIH0sLy90aGlzIGlzIHRoZSByaWdodCBw
bGF0Zm9ybSBkYXRhLEkgd2FudCB0byBtYXRjaCB0aGlzIGRhdGEgaW5mby4NCgl7ICJuMjVxMjU2
YSIsICAgIElORk8oMHgyMGJhMTksIDAsIDY0ICogMTAyNCwgIDUxMiwgU0VDVF80SykgfSwNCgl7
ICJuMjVxNTEyYSIsICAgIElORk8oMHgyMGJiMjAsIDAsIDY0ICogMTAyNCwgMTAyNCwgU0VDVF80
SykgfSwNCi4uLi4uLg0KLi4uLi4uDQouLi4uLi4NCn07DQpFWFBPUlRfU1lNQk9MX0dQTChzcGlf
bm9yX2lkcyk7DQoNCk1heWJlIG15IHBhdGNoIHNob3VsZCB0YWtlIGludG8gYWNjb3VudCB0aGF0
IElEIGlzIE5VTEwsDQpJIHdhbnQgdG8gY2hhbmdlIG15IHBhdGNoIGZvbGxvd2luZywgY291bGQg
eW91IHBsZWFzZSBnaXZlIG1lIHNvbWUgc3VnZ2VzdGlvbnM6DQoNCglzdHJ1Y3QgZmxhc2hfaW5m
byAqdG1waW5mbzsNCg0KCXRtcGluZm8gPSAodm9pZCAqKWppZC0+ZHJpdmVyX2RhdGE7DQoJaWYg
KGlkID09IE5VTEwgfHwgdG1waW5mby0+amVkZWNfaWQgIT0gaW5mby0+amVkZWNfaWQgfHwNCgkJ
IChpbmZvLT5leHRfaWQgIT0gMCAmJiB0bXBpbmZvLT5leHRfaWQgIT0gaW5mby0+ZXh0X2lkKSkg
ew0KCQkJZGV2X3dhcm4oZGV2LCAiZm91bmQgJXMsIGV4cGVjdGVkICVzXG4iLA0KCQkJCWppZC0+
bmFtZSwgaWQtPm5hbWUpOw0KCQkJaWQgPSBqaWQ7DQoJCQlpbmZvID0gKHZvaWQgKilqaWQtPmRy
aXZlcl9kYXRhOw0KCQkJCX0NCg==
