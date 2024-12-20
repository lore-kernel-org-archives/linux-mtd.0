Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074E5E7718A
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2024 01:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6V6P5DtGQrBkP59OCtXH06+Iq2ReKdPDKI8EXEYGac=; b=xuM5v8J2y0wHxjquzjYULpIEjW
	VVslyrdv5vdcvxWDvpudYKAUFLOcImkoUcbJIBJeKyksb6DJzULMBPAC5Wxc8Wklpj5R58VQl5G4a
	dF6pZBayJ6bhFAeyFBJ75cLzOd+bXaVB/mWSSyBxTwx6S2HMVFJnQdDUYcaJ/+GvSw/jkA5g7kuWi
	FCkmkYUSQpXWNwwKQ07jSYlr+akLHznm/a6Wv9idqcVGiZX3BYHhRpp50mfL8uUuOhgRYsZQhZybN
	RW0ystGxL2xcCtPFy+Ki6K8nW4rlZqyCmLk+Rnvx/4LteySxq6BV5YoFzVtOZvaZtT29C4rAW2A03
	Ky7JeP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tORY4-00000003YTN-3xHd;
	Fri, 20 Dec 2024 01:11:24 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tORXz-00000003YSJ-43TU
	for linux-mtd@lists.infradead.org;
	Fri, 20 Dec 2024 01:11:21 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YDq5w3rrzz1V6j3
	for <linux-mtd@lists.infradead.org>; Fri, 20 Dec 2024 09:07:48 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 475CA180A9E
	for <linux-mtd@lists.infradead.org>; Fri, 20 Dec 2024 09:11:05 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Dec 2024 09:11:04 +0800
Subject: Re: [PATCH mtd-utils] misc-utils: add missing error handling for
 'bam' allocation in ftl_check.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241219135103.712032-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <938073ca-f4b2-c17f-2d30-5699b1293749@huawei.com>
Date: Fri, 20 Dec 2024 09:11:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241219135103.712032-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_171120_193211_D1BEEFB1 
X-CRM114-Status: GOOD (  12.55  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNC8xMi8xOSAyMTo1MSwgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBDb3JyZWN0aW9ucyBl
eHBsYWluZWQ6Cj4gQWRkZWQgcm9idXN0IGhhbmRsaW5nIGZvciBtYWxsb2MoKSBmYWlsdXJlIGJ5
IGNoZWNraW5nIHRoZSByZXR1cm52YWx1ZWFuZCBwcm92aWRpbmcgYSBjbGVhciBlcnJvciBtZXNz
YWdlLgo+IAo+IFRyaWdnZXJzIGZvdW5kIGJ5IHN0YXRpYyBhbmFseXplciBTdmFjZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbnRvbiBNb3J5YWtvdiA8YW50LnYubW9yeWFrb3ZAZ21haWwuY29tPgo+
IAo+IC0tLQo+ICAgbWlzYy11dGlscy9mdGxfY2hlY2suYyB8IDkgKysrKysrKysrCj4gICAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxj
aGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiAKPiBkaWZmIC0tZ2l0IGEvbWlzYy11dGlscy9mdGxf
Y2hlY2suYyBiL21pc2MtdXRpbHMvZnRsX2NoZWNrLmMKPiBpbmRleCA1YjJkYWU1Li5mZTQzYTI0
IDEwMDY0NAo+IC0tLSBhL21pc2MtdXRpbHMvZnRsX2NoZWNrLmMKPiArKysgYi9taXNjLXV0aWxz
L2Z0bF9jaGVjay5jCj4gQEAgLTEyMCw4ICsxMjAsMTcgQEAgc3RhdGljIHZvaWQgY2hlY2tfcGFy
dGl0aW9uKGludCBmZCkKPiAgIAo+ICAgCS8qIENyZWF0ZSBiYXNpYyBibG9jayBhbGxvY2F0aW9u
IHRhYmxlIGZvciBjb250cm9sIGJsb2NrcyAqLwo+ICAgCW5iYW0gPSAobXRkLmVyYXNlc2l6ZSA+
PiBoZHIuQmxvY2tTaXplKTsKPiAgIAliYW0gPSBtYWxsb2MobmJhbSAqIHNpemVvZih1X2ludCkp
Owo+ICsJaWYgKCFiYW0pIHsKPiArCQlwZXJyb3IoIm1hbGxvYyBmYWlsZWQiKTsKPiArCQlyZXR1
cm47Cj4gKwl9Cj4gCj4gICAJZm9yIChpID0gMDsgaSA8IGxlMTZfdG9fY3B1KGhkci5OdW1FcmFz
ZVVuaXRzKTsgaSsrKSB7Cj4gICAJCWlmIChsc2VlayhmZCwgKGkgPDwgaGRyLkVyYXNlVW5pdFNp
emUpLCBTRUVLX1NFVCkgPT0gLTEpIHsKPiAgIAkJCXBlcnJvcigic2VlayBmYWlsZWQiKTsKPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
