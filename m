Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zk0gG-0002Vo-UC
 for linux-mtd@lists.infradead.org; Thu, 08 Oct 2015 02:11:41 +0000
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
Date: Thu, 8 Oct 2015 02:10:27 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF4D96A@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CEC3@NTXXIAMBX02.xacn.micron.com>
 <560A59B8.4000701@nod.at>
 <A765B125120D1346A63912DDE6D8B6310BF4D4C6@NTXXIAMBX02.xacn.micron.com>
 <560B8758.7010002@nod.at> <560E5C51.5000900@nod.at>
In-Reply-To: <560E5C51.5000900@nod.at>
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

PiBBbSAzMC4wOS4yMDE1IHVtIDA4OjU1IHNjaHJpZWIgUmljaGFyZCBXZWluYmVyZ2VyOg0KPiA+
PiBCeSB0aGUgd2F5LCBEbyB5b3UgcmV2aWV3IG15IHBhdGNoZXMgc2VyaWVzID8gSSBkb24ndCBi
YWNrdXAgZHVwbGljYXRlZA0KPiBkYXRhIGluIE9PQiAuDQo+ID4+IENhbiB5b3Ugc3BlY2lmeSB3
aGljaCBzZWN0b3IgY29kZXMgPyBzbyB0aGF0IEkgY2FuIGV4cGxhaW4gaXQgaW4gZGV0YWlsLg0K
PiA+DQo+ID4gT2theS4gTWF5YmUgYm90aCBCb3JpcyBhbmQgSSBtaXNyZWFkIHlvdXIgY29kZSwg
Y2FuIHlvdSBwbGVhc2UgZXhwbGFpbg0KPiA+IGluIGRldGFpbCB3aGF0IGZ1bmN0aW9ucyBsaWtl
IGNoZWNrX29yaWdpbmFsX2RhdGEoKSBvcg0KPiBtdGRfd3JpdGVfZHVhbF9wbGFuZV9vb2IoKSBk
bz8NCj4gDQo+IENhcmUgdG8gZXhwbGFpbj8NCj4gTWF5YmUgd2UgY2FuIGZpbmQgYSBzb2x1dGlv
biB3aXRob3V0IE9PQi4NCj4gQm9yaXMgcHJvcG9zZWQgYWxyZWFkeSBzb21lIHZlcnkgcHJvbWlz
aW5nIGlkZWFzOg0KPiBodHRwOi8vY29tbWVudHMuZ21hbmUub3JnL2dtYW5lLmxpbnV4LmRyaXZl
cnMubXRkLzYxNjU4DQoNCj4gQlRXOiBXaWxsIHlvdSBiZSBhdCBFbWJlZGRlZCBMaW51eGNvbiBF
dXJvcGUgaW4gRHVibGluPw0KPiBNYW55IE1URCBndXlzLCBpbmNsdWRpbmcgbWUsIHdpbGwgYmUg
dGhlcmUuDQo+IE1heWJlIHdlIGNhbiBkaXNjdXNzIHRoZSBwcm9ibGVtIGluIGEgbmljZSBwdWIs
IGZpcnN0IHJvdW5kIGlzIG9uIG1lLiA6LSkNCg0KUmljaGFyZCwgdGhhbmtzIGZvciB5b3VyIGNh
cmUgYWJvdXQgdGhpcyBwYXRjaC4gV2UgYXJlIGFsbCB2ZXJ5IGhhcHB5IHRvIGRvIHRoaXMgam9i
Lg0KSSB0aGluayAsYW55IGNvbW1lbnRzIG9yIHN1Z2dlc3RzIHdlbGNvbWUuIHdlIG5vdyBpbiBD
aGluYSwgc28gbWF5YmUgaXQgaXMgbm90IGNvbnZlbmllbnQgZm9yIHVzDQp0byBkaXNjdXNzIHRo
ZSBwcm9ibGVtIGluIGEgbmljZSBwdWIuIGNhbiB3ZSBjcmVhdGUgYSB0b3BpYyBvciBtYWluIHBy
b2plY3QgYWJvdXQgdGhpcyBpc3N1ZSwgdGhlbiB3ZSBjYW4gDQp3b3JrIG9uIGl0IHRvZ2V0aGVy
LiBJdCBpcyBlYXN5IHRvIHRyYWNlIGFuZCByZXZpZXcuDQoNClRoaXMgeWVhciwgd2UgZXZlciBh
dHRlbmRlZCBFbWJlZGRlZCBMaW51eCBjb25mZXJlbmNlIHRoYXQgaGVsZCBhdCBTYW4gSm9zZSBN
YXJyaW90dCwNCmFuZCBtZXQgQnJhaW4sIEJyYWluLiBXZSBoYWQgYSBzaG9ydCBkaXNjdXNzaW9u
IGFib3V0IHBhaXJlZCBwYWdlIGlzc3VlLg0KT25lIG9mIGNvbmNlcm5zIGlzIHBhdGVudCwgeW91
IGtub3cgLCB0aGVyZSBhcmUgc28gbWFueSBwYXRlbnRzIG9uIGhvdyB0byBzb2x2ZSBwYWlyZWQg
cGFnZSBpc3N1ZS4NCkxpbnV4IHNlZW1zIHRoYXQgbm90IHZlcnkgbGlrZSB0byBvbmUgYWNjZXB0
IHBhdGNoIGJhc2VkIG9uIGNlcnRhaW4gcGF0ZW50Lg0KDQpJIHdhbnQgdG8gc2F5LCBteSB0aGlz
IHNlcmllcyBwYXRjaCBpcyBhbHNvIGJhc2VkIG9uIGEgTWljcm9uIHBhdGVudCwgdGhpcyBpcyBh
bHNvIG9uZSBvZiBteSBrZXkgY29uY2VybnMuDQpJIGRvbid0IGtub3csIGhvdyBkbyB5b3UgdGhp
bmsgYWJvdXQgdGhpcy4NCg0KRm9yIG15IHRoaXMgcGF0Y2gsIGFub3RoZXIga2V5IGNvbmNlcm4g
aXMgdGhhdCBtZW1vcnkgb3ZlcmhlYWQsIG1heWJlIHlvdSBoYXZlIGZvdW5kIHRoYXQgDQpSZXNl
cnZlZCAyMCBQRUJzIGZvciBiYWNrdXAgbG9nIHZvbHVtZSwgYnV0IHRoZXNlIDIwIFBFQnMgd2ls
bCBiZSBzb29uIHF1aWNrbHkgdXNlZCB1cCwgYmVjYXVzZSBvZiBkdWFsIHBsYW5lIHByb2dyYW0N
ClBhZ2UgYWRkcmVzcyBzcGVjaWFsIHJlcXVpcmVtZW50Lg0KDQoNCg0KPiBUaGFua3MsDQo+IC8v
cmljaGFyZA0K
