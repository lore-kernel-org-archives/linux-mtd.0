Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1308CCF9FE
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 01:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8nHcEfRW5LHZB/MKg3kqtMcvNSiilv5fu5J2LpotNQ=; b=ddoGIuea4K90WjBGTLK0/v90rX
	2TwaAXaBoN3oBMAV7TczN7B4b6rJwdVMYlCouO3C+RMp40NDiJ+RBxtvC06iPITMlvefKvOUe8Rz5
	ff3peYVOyyPDBN/K7Uo7AsIaopv/eMP7qnwAQShSXpAq/c/8qVZcOdqDC83Yy1IlK185byBmom2Dz
	g6ZnFCPoXyCcqK9hxOkYrqUIbl18yuvngEQZz62096LQPKnM6DsnZKgm62mPxcJElPMgqSwSGvPLK
	sDqvqt/130h1pQV2jAi4XfM7M7vWZcZJoonZrbtTd6ClRxWxn7f4nLLcEGKmuRcVzTbQq3gu2fjYI
	24wiZkQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdhZB-0071gE-3C;
	Wed, 06 Sep 2023 01:42:49 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdhZ6-0071fB-08
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 01:42:46 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RgQ4k1j8MztQSC;
	Wed,  6 Sep 2023 09:38:30 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 6 Sep 2023 09:42:28 +0800
Subject: Re: [PATCH] ubifs: fix possible dereference after free
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yusongping@huawei.com>, <artem.kuzin@huawei.com>
References: <20230905101222.1725230-1-konstantin.meskhidze@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <939c0385-8663-91a2-df20-920f264a2aa1@huawei.com>
Date: Wed, 6 Sep 2023 09:42:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230905101222.1725230-1-konstantin.meskhidze@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_184244_287833_010591F3 
X-CRM114-Status: GOOD (  10.90  )
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

1NogMjAyMy85LzUgMTg6MTIsIEtvbnN0YW50aW4gTWVza2hpZHplINC0tcA6Cj4gJ29sZF9pZHgn
IGNvdWxkIGJlIGRlcmVmZXJlbmNlZCBhZnRlciBmcmVlIHZpYSAncmJfbGlua19ub2RlJyBmdW5j
dGlvbgo+IGNhbGwuCj4gCj4gRml4ZXM6IGI1ZmRhMDhlZjIxMyAoInViaWZzOiBGaXggbWVtbGVh
ayB3aGVuIGluc2VydF9vbGRfaWR4KCkgZmFpbGVkIikKPiBDby1kZXZlbG9wZWQtYnk6IEl2YW5v
diBNaWtoYWlsIDxpdmFub3YubWlraGFpbDFAaHVhd2VpLXBhcnRuZXJzLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBLb25zdGFudGluIE1lc2toaWR6ZSA8a29uc3RhbnRpbi5tZXNraGlkemVAaHVhd2Vp
LmNvbT4KPiAtLS0KPiAgIGZzL3ViaWZzL3RuYy5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiAKCk9ubHkgZm9yIHN0YXRpYyBhbGFybXOjrGFsdGhvdWdoIGl0IGNv
dWxkbid0IGhhcHBlbiBpbiB0aGVvcnkuCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVu
Z3poaWhhbzFAaHVhd2VpLmNvbT4KCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3RuYy5jIGIvZnMv
dWJpZnMvdG5jLmMKPiBpbmRleCA2YjdkOTViNjVmNGIuLmY0NzI4ZTY1ZDFiZCAxMDA2NDQKPiAt
LS0gYS9mcy91Ymlmcy90bmMuYwo+ICsrKyBiL2ZzL3ViaWZzL3RuYy5jCj4gQEAgLTY0LDggKzY0
LDkgQEAgc3RhdGljIHZvaWQgZG9faW5zZXJ0X29sZF9pZHgoc3RydWN0IHViaWZzX2luZm8gKmMs
Cj4gICAJCQlwID0gJigqcCktPnJiX3JpZ2h0Owo+ICAgCQllbHNlIHsKPiAgIAkJCXViaWZzX2Vy
cihjLCAib2xkIGlkeCBhZGRlZCB0d2ljZSEiKTsKPiAgIAkJCWtmcmVlKG9sZF9pZHgpOwo+ICsJ
CQlyZXR1cm47Cj4gICAJCX0KPiAgIAl9Cj4gICAJcmJfbGlua19ub2RlKCZvbGRfaWR4LT5yYiwg
cGFyZW50LCBwKTsKPiAgIAlyYl9pbnNlcnRfY29sb3IoJm9sZF9pZHgtPnJiLCAmYy0+b2xkX2lk
eCk7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
