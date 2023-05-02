Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54202C77B7E
	for <linux-mtd@archiver.kernel.org>; Tue,  2 May 2023 12:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMUp0afGghbCNowcJdY3K9YVXRo9mJAmXerxjJyeiyE=; b=cKTs2uZ4QE8AAx
	EEymdJstKYOszDK3IisTD5FfFf2toeov+3+NT/m0nCvPytlOGnFppgOMkI4nG7C6STUchsc6/9y+W
	hMcCgAxqzuWem/MkV6X0fxxkz7awS3bpMCjcb+Odw3THoVQiph5W9H5zQ+6iQ5Nw6459IFjR2R34F
	DraAqkPtnMaei5ONYmZeaclxiWqoGkUvWZpDnU4Jwy2iP9R4SjBmSqPlTQzEMwml7BkH4mYezrWx+
	d1C8Jwsbqt3z2RwGkIZNz1IgeXc61xqBXtuD4oah5SAjwyC4Ld/+Dgsk7463CXaeD86pqioGuIm5X
	1BmKddRJfqRcV42ArF/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptp7e-001Pu3-0m;
	Tue, 02 May 2023 12:28:46 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptp7Y-001PpX-26;
	Tue, 02 May 2023 12:28:42 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 36FB15FD3A;
	Tue,  2 May 2023 15:28:35 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683030515;
	bh=Z6sHlbXvgKt222GjY7JPBuTXXbvIEyYERXCO3Euf4Pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=HeFVgXrRNxcgX7AqBpLXglnPg3YFxR4bHT6sFrozEI6sToO5NnzcFuTIA6OFOuwb4
	 ghsrQwxsAPXIpZ4rMhuLvGIJKhTF9YucOgaxz09LxqtpTf3z6GKFvzvcrN9I5/fzxd
	 4herUvWmAKQ1qzeLVlNO8oxToG/bltoPtu5kjaxEkAoh5qtV+z8FyRxkpQwXOJORxj
	 +5vCF1rbkqEqBdN1/W4B4sOPeDS/Xy4/db1dVe3SkzM8CWS0xi95xCBTMg9C1K3u7X
	 Ctp3pS2db35IJb5fDILwEDBsRCQgi36zpqJWYNqD1w2VQVTjLSVvQc6nGa0SfcurUR
	 7Ssu1qvRugBNg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  2 May 2023 15:28:34 +0300 (MSK)
Message-ID: <91cb8e19-e782-b847-8d2b-22580c371c34@sberdevices.ru>
Date: Tue, 2 May 2023 15:24:09 +0300
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
	<linux-kernel@vger.kernel.org>, yonghui.yu <yonghui.yu@amlogic.com>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230413102200.309fbe9c@xps-13>
 <b3279de4-e89d-db03-a515-a6aa52ab90d3@sberdevices.ru>
 <20230413122252.0a8efcd8@xps-13>
 <569a948e-654a-b21f-8a4f-55dc4b295387@sberdevices.ru>
 <60fa656e-bda1-1de6-a79e-3e3041cd69a8@sberdevices.ru>
 <780c0cae-18b6-2652-1c2c-6d398ea60451@amlogic.com>
 <e7c49f2d-b3c1-8d9b-76fe-c8759b37c7c7@sberdevices.ru>
 <20230418152505.72fc16da@xps-13>
 <15a6e415-1489-a81f-fc8f-2372678ad2cb@sberdevices.ru>
 <ee10bdeb-416c-70f0-d323-7107fe0746e8@amlogic.com>
 <5e4b395e-bf9d-0123-a0f2-2b378d950b29@sberdevices.ru>
 <fda1ae91-4bf8-6945-bd0d-b6dabc9cb4bd@sberdevices.ru>
 <a5010dcf-a8ce-f144-949c-687548cefce7@amlogic.com>
 <cf27b6b4-a75b-c5a6-32ea-ac20a2984192@sberdevices.ru>
 <20230502115913.78012d98@xps-13>
 <2274b432-d1a9-b3cf-4f7b-08c4a4c580b5@sberdevices.ru>
 <20230502132745.14349770@xps-13>
 <2b2f5cb4-84f7-65f6-13b2-42f965503023@sberdevices.ru>
 <20230502141703.29f0bc30@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230502141703.29f0bc30@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/02 09:07:00 #21205017
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_052841_035385_10569164 
X-CRM114-Status: GOOD (  23.38  )
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

