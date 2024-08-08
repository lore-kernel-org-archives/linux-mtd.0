Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF13C3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Aug 2024 13:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dM1KGgD5kPz8E0wa1ftwwHlw70YpMT9lsHa/p95ED2A=; b=oEaxFNELneGt6xXNlr+mj5fd7i
	mWVTMaTS4de9Z3FxmN8XKM7XD/pQtfw5TfWHNeo9mC57X8h0jDJFu3rEPhnws81fGGX+Zg0Y6cfeP
	VQBKoFCiIMItM3jdoAfFvLwH4oWEV39+H/KvTUuH4uERUpPRawNpR4uA3nHIjbcMXa7VxIxLa0Pck
	q4t+oSSkAuy9Gd6jMccnUk7qZ/3WNTkEUiPgOrX6L9p2CkwkRvul/Qtwsx900cNilP3/XJgtB/zD2
	L+//O56hTZpNBuos7EMW3NEoJlTd7c7JBoxCt1oBc5ZhtmdAm6kXjAL4W9m5Ns2zDK/LGphyqfKkM
	aqMaDKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc3GP-00000008NqW-1x5G;
	Thu, 08 Aug 2024 13:33:09 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc3GL-00000008Npy-13DD
	for linux-mtd@lists.infradead.org;
	Thu, 08 Aug 2024 13:33:07 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wfnt04357z2ClsR
	for <linux-mtd@lists.infradead.org>; Thu,  8 Aug 2024 21:28:08 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id F178C180018
	for <linux-mtd@lists.infradead.org>; Thu,  8 Aug 2024 21:32:52 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 21:32:52 +0800
Subject: Re: [PATCH mtd-utils] fs-tests: integck: Allow checking root
To: =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>,
	<linux-mtd@lists.infradead.org>
References: <20240808123149.2667334-1-csokas.bence@prolan.hu>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <8e1e550c-b4e0-3d62-c734-50f733a194a7@huawei.com>
Date: Thu, 8 Aug 2024 21:32:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240808123149.2667334-1-csokas.bence@prolan.hu>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_063305_468251_544F2490 
X-CRM114-Status: GOOD (  13.61  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjQvOC84IDIwOjMxLCBDc8Oza8OhcywgQmVuY2Ug5YaZ6YGTOgo+IFRyYWlsaW5nIHNs
YXNoIHJlbW92YWwgY3JlYXRlcyBhbiBlbXB0eSBzdHJpbmcKPiBmcm9tICcvJywgbWFraW5nIGl0
IGltcG9zc2libGUgdG8gY2hlY2sgdGhlCj4gcm9vdCBmaWxlc3lzdGVtLgo+IAoKSXQgd2lsbCBi
cmluZyBhIG5ldyBmYWlsZWQgYXNzZXJ0aW9uICdDSEVDSyh1bW91bnQoZnNpbmZvLm1vdW50X3Bv
aW50KSAKIT0gLTEpJyBpbiByZWNvdmVyX3Rlc3RlZF9mcygpLCBmb2xsb3dpbmcgaXMgdGhlIGxv
ZzoKCmludGVnY2s6IHBpZCAzMzg3LCB0ZXN0aW5nICJleHQ0IiBhdCAiLyIKaW50ZWdjazogZXJy
b3IhOiBjb25kaXRpb24gJ3Vtb3VudChmc2luZm8ubW91bnRfcG9pbnQpICE9IC0xJyBmYWlsZWQg
aW4gCnJlY292ZXJfdGVzdGVkX2ZzKCkgYXQgdGVzdHMvZnMtdGVzdHMvaW50ZWdyaXR5L2ludGVn
Y2suYzozMjEyCmludGVnY2s6IGVycm9yIDE2IChEZXZpY2Ugb3IgcmVzb3VyY2UgYnVzeSkKCj4g
U2lnbmVkLW9mZi1ieTogQ3PDs2vDoXMsIEJlbmNlIDxjc29rYXMuYmVuY2VAcHJvbGFuLmh1Pgo+
IC0tLQo+ICAgdGVzdHMvZnMtdGVzdHMvaW50ZWdyaXR5L2ludGVnY2suYyB8IDggKysrKystLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ZzLXRlc3RzL2ludGVncml0eS9pbnRlZ2NrLmMgYi90ZXN0cy9m
cy10ZXN0cy9pbnRlZ3JpdHkvaW50ZWdjay5jCj4gaW5kZXggMGE3ZjE0Mi4uYjdjZWRjMiAxMDA2
NDQKPiAtLS0gYS90ZXN0cy9mcy10ZXN0cy9pbnRlZ3JpdHkvaW50ZWdjay5jCj4gKysrIGIvdGVz
dHMvZnMtdGVzdHMvaW50ZWdyaXR5L2ludGVnY2suYwo+IEBAIC0yOTQ2LDkgKzI5NDYsMTEgQEAg
c3RhdGljIHZvaWQgZ2V0X3Rlc3RlZF9mc19pbmZvKHZvaWQpCj4gICAJLyogUmVtb3ZlIHRyYWls
aW5nICcvJyBzeW1ib2xzIGZyb20gdGhlIG1vdW50IHBvaW50ICovCj4gICAJcCA9IGR1cF9zdHJp
bmcoYXJncy5tb3VudF9wb2ludCk7Cj4gICAJZnNpbmZvLm1vdW50X3BvaW50ID0gcDsKPiAtCXAg
Kz0gc3RybGVuKHApOwo+IC0Jd2hpbGUgKCotLXAgPT0gJy8nKTsKPiAtCSoocCArIDEpID0gJ1ww
JzsKPiArCWlmIChzdHJsZW4ocCkgPiAxKSB7Cj4gKwkJcCArPSBzdHJsZW4ocCk7Cj4gKwkJd2hp
bGUgKCotLXAgPT0gJy8nKTsKPiArCQkqKHAgKyAxKSA9ICdcMCc7Cj4gKwl9Cj4gICAKPiAgIAlD
SEVDSyhzdGF0ZnMoZnNpbmZvLm1vdW50X3BvaW50LCAmZnNfaW5mbykgPT0gMCk7Cj4gICAJZnNp
bmZvLm1heF9uYW1lX2xlbiA9IGZzX2luZm8uZl9uYW1lbGVuOwo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
