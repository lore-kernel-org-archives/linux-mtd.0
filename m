Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84F0C6FD18
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Apr 2023 15:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+uJKN6dL5hLYwyPvIJLme1hEaEvXKFWhdb3mr+BxUNE=; b=N70gbEOYfITPWf
	ILjSIu7U5zMFi8mMWUTZn3c3mySS4iRNcWq1hxHDcf/QxhKRN5dBLUQBvZuFeIEpflcyy0WZOk6G9
	HnL0AsCLIkCarKvcDyrsYQI9aQe7fC7J+WR//1LTm1CqHfP3vjJ2N1YRfamEXi+kOrk8hNypUGCIl
	jIfpmQP3BCXYEOxfvZ6gV2nmBnbZVRD1+ucsQFKU/SWuIth5rcAqFiL81v1qvf/PCqkBFgAXedYJI
	hMDLSBxVntcBSScuiAuEcZkBDWYQ4ISoemWakZPuVzWrNInraiXSa0aH5aqIxi1qY1crMvmOdrStf
	/ix+a0tG7ZLRg7cjuMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pompp-002W7k-03;
	Tue, 18 Apr 2023 15:01:33 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pompk-002W5O-0I;
	Tue, 18 Apr 2023 15:01:30 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id D09235FD79;
	Tue, 18 Apr 2023 18:01:19 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681830079;
	bh=KwR/vXWf2XJngJDNGuVOyhCkpaE9REad0bk6h20/y5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=o//7o0k99+18UL3Bm6MDreX/1dBhk+3cUNFWkm1iQlxcy8VtzGIh3NUhQrAdB8wCP
	 APnZCKYsFaTcb01zPjptfhaSIMefaLEqqAJc19nm97Ui9WfPeux5UruApUpHFxcZCO
	 fSWOcHegOfEU32sFSYGjbPuFeuv/wHrrOXENQN1SOa01JCgerQOTbJDjWH9D0ms206
	 dzn+u9W9FiwGmnTQPbh0UV4FERn1oNbP9j3eBC4b/nVrz2nBW7QITjMirfuEYelfG1
	 IrJcNf79eMY2NHedJoZGtGSNL5V5aiexfD6I9qWJRYpE+vztUIlXJcm5end7GMkRLr
	 m+fzRU1vcdnVw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 18 Apr 2023 18:01:18 +0300 (MSK)
Message-ID: <15a6e415-1489-a81f-fc8f-2372678ad2cb@sberdevices.ru>
Date: Tue, 18 Apr 2023 17:57:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>, Liang Yang
	<liang.yang@amlogic.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
	<jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
	<oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	yonghui.yu <yonghui.yu@amlogic.com>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230412094400.3c82f631@xps-13>
 <ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
 <20230412113654.183350d0@xps-13>
 <4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
 <20230412141824.755b2bca@xps-13>
 <eedaaed9-0a41-2c18-9eb2-792613566986@sberdevices.ru>
 <20230412145715.58c2be4a@xps-13>
 <7c996832-258f-001c-56bd-87bbdf23eeaa@amlogic.com>
 <20230412163214.0c764bb3@xps-13>
 <0c61eaae-053e-5768-a533-70b2ff0cc95d@amlogic.com>
 <fbb8cb2b-0996-3029-b368-f67087d73487@amlogic.com>
 <7520e512-8a19-ff04-364c-b5be0a579ef0@sberdevices.ru>
 <20230413102200.309fbe9c@xps-13>
 <b3279de4-e89d-db03-a515-a6aa52ab90d3@sberdevices.ru>
 <20230413122252.0a8efcd8@xps-13>
 <569a948e-654a-b21f-8a4f-55dc4b295387@sberdevices.ru>
 <60fa656e-bda1-1de6-a79e-3e3041cd69a8@sberdevices.ru>
 <780c0cae-18b6-2652-1c2c-6d398ea60451@amlogic.com>
 <e7c49f2d-b3c1-8d9b-76fe-c8759b37c7c7@sberdevices.ru>
 <20230418152505.72fc16da@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230418152505.72fc16da@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/18 12:37:00 #21124037
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_080128_826119_60F31638 
X-CRM114-Status: GOOD (  26.19  )
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

