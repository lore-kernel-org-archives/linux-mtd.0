Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2740DC7EE2E
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cI/MLUok5Etdks46UfZqSfNfIqkqRHZ3m6rW8nlTbcA=; b=geC6WH6WbifJHP
	f1CaD5DUZT5+EmqnOzp4kVjU9O02I1D3pGz6fB55x/5auymbCB36ALTBG74pY75mbtk9rQi+9ZcMV
	+n0+3wAU2wmCX8fBVn5ZGA/V786yghPTLVDrsSxof+KjpOBSIP3LDPQ56jQoaLcfDyB7XQdLYVS5h
	obhF+Nk2Dxdo32IVMPy3ok85PJipRw4Rm3lcQgT9bz0yPFiO3L9h0V0Qarm/Zsvsff8q7UVxvpPd/
	Lt4PNFFsFpfGbrmULcWyk267ZPh73LTslZI9LDxsKK/NkW2hwbnOs1bhIw4ukvNrVfKc13o91fVBU
	c0bAEc7WMi40HhvcFQ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3un8-00Cwz0-2p;
	Tue, 30 May 2023 08:33:18 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3un4-00Cwwe-0x;
	Tue, 30 May 2023 08:33:16 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 960E85FD1D;
	Tue, 30 May 2023 11:33:11 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685435591;
	bh=iah+zrTqnTbZamRlmW+Ybmqp3PDHYuh1a0WRns1ny6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=Q9sgChetLK6O5PUBi6o4WdrQycgjNOSOp0BUgs1dZVu6QrZcsrjfaZOlPDLfMLyBq
	 cK3fw621aJrLpqH6/pGFZ8gkDrdAYgwjXDPpL/J2O57VkBmM+SJyP8T5QoGnPSjt1j
	 lUtFFES5eCD1cG27GzVw9LUs8Ab6Qcqpjs+BfgpSG3NpqgAFcDAojwxn0PuDwn6qWL
	 qlFLnFQWxZpjojWVjnoCpHogLAIxO7N59wOhnQEhjPyjXKADiRMuNpahU/zcrlg/2b
	 iqSk7jAScBTXANKEdKO0D1mFgZXRrxY9gC9b977NjD/IvfEaOMjIzrlp+xBjF5/J3V
	 IZSbUdDCgTfLg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 30 May 2023 11:33:10 +0300 (MSK)
Message-ID: <1d1cfd95-d0ee-e6de-d3d9-acf6defde661@sberdevices.ru>
Date: Tue, 30 May 2023 11:28:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 2/5] mtd: rawnand: meson: move OOB to non-protected ECC
 area
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Yixun Lan <yixun.lan@amlogic.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
 <20230515094440.3552094-3-AVKrasnov@sberdevices.ru>
 <20230522173334.7aa6f917@xps-13>
 <ebbc26e3-6a1c-eead-051c-8f93beba41f3@sberdevices.ru>
 <20230526190347.6e34a2be@xps-13>
 <b9f0a38a-0d50-23f0-4509-c38362d05f12@sberdevices.ru>
 <20230530094420.06281ab5@xps-13>
 <1f4c90c4-e436-c53f-bb6f-416db374ae52@sberdevices.ru>
 <20230530102143.6b2a199a@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230530102143.6b2a199a@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/30 04:52:00 #21374971
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_013314_685312_5684EB20 
X-CRM114-Status: GOOD (  20.85  )
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

