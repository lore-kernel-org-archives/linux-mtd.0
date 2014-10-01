From: =?utf-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
To: Marek Vasut <marex@denx.de>
Subject: RE: [PATCH 1/1 v3] driver:mtd:spi-nor: Add Micron quad I/O support
Date: Wed, 1 Oct 2014 14:24:41 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315E3D3F@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409261046.07132.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315E3C79@NTXXIAMBX02.xacn.micron.com>
 <201409301538.40466.marex@denx.de>
In-Reply-To: <201409301538.40466.marex@denx.de>
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

Pj4gRm9yIE1pY3JvbiBzcGkgbm9yZmxhc2gsZW5hYmxlcyBvciBkaXNhYmxlcyBxdWFkIEkvTyBw
cm90b2NvbCAsd2hpY2ggDQo+PiBjb250cm9sZWQgYnkgRVZDUihFbmhhbmNlZCBWb2xhdGlsZSBD
b25maWd1cmF0aW9uIFJlZ2lzdGVyKSBRdWFkIEkvTyANCj4+IHByb3RvY29sIGJpdCA3LldoZW4g
RVZDUiBiaXQgNyBpcyByZXNldCB0byAwLCB0aGUgc3BpIG5vcmZsYXNoIHdpbGwgDQo+PiBvcGVy
YXRlIGluIHF1YWQgSS9PIGZvbGxvd2luZyB0aGUgbmV4dCBXUklURSBFTkhBTkNFRCBWT0xBVElM
RSANCj4+IENPTkZJR1VSQVRJT04gY29tbWFuZC4NCg0KPllvdSBvbmx5IGRvIG9uZSBXUklURSBF
TkhBTkNFRCBWT0xBVElMRSBDT05GSUdVUkFUSU9OIGNvbW1hbmQgaW4gdGhlIHBhdGNoLCBzbyB0
aGlzIHRleHQgZG9lc24ndCBhZGQgdXAuDQoNCj5Ucnkgc29tZXRoaW5nIGxpa2UgdGhpczoNCj4t
LT44LS0NCj5UaGlzIHBhdGNoIGFkZHMgY29kZSB3aGljaCBlbmFibGVzIFF1YWQgSS9PIG1vZGUg
b24gTWljcm9uIFNQSSBOT1IgZmxhc2hlcy4NCg0KPkZvciBNaWNyb24gU1BJIE5PUiBmbGFzaCwg
ZW5hYmxpbmcgb3IgZGlzYWJsaW5nIHF1YWQgSS9PIHByb3RvY29sIGlzIGNvbnRyb2xlZCBieSBF
VkNSIChFbmhhbmNlZCBWb2xhdGlsZSBDb25maWd1cmF0aW9uIFJlZ2lzdGVyKSwgUXVhZCBJL08g
cHJvdG9jb2wgYml0IDcuIFdoZW4gRVZDUiBiaXQgNyBpcyByZXNldCB0byAwLCB0aGUgU1BJIE5P
UiBmbGFzaCB3aWxsIG9wZXJhdGUgaW4gcXVhZCBJL08gbW9kZS4NCj4tLTg8LS0NCg0KPldoYXQg
ZG8geW91IHRoaW5rID8NClBlcmZlY3QsSSB3aWxsIG1vZGlmeSBteSBjb21taXQgbWVzc2FnZSBh
bmQgc3VtYml0IGl0IGFnYWluLnRoYW5rcy4NCg==
