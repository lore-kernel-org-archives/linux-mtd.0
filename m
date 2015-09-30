Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhA18-0000M3-HJ
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 05:33:27 +0000
From: =?gb2312?B?QmVhbiBIdW8gu/Sx87HzIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
To: Richard Weinberger <richard@nod.at>, "dedekind1@gmail.com"
 <dedekind1@gmail.com>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "baruch@tkos.co.il" <baruch@tkos.co.il>, "asierra@xes-inc.com"
 <asierra@xes-inc.com>, "guz.fnst@cn.fujitsu.com" <guz.fnst@cn.fujitsu.com>,
 "gsi@denx.de" <gsi@denx.de>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
CC: David Woodhouse <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>,
 =?gb2312?B?RnJhbmsgTGl1IMH1yLogKGZyYW5rbGl1KQ==?= <frankliu@micron.com>,
 Andrea Scian <rnd4@dave-tech.it>,
 =?gb2312?B?S2FybCBaaGFuZyDVxcurwuAgKGthcmx6aGFuZyk=?= <karlzhang@micron.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/9] drivers:mtd:UBI: add bakvol module for MLC NAND
 paired page issue
Date: Wed, 30 Sep 2015 05:31:43 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF4D4C6@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CEC3@NTXXIAMBX02.xacn.micron.com>
 <560A59B8.4000701@nod.at>
In-Reply-To: <560A59B8.4000701@nod.at>
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
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

PiBBbSAyOC4wOS4yMDE1IHVtIDA5OjAyIHNjaHJpZWIgQmVhbiBIdW8gu/Sx87HzIChiZWFuaHVv
KToNCj4gPiBIZWxsbywNCj4gPg0KPiA+IFRoaXMgc2VyaWVzIGFpbXMgYXQgYWRkaW5nIGEgYmFr
dm9sIG1vZHVsZSBmb3IgTUxDIE5BTkQgcGFpcmVkIHBhZ2UNCj4gPiBQb3dlciBsb3NzIHByb3Rl
Y3Rpb24uDQo+ID4gTUxDIE5BTkQgcGFpcmVkIHBhZ2UgcG93ZXIgbG9zcyBpcyBhIGtub3duIGlz
c3VlIHNvIGZhciwgTUxDIE5BTkQNCj4gPiBwYWdlcyBhcmUgY291cGxlZCBpbiBhIHNlbnNlIHRo
YXQgaWYgeW91IGN1dCBwb3dlciB3aGlsZSB3cml0aW5nIHRvIGENCj4gPiBwYWdlLCB5b3UgY29y
cnVwdCBub3Qgb25seSB0aGlzIHBhZ2UsIGJ1dCBhbHNvIG9uZSBvZiB0aGUgcHJldmlvdXMgcGFn
ZXMNCj4gd2hpY2ggaXMgcGFpcmVkIHdpdGggdGhlIGN1cnJlbnQgb25lLg0KPiA+IEN1cnJlbnRs
eSwgdGhlcmUgaXMgbm8gYSBwZXJmZWN0IHNvbHV0aW9uIGZvciB0aGlzLg0KPiA+IFRoaXMgcGFp
cmVkIHBhZ2Ugc29sdXRpb24gaXMgYmFzZWQgb24gTkFORCBtdWx0aXBsZSBwbGFuZSBwcm9ncmFt
DQo+ID4gZmVhdHVyZS4gRm9yIHRoaXMgUGF0Y2gsIG9ubHkgdXNlZCBkdWFsIHBsYW5lIHBhZ2Ug
cHJvZ3JhbSwgbWVhbnMgdHdvDQo+ID4gZGlmZmVyZW50IHBsYW5lIHBhZ2VzIGNhbiBCZSBwcm9n
cmFtbWVkIHRvZ2V0aGVyIGF0IHRoZSBzYW1lIHRpbWUuDQo+ID4gRHVhbCBwbGFuZSBwYWdlIHBy
b2dyYW0gb25seSBpbXBsZW1lbnRzIGluIGJhY2t1cCBvcGVyYXRpb24uIE9ubHkNCj4gPiBsb3dl
ciBwYWdlIGRhdGEgQmUgZHVwbGljYXRlZCBhbmQgYmFjayB1cCBpbnRvIGEgaW50ZXJuYWwgbG9n
IHZvbHVtZSBieQ0KPiBkdWFsIHBsYW5lIHByb2dyYW0gbWV0aG9kLg0KPiA+DQo+ID4gVGhpcyBw
YXRjaCBoYXMgYmVlbiB0ZXN0aW5nIG9uIE1pY3JvbiA3MHMvODBzLzkwcyBNTEMgTkFORC4NCj4g
PiBPZiBjb3Vyc2UgdGhlcmUgYXJlIHNvbWUgcGxhY2VzIG5lZWRlZCB0byBiZSBpbXByb3ZlZCBh
bmQgc2ltcGxpZmllZC4NCj4gPg0KPiA+IEFueSBzdWdnZXN0aW9uIGFuZCBjb21tZW50cyB3ZWxj
b21lZC4NCj4gDQo+IEFzIHN0YXRlZCBiZWZvcmUsIHVzaW5nIE9PQiBpbiBVQkkgaXMgbm90IGdv
aW5nIHRvIGhhcHBlbiB1bmxlc3MgcHJvdmVuIHRoYXQNCj4gdGhlcmUgaXMgYWJzb2x1dGVseSBu
byBvdGhlciB3YXkgdG8gc29sdmUgdGhlIHBhaXJlZCBwYWdlcyBwcm9ibGVtLg0KPiANCj4gTmFj
a2VkLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pg0KPiANCj4gU29ycnks
DQo+IC8vUmljaGFyZA0KDQpIaSwgUmljaGFyZA0KVGhhbmtzIGZvciB5b3VyIGNvbmNlcm4uIEkg
YW0gYSBuZXcgcGF0Y2ggc3VibWl0dGVyLg0KQ2FuIHlvdSB0ZWxsIG1lIE5hY2tlZC1ieSBtZWFu
cz8NCg0KQnkgdGhlIHdheSwgRG8geW91IHJldmlldyBteSBwYXRjaGVzIHNlcmllcyA/IEkgZG9u
J3QgYmFja3VwIGR1cGxpY2F0ZWQgZGF0YSBpbiBPT0IgLg0KQ2FuIHlvdSBzcGVjaWZ5IHdoaWNo
IHNlY3RvciBjb2RlcyA/IHNvIHRoYXQgSSBjYW4gZXhwbGFpbiBpdCBpbiBkZXRhaWwuDQpUaGFu
a3MuDQo=
