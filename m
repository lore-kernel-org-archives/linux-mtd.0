Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B87C4345F
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Apr 2024 02:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zvKdvK4HkLkr1YTi4KrO40iHiczTpjSH5VISz6pmRM=; b=bgal+sa+T9+0XaPsco2KIESHHi
	xj7m+QeLbeIRT9ODNBiMlxZW/EOp3NjHjUWwyjBZDf1Lmx3UdcLIGf48c2aRpl00Z5sGQXHOaD4Xz
	EBhkdzEQ7qMV557u8A2CASNrh/njDLP8WB8YdOAbU6TkiAWIb/gzDkMdJmYmHhMZ81Ozo0OAP+NIP
	wZAYJqGyfzQDkWY/yvLO5xklXL72O8hXaPIjO95XlFbgTxkyvC+ugPDtFOPRV710w36puU+VdScp1
	eZARd4aOEbW44CxQu5Vy4mLIBGfP2jvfLDGaqLRD1ZXzX7Nmfd+2EX/YIkvDou/RtPzJyUTlr/1py
	aNVfZqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvStS-000000023ed-34Bv;
	Sat, 13 Apr 2024 02:13:26 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvStN-000000023ck-3f3V
	for linux-mtd@lists.infradead.org;
	Sat, 13 Apr 2024 02:13:24 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4VGcQ62nB0z1xmcQ;
	Sat, 13 Apr 2024 10:12:14 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 56E201402CE;
	Sat, 13 Apr 2024 10:13:03 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 13 Apr 2024 10:13:02 +0800
Subject: Re: [PATCH] mtd-utils: fectest: Fix time formatting with
 _TIME_BITS=64 on 32-bit system
To: Ben Hutchings <ben.hutchings@mind.be>, <linux-mtd@lists.infradead.org>
References: <20240412205505.1283783-1-ben.hutchings@mind.be>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <2fd9e121-133c-57b4-db16-3eb1860406e6@huawei.com>
Date: Sat, 13 Apr 2024 10:13:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240412205505.1283783-1-ben.hutchings@mind.be>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_191322_109477_BF89A064 
X-CRM114-Status: GOOD (  13.36  )
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

1NogMjAyNC80LzEzIDQ6NTUsIEJlbiBIdXRjaGluZ3Mg0LS1wDoKPiBmZWN0ZXN0LmMgZm9ybWF0
cyBhIHN0cnVjdCB0aW1ldmFsIHdpdGggdGhlIGFzc3VtcHRpb24gdGhhdCB0aW1lX3QgYW5kCj4g
c3VzZWNvbmRzX3QgYXJlIGFsaWFzZXMgZm9yIGxvbmcsIGJ1dCBzb21lIDMyLWJpdCBzeXN0ZW1z
IG5vdyBkZWZpbmUKPiB0aGVtIGFzIGxvbmcgbG9uZyBpbiBvcmRlciB0byBzdXBwb3J0IHRpbWVz
dGFtcHMgYmV5b25kIDIwMzguCj4gCj4gQXMgdGhpcyBpcyBhbiBlbGFwc2VkIHRpbWUgYW5kIG5v
dCBhIHRpbWVzdGFtcCwgYm90aCBmaWVsZHMgc2hvdWxkIGJlCj4gd2l0aGluIHRoZSByYW5nZSBv
ZiBsb25nLCBzbyBjYXN0IHRoZW0gdG8gbG9uZyBiZWZvcmUgZm9ybWF0dGluZwo+IHJhdGhlciB0
aGFuIG1vdmluZyB0byBsb25nIGxvbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmVuIEh1dGNoaW5n
cyA8YmVuLmh1dGNoaW5nc0BtaW5kLmJlPgo+IC0tLQo+ICAgbWlzYy11dGlscy9mZWN0ZXN0LmMg
fCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CkZpeCBjb21waWxlciB3YXJuaW5nLgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3po
aWhhbzFAaHVhd2VpLmNvbT4KPiAKPiBkaWZmIC0tZ2l0IGEvbWlzYy11dGlscy9mZWN0ZXN0LmMg
Yi9taXNjLXV0aWxzL2ZlY3Rlc3QuYwo+IGluZGV4IGViMWQzM2UuLmY1NjBmMmIgMTAwNjQ0Cj4g
LS0tIGEvbWlzYy11dGlscy9mZWN0ZXN0LmMKPiArKysgYi9taXNjLXV0aWxzL2ZlY3Rlc3QuYwo+
IEBAIC04Nyw2ICs4Nyw2IEBAIGludCBtYWluKHZvaWQpCj4gICAJCWV4aXQoMSk7Cj4gICAJfQo+
ICAgCj4gLQlwcmludGYoIkRlY29kZWQgaW4gJWxkLiUwNmxkc1xuIiwgbm93LnR2X3NlYywgbm93
LnR2X3VzZWMpOwo+ICsJcHJpbnRmKCJEZWNvZGVkIGluICVsZC4lMDZsZHNcbiIsIChsb25nKW5v
dy50dl9zZWMsIChsb25nKW5vdy50dl91c2VjKTsKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