CgpPbiAxOC4wNC4yMDIzIDE2OjI1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4+Pj4gSGVsbG8gYWdhaW4gQExpYW5nIEBNaXF1ZWwhCj4+Pj4KPj4+PiBPbmUgbW9yZSBx
dWVzdGlvbiBhYm91dCBPT0IgYWNjZXNzLCBhcyBJIGNhbiBzZWUgY3VycmVudCBkcml2ZXIgdXNl
cyB0aGUgZm9sbG93aW5nCj4+Pj4gY2FsbGJhY2tzOgo+Pj4+Cj4+Pj4gwqDCoMKgwqBuYW5kLT5l
Y2Mud3JpdGVfb29iX3JhdyA9IG5hbmRfd3JpdGVfb29iX3N0ZDsKPj4+PiDCoMKgwqDCoG5hbmQt
PmVjYy53cml0ZV9vb2IgPSBuYW5kX3dyaXRlX29vYl9zdGQ7Cj4+Pj4KPj4+Pgo+Pj4+IEZ1bmN0
aW9uICduYW5kX3dyaXRlX29vYl9zdGQoKScgd3JpdGVzIGRhdGEgdG8gdGhlIGVuZCBvZiB0aGUg
cGFnZS4gQnV0IGFzIEkKPj4+PiBjYW4gc2VlIGJ5IGR1bXBpbmcgJ2RhdGFfYnVmJyBkdXJpbmcg
cmVhZCwgcGh5c2ljYWwgbGF5b3V0IG9mIGVhY2ggcGFnZSBpcyB0aGUKPj4+PiBmb2xsb3dpbmcg
KDFLQiBFQ0MpOgo+Pj4+Cj4+Pj4gMHgwMDA6IFvCoMKgwqDCoMKgwqDCoMKgIDEgS0Igb2YgZGF0
YcKgwqDCoMKgwqDCoMKgIF0KPj4+PiAweDQwMDogWyAyQiB1c2VyIGRhdGFdIFsgMTRCIEVDQyBj
b2RlXQo+Pj4+IDB4NDEwOiBbwqDCoMKgwqDCoMKgwqDCoCAxIEtCIG9mIGRhdGHCoMKgwqDCoMKg
wqDCoCBdwqDCoMKgIChBKQo+Pj4+IDB4ODEwOiBbIDJCIHVzZXIgZGF0YV0gWyAxNEIgRUNDIGNv
ZGVdCj4+Pj4gMHg4MjA6IFvCoMKgwqDCoMKgwqDCoCAzMkIgdW51c2VkwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXQo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IFNvLCBhZnRlciAnbmFuZF93cml0ZV9vb2Jfc3Rk
KCknIChsZXQgZGF0YSBiZSBzZXF1ZW5jZSBmcm9tIFsweDAgLi4uIDB4M2ZdKSwKPj4+PiBwYWdl
IHdpbGwgbG9vayBsaWtlIHRoaXM6Cj4+Pj4KPj4+PiAweDAwMDogW8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAweEZGwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBdCj4+Pj4gMHg0MDA6IFvCoMKgwqDC
oMKgwqDCoMKgwqDCoCAuLi4uLi4uLsKgwqDCoMKgwqDCoMKgwqDCoCBdCj4+Pj4gMHg3ZjA6IFvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhGRsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXQo+Pj4+
IDB4ODAwOiBbIDAwIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uwqAgXQo+Pj4+IDB4ODMwOiBbIC4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLiAzZiBdCj4+Pj4KPj4+PiBIZXJlIHdlIGhhdmUgdHdvIHBy
b2JsZW1zOgo+Pj4+IDEpIEF0dGVtcHQgdG8gZGlzcGxheSByYXcgZGF0YSBieSAnbmFuZGR1bXAn
IHV0aWxpdHkgcHJvZHVjZXMgYSBsaXR0bGUgYml0Cj4+Pj4gwqDCoMKgIGludmFsaWQgb3V0cHV0
LCBhcyBkcml2ZXIgcmVsaWVzIG9uIGxheW91dCAoQSkgZnJvbSBhYm92ZS4gRS5nLiBPT0IgZGF0
YQo+Pj4+IMKgwqDCoCBpcyBhdCAweDQwMCBhbmQgMHg4MTAuIEhlcmUgaXMgYW4gZXhhbXBsZSAo
YXR0ZW1wdCB0byB3cml0ZSAweDExIDB4MjIgMHgzMyAweDQ0KToKPj4+Pgo+Pj4+IDB4MDAwMDA3
ZjA6IDExIDIyIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmwqAgfC4i
Li4uLi4uLi4uLi4uLi58Cj4+Pj4gwqDCoCBPT0IgRGF0YTogZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmbCoCB8Li4uLi4uLi4uLi4uLi4uLnwKPj4+PiDCoMKg
IE9PQiBEYXRhOiAzMyA0NCBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZsKgIHwzRC4uLi4uLi4uLi4uLi4ufAo+Pj4+IMKgwqAgT09CIERhdGE6IGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmwqAgfC4uLi4uLi4uLi4uLi4uLi58Cj4+
Pj4gwqDCoCBPT0IgRGF0YTogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmbCoCB8Li4uLi4uLi4uLi4uLi4uLnwKPj4+PiAgCj4+PiBIaSBBcnNlbml5LAo+Pj4K
Pj4+IEkgcmVhbGl6ZWQgdGhlIHdyaXRlX29vYl9yYXcoKSBhbmQgd3JpdGVfb29iKCkgYXJlIHdy
b25nIGluIG1lc29uX25hbmQuYy4gSSBzdWdnZXN0IGJvdGggb2YgdGhlbSBzaG91bGQgYmUgcmV3
b3JrZWQgYW5kIGZvbGxvdyB0aGUgZm9ybWF0IG9mIG1lc29uIG5hbmQgY29udHJvbGxlci4gaS5l
LiBmaXJzdGx5IGZvcm1hdCB0aGUgZGF0YSBpbiBMYXlvdXQgKEEpIGFuZCB0aGVuIHdyaXRlLiBy
ZWFkaW5nIGlzIGZpcnN0bHkgcmVhZGluZyB0aGUgZGF0YSBvZiBsYXlvdXQgKEEpIGFuZCB0aGVu
IGNvbXBvc3QgdGhlIGxheW91dCAoQikuICAKPj4KPj4gSUlVQyBhZnRlciBzdWNoIHdyaXRpbmcg
b25seSBPT0IgKGUuZy4gdXNlciBieXRlcykgYWNjb3JkaW5nIGxheW91dCAoQSksIGh3IHdpbGwg
YWxzbyB3cml0ZSBFQ0MgY29kZXMsIHNvCj4+IGl0IHdpbGwgYmUgaW1wb3NzaWJsZSB0byB3cml0
ZSBkYXRhIHRvIHRoaXMgcGFnZSBsYXRlciwgYmVjYXVzZSB3ZSBjYW5ub3QgdXBkYXRlIEVDQyBj
b2RlcyBwcm9wZXJseSBmb3IgdGhlIG5ld2x5Cj4+IHdyaXR0ZW4gZGF0YSAod2UgY2FuJ3QgdXBk
YXRlIGJpdHMgZnJvbSAwIHRvIDEpLgo+Pgo+Pj4KPj4+ICAgCj4+Pj4KPj4+PiAyKSBBdHRlbXB0
IHRvIHJlYWQgZGF0YSBpbiBFQ0MgbW9kZSB3aWxsIGZhaWwsIGJlY2F1c2UgSUlVQyBwYWdlIGlz
IGluIGRpcnR5Cj4+Pj4gwqDCoMKgIHN0YXRlIChJIG1lYW4gd2FzIHdyaXR0ZW4gYXQgbGVhc3Qg
b25jZSkgYW5kIE5BTkQgY29udHJvbGxlciB0cmllcyB0byB1c2UKPj4+PiDCoMKgwqAgRUNDIGNv
ZGVzIGF0IDB4NDAwIGFuZCAweDgxMCwgd2hpY2ggYXJlIG9idmlvdXNseSBicm9rZW4gaW4gdGhp
cyBjYXNlLiBUaHVzICAKPj4+Cj4+PiBBcyBpIHNhaWQgYWJvdmUsIHdyaXRlX29vYl9yYXcoKSBh
bmQgd3JpdGVfb29iKCkgc2hvdWxkIGJlIHJld29ya2VkLgo+Pj4gaSBkb24ndCBrbm93IHdoYXQg
ZG8geW91IG1lYW4gcGFnZSB3YXMgd3JpdHRlbiBhdCBsZWFzdCBvbmNlLiBhbnl3YXkgdGhlIHBh
Z2Ugc2hvdWxkIGJlIHdyaXR0ZW4gb25jZSwgZXZlbiBqdXN0IHdyaXRlX29vYl9yYXcoKS4gIAo+
Pgo+PiBTb3JyeSwgWW91IG1lYW4gdGhhdCBhZnRlciBPT0Igd3JpdGUsIHdlIGNhbm5vdCB3cml0
ZSB0byB0aGUgZGF0YSBhcmVhIChlLmcuIDB4MCAuLiAweDgxMCkgdW50aWwgcGFnZSB3aWxsIGJl
IGVyYXNlZD8gRm9yIGV4YW1wbGUKPj4gSkZGUzIgd3JpdGVzIHRvIE9PQiBvd24gbWFya2Vycywg
dGhlbiBpdCB0cmllcyB0byB3cml0ZSB0byB0aGUgZGF0YSBhcmVhIG9mIHN1Y2ggcGFnZS4KCkBM
aWFuZywgSSdsbCBkZXNjcmliZSBjdXJyZW50IHRlc3QgY2FzZSBpbiBkZXRhaWxzOgoxKSBJIGhh
dmUgZXJhc2VkIHBhZ2UsIEkgY2FuIHJlYWQgaXQgaW4gIGJvdGggcmF3IGFuZCBlY2MgbW9kZXMg
LSBubyBwcm9ibGVtIChpdCBpcyBmdWxsIG9mIDB4RkYpLgoyKSBJIChKRkZTMiBmb3IgZXhhbXBs
ZSkgd2FudCB0byB3cml0ZSBvbmx5IE9PQiAtIGxldCBpdCBiZSBjbGVhbiBtYXJrZXJzLgozKSBJ
IHVzZSByYXcgd3JpdGUgdG8gdGhlIG5lZWRlZCBwYWdlIChwbGVhc2UgY29ycmVjdCBtZSBpZiBp
J20gd3JvbmcpLiBGb3VyIGJ5dGVzCiAgIGF0IDB4NDAwIGFuZCAweDgxMCBhcmUgdXBkYXRlZC4g
QWxsIG90aGVyIGJ5dGVzIHN0aWxsIDB4ZmYuCjQpIE5vdywgd2hlbiBpJ20gdHJ5aW5nIHRvIHJl
YWQgdGhpcyBwYWdlIGluIEVDQyBtb2RlLCBJIGdldCBFQ0MgZXJyb3JzOiBJSVVDIHRoaXMKICAg
aGFwcGVucyBiZWNhdXNlIGZyb20gY29udHJvbGxlciBwb2ludCBvZiB2aWV3IEVDQyBjb2RlcyBh
cmUgaW52YWxpZCBmb3IgY3VycmVudAogICBkYXRhIChhbGwgRUNDcyBhcmUgMHhmZikuIElzIHRo
aXMgYmVoYXZpb3VyIGlzIG9rPwo1KSBPaywgZG9uJ3QgY2FyZSBvbiB0aGVzZSBFQ0MgZXJyb3Jz
LCBsZXQncyBnbyBmdXJ0aGVyLgo2KSBJJ20gZ29pbmcgdG8gd3JpdGUgc2FtZSBwYWdlIGluIEVD
QyBtb2RlIC0gaG93IHRvIGRvIGl0IGNvcnJlY3RseT8gVGhlcmUgaXMgYWxyZWFkeQogICA0IE9P
QiBieXRlcywgY29uc2lkZXJlZCB0byBiZSBjb3ZlcmVkIGJ5IEVDQyAoYnV0IGluIGZhY3Qgbm93
IC0gRUNDIGFyZWEgaXMgRkZlZCkuCgpUaGF0J3Mgd2h5IEkgYXNrZWQgWW91ciBvcGluaW9uIGFi
b3V0IG1vdmluZyBPT0IgZGF0YSB0byBub25wcm90ZWN0ZWQgYnkgRUNDIGFyZWEgKGFuZApsZWF2
ZSB1c2VyJ3MgYnl0ZXMgdW50b3VjaGVkKS4gSW4gdGhpcyBjYXNlIE9PQiBhY2Nlc3MgaXMgZnJl
ZSBhbmQgbm90IGxpbmtlZCB3aXRoIEVDQwpjb2RlcyB3aGljaCBhbHNvIGNvdmVycyBkYXRhLgoK
VGhhbmtzLCBBcnNlbml5CiAgIAoKPiAKPiBBIHBhZ2UgaXMgd3JpdHRlbiBhZnRlciB0d28gc3Rl
cHM6Cj4gLSBsb2FkaW5nIHRoZSBkYXRhIGludG8gdGhlIE5BTkQgY2hpcCBjYWNoZSAodGhhdCdz
IHdoZW4geW91IHVzZSB0aGUKPiAgIGJ1cykKPiAtIHByb2dyYW1taW5nIHRoZSBOQU5EIGFycmF5
IHdpdGggdGhlIGRhdGEgbG9hZGVkIGluIGNhY2hlICh0aGF0J3Mgd2hlbgo+ICAgeW91IHdhaXQp
Cj4gCj4gSW4gdGhlb3J5IGl0IGRvZXMgbm90IG1hdHRlciB3aGVyZSB5b3Ugd3JpdGUgaW4gdGhl
IGNhY2hlLCBpdCdzIHJlZ3VsYXIKPiBEUkFNLCB5b3UgY2FuIG1ha2UgcmFuZG9tIHdyaXRlcyB0
aGVyZSB3aXRoIHRoZSBhcHByb3ByaWF0ZSBOQU5ECj4gY29tbWFuZHMuIE9mIGNvdXJzZSB3aGVu
IHVzaW5nIGVtYmVkZGVkIGhhcmR3YXJlIEVDQyBlbmdpbmVzLCB0aGUKPiBjb250cm9sbGVycyB1
c3VhbGx5IGV4cGVjdCB0byBiZSBmZWQgaW4gYSBjZXJ0YWluIHdheSBpbiBvcmRlciB0bwo+IHBy
b2R1Y2UgdGhlIEVDQyBieXRlcyBhbmQgcHV0IHRoZW0gYXQgdGhlIHJpZ2h0IGxvY2F0aW9uIGlu
IGNhY2hlLgo+IAo+IEFuZCB0aGVuLCB3aGVuIHlvdSBhY3R1YWxseSBzZW5kIHRoZSAicHJvZ3Jh
bSIgY29tbWFuZCwgdGhlIE5BTkQgY2VsbHMKPiBhY3R1YWxseSBnZXQgcHJvZ3JhbW1lZCBiYXNl
ZCBvbiB3aGF0IGhhcyBiZWVuIGxvYWRlZCBpbiBjYWNoZS4KClRoYW5rcyBmb3IgdGhpcyBkZXRh
aWxzISBWZXJ5IGludGVyZXN0aW5nIQoKCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
