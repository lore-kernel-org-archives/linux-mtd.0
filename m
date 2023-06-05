Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03965C7EE24
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 08:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O97K5mXdXuWhUK7aycf28jEnJppGmlQort1BZo51Bfk=; b=JkwHQaNk08R2Cr
	eunpRWor389/jSFcx2tFOOmy0WMqg/KsYTcNNHZBwaGV+jwDLyV92qhuVk441X+Tp7LWb0zIrsEXV
	z0aZ4vcR8kBj/P7tr87pS3WVi59XHka/B+QbqbEzltBKOEZB15J23fOHPCfrPnwlNG8w66IHDPfsZ
	pG9D6exDmYqU5tr26nOFwNWDiIAc13Nko8YZNfLUdpIx8yMM8vzuUJejqGDCDW6PSBKmN3Zm8SPa0
	gbY/OXMbFsTQNkdyYf5zAKoc9+0cUKFhH2Rf+xDZ6qmMLuy2ya+SXKPlq1NyZCXM3VxyiMJgI4pHX
	MzAEr0yXrMY+zpKJPa1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q65dn-00Eiev-0B;
	Mon, 05 Jun 2023 08:32:39 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q65de-00EidX-00;
	Mon, 05 Jun 2023 08:32:36 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 8C5325FD10;
	Mon,  5 Jun 2023 11:32:25 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685953945;
	bh=rcmkcmvXvlTClC6RLl0usufbWZ43nNBCgISC/BBJztQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=DYOvnaOTvkIA2gZzibpKhAau9XOxoMNCzadDny1zRD26CXSlqfcBkzgqXVUYY1Zyz
	 JyioYfKvbfNioCmHoDAVrNUixZb7DLstZuC+7Ss0dcomtk92bVA3i7D0F+FfLDKi1T
	 8baw4Wh/Zm52kP93LmpXXhB7dARA7BoQUq+iamcHl723N9p1Vkh5xQg4ecVqGrk+U9
	 Ak7fb2BLcJw++p6+psFX1WX1s7YcZlVzUB3swNx/tDV7JE5PwEt57AWJPJH8mYquTK
	 debttSRJvqVZT4e7cHpxWdDZVjIK0gbwp9rUhMyChEK2kfGH+UKw4/YIWzKDYXXbfF
	 MDvRfV9gO5ihA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon,  5 Jun 2023 11:32:24 +0300 (MSK)
Message-ID: <9bea333a-e5fc-af89-29a0-fa01236488a3@sberdevices.ru>
Date: Mon, 5 Jun 2023 11:27:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix ready/busy command
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, <stable@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Liang
 Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>
