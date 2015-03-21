Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YZ8XY-0003Iy-Sh
 for linux-mtd@lists.infradead.org; Sat, 21 Mar 2015 01:49:29 +0000
From: =?utf-8?B?UWkgV2FuZyDnjovotbcgKHFpd2FuZyk=?= <qiwang@micron.com>
To: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Subject: RE: detect and manage power cut on MLC NAND
Date: Sat, 21 Mar 2015 01:48:41 +0000
Message-ID: <71CF8D7F32C5C24C9CD1D0E02D52498A7717482E@NTXXIAMBX02.xacn.micron.com>
References: <mailman.37706.1426822709.22890.linux-mtd@lists.infradead.org>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7717444D@NTXXIAMBX02.xacn.micron.com>
 <EACD232272DA4849B060F0828564D13B57804E26B6@ntcex01.corp.netcomm.com.au>
 <71CF8D7F32C5C24C9CD1D0E02D52498A771744B0@NTXXIAMBX02.xacn.micron.com>
 <20150320095822.7e1979ff@bbrezillon>	<550BE355.8020009@nod.at>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7717470C@NTXXIAMBX02.xacn.micron.com>
 <20150320161903.608a79fc@bbrezillon>
 <0D23F1ECC880A74392D56535BCADD7354973F4B5@NTXBOIMBX03.micron.com>
In-Reply-To: <0D23F1ECC880A74392D56535BCADD7354973F4B5@NTXBOIMBX03.micron.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
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

SGkgSmVmZiwNCg0KU28gZ2xhZCB0byBtZWV0IG91ciBNaWNyb24gY29sbGVhZ3VlIGhlcmUuIA0K
DQpPbiBGcmksIDIxIE1hciAyMDE1IDEyOjQ4OjM1IEFNICswMDAwIEplZmYgTGF1cnVobiB3cm90
ZToNCj4NCj5IaSBCb3JpczsNCj4+IFllcywgeW91IGFyZSByaWdodC4gVGhpcyBtZXRob2QgaXNu
J3QgYWxsb3dlZC4gVXNlciBjYW4gb25seSBwcm9ncmFtDQo+PiBwYWdlIHdpdGhpbiBhIGJsb2Nr
IGZyb20gbG93IGFkZHJlc3MgdG8gaGlnaCBhZGRyZXNzLg0KPg0KPkRvIHlvdSBrbm93IHRoZSBy
ZWFzb24gYmVoaW5kIHRoaXMgPw0KDQpGb3IgdGhpcyBtZXRob2QsIG15IGlkZWEgaXMgd2UgY2Fu
IGNvbnNpZGVyIHBhZ2UgMSBhbmQgcGFnZTQgYXMgb25lIA0KcGFnZSwgdG8gcHJvZ3JhbSBwYWdl
IDEgYW5kIHBhZ2UgNCB0b2dldGhlci4gU28gaWYgcG93ZXIgY3V0IG9jY3VyLCANCmJvdGggcGFn
ZSAxIGFuZCBwYWdlIDQgKEJ1dCBvbmUgcGFnZSBjb3JydXB0aW9uIGluIHNvZnR3YXJlIHZpZXcp
d2lsbCANCmNvcnJ1cHQgYXQgc2FtZSB0aW1lLCB3b24ndCBoYXZlIGlzc3VlIGZvciBVQkkvVUJJ
RlMuDQoNCkkgYW0gbm90IHN1cmUgaWYgSSBhbSByaWdodCwgQm9yaXMgY2FuIGNvcnJlY3QgbWUu
IA0KDQo+VGhpcyBpcyBkb25lIHRvIGhlbHAgbWl0aWdhdGUgZGlzdHVyYnMgYW5kIHRvIGVuc3Vy
ZSB3ZSBnZXQgdGhlIGhpZ2hlc3QNCj5yZWxpYWJpbGl0eS4gIERyaXZpbmcgc29mdHdhcmUgZGV2
ZWxvcGVycyBjcmF6eSBpcyBqdXN0IGFuIGV4dHJhDQo+YmVuZWZpdC4gIDopDQoNClllcywgSSBh
Z3JlZSB0aGlzIHBvaW50LCB0byBtaXRpZ2F0ZSBkaXN0dXJicy4gDQoNCi0tDQpUaGFua3MNClFp
IFdhbmcNCg==
