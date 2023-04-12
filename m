Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D40C77B71
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 09:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MvH/7Mx4Di98gC09BdJ1jKIs2Yg25Pa/94bpw5BlIg=; b=zZG3PyK6NMMC9U
	/XtxkW5E/ymJkUziz9yd7MRERn7O1adEsUq5iadDSmi5J3F+jLQ7kG1q1+nfK1PQkZlvWFG47U2zc
	6uAzGfG9vJpum8Rq0pAptrFK5+ef8dFlBgkW6dQfM6Y8tkUxZqpNdfrsRMlfS65DI/CnFNhDio+sT
	NyakICEXpl6/ZKTcx8YF66tTUcIKTw4V+rfSJ7aQFchF1fATy2VM+5s6lCLESMHgUdRF3zBy3620T
	TjDt9yS3h35ZU5SuXNaVLvqiuD85aP+k6XUqcgDL/Yzed6ab+owNfv7pQSLxv7mbtskB/wozNleQo
	3lf0cST7HHqQN/09H8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmWin-002O7K-0m;
	Wed, 12 Apr 2023 09:24:57 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmWii-002O5i-08;
	Wed, 12 Apr 2023 09:24:54 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 322025FD61;
	Wed, 12 Apr 2023 12:24:45 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681291485;
	bh=Tghv5UH8zv7I4pRNO5QISMHmKjV0z5XxnvqtmlhyC0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=sRo4D8wMqr26oBvkPBtliboyQR2sbiUMF5De1jscGX3zCgevX41L8qQc05dZNqzZv
	 sDAA2csxJldkJrWlXePNFQk0izMjf9bF9FINlXbWLCNyt1+mE9KzZ4Hm/l8jZUfcbF
	 kx8+02TQmnhDqDRbPtg4aAQZgfB6nEhlpbeIxJoEJOgHjF3Tp4erfwqAPjq5MBfSBZ
	 kEQBx+QmiFn1pMHmdaM7CUC0Gm/83q5+wRpiKciZoni+UTkMY5RA4+CCu9vSCIqj8r
	 RMdjQxhObGTyVq9uUEO0c/kXLDpn7jyRpAM/E8nKUf6JT9FQqXu1qacRO0N2wXY2uG
	 xuKXcOshcfohQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 12 Apr 2023 12:24:43 +0300 (MSK)
Message-ID: <ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
Date: Wed, 12 Apr 2023 12:20:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
 <20230412094400.3c82f631@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230412094400.3c82f631@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/12 04:12:00 #21090163
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_022452_770837_3D682020 
X-CRM114-Status: GOOD (  16.39  )
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

