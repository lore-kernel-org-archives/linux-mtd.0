Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ad1P3-0001kh-1U
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2016 20:05:18 +0000
From: Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: Robert Jarzmik <robert.jarzmik@free.fr>, Brian Norris
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Michael Wang
 <Michael.Wang@alliedtelesis.co.nz>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Chris Packham
 <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: mtd: pxa3xx_nand: issue with command time out
Date: Mon, 7 Mar 2016 20:04:51 +0000
Message-ID: <56DDDEE2.6010405@alliedtelesis.co.nz>
In-Reply-To: <CAAEAJfDyZELBkwNOkjPzGpg_gv-sDOkOSQV76c3WniCuEhveFw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <947A30B2C24F7B4C8B4D0632395C1E20@atlnz.lc>
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

SGkgRXplcXVpZWwsDQoNCk9uIDAzLzA0LzIwMTYgMDE6MDMgUE0sIEV6ZXF1aWVsIEdhcmNpYSB3
cm90ZToNCj4gT24gMyBNYXJjaCAyMDE2IGF0IDE3OjE2LCBIYW1pc2ggTWFydGluDQo+IDxIYW1p
c2guTWFydGluQGFsbGllZHRlbGVzaXMuY28ubno+IHdyb3RlOg0KPj4gSGkgRXplcXVpZWwsDQo+
Pg0KPj4gSSdtIGdsYWQgbXkgYW5hbHlzaXMgd2FzIGNvcnJlY3QgYW5kIHdlIG1vcmUgZnVsbHkg
dW5kZXJzdGFuZCB0aGUNCj4+IHByb2JsZW0gbm93LiBDT05GSUdfUFJFRU1QVCBzZWVtcyB0byB3
b3JrIGZvciB1cyBub3csIGJ1dCBpdCBkb2VzIHNlZW0NCj4+IGxpa2UgdGhlIHdyb25nIGZpeCwg
YW5kIGlmIHlvdSBndXlzIHRoaW5rIGl0IHdpbGwgbm90IGd1YXJhbnRlZQ0KPj4gcHJldmVudGlu
ZyB0aGUgaXNzdWUgdGhlbiB3ZSdkIHJhdGhlciBiYWNrIHRoYXQgY2hhbmdlIG91dC4NCj4+DQo+
IERvIHlvdSBoYXZlIGFueSBnb29kIHJlYXNvbiBmb3IgTk9UIGVuYWJsaW5nIENPTkZJR19QUkVF
TVBUPw0KPg0KPiBJJ3ZlIGhhZCB2ZXJ5IGJhZCBleHBlcmllbmNlcyBvbiBlbWJlZGRlZCBzeXN0
ZW1zIHdoZW4gbm90DQo+IHVzaW5nIENPTkZJR19QUkVFTVBULCBhbmQgY2FtZSB0byB0aGUgY29u
Y2x1c2lvbiB0aGF0DQo+IGVuYWJsZSBmdWxsIHByZWVtcHRpb24sIHVubGVzcyB0aGVyZSdzIGEg
Z29vZCByZWFzb24gbm90IHRvLg0KPg0KPiBFbmFibGluZyBDT05GSUdfUFJFRU1QVCB3b3VsZCBy
ZXN1bHQgaW4gc2xpZ2h0bHkgbG93ZXIgdGhyb3VnaHB1dCwNCj4gYnV0IG1heGltdW0gbGF0ZW5j
eSB3aWxsIGJlIGdyZWF0bHkgcmVkdWNlZC4NCj4NCj4gRm9yIGluc3RhbmNlLCBpbiBhIGtlcm5l
bCB3aXRob3V0IHByZWVtcHRpb24sIGEgVUJJIHN0YXRpYyB2b2x1bWUgY2hlY2sNCj4gKHdoaWNo
IGhhcHBlbnMgb24gdGhlIGZpcnN0IFVCSSBzdGF0aWMgdm9sdW1lIG9wZW4gY2FsbCksIGNhbiB0
YWtlDQo+IHNldmVyYWwgc2Vjb25kcy4NCldlIGRvbid0IGhhdmUgYSBnb29kIHJlYXNvbiwgaXQg
aXMgbWFpbmx5IGFuIGhpc3RvcmljIGFydGlmYWN0LiBXZSBhcmUgDQpoYXBweSB0byBnbyB3aXRo
IHRoYXQgYXMgYSBmaXggYW5kIHdlIGFyZSBpbnZlc3RpZ2F0aW5nIGl0IGZvciBvdGhlciANCnBs
YXRmb3JtcyB0b28uIEkgdGhpbmsgaXQgaXMgYW4gb3ZlcnNpZ2h0IHRoYXQgaGFzbid0IGJlZW4g
Z2l2ZW4gdGhlIA0KdGhvdWdodCBpdCBzaG91bGQuDQpJIHRoaW5rIHdlIHN0aWxsIG5lZWQgdG8g
Y29uc2lkZXIgb3BlcmF0aW9uIG9mIHRoZSBkcml2ZXIgd2l0aG91dCANCkNPTkZJR19QUkVFTVBU
IGVuYWJsZWQuDQoNCj4NCj4+IEkgaGFkIGNvbnRlbXBsYXRlZCB1c2luZyB3YWl0X2Zvcl9jb21w
bGV0aW9uX2ludGVycnVwdGlibGUoKSBidXQgd2FzIGENCj4+IGJpdCB1bnN1cmUgaWYgaXQgd2Fz
IHNhZmUuIERvIHlvdSBoYXZlIGEgcHJvcG9zZWQgcGF0Y2g/IFdlIHdvdWxkIGJlDQo+PiBoYXBw
eSB0byBhcHBseSBpdCB0byBvdXIgc3lzdGVtLCB0dXJuIG9mZiBDT05GSUdfUFJFRU1QVCwgYW5k
IHNlZSBob3cgaXQNCj4+IGdvZXMuIE91dCBpc3N1ZSBpcyBoaWdobHkgcmVwcm9kdWNpYmxlIHNv
IEkgdGhpbmsgaXQgd291bGQgYmUgYSBnb29kDQo+PiBmaXJzdCB0ZXN0IGZvciBhIGNoYW5nZT8N
Cj4+DQo+IFN1cmUsIEkgY2FuIHRyeSB0byBjb29rIGEgcGF0Y2ggZm9yIHlvdS4NClRoYW5rcyBm
b3IgeW91ciBoZWxwIHdpdGggdGhpcyBndXlzLiBTZW5kIG1lIHRoZSBwYXRjaCB3aGVuIHlvdSBo
YXZlIG9uZSANCnlvdSB3YW50IG1lIHRvIHRlc3Qgb3V0IGZvciB5b3UuDQoNCkNoZWVycywNCkhh
bWlzaCBNLg==
