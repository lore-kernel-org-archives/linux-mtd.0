Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMVj6-0000oZ-3A
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2016 07:01:44 +0000
From: =?utf-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Adam Somerville <adamsomerville@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "zajec5@gmail.com" <zajec5@gmail.com>, "jteki@openedev.com"
 <jteki@openedev.com>, "mika.westerberg@linux.intel.com"
 <mika.westerberg@linux.intel.com>,
 "furquan@google.com" <furquan@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RFC] spi-nor: fix cross die reads on Micron multi-die devices
Date: Fri, 22 Jan 2016 07:00:43 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF57E59@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF57A20@NTXXIAMBX02.xacn.micron.com>
 <CAJorgdvD9WCsHCoRt05tn-vh_1oqsCZiMehbVKQtynocxX_-wQ@mail.gmail.com>
 <A765B125120D1346A63912DDE6D8B6310BF57B7B@NTXXIAMBX02.xacn.micron.com>
 <20160121095630.4df558b3@bbrezillon>
In-Reply-To: <20160121095630.4df558b3@bbrezillon>
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

PiBIaSBCZWFuLA0KPiANCj4gT24gVGh1LCAyMSBKYW4gMjAxNiAwMTowNjo0OCArMDAwMA0KPiBC
ZWFuIEh1byDpnI3mlozmlowgKGJlYW5odW8pIDxiZWFuaHVvQG1pY3Jvbi5jb20+IHdyb3RlOg0K
PiANCj4gPiAgSGksIEFkYW0gYW5kIEJvcmlzDQo+ID4NCj4gPiBGb3IgTWljcm9uIE1UMjVRICxN
VDI1VCBhbmQgTVQzNVEsIHRoZXkgZG9lcyBub3QgZXhpc3QgdGhpcyBhY3Rpb24NCj4gPiBldmVu
IHRoZXkgYXJlIE11bHRpLWRpZSBkZXZpY2VzLiBTbyB3aGVuIHRoZSBsYXN0IGJ5dGUgb2YgdGhl
IGRpZQ0KPiA+IHNlbGVjdGVkIGlzIHJlYWQsIHRoZSBuZXh0IGJ5dGUgb3V0cHV0IGlzIHRoZSBm
aXJzdCBieXRlIG9mIG5leHQgZGllKG5vdCB0aGUNCj4gc2FtZSBkaWUpLg0KPiA+IFlvdSBjYW4g
Y2hlY2sgdGhpcyBieSBleHRlbmRlZCBhZGRyZXNzIHJlZ2lzdGVyIGNoYXB0ZXIgaW4gb3VyDQo+
ID4gZGF0YXNoZWV0LCB0aGVyZSBhcmUgZGV0YWlsIEluZm9ybWF0aW9uLg0KPiANCj4gSSBuZXZl
ciBzYWlkIHlvdSB3ZXJlIHdyb25nIDspLCBJIGp1c3QgYXNrZWQgaWYgaXQgd2FzIHJlbGV2YW50
IHRvIGRpZmZlcmVudGlhdGUNCj4gdGhlIHR3byBjYXNlcy4gSU9XLCB3b3VsZCB0aGUgaW1wbGVt
ZW50YXRpb24gcHJvcG9zZWQgYnkgQWRhbSB3b3JrDQo+IGNvcnJlY3RseSBvbiBhbGwgY2hpcHM/
IEFuZCB3aGF0IGlzIHRoZSByZWFsIHBlcmZvcm1hbmNlIHBlbmFsdHkgZm9yDQo+IE1UMjVRICxN
VDI1VCBhbmQgTVQzNVEgaWYgd2UgZGVjaWRlIHRvIHNwbGl0IHRoZSByZWFkIGNvbW1hbmQgaW4g
c2V2ZXJhbA0KPiByZWFkcyB0byBoYW5kbGUgdGhpcyBjcm9zcyBkaWUgY2FzZT8NCkZvciB0aGlz
ICwgcGVyZm9ybWFuY2UgcGVuYWx0eSBpcyB0aW55LCBjYW4gaWdub3JlLiANClNQSSBOT1IgcmVh
ZCBwZXJmb3JtYW5jZSBvbmx5IGRlcGVuZHMgb24gU1BJIEkvTyBjbG9jay4gTm90IHRoZSBzYW1l
IGFzIE5BTkQuDQo+IEJlc3QgUmVnYXJkcywNCj4gDQo+IEJvcmlzDQo+IA0KPiAtLQ0KPiBCb3Jp
cyBCcmV6aWxsb24sIEZyZWUgRWxlY3Ryb25zDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcNCj4gaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQ0K
