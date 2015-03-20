Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYzBQ-0005Jy-BD
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2015 15:50:00 +0000
From: =?utf-8?B?UWkgV2FuZyDnjovotbcgKHFpd2FuZyk=?= <qiwang@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: RE: detect and manage power cut on MLC NAND
Date: Fri, 20 Mar 2015 15:49:16 +0000
Message-ID: <71CF8D7F32C5C24C9CD1D0E02D52498A77174764@NTXXIAMBX02.xacn.micron.com>
References: <mailman.37706.1426822709.22890.linux-mtd@lists.infradead.org>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7717444D@NTXXIAMBX02.xacn.micron.com>
 <EACD232272DA4849B060F0828564D13B57804E26B6@ntcex01.corp.netcomm.com.au>
 <71CF8D7F32C5C24C9CD1D0E02D52498A771744B0@NTXXIAMBX02.xacn.micron.com>
 <20150320095822.7e1979ff@bbrezillon>	<550BE355.8020009@nod.at>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7717470C@NTXXIAMBX02.xacn.micron.com>
 <20150320161903.608a79fc@bbrezillon>
In-Reply-To: <20150320161903.608a79fc@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, "rnd4@dave-tech.it" <rnd4@dave-tech.it>,
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

SGkgQm9yaXMsDQoNCk9uIEZyaSwgMjAgTWFyIDIwMTUgMTE6MTk6NDggUE0gKzAwMDAgQm9yaXMg
QnJlemlsbG9uIHdyb3RlOg0KPg0KPkhpIFFpLA0KPg0KPk9uIEZyaSwgMjAgTWFyIDIwMTUgMTU6
MDU6NTQgKzAwMDANCj5RaSBXYW5nIOeOi+i1tyAocWl3YW5nKSA8cWl3YW5nQG1pY3Jvbi5jb20+
IHdyb3RlOg0KPg0KPj4gSGkgQm9yaXMsIFJpY2hhcmQNCj4+DQo+PiBPbiBGcmksIDIwIE1hciAy
MDE1IDA1OjA4IFBNICswMDAwIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToNCj4+ID4NCj4+ID5B
bSAyMC4wMy4yMDE1IHVtIDA5OjU4IHNjaHJpZWIgQm9yaXMgQnJlemlsbG9uOg0KPj4gPj4gSGkg
UWksDQo+PiA+Pg0KPj4gPj4gT24gRnJpLCAyMCBNYXIgMjAxNSAwNzo0NDo1OCArMDAwMA0KPj4g
Pj4gUWkgV2FuZyDnjovotbcgKHFpd2FuZykgPHFpd2FuZ0BtaWNyb24uY29tPiB3cm90ZToNCj4+
ID4+DQo+PiA+Pj4+DQo+PiA+Pj4+IEkgc2VlbSB0byByZW1lbWJlciBhIHJlcXVpcmVtZW50IHRv
IHdyaXRlIHBhZ2VzIHRvIGEgYmxvY2sgaW4gYQ0KPj4gPj4+PiBtb25vdG9uaWMgZmFzaGlvbiAo
bG93IHRvIGhpZ2gpLiBJcyB0aGF0IHN0aWxsIHRoZSBjYXNlPyBJdA0KPj4gPj4+PiBzZWVtcyB0
aGF0IHRoZSBsb3cgcGFnZSBiYWNrdXAgY291bGQgdmlvbGF0ZSB0aGF0IHJ1bGUgb3RoZXJ3aXNl
Lg0KPj4gPj4+DQo+PiA+Pj4gWWVzLCBwYWdlcyBuZWVkIHRvIGJlIHByb2dyYW1tZWQgZnJvbSBs
b3cgdG8gaGlnaC4gQnV0IGl0IGlzDQo+cG9zc2libGUNCj4+ID4+PiB0byBza2lwIHNvbWUgcGFn
ZXMuIFRha2UgYSBleGFtcGxlLA0KPj4gPj4+DQo+PiA+Pj4gYmVsb3cgcGFnZSBwcm9ncmFtIG9y
ZGVyaW5nIGlzIG9rLg0KPj4gPj4+IFBhZ2UgMCwgcGFnZSAxLCBwYWdlIDIsIHBhZ2UgNCwgcGFn
ZSA2LCBwYWdlIDEwLCBwYWdlIDE1LCBldGMuLg0KPj4gPj4+IEp1c3QgbWFrZSBzdXJlIGRvbid0
IHR1cm4gYmFjayB0byBwcm9ncmFtIHRoZSBsb3cgcGFnZSBpcyBvay4NCj4+ID4+DQo+PiA+PiBJ
IGFza2VkIGEgcXVlc3Rpb24gcmVnYXJkaW5nIHRoZSBwcm9ncmFtbWluZyBzZXF1ZW5jZSBpbiBh
bnN3ZXIgdG8NCj5Jd28sDQo+PiA+PiBidXQgSSdtIG5vdCBzdXJlIHlvdSB3ZXJlIGluIENjLCBz
byBJJ20gYXNraW5nIGl0IGFnYWluLg0KPj4gPj4NCj4+ID4+IFNheSBwYWdlIDEgaXMgcGFpcmVk
IHdpdGggcGFnZSA0LCBjYW4gd2UgcHJvZ3JhbSBwYWdlcyBpbiB0aGlzIG9yZGVyOg0KPj4gPj4g
MSwgNCwgMiwgNSwgMywgNiwgLi4uLCBzbyB0aGF0IGJvdGggcGFpcmVkIHBhZ2VzIGFyZSBwcm9n
cmFtbWVkDQo+PiA+PiB0b2dldGhlciAodGhlIEp1bWJvIHBhZ2UgYXBwcm9hY2ggSXdvIGRlc2Ny
aWJlZCBpbiBoaXMgbWFpbCkuDQo+PiA+DQo+PiA+VGhhdCdzIGEgZ29vZCBxdWVzdGlvbi4gSSB3
YXMgYWx3YXlzIHRvbGQgdGhhdCB5b3UncmUgbm90IGFsbG93ZWQNCj4+ID50byBwcm9ncmFtIHBh
Z2VzIGluIGEgbm9uLWxpbmVhciBtYW5uZXIuDQo+PiA+DQo+Pg0KPj4gWWVzLCB5b3UgYXJlIHJp
Z2h0LiBUaGlzIG1ldGhvZCBpc24ndCBhbGxvd2VkLiBVc2VyIGNhbiBvbmx5IHByb2dyYW0NCj5w
YWdlDQo+PiB3aXRoaW4gYSBibG9jayBmcm9tIGxvdyBhZGRyZXNzIHRvIGhpZ2ggYWRkcmVzcy4N
Cj4NCj5EbyB5b3Uga25vdyB0aGUgcmVhc29uIGJlaGluZCB0aGlzID8NCj4NCg0KSSBuZWVkIHRv
IGlucXVpcmUgb3VyIHByb2R1Y3QgZW5naW5lZXIsIHdpbGwgZ2l2ZSB5b3UgYW5zd2VyIG9uY2Ug
SSBnZXQgaXQuDQoNCi0tDQpUaGFua3MNClFpIFdhbmcNCg==
