Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zjz4Z-00040z-3G
 for linux-mtd@lists.infradead.org; Thu, 08 Oct 2015 00:28:39 +0000
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
Date: Thu, 8 Oct 2015 00:27:14 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6310BF4D8C9@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CEC3@NTXXIAMBX02.xacn.micron.com>
 <560A59B8.4000701@nod.at>
 <A765B125120D1346A63912DDE6D8B6310BF4D4C6@NTXXIAMBX02.xacn.micron.com>
 <560B8758.7010002@nod.at>
In-Reply-To: <560B8758.7010002@nod.at>
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

PiA+IEhpLCBSaWNoYXJkDQo+ID4gVGhhbmtzIGZvciB5b3VyIGNvbmNlcm4uIEkgYW0gYSBuZXcg
cGF0Y2ggc3VibWl0dGVyLg0KPiA+IENhbiB5b3UgdGVsbCBtZSBOYWNrZWQtYnkgbWVhbnM/DQo+
IA0KPiBJIGJhc2ljYWxseSBtZWFucyB0aGF0IEknbSAoYXMgbWFpbnRhaW5lcikgcmVhbGx5IHVu
aGFwcHkgd2l0aCB0aGlzIHBhdGNoZXMgYW5kDQo+IGRvbid0IHNlZSBhIHdheSB0byBnZXQgdGhl
bSBtZXJnZWQgYXMgdGhlIHdob2xlIGNvbmNlcHQgaXMgbm90IGFjY2VwdGFibGUuDQo+IA0KPiA+
IEJ5IHRoZSB3YXksIERvIHlvdSByZXZpZXcgbXkgcGF0Y2hlcyBzZXJpZXMgPyBJIGRvbid0IGJh
Y2t1cCBkdXBsaWNhdGVkDQo+IGRhdGEgaW4gT09CIC4NCj4gPiBDYW4geW91IHNwZWNpZnkgd2hp
Y2ggc2VjdG9yIGNvZGVzID8gc28gdGhhdCBJIGNhbiBleHBsYWluIGl0IGluIGRldGFpbC4NCj4g
DQo+IE9rYXkuIE1heWJlIGJvdGggQm9yaXMgYW5kIEkgbWlzcmVhZCB5b3VyIGNvZGUsIGNhbiB5
b3UgcGxlYXNlIGV4cGxhaW4gaW4NCj4gZGV0YWlsIHdoYXQgZnVuY3Rpb25zIGxpa2UgY2hlY2tf
b3JpZ2luYWxfZGF0YSgpIG9yDQo+IG10ZF93cml0ZV9kdWFsX3BsYW5lX29vYigpIGRvPw0KDQpP
SywgTmV4dCB2ZXJzaW9uIHBhdGNoLCBJIHdpbGwgYWRkIG1vcmUgY29tbWVudHMgZm9yIHNvbWUg
aW1wb3J0YW50IGZ1bmN0aW9uLg0KDQo+IFRoYW5rcywNCj4gLy9yaWNoYXJkDQo=
