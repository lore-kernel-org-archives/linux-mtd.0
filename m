Received: from mail-db8lp0185.outbound.messaging.microsoft.com
 ([213.199.154.185] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UnJbj-0003SZ-Ff
 for linux-mtd@lists.infradead.org; Fri, 14 Jun 2013 02:19:21 +0000
Received: from mail173-db8 (localhost [127.0.0.1])	by
 mail173-db8-R.bigfish.com (Postfix) with ESMTP id 16469CE00B7	for
 <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2013 02:18:56 +0000 (UTC)
Received: from DB8EHSMHS027.bigfish.com (unknown [10.174.8.226])	by
 mail173-db8.bigfish.com (Postfix) with ESMTP id 288B88C0049	for
 <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2013 02:18:53 +0000 (UTC)
From: =?ks_c_5601-1987?B?vK2x4ryuW1NlbyBLaSBTZW9rXQ==?=
 <templer84@kaonmedia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBIFS io performance consistency issue
Date: Fri, 14 Jun 2013 02:18:42 +0000
Message-ID: <d485c1a2c18a4c1daf05c6503767ca9f@HKNPR03MB019.apcprd03.prod.outlook.com>
Content-Language: ko-KR
Content-Type: text/plain; charset="ks_c_5601-1987"
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

RGVhciBVQklGUyBkZXZlbG9wZXJzDQoNCktlcm5lbCB2ZXJzaW9uIDogMi42LjM3LTIuOA0KTmFu
ZCA6IE1pY3JvbiBNVDI5RjMyRzA4Q0JBQ0EgKDRHQiwgTUxDKQ0KDQpIaSwgSSBhbSB1c2luZyB1
YmlmcyBmb3IgNEdCIE1MQyBuYW5kZmxhc2ggYW5kIGJhc2ljIHdvcmtpbmcgaXMgd2VsbCBkb25l
Lg0KQnV0IHNvbWUgaXNzdWUgdG9ydHVyZSBtZS4gSSB1bnRhciBsYXJnZSBmaWxlIHNvbWV0aW1l
cy4gQnV0IHRoZXJlIGFyZQ0Kd2lkZSB2YXJpYXRpb25zIGluIHVudGFyIHNwZWVkLg0KSSBzcGVu
ZCA1fjE1IG1pbihpbiBzeW5jIG1vZGUpIGZvciAxNTBNQiBmaWxlIHRvIHVudGFyLiBldmVuIHNw
ZW5kIDI1DQptaW4gZm9yIHNhbWUgZmlsZS4NCldoeSBpcyB0aGlzIGhhcHBlbmluZz8NCk9mIGNv
dXJzZSBJIHJlYWQgdWJpIGFuZCB1YmlmcyBkb2N1bWVudGF0aW9ucy4NCihodHRwOi8vd3d3Lmxp
bnV4LW10ZC5pbmZyYWRlYWQub3JnL2RvYykNCkFuZCBJIHJlYWQgIkRvZXMgVUJJRlMgYmVjb21l
IHNsb3dlciB3aGVuIGl0IGlzIGZ1bGw/Ig0KKGh0dHA6Ly93d3cubGludXgtbXRkLmluZnJhZGVh
ZC5vcmcvZmFxL3ViaWZzLmh0bWwjTF9zbG93X3doZW5fZnVsbCkNCkJ1dCBteSBuYW5kZmxhc2gg
aXMgbm90IGNsb3NlIHRvIGZ1bGwuIEkgaGF2ZSAxLjVHQiBtb3JlIGF2YWlsYWJsZSBjYXBhY2l0
eS4NCkkgd29uZGVyIHRoYXQgdWJpZnMgaW8gcGVyZm9ybWFuY2UgaXMgY29uc2lzdGVuY3kgb3Ig
bm90Lg0KUGxlYXNlIGhlbHAgbWUgc29tZSB0aXBzIGZvciBpbiB0aGlzIGNhc2UuIEkgbmVlZCB0
byBiZSBjb25zaXN0ZW5jeQ0KZm9yIGlvIG9wZXJhdGlvbnMuDQpUaGFua3MgZm9yIHJlYWRpbmcg
bXkgc2hvcnQgRW5nbGlzaC4NCg0KUmVzcGVjdGZ1bGx5IHlvdXJzDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXw0KDQpUaGUgYWJvdmUgbWVzc2FnZSBpcyBpbnRlbmRlZCBzb2xlbHkg
Zm9yIHRoZSBuYW1lZCBhZGRyZXNzZWUgYW5kIG1heSBjb250YWluIHRyYWRlIHNlY3JldCBhbmQg
Y29uZmlkZW50aWFsIGluZm9ybWF0aW9uIG90aGVyd2lzZSBwcm90ZWN0ZWQgdW5kZXIgYXBwbGlj
YWJsZSBsYXcuDQpBbnkgdW5hdXRob3JpemVkIGRpc3NlbWluYXRpb24gb3IgdXNlIG9mIHRoZSBp
bmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBjb21tdW5pY2F0aW9uIGlzIHN0cmljdGx5IHBy
b2hpYml0ZWQuDQpJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGNvbW11bmljYXRpb24gaW4gZXJy
b3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBieSBlbWFpbCBhbmQgZGVsZXRlIHRoaXMgY29t
bXVuaWNhdGlvbiBpbW1lZGlhdGVseS4NCg0KVGhlIEZ1dHVyZSBvZiBTbWFydFRWIGFuZCBDb25u
ZWN0ZWQgSG9tZS4uLiBLYW9uTWVkaWEgQ28uIEx0ZC4gd3d3Lmthb25tZWRpYS5jb208aHR0cDov
L3d3dy5rYW9ubWVkaWEuY29tPg0K
