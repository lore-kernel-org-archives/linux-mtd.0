Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87165E77188
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Dec 2024 01:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4na/nwIAr/BvpM2bDIdXio8skmJuHScYiri5zwLKZs=; b=M/GBzBb1e0pOBMjjXtpUJpbeTE
	hkmEFqPgujGe+fwypIXOZjAPgLR4wSJr2ZzBDywH8GSksiRzh22QdDGkG5NFoZbF2PmUs0PXLf0fz
	hPNqENg/Ptjnc92OEoMNb68Qm1AZqcUYxmPmtndvROIyneTt0JcRwJExwPtJIaNVqADZyBu80irnM
	gi427/pCxNVhggrmrH64x6bhuXF8YFUDaTXARhRQkNlo5ub7uT4gCbU51jx4NaCFppu8bZi/Hx1St
	+bu48UhjBH/HAucOgAVaCCh4opdx4HWN/O5FQT8k1a2/HuJxrTppKWoPga7P0INqg9NcQjeh4RsZq
	MZHGLKMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQG4L-0000000D2ef-2l7N;
	Wed, 25 Dec 2024 01:20:13 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQG4I-0000000D2e1-14Ql
	for linux-mtd@lists.infradead.org;
	Wed, 25 Dec 2024 01:20:12 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YHv843J19z20mkL
	for <linux-mtd@lists.infradead.org>; Wed, 25 Dec 2024 09:20:20 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A8B311A016C
	for <linux-mtd@lists.infradead.org>; Wed, 25 Dec 2024 09:20:00 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 25 Dec 2024 09:19:59 +0800
Subject: Re: [PATCH mtd-utils] ubi-utils: FIX DIVISION BY ZERO in ubinize.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241224194013.145454-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f9876c26-1da8-b1b1-f5bb-8eb454293d5a@huawei.com>
Date: Wed, 25 Dec 2024 09:19:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241224194013.145454-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_172010_481861_9019BFFB 
X-CRM114-Status: GOOD (  19.72  )
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

