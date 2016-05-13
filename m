Received: from mail.kymetacorp.com ([192.81.58.21])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b1Jw6-0003fA-BF
 for linux-mtd@lists.infradead.org; Fri, 13 May 2016 20:43:51 +0000
From: Trent Piepho <tpiepho@kymetacorp.com>
To: Marek Vasut <marex@denx.de>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Graham
 Moore" <grmoore@opensource.altera.com>, Alan Tull
 <atull@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, "R, Vignesh" <vigneshr@ti.com>, "Yves
 Vandervennet" <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH V10 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Fri, 13 May 2016 20:43:26 +0000
Message-ID: <1463172208.9103.313.camel@rtred1test09.kymeta.local>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <1452486886-8049-2-git-send-email-marex@denx.de>
 <1463097635.9103.301.camel@rtred1test09.kymeta.local>
 <57351ECE.2020009@denx.de>
In-Reply-To: <57351ECE.2020009@denx.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CB3BCD547363E40B3A77DD6788E40CC@kymetacorp.com>
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

T24gRnJpLCAyMDE2LTA1LTEzIGF0IDAyOjI0ICswMjAwLCBNYXJlayBWYXN1dCB3cm90ZToNCj4g
T24gMDUvMTMvMjAxNiAwMjowMCBBTSwgVHJlbnQgUGllcGhvIHdyb3RlOg0KPiA+IE9uIE1vbiwg
MjAxNi0wMS0xMSBhdCAwNTozNCArMDEwMCwgTWFyZWsgVmFzdXQgd3JvdGU6DQo+ID4+IEZyb206
IEdyYWhhbSBNb29yZSA8Z3Jtb29yZS15enZQSUN1azJBQk1jZzRJSEswa0ZvSDZNYzRNQjBWeEBw
dWJsaWMuZ21hbmUub3JnPg0KPiA+Pg0KPiA+PiBBZGQgc3VwcG9ydCBmb3IgdGhlIENhZGVuY2Ug
UVNQSSBjb250cm9sbGVyLiBUaGlzIGNvbnRyb2xsZXIgaXMNCj4gPj4gcHJlc2VudCBpbiB0aGUg
QWx0ZXJhIFNvQ0ZQR0EgU29DcyBhbmQgdGhpcyBkcml2ZXIgaGFzIGJlZW4gdGVzdGVkDQo+ID4+
IG9uIHRoZSBDeWNsb25lIFYgU29DLg0KPiA+IA0KPiA+IEknbSB0cnlpbmcgdG8gdXNlIHRoaXMg
ZHJpdmVyIHRoZSBBbGFyaWMgRGV2a2l0IGZvciBBbHRlcmEncyBBcnJpYTEwDQo+ID4gU29DLiAg
SXQncyBub3Qgd29ya2luZyBzbyBmYXIuICBJbiB0aGUgY291cnNlIG9mIHRyeWluZyB0byBkZWJ1
ZyBpdCwNCj4gPiBJJ3ZlIGZvdW5kIGEgZmV3IHRoaW5ncyB3aXRoIHRoZSBkcml2ZXIgaW4gdGhl
IHNvY2ZwZ2EtNC4xLWx0c2kgYnJhbmNoLg0KPiANCj4gU28gYXJlIHlvdSB0cnlpbmcgdG8gZGVi
dWcgdGhpcyBkcml2ZXIgb3Igc29tZSBvdGhlciBvdXQtb2YtdHJlZSBkcml2ZXI/DQo+IGJ0dy4g
SSBwdXNoZWQgdGhlIGxhdGVzdCB2ZXJzaW9uIGhlcmU6DQo+IA0KPiBodHRwczovL2dpdC5rZXJu
ZWwub3JnL2NnaXQvbGludXgva2VybmVsL2dpdC9tYXJleC9saW51eC0yLjYuZ2l0L2xvZy8/aD1u
ZXh0L2NhZGVuY2UtcXNwaQ0KDQpJJ20gdHJ5aW5nIHRvIHVzZSB0aGUgb3V0IG9mIHRyZWUgZHJp
dmVyIGZyb20gQWx0ZXJhJ3MgbGF0ZXN0IGtlcm5lbCwNCmZyb20gaGVyZToNCmh0dHBzOi8vZ2l0
aHViLmNvbS9hbHRlcmEtb3BlbnNvdXJjZS9saW51eC1zb2NmcGdhL3RyZWUvc29jZnBnYS00LjQN
Cg0KQnV0IGl0J3Mgbm90IGEgdG90YWxseSBkaWZmZXJlbnQgZHJpdmVyLCBpdCdzIGp1c3QgYW4g
b2xkZXIgdmVyc2lvbiBvZg0KdGhpcyBkcml2ZXIuICBJJ20gdGhpbmtpbmcgb2YgcG9ydGluZyBp
biB0aGlzIHZlcnNpb24gc2luY2UgSSB0aGluayBpdCdzDQptdWNoIGltcHJvdmVkIChhZnRlciBW
MTEgb25lIHdvdWxkIGhvcGUgc28pLiAgUmVhbGx5LCBBbHRlcmEgc2hvdWxkDQp1cGRhdGUgdGhl
aXIgc3VwcG9ydGVkIGtlcm5lbCB3aXRoIHRoaXMgY29kZS4NCg0KQ29tbWVudHMgYWJvdXQgd2hh
dCdzIG9uIHlvdXIgYnJhbmNoLg0KDQpDb21taXQgIkFSTTogc29jZnBnYTogQWRkIENhbmRlbmNl
IFFTUEkgY29udHJvbGxlciBEVCBub2RlIiBvbmx5DQphZGRzIHRoZSBub2RlIGZvciBDeWNsb25l
IDUuICBUaGlzIHNhbWUgRFQgbm9kZSBzaG91bGQgYWxzbyBiZSBhZGRlZCB0bw0KdGhlIHNvY2Zw
Z2FfYXJyaWExMC5kdHNpIGZpbGUuDQoNCg==