References: <20230605061048.485622-1-AVKrasnov@sberdevices.ru>
 <19f809ab-218e-8da5-6d5e-ac47902fa706@sberdevices.ru>
 <20230605101739.069b98af@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230605101739.069b98af@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/05 04:52:00 #21434197
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_013230_771949_63CFA86B 
X-CRM114-Status: GOOD (  22.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAwNS4wNi4yMDIzIDExOjE3LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIE1vbiwgNSBKdW4gMjAyMyAw
OTozOTo0MCArMDMwMDoKPiAKPj4gSGVsbG8gTWlxdWVsIQo+Pgo+PiBJIGV4Y2x1ZGUgdGhpcyBw
YXRjaCBmcm9tIHRoZSByZWNlbnQgTWVzb24gcGF0Y2hzZXQsIGFzIGl0IGlzIGZpeCBhbmQgbm90
IHJlbGF0ZWQgdG8gYW5vdGhlciBwYXRjaGVzLgo+PiBBbHNvIEkgdGhpbmsgdGhhdCBJIGNhbiBz
cGxpdCBNZXNvbiBwYXRjaHNldCAoZnJvbSBsaW5rcyBiZWxvdykgaW4gdGhlIGZvbGxvd2luZyB3
YXk6Cj4+IDEpIFBhdGNoL3BhdGNoc2V0IGZvciBPT0IgbGF5b3V0Cj4+IDIpIFBhdGNoc2V0IGZv
ciAibmFuZC1yYiIgbG9naWMgKG1lc29uX25hbmQuYyArIERUIGJpbmRpbmdzKQo+PiBUaGVzZSB0
d28gY2FuIGFsc28gZ28gaW5kZXBlbmRlbnRseToKPj4gMykgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbXRkLzIwMjMwNjAxMDYxODUwLjM5MDc4MDAtNi1BVktyYXNub3ZAc2JlcmRldmlj
ZXMucnUvCj4+IDQpIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIzMDYwMTA2
MTg1MC4zOTA3ODAwLTctQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Lwo+IAo+IExHVE0uCgpJIHRo
aW5rIHdlIGRvbid0IG5lZWQgdGhpcyBwYXRjaCB3aXRoIG5ldyBSQl9JTlQgdmFsdWUuIEkgZGl2
ZSBpbnRvIGNvbnZlcnNhdGlvbnMgd2l0aCBMaWFuZyBZYW5nIC0gYXV0aG9yIG9mIHRoaXMgZHJp
dmVyLiBIZSBzYWlkLAp0aGF0IHRoaXMgZGVmaW5lIGlzICJzcGVjaWFsIiBwb2xsaW5nIG1vZGUu
IE5vdyBJJ20gYSBsaXR0bGUgYml0IG1vcmUgZXhwZXJpZW5jZWQgaW4gTkFORCBhcmVhLCBzbyBJ
SVVDIHdlIGhhdmUgdHdvIGJhc2ljIHdhaXRpbmcgbW9kZXM6CjEpIFNvZnR3YXJlLCBieSBzZW5k
aW5nIHN0YXR1cyBjb21tYW5kLCB0aGVuIHBvbGxpbmcgcmVwbHkgZnJvbSBjb250cm9sbGVyLCBh
bmQgdGhlbiBmaW5hbGx5IHNlbmQgUkVBRDAgdG8gZXhpdCBzdGF0dXMgcmVhZGluZyBtb2RlIChu
YW5kX3NvZnRfd2FpdHJkeSgpKS4KMikgQnkgUkIgcGluIGFuZCBpbnRlcnJ1cHQgLSBpbiB0aGlz
IG1vZGUgd2Ugc2VuZCB2ZW5kb3Igc3BlY2lmaWMgY29tbWFuZCB0byB0aGUgY29udHJvbGxlciBh
bmQgaXQgdHJpZ2dlcnMgaW50ZXJydXB0IG9uIFJCIHBpbiB1cGRhdGUuCiAgIEluIHRoaXMgY2Fz
ZSBSQiBwaW4gbXVzdCBiZSBjb25uZWN0ZWQgdG8gdGhlIGNvbnRyb2xsZXIuIFRoaXMgbW9kZSBp
cyBhbHJlYWR5IGltcGxlbWVudGVkIGJ5IExpYW5nIFlhbmcuCgpOb3csIGNvbW1hbmQgd2l0aCB0
aGlzIG5ldyBkZWZpbmUgd29ya3MgaW4gdGhlIGZvbGxvd2luZyB3YXk6IHdlIHNlbmQgc3RhdHVz
IGNvbW1hbmQsIGJ5IGluc3RlYWQgb2YgcmVhZGluZyByZXBseSBmcm9tIGl0IGJ5IHNvZnR3YXJl
LApjb250cm9sbGVyIGl0c2VsZiBjaGVja3MgUkIgcGluIGFuZCBzdGF0dXMgcmVhZHkgYml0IGlu
IElPIGJ1cy4gRHJpdmVyIGp1c3Qgd2FpdHMgb24gY29tcGxldGlvbi4gQWZ0ZXIgd2FpdGluZyB3
ZSBuZWVkIHRvIHNlbmQKUkVBRDAgY29tbWFuZCBhZ2FpbiB0byBtYWtlIGNvbnRyb2xsZXIgbGVh
dmUgc3RhdHVzIHJlYWRpbmcgbW9kZS4gSSB0aGluayB0aGlzIGlzIGxpa2UgImludGVybWVkaWF0
ZSIgbW9kZSBiZXR3ZWVuIHNvZnR3YXJlIHBvbGxpbmcKYW5kIGhhcmR3YXJlIGludGVycnVwdCAt
IHRoZXJlIGlzIG5vIG5lZWQgdG8gc3BpbiBpbiBsb29wLCB3YWl0aW5nIGZvciBzdGF0dXMgcmVh
ZHkgYml0LCBidXQgc3RpbGwgbmVlZCB0byBsZWF2ZSBzdGF0dXMgbW9kZSBieSBzZW5kaW5nClJF
QUQwIGNvbW1hbmQuIEknbSBub3Qgc3VyZSB0aGF0IHdlIG5lZWQgdGhpcyBhcyB0aGlyZCBtb2Rl
IG9mIHdhaXRpbmcgZm9yIGNvbW1hbmQgaXMgZG9uZS4gTWF5IGJlIGF0IGxlYXN0IG5vdCBpbiB0
aGlzIHdvcmsgb24gTWVzb24gZHJpdmVyLApzbyBJIGd1ZXNzIHRvIGRyb3AgdGhpcyBwYXRjaCBh
dCAgdGhpcyBtb21lbnQgYW5kIGFkZCAnbmFuZF9zb2Z0X3dhaXRyZHkoKScgc3VwcG9ydC4KClRo
YW5rcywgQXJzZW5peQoKPiAKPj4KPj4gV2hhdCBkbyBZb3UgdGhpbms/Cj4+Cj4+IFRoYW5rcywg
QXJzZW5peQo+Pgo+PiBPbiAwNS4wNi4yMDIzIDA5OjEwLCBBcnNlbml5IEtyYXNub3Ygd3JvdGU6
Cj4+PiBGaXggdGhlIHJlYWR5L2J1c3kgY29tbWFuZCB2YWx1ZS4KPj4+Cj4+PiBGaXhlczogOGZh
ZTg1NmM1MzUwICgibXRkOiByYXduYW5kOiBtZXNvbjogYWRkIHN1cHBvcnQgZm9yIEFtbG9naWMg
TkFORCBmbGFzaCBjb250cm9sbGVyIikKPj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+
PiBTdWdnZXN0ZWQtYnk6IExpYW5nIFlhbmcgPGxpYW5nLnlhbmdAYW1sb2dpYy5jb20+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4K
Pj4+IC0tLQo+Pj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyB8IDIgKy0KPj4+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+PiBpbmRleCAwNzRlMTQyMjVjMDYuLjlkZDRhNjc2
NDk3YiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+
Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+PiBAQCAtMzcsNyAr
MzcsNyBAQAo+Pj4gICNkZWZpbmUgTkZDX0NNRF9TQ1JBTUJMRVJfRU5BQkxFCUJJVCgxOSkKPj4+
ICAjZGVmaW5lIE5GQ19DTURfU0NSQU1CTEVSX0RJU0FCTEUJMAo+Pj4gICNkZWZpbmUgTkZDX0NN
RF9TSE9SVE1PREVfRElTQUJMRQkwCj4+PiAtI2RlZmluZSBORkNfQ01EX1JCX0lOVAkJQklUKDE0
KQo+Pj4gKyNkZWZpbmUgTkZDX0NNRF9SQl9JTlQJCSgoMHhiIDw8IDEwKSB8IEJJVCgxOCkgfCBC
SVQoMTYpKQo+Pj4gIAo+Pj4gICNkZWZpbmUgTkZDX0NNRF9HRVRfU0laRSh4KQkoKCh4KSA+PiAy
MikgJiBHRU5NQVNLKDQsIDApKQo+Pj4gICAgCj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
