From: =?utf-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: "dedekind1@gmail.com" <dedekind1@gmail.com>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>,
 "asierra@xes-inc.com" <asierra@xes-inc.com>, "guz.fnst@cn.fujitsu.com"
 <guz.fnst@cn.fujitsu.com>, "gsi@denx.de" <gsi@denx.de>, "richard@nod.at"
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?utf-8?B?RnJhbmsgTGl1IOWImOe+pCAoZnJhbmtsaXUp?= <frankliu@micron.com>,
 Andrea Scian <rnd4@dave-tech.it>,
 =?utf-8?B?UGV0ZXIgUGFuIOa9mOagiyAocGV0ZXJwYW5kb25nKQ==?=
 <peterpandong@micron.com>,
 =?utf-8?B?S2FybCBaaGFuZyDlvKDlj4zplKMgKGthcmx6aGFuZyk=?=
 <karlzhang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/9] drivers:mtd:UBI: add bakvol module for MLC NAND
 paired page issue
Date: Mon, 28 Sep 2015 08:16:28 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF4D074@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CEC3@NTXXIAMBX02.xacn.micron.com>
 <20150928094134.2ab8557e@bbrezillon>
In-Reply-To: <20150928094134.2ab8557e@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
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

PiBIaSBCZWFuLA0KPiANCj4gTmV4dCB0aW1lIHlvdSBzZW5kIGEgcGF0Y2ggc2VyaWVzLCBjb3Vs
ZCBzZW5kIGFsbCB0aGUgcGF0Y2hlcyBpbiByZXBseSB0byB0aGUNCj4gY292ZXIgbGV0dGVyPw0K
DQpObyBwcm9ibGVtLCB3ZSB3aWxsIGZvcm1hdCBvdXIgc3VibWl0LXBhdGNoIG1ldGhvZCwgYW5k
IHN0YW5kYXJkIGl0Lg0KDQoNCj4gPiBIZWxsbywNCj4gPg0KPiA+IFRoaXMgc2VyaWVzIGFpbXMg
YXQgYWRkaW5nIGEgYmFrdm9sIG1vZHVsZSBmb3IgTUxDIE5BTkQgcGFpcmVkIHBhZ2UNCj4gPiBQ
b3dlciBsb3NzIHByb3RlY3Rpb24uDQo+ID4gTUxDIE5BTkQgcGFpcmVkIHBhZ2UgcG93ZXIgbG9z
cyBpcyBhIGtub3duIGlzc3VlIHNvIGZhciwgTUxDIE5BTkQNCj4gPiBwYWdlcyBhcmUgY291cGxl
ZCBpbiBhIHNlbnNlIHRoYXQgaWYgeW91IGN1dCBwb3dlciB3aGlsZSB3cml0aW5nIHRvIGENCj4g
PiBwYWdlLCB5b3UgY29ycnVwdCBub3Qgb25seSB0aGlzIHBhZ2UsIGJ1dCBhbHNvIG9uZSBvZiB0
aGUgcHJldmlvdXMgcGFnZXMNCj4gd2hpY2ggaXMgcGFpcmVkIHdpdGggdGhlIGN1cnJlbnQgb25l
Lg0KPiA+IEN1cnJlbnRseSwgdGhlcmUgaXMgbm8gYSBwZXJmZWN0IHNvbHV0aW9uIGZvciB0aGlz
Lg0KPiA+IFRoaXMgcGFpcmVkIHBhZ2Ugc29sdXRpb24gaXMgYmFzZWQgb24gTkFORCBtdWx0aXBs
ZSBwbGFuZSBwcm9ncmFtDQo+ID4gZmVhdHVyZS4gRm9yIHRoaXMgUGF0Y2gsIG9ubHkgdXNlZCBk
dWFsIHBsYW5lIHBhZ2UgcHJvZ3JhbSwgbWVhbnMgdHdvDQo+ID4gZGlmZmVyZW50IHBsYW5lIHBh
Z2VzIGNhbiBCZSBwcm9ncmFtbWVkIHRvZ2V0aGVyIGF0IHRoZSBzYW1lIHRpbWUuDQo+ID4gRHVh
bCBwbGFuZSBwYWdlIHByb2dyYW0gb25seSBpbXBsZW1lbnRzIGluIGJhY2t1cCBvcGVyYXRpb24u
IE9ubHkNCj4gPiBsb3dlciBwYWdlIGRhdGEgQmUgZHVwbGljYXRlZCBhbmQgYmFjayB1cCBpbnRv
IGEgaW50ZXJuYWwgbG9nIHZvbHVtZSBieQ0KPiBkdWFsIHBsYW5lIHByb2dyYW0gbWV0aG9kLg0K
PiANCj4gSG0sIEknbSBub3QgdmVyeSBmb25kIG9mIHRoZSBpZGVhLCBlc3BlY2lhbGx5IGJlY2F1
c2Ugb2YgdGhlIGNvbXBsZXhpdHkgY2F1c2VkDQo+IGJ5IGR1YWwgcGxhbmUgcHJvZ3JhbSBvcGVy
YXRpb25zICh5b3UgY2FuJ3QgdGFrZSBhIHJhbmRvbSBibG9jayB0byB3cml0ZSB5b3VyDQo+IGJh
Y2t1cCBvbiBpdCwgd2hpY2ggbWVhbnMgV0wgaXMgY29tcGxleGlmaWVkIHRvbyksIGFuZCB0aGUg
ZmFjdCB0aGF0IHlvdSdyZQ0KPiBkdXBsaWNhdGluZyBkYXRhICh0aHVzIGludHJvZHVjaW5nIGEg
cGVyZm9ybWFuY2UgcGVuYWx0eSBhbmQgc3RvcmFnZQ0KPiBvdmVyaGVhZCkuDQpZZXMsIGR1YWwg
cGxhbmUgcHJvZ3JhbSBvcGVyYXRpb24gaGFzIHNwZWNpYWwgcGFnZXMgcmVxdWlyZW1lbnQuIA0K
VGhlIHBhZ2UgYWRkcmVzcyBiaXRzLCBQQVs3OjBdLCBtdXN0IGJlIGlkZW50aWNhbCBmb3IgZWFj
aCBpc3N1ZWQgYWRkcmVzcy4NClRoaXMgaXMgYmVpbmcgZGVmaW5lZCBieSBPTkZJIHNwZWNpZmlj
YXRpb24uIEl0IHdpbGwgZGVmaW5pdGVseSByZXN1bHQgaW4gc3RvcmFnZSANCm92ZXJoZWFkLCBi
dXQgdGhlIHBlcmZvcm1hbmNlIG9mIGR1YWwgcGxhbmUgcHJvZ3JhbSBpcyBiZXR0ZXIgdGhhbiBu
b3JtYWwgcGFnZSBwcm9ncmFtLg0KQmVjYXVzZSB3ZSBkb24ndCBwcm9ncmFtIHNvdXJjZSBkYXRh
IGFuZCBiYWNrdXAgZGF0YSBvbmUgcGFnZSBieSBvbmUgcGFnZS4NCg0KPiA+DQo+ID4gVGhpcyBw
YXRjaCBoYXMgYmVlbiB0ZXN0aW5nIG9uIE1pY3JvbiA3MHMvODBzLzkwcyBNTEMgTkFORC4NCj4g
PiBPZiBjb3Vyc2UgdGhlcmUgYXJlIHNvbWUgcGxhY2VzIG5lZWRlZCB0byBiZSBpbXByb3ZlZCBh
bmQgc2ltcGxpZmllZC4NCj4gPg0KPiA+IEFueSBzdWdnZXN0aW9uIGFuZCBjb21tZW50cyB3ZWxj
b21lZC4NCj4gDQo+IFN1cmUsIEknbGwgdHJ5IHRvIHJldmlldyBpdCBzb29uLg0KDQpUaGFua3Ms
IHRoaXMgaXMgYSBpbml0aWFsIHZlcnNpb24sIEkgdGhpbmssIHRoZXJlIGFyZSBzb21lIHBsYWNl
cyBuZWVkZWQgdG8gYmUgcGVyZmVjdGVkLg0KDQo+IFRoYW5rcyBmb3Igc3VibWl0dGluZyB0aG9z
ZSBwYXRjaGVzLg0KPiANCj4gQmVzdCBSZWdhcmRzLA0KPiANCj4gQm9yaXMNCj4gDQo+IC0tDQo+
IEJvcmlzIEJyZXppbGxvbiwgRnJlZSBFbGVjdHJvbnMNCj4gRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZw0KPiBodHRwOi8vZnJlZS1lbGVjdHJvbnMuY29tDQo=
