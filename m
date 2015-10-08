Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjzPc-0006Mh-Bc
 for linux-mtd@lists.infradead.org; Thu, 08 Oct 2015 00:50:24 +0000
From: =?utf-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Richard Weinberger <richard@nod.at>, "dedekind1@gmail.com"
 <dedekind1@gmail.com>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "baruch@tkos.co.il" <baruch@tkos.co.il>, "asierra@xes-inc.com"
 <asierra@xes-inc.com>, "guz.fnst@cn.fujitsu.com" <guz.fnst@cn.fujitsu.com>,
 "gsi@denx.de" <gsi@denx.de>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Andrea Scian <rnd4@dave-tech.it>,
 =?utf-8?B?S2FybCBaaGFuZyDlvKDlj4zplKMgKGthcmx6aGFuZyk=?=
 <karlzhang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/9] drivers:mtd:UBI: add bakvol module for MLC NAND
 paired page issue
Date: Thu, 8 Oct 2015 00:49:10 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF4D8ED@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CEC3@NTXXIAMBX02.xacn.micron.com>
 <560A59B8.4000701@nod.at>
 <A765B125120D1346A63912DDE6D8B6310BF4D4C6@NTXXIAMBX02.xacn.micron.com>
 <20150930093355.3266a4b3@bbrezillon>
In-Reply-To: <20150930093355.3266a4b3@bbrezillon>
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

PiA+ID4gQXMgc3RhdGVkIGJlZm9yZSwgdXNpbmcgT09CIGluIFVCSSBpcyBub3QgZ29pbmcgdG8g
aGFwcGVuIHVubGVzcw0KPiA+ID4gcHJvdmVuIHRoYXQgdGhlcmUgaXMgYWJzb2x1dGVseSBubyBv
dGhlciB3YXkgdG8gc29sdmUgdGhlIHBhaXJlZCBwYWdlcw0KPiBwcm9ibGVtLg0KPiA+ID4NCj4g
PiA+IE5hY2tlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4NCj4gPiA+
DQo+ID4gPiBTb3JyeSwNCj4gPiA+IC8vUmljaGFyZA0KPiA+DQo+ID4gSGksIFJpY2hhcmQNCj4g
PiBUaGFua3MgZm9yIHlvdXIgY29uY2Vybi4gSSBhbSBhIG5ldyBwYXRjaCBzdWJtaXR0ZXIuDQo+
ID4gQ2FuIHlvdSB0ZWxsIG1lIE5hY2tlZC1ieSBtZWFucz8NCj4gPg0KPiA+IEJ5IHRoZSB3YXks
IERvIHlvdSByZXZpZXcgbXkgcGF0Y2hlcyBzZXJpZXMgPyBJIGRvbid0IGJhY2t1cCBkdXBsaWNh
dGVkDQo+ID5kYXRhIGluIE9PQiAuDQo+IA0KPiBUaGF0J3Mgbm90IHdoYXQgUmljaGFyZCBzYWlk
LCBoZSBqdXN0IHBvaW50ZWQgdGhhdCB5b3Ugd2VyZSB1c2luZyB0aGUgT09CDQo+IGFyZWEsIGFu
ZCB5b3UncmUgYWN0dWFsbHkgdXNpbmcgaXQgdG8gc3RvcmUgdGhlIGluZm9ybWF0aW9uIGFib3V0
IHdoaWNoIHBhZ2UNCj4geW91J3JlIGJhY2t1cGluZy4NCj4gDQo+ID4gQ2FuIHlvdSBzcGVjaWZ5
IHdoaWNoIHNlY3RvciBjb2RlcyA/IHNvIHRoYXQgSSBjYW4gZXhwbGFpbiBpdCBpbiBkZXRhaWwu
DQo+IA0KPiBBbmQgYXMgYW5zd2VyZWQgYnkgUmljaGFyZCwgY2hlY2tfb3JpZ2luYWxfZGF0YSgp
IGFuZA0KPiBtdGRfd3JpdGVfZHVhbF9wbGFuZV9vb2IoKSBhcmUgZmlsbGluZyB0aGUgT09CIGJ1
ZiB3aXRoIHRoZSBvcmlnaW5hbCBwYWdlDQo+IG9mZnNldCwgc28geW91J3JlIGRlZmluaXRlbHkg
dXNpbmcgdGhlIE9PQiBhcmVhIHRvIHN0b3JlIG1ldGFkYXRhLg0KDQpZZXMgLGN1cnJlbnRseSBJ
IG9ubHkgdXNlIDQgYnl0ZXMgT09CIGFyZWEgdG8gc3RvcmUgYmFja3VwIHBhZ2UgYWRkcmVzcy4N
Cg0KPiAtLQ0KPiBCb3JpcyBCcmV6aWxsb24sIEZyZWUgRWxlY3Ryb25zDQo+IEVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQ0K