CgpPbiAxMi4wNC4yMDIzIDEwOjQ0LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMTIgQXByIDIwMjMg
MDk6MTY6NTggKzAzMDA6Cj4gCj4+IFRoaXMgTkFORCByZWFkcyBvbmx5IGZldyB1c2VyJ3MgYnl0
ZXMgaW4gRUNDIG1vZGUgKG5vdCBmdWxsIE9PQiksIHNvCj4gCj4gIlRoaXMgTkFORCByZWFkcyIg
ZG9lcyBub3QgbG9vayByaWdodCwgZG8geW91IG1lYW4gIlN1YnBhZ2UgcmVhZHMgZG8KPiBub3Qg
cmV0cmlldmUgYWxsIHRoZSBPT0IgYnl0ZXMsIj8KPiAKPj4gZmlsbCBPT0IgYnVmZmVyIHdpdGgg
emVyb2VzIHRvIG5vdCByZXR1cm4gZ2FyYmFnZSBmcm9tIHByZXZpb3VzIHJlYWRzCj4+IHRvIHVz
ZXIuCj4+IE90aGVyd2lzZSAnbmFuZGR1bXAnIHV0aWxpdHkgcHJpbnRzIHNvbWV0aGluZyBsaWtl
IHRoaXMgZm9yIGp1c3QgZXJhc2VkCj4+IHBhZ2U6Cj4+Cj4+IC4uLgo+PiAweDAwMDAwN2YwOiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZgo+PiAgIE9PQiBE
YXRhOiBmZiBmZiBmZiBmZiAwMCAwMCBmZiBmZiA4MCBjZiAyMiA5OSBjYiBhZCBkMyBiZQo+PiAg
IE9PQiBEYXRhOiA2MyAyNyBhZSAwNiAxNiAwYSAyZiBlYiBiYiBkZCA0NiA3NCA0MSA4ZSA4OCA2
ZQo+PiAgIE9PQiBEYXRhOiAzOCBhMSAyZCBlNiA3NyBkNCAwNSAwNiBmMiBhNSA3ZSAyNSBlYiAz
NCA3YyBmZgo+PiAgIE9PQiBEYXRhOiAzOCBlYSBkZSAxNCAxMCBkZSA5YiA0MCAzMyAxNiA2YSBj
YyA5ZCBhYSAyZiA1ZQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPEFWS3Jh
c25vdkBzYmVyZGV2aWNlcy5ydT4KPj4gLS0tCj4+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNv
bl9uYW5kLmMgfCA1ICsrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4gaW5kZXggZjg0YTEwMjM4ZTRkLi5mMmYy
NDcyY2I1MTEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQu
Ywo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4gQEAgLTg1OCw5
ICs4NTgsMTIgQEAgc3RhdGljIGludCBtZXNvbl9uZmNfcmVhZF9wYWdlX3N1YihzdHJ1Y3QgbmFu
ZF9jaGlwICpuYW5kLAo+PiAgc3RhdGljIGludCBtZXNvbl9uZmNfcmVhZF9wYWdlX3JhdyhzdHJ1
Y3QgbmFuZF9jaGlwICpuYW5kLCB1OCAqYnVmLAo+PiAgCQkJCSAgIGludCBvb2JfcmVxdWlyZWQs
IGludCBwYWdlKQo+PiAgewo+PiArCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQo
bmFuZCk7Cj4+ICAJdTggKm9vYl9idWYgPSBuYW5kLT5vb2JfcG9pOwo+PiAgCWludCByZXQ7Cj4+
ICAKPj4gKwltZW1zZXQob29iX2J1ZiwgMCwgbXRkLT5vb2JzaXplKTsKPiAKPiBJJ20gc3VycHJp
c2VkIHJhdyByZWFkcyBkbyBub3QgcmVhZCB0aGUgZW50aXJlIE9PQj8KClllcyEgU2VlbXMgaW4g
Y2FzZSBvZiByYXcgYWNjZXNzICh3aGF0IGkgc2VlIGluIHRoaXMgZHJpdmVyKSBudW1iZXIgb2Yg
T09CIGJ5dGVzIHJlYWQKc3RpbGwgZGVwZW5kcyBvbiBFQ0MgcGFyYW1ldGVyczogZm9yIGVhY2gg
cG9ydGlvbiBvZiBkYXRhIGNvdmVyZWQgd2l0aCBFQ0MgY29kZSB3ZSBjYW4KcmVhZCBpdCdzIEVD
QyBjb2RlIGFuZCAidXNlciBieXRlcyIgZnJvbSBPT0IgLSBpdCBpcyB3aGF0IGkgc2VlIGJ5IGR1
bXBpbmcgRE1BIGJ1ZmZlciBieQpwcmludGsoKS4gRm9yIGV4YW1wbGUgSSdtIHdvcmtpbmcgd2l0
aCAySyBOQU5EIHBhZ2VzLCBlYWNoIHBhZ2UgaGFzIDIgeCAxSyBFQ0MgYmxvY2tzLgpGb3IgZWFj
aCBFQ0MgYmxvY2sgSSBoYXZlIDE2IE9PQiBieXRlcyB3aGljaCBJIGNhbiBhY2Nlc3MgYnkgcmVh
ZC93cml0ZS4gRWFjaCAxNiBieXRlcwpjb250YWlucyAyIGJ5dGVzIG9mIHVzZXIncyBkYXRhIGFu
ZCAxNCBieXRlcyBFQ0MgY29kZXMuIFNvIHdoZW4gSSByZWFkIHBhZ2UgaW4gcmF3IG1vZGUKY29u
dHJvbGxlciByZXR1cm5zIDMyIGJ5dGVzICgyIHggKDIgKyAxNCkpIG9mIE9PQi4gV2hpbGUgT09C
IGlzIHJlcG9ydGVkIGFzIDY0IGJ5dGVzLgoKVGhhbmtzLCBBcnNlbml5Cgo+IAo+PiArCj4+ICAJ
cmV0ID0gbWVzb25fbmZjX3JlYWRfcGFnZV9zdWIobmFuZCwgcGFnZSwgMSk7Cj4+ICAJaWYgKHJl
dCkKPj4gIAkJcmV0dXJuIHJldDsKPj4gQEAgLTg4MSw2ICs4ODQsOCBAQCBzdGF0aWMgaW50IG1l
c29uX25mY19yZWFkX3BhZ2VfaHdlY2Moc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKmJ1ZiwK
Pj4gIAl1OCAqb29iX2J1ZiA9IG5hbmQtPm9vYl9wb2k7Cj4+ICAJaW50IHJldCwgaTsKPj4gIAo+
PiArCW1lbXNldChvb2JfYnVmLCAwLCBtdGQtPm9vYnNpemUpOwo+PiArCj4+ICAJcmV0ID0gbWVz
b25fbmZjX3JlYWRfcGFnZV9zdWIobmFuZCwgcGFnZSwgMCk7Cj4+ICAJaWYgKHJldCkKPj4gIAkJ
cmV0dXJuIHJldDsKPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