1NogMjAyNC8xMi8yNSAzOjQwLCBBbnRvbiBNb3J5YWtvdiDQtLXAOgo+IFJlcG9ydCBvZiB0aGUg
c3RhdGljIGFuYWx5emVyOgo+IFZhcmlhYmxlIHZpLT5hbGlnbm1lbnQsIHdob3NlIHBvc3NpYmxl
IHZhbHVlIHNldCBhbGxvd3MgYSB6ZXJvIHZhbHVlIGF0IHViaW5pemUuYzozNzUsIGlzIHVzZWQg
YXMgYSBkZW5vbWluYXRvciBhdCB1YmluaXplLmM6NDEwLgo+IAo+IElmIHlvdSBsb29rIGF0IHRo
ZSBjb2RlIG1vcmUgY2xvc2VseSwgaXQgd2lsbCBiZSBjbGVhciB0aGF0IHRoZSB2aS0+YWxpZ25t
ZW50IHBhcmFtZXRlciBpcyBvYnRhaW5lZCBmcm9tIGFuIGV4dGVybmFsIGZpbGUgcGFzc2VkIGFz
IGEgY29tbWFuZCBsaW5lIGFyZ3VtZW50Lgo+IAo+IEEgY2hlY2sgd2FzIGFsc28gcGVyZm9ybWVk
IGlmIHlvdSBwYXNzIGEgdGVzdC5pbmkgZmlsZSBvZiB0aGUgZm9sbG93aW5nIHR5cGUgdG8gdGhl
IGlucHV0Ogo+IAo+IFtqZmZzMi12b2x1bWVdCj4gbW9kZT11YmkKPiBpbWFnZT0uLi9qZmZzMi5p
bWcKPiB2b2xfaWQ9MQo+IHZvbF9zaXplPTMwTWlCCj4gdm9sX3R5cGU9ZHluYW1pYwo+IHZvbF9u
YW1lPWpmZnMyX3ZvbHVtZQo+IHZvbF9mbGFncz1hdXRvcmVzaXplCj4gdm9sX2FsaWdubWVudD0w
Cj4gCj4gYW5kIGV4ZWN1dGUgdGhlIGNvbW1hbmQ6Cj4gCj4gLi91YmluaXplIC1vIHViaS5pbWcg
LXAgMTZLaUIgLW0gNTEyIC1zIDI1NiB0ZXN0LmluaQo+IAo+IHdlIHdpbGwgZ2V0IHRoZSByZXN1
bHQ6Cj4gCj4gRmxvYXRpbmcgcG9pbnQgZXhjZXB0aW9uIChjb3JlIGR1bXBlZCkKPiAKPiBDb3Jy
ZWN0aW9ucyBleHBsYWluZWQ6Cj4gVXBkYXRlZCB0aGUgdmFsaWRhdGlvbiBsb2dpYyBmb3Igdmkt
PmFsaWdubWVudDoKPiAtIFJlcGxhY2VkIHRoZSBjaGVjayBmb3IgbmVnYXRpdmUgYWxpZ25tZW50
IChgdmktPmlkIDwgMGApIHdpdGggYSBtb3JlIGNvbXByZWhlbnNpdmUgY2hlY2sgZm9yIG5vbi1w
b3NpdGl2ZSBhbGlnbm1lbnQgKGB2aS0+YWxpZ25tZW50IDw9IDBgKS4KPiAtIFVwZGF0ZWQgdGhl
IGNvcnJlc3BvbmRpbmcgZXJyb3IgbWVzc2FnZSB0byByZWZsZWN0IHRoZSByZXF1aXJlbWVudCBm
b3IgYSBwb3NpdGl2ZSB2b2x1bWUgYWxpZ25tZW50Lgo+IFRoaXMgZW5zdXJlcyBtb3JlIHJvYnVz
dCB2YWxpZGF0aW9uIGFuZCBpbXByb3ZlcyBlcnJvciBjbGFyaXR5IHdoZW4gaW52YWxpZCBhbGln
bm1lbnQgdmFsdWVzIGFyZSBlbmNvdW50ZXJlZC4KPiAKPiBUcmlnZ2VycyBmb3VuZCBieSBzdGF0
aWMgYW5hbHl6ZXIgU3ZhY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50b24gTW9yeWFrb3YgPGFu
dC52Lm1vcnlha292QGdtYWlsLmNvbT4KPiAKPiAtLS0KPiAgIHViaS11dGlscy91YmluaXplLmMg
fCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNv
bT4KPiBkaWZmIC0tZ2l0IGEvdWJpLXV0aWxzL3ViaW5pemUuYyBiL3ViaS11dGlscy91YmluaXpl
LmMKPiBpbmRleCBhYzhjMWU1Li45Yzk1MGIxIDEwMDY0NAo+IC0tLSBhL3ViaS11dGlscy91Ymlu
aXplLmMKPiArKysgYi91YmktdXRpbHMvdWJpbml6ZS5jCj4gQEAgLTM3NSw4ICszNzUsOCBAQCBz
dGF0aWMgaW50IHJlYWRfc2VjdGlvbihjb25zdCBzdHJ1Y3QgdWJpZ2VuX2luZm8gKnVpLCBjb25z
dCBjaGFyICpzbmFtZSwKPiAgIAl2aS0+YWxpZ25tZW50ID0gaW5pcGFyc2VyX2dldGludChhcmdz
LmRpY3QsIGJ1ZiwgLTEpOwo+ICAgCWlmICh2aS0+YWxpZ25tZW50ID09IC0xKQo+ICAgCQl2aS0+
YWxpZ25tZW50ID0gMTsKPiAtCWVsc2UgaWYgKHZpLT5pZCA8IDApCj4gLQkJcmV0dXJuIGVycm1z
ZygibmVnYXRpdmUgdm9sdW1lIGFsaWdubWVudCAlZCBpbiBzZWN0aW9uIFwiJXNcIiIsCj4gKwll
bHNlIGlmICh2aS0+YWxpZ25tZW50IDw9IDApCj4gKwkJcmV0dXJuIGVycm1zZygibm90IHBvc2l0
aXZlIHZvbHVtZSBhbGlnbm1lbnQgJWQgaW4gc2VjdGlvbiBcIiVzXCIiLAo+ICAgCQkJICAgICAg
dmktPmFsaWdubWVudCwgc25hbWUpOwo+ICAgCj4gICAJdmVyYm9zZShhcmdzLnZlcmJvc2UsICJ2
b2x1bWUgYWxpZ25tZW50OiAlZCIsIHZpLT5hbGlnbm1lbnQpOwo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
