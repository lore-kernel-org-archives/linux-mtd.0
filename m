Received: from mailout3.samsung.com ([203.254.224.33])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H7Ka6-0005KK-Bs
	for linux-mtd@lists.infradead.org; Wed, 17 Jan 2007 18:52:42 -0500
Received: from ep_ms12_bk (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0JC100HDVE82AU@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 18 Jan 2007 08:50:26 +0900 (KST)
Received: from ep_spt01 (ms12.samsung.com [203.254.225.99])
	by ms12.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0JC100IL5E82AO@ms12.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 18 Jan 2007 08:50:26 +0900 (KST)
Content-return: prohibited
Date: Wed, 17 Jan 2007 23:50:26 +0000 (GMT)
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: OneNAND oobfree
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Message-id: <28258806.531401169077825918.JavaMail.weblogic@ep_ml22>
MIME-version: 1.0
MIME-version: 1.0
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: base64
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgQWRyaWFuLA0KDQpZZXMsIEkga25vdyBpdCdzIGNvbmZ1c2luZy4gIk1hbmFnZWQgYnkgaW50
ZXJuYWwgRUNDIGxvZ2ljIGZvciBMb2dpY2FsIFNlY3RvciBOdW1iZXIgZGF0YSINCkJ1dCBhY3R1
YWxseSBpdCBtZWFucyAzIGJ5dGVzIGluIHNwYXJlIGFyZWEgaXMgbWFuYWdlZCBieSBpbnRlcm5h
bCBFQ0MgbG9naWMgYW5kIGl0IGdlbmVyYXRlcyBzcGFjZSBlY2MuDQpTbyB3ZSBjYW4gdXNlIGl0
IGFzIGZyZWUuDQoNCk5vdyBJIHRyeSB0byBvcHRpbWl6ZSBzcGFyZSBoYW5kbGluZy4NClRoZSBv
bmVuYW5kX2RvX3JlYWRfb29iIHJlYWRzIDMgYnl0ZXMuIGJ1dCBvbmVuYW5kIGhhcyAxNi1iaXQg
YnVzDQpCdXQgSSB0aGluayB0aGVyZSdzIHNvbWUgcGVyZm9ybWFuY2UgcHJvYmxlbS4gc28gSSBl
eGFtaW5lIHRoZSBpdC4NCkJhc2ljYWxseSBJIHdhbnQgdG8gb3BlcmF0aW9uIHdpdGggb29iIGJh
c2VkIG9uIDMyIGJ5dGUgZm9yIG9wdGltaXplZCBtZW1jcHkgaWYgcG9zc2libGUNCg0KVGhhbmsg
eW91LA0KS3l1bmdtaW4gUGFyaw0KDQotLS0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0tLQ0K
U2VuZGVyIDogQWRyaWFuIEh1bnRlcjxleHQtYWRyaWFuLmh1bnRlckBub2tpYS5jb20+IA0KRGF0
ZSAgIDogSmFuIDE3LCAyMDA3IDIwOjE3DQpUaXRsZSAgOiBPbmVOQU5EIG9vYmZyZWUNCg0KSGkg
S3l1bmdtaW4NCg0KVGhlIG5hbmRfZWNjbGF5b3V0IHN0cnVjdHVyZSBmb3IgT25lTkFORCBoYXMg
MyBieXRlcw0KYXQgcG9zaXRpb24gMiBtYXJrZWQgYXMgZnJlZSAoc2VlIGJlbG93KS4gIEhvd2V2
ZXIsDQp0aGUgZG9jdW1lbnRhdGlvbiBkZXNjcmliZXMgdGhlc2UgMyBieXRlcyBhcw0KIk1hbmFn
ZWQgYnkgaW50ZXJuYWwgRUNDIGxvZ2ljIGZvciBMb2dpY2FsIFNlY3Rvcg0KTnVtYmVyIGRhdGEi
Lg0KDQpBcmUgdGhlc2UgYnl0ZXMsIGluIGZhY3QsIGZyZWUsIGFuZCBzaG91bGQgdGhleSBiZSBs
aXN0ZWQNCmluIG9vYmZyZWUgYXMgdGhleSBhcmUgbm93Pw0KDQpSZWdhcmRzDQpBZHJpYW4NCg0K
DQoNCkZyb20gb25lbmFuZF9iYXNlLmM6DQpzdGF0aWMgc3RydWN0IG5hbmRfZWNjbGF5b3V0IG9u
ZW5hbmRfb29iXzY0ID0gew0KCS5lY2NieXRlcwk9IDIwLA0KCS5lY2Nwb3MJCT0gew0KCQk4LCA5
LCAxMCwgMTEsIDEyLA0KCQkyNCwgMjUsIDI2LCAyNywgMjgsDQoJCTQwLCA0MSwgNDIsIDQzLCA0
NCwNCgkJNTYsIDU3LCA1OCwgNTksIDYwLA0KCQl9LA0KCS5vb2JmcmVlCT0gew0KCQl7MiwgM30s
IHsxNCwgMn0sIHsxOCwgM30sIHszMCwgMn0sDQoJCXszNCwgM30sIHs0NiwgMn0sIHs1MCwgM30s
IHs2MiwgMn0NCgl9DQp9Ow0KDQoNCg0KDQo=