CgpPbiAwMi4wNS4yMDIzIDE1OjE3LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gUmljaGFyZCwgeW91ciBpbnB1dCBpcyB3ZWxjb21lIGJlbG93IDotKQo+IAo+Pj4+Pj4+
Pj4gSSBqdXN0IGNoZWNrZWQgSkZGUzIgbW91bnQvdW1vdW50IGFnYWluLCBoZXJlIGlzIHdoYXQg
aSBzZWU6Cj4+Pj4+Pj4+PiAwKSBGaXJzdCBhdHRlbXB0IHRvIG1vdW50IEpGRlMyLgo+Pj4+Pj4+
Pj4gMSkgSXQgd3JpdGVzIE9PQiB0byBwYWdlIE4gKGknbSB1c2luZyByYXcgd3JpdGUpLiBJdCBp
cyBjbGVhbm1hcmtlciB2YWx1ZSAweDg1IDB4MTkgMHgwMyAweDIwLiBNb3VudCBpcyBkb25lLgo+
Pj4+Pj4+Pj4gMikgVW1vdW50IEpGRlMyLiBEb25lLgo+Pj4+Pj4+Pj4gMykgU2Vjb25kIGF0dGVt
cHQgdG8gbW91bnQgSkZGUzIuCj4+Pj4+Pj4+PiA0KSBJdCByZWFkcyBPT0IgZnJvbSBwYWdlIE4g
KGknbSB1c2luZyByYXcgcmVhZCkuIFZhbHVlIGlzIDB4ODUgMHgxOSAweDAzIDB4MjAuIERvbmUu
Cj4+Pj4+Pj4+PiA1KSBJdCByZWFkcyBwYWdlIE4gaW4gRUNDIG1vZGUsIGFuZCBpIGdldDoKPj4+
Pj4+Pj4+IMKgwqDCoMKgIGpmZnMyOiBtdGQtPnJlYWQoMHgxMDAgYnl0ZXMgZnJvbSBOKSByZXR1
cm5lZCBFQ0MgZXJyb3IKPj4+Pj4+Pj4+IDYpIE1vdW50IGZhaWxlZC4KPj4+Pj4+Pj4+Cj4+Pj4+
Pj4+PiBXZSBhbHJlYWR5IGhhZCBwcm9ibGVtIHdoaWNoIGxvb2tzIGxpa2UgdGhpcyBvbiBhbm90
aGVyIGRldmljZS4gU29sdXRpb24gd2FzIHRvIHVzZSBPT0IgYXJlYSB3aGljaCBpcwo+Pj4+Pj4+
Pj4gbm90IGNvdmVyZWQgYnkgRUNDIGZvciBKRkZTMiBjbGVhbm1hcmtlcnMuICAgICAgCj4+Pj4+
Pj4KPj4+Pj4+PiBvaywgc28gdGhlcmUgaXMgbm90IEVDQyBwYXJpdHkgYnl0ZXMgYW5kIG10ZC0+
cmVhZCgpIHJldHVybnMgRUNDIGVycm9yLgo+Pj4+Pj4+IGRvZXMgaXQgaGF2ZSB0byB1c2UgcmF3
IHdyaXRlL3JlYWQgb24gc3RlcCAxKSBhbmQgNCk/Cj4+Pj4+Pj4gICAgICAgCj4+Pj4+Pgo+Pj4+
Pj4gSWYgaSdtIHVzaW5nIG5vbiByYXcgYWNjZXNzIHRvIE9PQiwgZm9yIGV4YW1wbGUgd3JpdGUg
T09CICh1c2VyIGJ5dGVzKSBpbiBFQ0MgbW9kZSwgdGhlbgo+Pj4+Pj4gc3RlcHMgMSkgYW5kIDQp
IGFuZCA1KSBwYXNzZXMgb2ssIGJ1dCB3cml0ZSB0byB0aGlzIHBhZ2Ugd2lsbCBiZSBpbXBvc3Np
YmxlIChmb3IgZXhhbXBsZSBKRkZTMgo+Pj4+Pj4gd3JpdGVzIHRvIHN1Y2ggcGFnZXMgbGF0ZXIp
IC0gd2UgY2FuJ3QgdXBkYXRlIEVDQyBjb2RlcyBwcm9wZXJseSB3aXRob3V0IGVyYXNpbmcgd2hv
bGUgcGFnZS4KPj4+Pj4+IFdyaXRlIG9wZXJhdGlvbiB3aWxsIGJlIGRvbmUgd2l0aG91dCBwcm9i
bGVtLCBidXQgcmVhZCB3aWxsIHRyaWdnZXIgRUNDIGVycm9ycyBkdWUgdG8gYnJva2VuCj4+Pj4+
PiBFQ0MgY29kZXMuCj4+Pj4+Pgo+Pj4+Pj4gSW4gZ2VuZXJhbCBwcm9ibGVtIHRoYXQgd2UgZGlz
Y3VzcyBpcyB0aGF0IGluIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZGF0YSBhbmQgT09CIGNvbmZs
aWN0cwo+Pj4+Pj4gd2l0aCBlYWNoIG90aGVyIGJ5IHNoYXJpbmcgc2FtZSBFQ0MgY29kZXMsIHRo
ZXNlIEVDQyBjb2RlcyBjb3VsZCBiZSB3cml0dGVuIG9ubHkgb25jZSAod2l0aG91dAo+Pj4+Pj4g
ZXJhc2luZyksIHdoaWxlIGRhdGEgYW5kIE9PQiBoYXMgZGlmZmVyZW50IGNhbGxiYWNrcyB0byBh
Y2Nlc3MgYW5kIHRodXMgc3VwcG9zZWQgdG8gd29yawo+Pj4+Pj4gc2VwYXJhdGVseS4gICAgCj4+
Pj4+Cj4+Pj4+IFRoZSBmYWN0IHRoYXQgdGhlcmUgbWlnaHQgYmUgaGVscGVycyBqdXN0IGZvciB3
cml0aW5nIE9PQiBhcmVhcyBvciBqdXN0Cj4+Pj4+IGluLWJhbmQgYXJlYXMgYXJlIG9wdGltaXph
dGlvbnMuIE5BTkQgcGFnZXMgYXJlIG1lYW50IHRvIGJlIHdyaXR0ZW4gYQo+Pj4+PiBzaW5nbGUg
dGltZSwgbm8gbWF0dGVyIHdoYXQgcG9ydGlvbiB5b3Ugd3JpdGUuIEluIHNvbWUgY2FzZXMsIGl0
IGlzCj4+Pj4+IHBvc3NpYmxlIHRvIHBlcmZvcm0gc3VicGFnZSB3cml0ZXMgaWYgdGhlIGNoaXAg
c3VwcG9ydHMgaXQuIFBhZ2VzIG1heQo+Pj4+PiBiZSBzcGxpdCBpbnRvIHNldmVyYWwgYXJlYXMg
d2hpY2ggY292ZXIgYSBwYXJ0aWFsIGluLWJhbmQgYXJlYSAqYW5kKiBhCj4+Pj4+IHBhcnRpYWwg
T09CIGFyZWEuIElmIHlvdSB3cml0ZSBpbnRvIHRoZSBpbi1iYW5kICpvciogb3V0LW9mLWJhbmQg
YXJlYXMKPj4+Pj4gb2YgYSBnaXZlbiBzdWJwYWdlLCB5b3UgKmNhbm5vdCogd3JpdGUgdGhlIG90
aGVyIHBhcnQgbGF0ZXIgd2l0aG91dCAgICAKPj4+Pgo+Pj4+IFRoYW5rcyBmb3IgZGV0YWlscyEg
U28gaW4gY2FzZSBvZiBKRkZTMiBpdCBsb29rcyBsaWtlIHN0cmFuZ2UsIHRoYXQgaXQgdHJpZXMK
Pj4+PiB0byB3cml0ZSBwYWdlIGFmdGVyIHdyaXRpbmcgY2xlYW4gbWFya2VycyB0byBpdCBiZWZv
cmU/IEluIHRoZSBvbGQgdmVuZG9yJ3MKPj4+PiBkcml2ZXIgT09CIHdyaXRlIGNhbGxiYWNrIGlz
IHN1cHByZXNzZWQgYnkgcmV0dXJuIDAgYWx3YXlzIGFuZCBKRkZTMiB3b3Jrcwo+Pj4+IGNvcnJl
Y3RseS4gIAo+Pj4KPj4+IENhbiB5b3UgcG9pbnQgdGhlIGNvZGUgeW91J3JlIG1lbnRpb25pbmc/
IChib3RoIHdoYXQgSkZGUzIgd2hpY2ggbG9va3MKPj4+IHN0cmFuZ2UgdG8geW91IGFuZCB0aGUg
b2xkIHZlbmRvciBoYWNrKSAgCj4+Cj4+IEhlcmUgaXMgdmVyc2lvbiBvZiB0aGUgb2xkIHZlbmRv
cidzIGRyaXZlcjoKPj4KPj4gaHR0cHM6Ly9naXRodWIuY29tL2tzemFxL2xpbnV4LWFtbG9naWMv
YmxvYi9tYXN0ZXJfbmV3X2FtcG9ydHMvZHJpdmVycy9hbWxvZ2ljL25hbmQvbmFuZC9hbWxfbmFu
ZC5jI0wzMjYwCj4+Cj4+IEluIG15IHZlcnNpb24gdGhlcmUgaXMgbm8gQlVHKCkgdGhlcmUsIGJ1
dCBpdCBpcyBzYW1lIGRyaXZlciBmb3IgdGhlIHNhbWUgY2hpcC4KPj4KPj4gQWJvdXQgSkZGUzIg
LSBpIGRpZG4ndCBjaGVjayBpdHMgc291cmNlIGNvZGUsIGJ1dCB3aGF0IEkgY2FuIHNlZSB1c2lu
ZyBwcmludGsoKSwgaXMgdGhhdCBpdCBmaXJzdAo+PiB0cmllcyB0byB3cml0ZSBjbGVhbm1hcmtl
ciB1c2luZyBPT0Igd3JpdGUgY2FsbGJhY2suIFRoZW4gbGF0ZXIgaXQgdHJpZXMgdG8gd3JpdGUg
dG8gdGhpcyBwYWdlLCBzbwo+PiBtYXkgYmUgaXQgaXMgdW5leHBlY3RlZCBiZWhhdmlvdXIgb2Yg
SkZGUzI/Cj4gCj4gVEJIIEkgYW0gbm90IGtub3dsZWRnZWFibGUgYWJvdXQgSkZGUzIsIG1heWJl
IFJpY2hhcmQgY2FuIGhlbHAgaGVyZS4KPiAKPiBBcmUgeW91IHN1cmUgeW91IGZsYXNoIGlzIHJl
Y29nbml6ZWQgYnkgSkZGUzIgYXMgYmVpbmcgYSBOQU5EIGRldmljZT8KPiBEaWQgeW91IGVuYWJs
ZSBDT05GSUdfSkZGUzJfRlNfV1JJVEVCVUZGRVIgY29ycmVjdGx5PyBCZWNhdXNlCj4gY2xlYW5t
YXJrZXIgc2VlbSB0byBiZSBkaXNjYXJkZWQgd2hlbiB1c2luZyBhIE5BTkQgZGV2aWNlLCBhbmQK
PiByZWNvZ25pemluZyB0aGUgZGV2aWNlIGFzIGEgTkFORCBkZXZpY2UgcmVxdWlyZXMgdGhlIGFi
b3ZlIG9wdGlvbiB0byBiZQo+IHNldCBhcHBhcmVudGx5LgoKWWVzLCBJIGhhdmUKCkNPTkZJR19K
RkZTMl9GU19XUklURUJVRkZFUj15CgpBbmQgaSBzZWUsIHRoYXQgamZmczJfbWFya19lcmFzZWRf
YmxvY2soKSBjYWxscyBqZmZzMl9jbGVhbm1hcmtlcl9vb2IoKSB3aGljaCBjaGVja3MgdGhhdCB3
ZSBoYXZlIE1URF9OQU5ERkxBU0guIFRoaXMKY2hlY2sgaXMgdHJ1ZSwgc28gdGhlbiBqZmZzMl93
cml0ZV9uYW5kX2NsZWFubWFya2VyKCkgaXMgY2FsbGVkIGFuZCB0aGVyZSBpcyBPT0Igd3JpdGUg
aW4gaXQuIFNvIEkgc2VlIG9wcG9zaXRlIHRoaW5nOgpjbGVhbm1hcmtlcnMgYXJlIG5vdCBkaXNj
YXJkZWQgd2l0aCBOQU5EIGRldmljZS4gCgpUaGFua3MsIEFyc2VuaXkKCj4gCj4gVGhhbmtzLAo+
IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