CgpPbiAzMC4wNS4yMDIzIDExOjIxLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFR1ZSwgMzAgTWF5IDIwMjMg
MTE6MDk6MTAgKzAzMDA6Cj4gCj4+IEhpIE1pcXVlbCwKPj4KPj4gT24gMzAuMDUuMjAyMyAxMDo0
NCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+IEhpIEFyc2VuaXksCj4+PiAgIAo+Pj4+Pj4+PiAt
c3RhdGljIHZvaWQgbWVzb25fbmZjX2dldF91c2VyX2J5dGUoc3RydWN0IG5hbmRfY2hpcCAqbmFu
ZCwgdTggKm9vYl9idWYpCj4+Pj4+Pj4+IC17Cj4+Pj4+Pj4+IC0Jc3RydWN0IG1lc29uX25mY19u
YW5kX2NoaXAgKm1lc29uX2NoaXAgPSB0b19tZXNvbl9uYW5kKG5hbmQpOwo+Pj4+Pj4+PiAtCV9f
bGU2NCAqaW5mbzsKPj4+Pj4+Pj4gLQlpbnQgaSwgY291bnQ7Cj4+Pj4+Pj4+ICsJaW50IGk7Cj4+
Pj4+Pj4+ICAKPj4+Pj4+Pj4gLQlmb3IgKGkgPSAwLCBjb3VudCA9IDA7IGkgPCBuYW5kLT5lY2Mu
c3RlcHM7IGkrKywgY291bnQgKz0gMikgewo+Pj4+Pj4+PiArCWZvciAoaSA9IDA7IGkgPCBuYW5k
LT5lY2Muc3RlcHM7IGkrKykgewo+Pj4+Pj4+PiAgCQlpbmZvID0gJm1lc29uX2NoaXAtPmluZm9f
YnVmW2ldOwo+Pj4+Pj4+PiAtCQlvb2JfYnVmW2NvdW50XSA9ICppbmZvOwo+Pj4+Pj4+PiAtCQlv
b2JfYnVmW2NvdW50ICsgMV0gPSAqaW5mbyA+PiA4Owo+Pj4+Pj4+PiArCQkvKiBBbHdheXMgaWdu
b3JlIHVzZXIgYnl0ZXMgcHJvZ3JhbW1pbmcuICovICAgICAgCj4+Pj4+Pj4KPj4+Pj4+PiBXaHk/
ICAgICAgCj4+Pj4+Pgo+Pj4+Pj4gSSB0aGluayBjb21tZW50IG1lc3NhZ2UgaXMgd3JvbmcgYSBs
aXR0bGUgYml0LiBIZXJlICJ1c2VyIGJ5dGVzIiBhcmUKPj4+Pj4+IHVzZXIgYnl0ZXMgcHJvdGVj
dGVkIGJ5IEVDQyAoZS5nLiBsb2NhdGlvbiBvZiB0aGVzZSBieXRlcyBkaWZmZXJzIGZyb20gbmV3
Cj4+Pj4+PiBPT0IgbGF5b3V0IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCkuIER1cmluZyBwYWdl
IHdyaXRlIHRoaXMgaGFyZHdhcmUKPj4+Pj4+IGFsd2F5cyB3cml0ZXMgdGhlc2UgYnl0ZXMgYWxv
bmcgd2l0aCBkYXRhLiBCdXQsIG5ldyBPT0IgbGF5b3V0IGFsd2F5cyBpZ25vcmVzCj4+Pj4+PiB0
aGVzZSA0IGJ5dGVzLCBzbyBzZXQgdGhlbSB0byAweEZGIGFsd2F5cy4gICAgCj4+Pj4+Cj4+Pj4+
IFdoZW4gcGVyZm9ybWluZyBwYWdlIHJlYWRzL3dyaXRlcywgeW91IG5lZWQgdG8gdGFrZSB0aGUg
ZGF0YSBhcyBpdCdzCj4+Pj4+IGJlZW4gcHJvdmlkZWQuIFlvdSBtYXkgbW92ZSB0aGUgZGF0YSBh
cm91bmQgaW4gdGhlIGJ1ZmZlciBwcm92aWRlZCB0bwo+Pj4+PiB0aGUgY29udHJvbGxlciwgc28g
dGhhdCBpdCBnZXQgdGhlIEVDQyBkYXRhIGF0IHRoZSByaWdodCBsb2NhdGlvbiwgYW5kCj4+Pj4+
IHlvdSBuZWVkIG9mIGNvdXJzZSB0byByZW9yZ2FuaXplIHRoZSBkYXRhIHdoZW4gcmVhZGluZyBh
cyB3ZWxsLCBzbyB0aGF0Cj4+Pj4+IHRoZSB1c2VyIHNlZXMgWGtpQiBvZiBkYXRhICsgWUIgb2Yg
T09CLiBUaGF0J3MgYWxsIHlvdSBuZWVkIHRvIGRvIGluCj4+Pj4+IHRoZXNlIGhlbHBlcnMuCj4+
Pj4+ICAgICAKPj4+Pgo+Pj4+IEkgdGhpbmsgdGhlcmUgaXMgc29tZSBtaXN1bmRlcnN0YW5kaW5n
IGFib3V0IHRoZXNlICJ1c2VyIGJ5dGVzIiBhYm92ZTogdGhlcmUgYXJlIDQKPj4+PiBieXRlcyB3
aGljaCB0aGlzIE5BTkQgY29udHJvbGxlciBhbHdheXMgd3JpdGVzIHRvIHBhZ2UgaW4gRUNDIG1v
ZGUgLSBpdCB3YXMgZnJlZSBPT0IKPj4+PiBieXRlcyBjb3ZlcmVkIGJ5IEVDQy4gQ29udHJvbGxl
ciBncmFicyB2YWx1ZXMgZnJvbSBETUEgYnVmZmVyIChzZWNvbmQgRE1BIGJ1ZmZlciB3aGljaAo+
Pj4+IGRvZXNuJ3QgY29udGFpbnMgcGFnZSBkYXRhKSBhbmQgd3JpdGVzIGl0IGFsb25nIHdpdGgg
ZGF0YSBhbmQgRUNDIGNvZGVzLiBJZGVhIG9mIHRoaXMKPj4+PiBjaGFuZ2UgaXMgdG8gYWx3YXlz
IHN1cHByZXNzIHRoaXMgd3JpdGUgYnkgc2V0dGluZyB0aGVtIHRvIDB4RkYgKG1heSBiZSB0aGVy
ZSBpcyBzb21lCj4+Pj4gY29tbWFuZCBvcHRpb24gdG8gbm90IHdyaXRlIGl0LCBidXQgSSBkb24n
dCBoYXZlIGRvYyksIGJlY2F1c2UgYWxsIG9mIHRoZW0gKDQgYnl0ZXMpCj4+Pj4gYmVjb21lIHVu
YXZhaWxhYmxlIHRvIHJlYWRlci93cml0ZXIuICAKPj4+Cj4+PiBBdCB0aGUgTkFORCBjb250cm9s
bGVyIGxldmVsLCBJIHdvdWxkIHJhdGhlciBhdm9pZCBkb2luZyB0aGluZ3MgbGlrZQo+Pj4gdGhh
dC4KPj4+Cj4+PiBJIGJlbGlldmUgeW91IGNhbiBqdXN0IHVwZGF0ZSB0aGUgb29ibGF5b3V0IHNv
IHRoYXQgcHJvdGVjdGVkIE9PQiBieXRlcwo+Pj4gYXJlIG5vdCBleHBvc2VkIHRvIHRoZSB1c2Vy
IGFzIGZyZWUgYnl0ZXMuIFRoZW4geW91ciBidWZmZXJzIHNob3VsZAo+Pj4gYWxyZWFkeSBjb250
YWluIDB4ZmZmZmZmIGF0IHRoZSBwcm9ibGVtYXRpYyBsb2NhdGlvbi4gIAo+Pgo+PiBTbyBZb3Vy
IGlkZWEgaXMgdG8gY29udGludWUgZmlsbCBETUEgYnVmZmVyIChmb3IgdGhlc2UgNCBieXRlcykg
ZnJvbSBwcm92aWRlZCBPT0IgYnVmZmVyLAo+PiByZWx5aW5nIG9uIHRoYXQgYXMgdGhlc2UgYnl0
ZXMgYXJlIHVudXNlZCwgdGhleSB3aWxsIGJlIDB4RkYgaW4gT09CIGJ1ZmZlciBzbyB3ZSBnZXQg
dGhlIHNhbWUgcmVzdWx0Pwo+IAo+IFllcy4KPiAKPiBUaGUgcHJvYmxlbSB5b3UgZmFjZSBpcyBk
dWUgdG8gamZmczIgdXNpbmcgZnJlZSBPT0IgYnl0ZXMgdG8gc3RvcmUgc29tZQo+IGRhdGEuIElm
IHRoaXMgZGF0YSBpcyBpbiB0aGUgcHJvdGVjdGVkIGFyZWEgLT4gQk9PTS4KPiAKPiBJZiBhbm90
aGVyIGFwcGxpY2F0aW9uIHdhbnRzIHRvIHVzZSBhbGwgdGhlIGJ5dGVzIGFuZCB3cml0ZXMgdGhl
bSBhbGwKPiBpbiB0aGUgc2FtZSBQUk9HUkFNIG9wZXJhdGlvbiBpdCdzIGZpbmUuCj4gCj4gSmZm
czIgYWNjZXNzZXMgdGhlIGZyZWUgYXJlYSB0aHJvdWdoIHRoZSBPT0IgbGF5b3V0cyBvbmx5LCBz
byBqdXN0Cj4gdHdlYWtpbmcgdGhlIE9PQiBsYXlvdXRzIHNob3VsZCB3b3JrLgoKSSBzZWUsIEkn
bGwgdHJ5IHRoaXMuCgpUaGFua3MsCkFyc2VuaXkKCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
