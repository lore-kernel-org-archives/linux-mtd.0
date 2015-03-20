Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYyVU-000151-6d
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2015 15:06:40 +0000
From: =?utf-8?B?UWkgV2FuZyDnjovotbcgKHFpd2FuZyk=?= <qiwang@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>
Subject: RE: detect and manage power cut on MLC NAND
Date: Fri, 20 Mar 2015 15:05:54 +0000
Message-ID: <71CF8D7F32C5C24C9CD1D0E02D52498A7717470C@NTXXIAMBX02.xacn.micron.com>
References: <mailman.37706.1426822709.22890.linux-mtd@lists.infradead.org>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7717444D@NTXXIAMBX02.xacn.micron.com>
 <EACD232272DA4849B060F0828564D13B57804E26B6@ntcex01.corp.netcomm.com.au>
 <71CF8D7F32C5C24C9CD1D0E02D52498A771744B0@NTXXIAMBX02.xacn.micron.com>
 <20150320095822.7e1979ff@bbrezillon> <550BE355.8020009@nod.at>
In-Reply-To: <550BE355.8020009@nod.at>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "rnd4@dave-tech.it" <rnd4@dave-tech.it>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?utf-8?B?RnJhbmsgTGl1IOWImOe+pCAoZnJhbmtsaXUp?= <frankliu@micron.com>,
 "andrea.marson@dave.eu" <andrea.marson@dave.eu>,
 =?utf-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgQm9yaXMsIFJpY2hhcmQNCg0KT24gRnJpLCAyMCBNYXIgMjAxNSAwNTowOCBQTSArMDAwMCBS
aWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6DQo+DQo+QW0gMjAuMDMuMjAxNSB1bSAwOTo1OCBzY2hy
aWViIEJvcmlzIEJyZXppbGxvbjoNCj4+IEhpIFFpLA0KPj4NCj4+IE9uIEZyaSwgMjAgTWFyIDIw
MTUgMDc6NDQ6NTggKzAwMDANCj4+IFFpIFdhbmcg546L6LW3IChxaXdhbmcpIDxxaXdhbmdAbWlj
cm9uLmNvbT4gd3JvdGU6DQo+Pg0KPj4+Pg0KPj4+PiBJIHNlZW0gdG8gcmVtZW1iZXIgYSByZXF1
aXJlbWVudCB0byB3cml0ZSBwYWdlcyB0byBhIGJsb2NrIGluIGENCj4+Pj4gbW9ub3RvbmljIGZh
c2hpb24gKGxvdyB0byBoaWdoKS4gSXMgdGhhdCBzdGlsbCB0aGUgY2FzZT8gSXQNCj4+Pj4gc2Vl
bXMgdGhhdCB0aGUgbG93IHBhZ2UgYmFja3VwIGNvdWxkIHZpb2xhdGUgdGhhdCBydWxlIG90aGVy
d2lzZS4NCj4+Pg0KPj4+IFllcywgcGFnZXMgbmVlZCB0byBiZSBwcm9ncmFtbWVkIGZyb20gbG93
IHRvIGhpZ2guIEJ1dCBpdCBpcyBwb3NzaWJsZQ0KPj4+IHRvIHNraXAgc29tZSBwYWdlcy4gVGFr
ZSBhIGV4YW1wbGUsDQo+Pj4NCj4+PiBiZWxvdyBwYWdlIHByb2dyYW0gb3JkZXJpbmcgaXMgb2su
DQo+Pj4gUGFnZSAwLCBwYWdlIDEsIHBhZ2UgMiwgcGFnZSA0LCBwYWdlIDYsIHBhZ2UgMTAsIHBh
Z2UgMTUsIGV0Yy4uDQo+Pj4gSnVzdCBtYWtlIHN1cmUgZG9uJ3QgdHVybiBiYWNrIHRvIHByb2dy
YW0gdGhlIGxvdyBwYWdlIGlzIG9rLg0KPj4NCj4+IEkgYXNrZWQgYSBxdWVzdGlvbiByZWdhcmRp
bmcgdGhlIHByb2dyYW1taW5nIHNlcXVlbmNlIGluIGFuc3dlciB0byBJd28sDQo+PiBidXQgSSdt
IG5vdCBzdXJlIHlvdSB3ZXJlIGluIENjLCBzbyBJJ20gYXNraW5nIGl0IGFnYWluLg0KPj4NCj4+
IFNheSBwYWdlIDEgaXMgcGFpcmVkIHdpdGggcGFnZSA0LCBjYW4gd2UgcHJvZ3JhbSBwYWdlcyBp
biB0aGlzIG9yZGVyOg0KPj4gMSwgNCwgMiwgNSwgMywgNiwgLi4uLCBzbyB0aGF0IGJvdGggcGFp
cmVkIHBhZ2VzIGFyZSBwcm9ncmFtbWVkDQo+PiB0b2dldGhlciAodGhlIEp1bWJvIHBhZ2UgYXBw
cm9hY2ggSXdvIGRlc2NyaWJlZCBpbiBoaXMgbWFpbCkuDQo+DQo+VGhhdCdzIGEgZ29vZCBxdWVz
dGlvbi4gSSB3YXMgYWx3YXlzIHRvbGQgdGhhdCB5b3UncmUgbm90IGFsbG93ZWQNCj50byBwcm9n
cmFtIHBhZ2VzIGluIGEgbm9uLWxpbmVhciBtYW5uZXIuDQo+DQoNClllcywgeW91IGFyZSByaWdo
dC4gVGhpcyBtZXRob2QgaXNuJ3QgYWxsb3dlZC4gVXNlciBjYW4gb25seSBwcm9ncmFtIHBhZ2UN
CndpdGhpbiBhIGJsb2NrIGZyb20gbG93IGFkZHJlc3MgdG8gaGlnaCBhZGRyZXNzLg0KDQotLQ0K
UWkgV2FuZw0KVGhhbmtzDQoNCg0K
