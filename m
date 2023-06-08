Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D8DC7EE29
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 14:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRejw7XwNGBBjX7qmgjgTQ5+NsLBlE89FA9BjFCQxeA=; b=KNR4MHUvOIDgASTiDAsqXiLp7f
	RP3JNBzd8Xh/j6VY0TVcILk1Y/NWcKTh85fka9lssB0123qpb9FOyABhBZlaYHyfx749FgQW7VB7e
	jmJ3ACJwJ5THYgTgQ2G0iC4S+tzDomE1x6fFg5cPFMHAhpoFGUSBLPbBWTyp6Go5cg7NCb6J0sjqK
	+4NQjavJA5WtH7BffjvbjVHSaftiJO7y5UroDv0LiiK36hzu27S19Ansko3jqE88U0m+3xmYojJ6s
	ka7zQ8u59yfdwvngxFtH5ALR1Vf4F0T6tYl2ZGVqkItWa9ySri/qfeyVm8n1kONueCes48nKOjMWR
	hHXWm9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Gg3-009d8r-1v;
	Thu, 08 Jun 2023 14:31:51 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Gfz-009d6B-2b
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jun 2023 14:31:50 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QcRNk6ZjSzqTp3;
	Thu,  8 Jun 2023 22:26:46 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 22:31:36 +0800
Subject: Re: [PATCH 3/4] ubifs: Use a folio in do_truncation()
To: Matthew Wilcox <willy@infradead.org>, Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20230605165029.2908304-1-willy@infradead.org>
 <20230605165029.2908304-4-willy@infradead.org>
 <ZH4VxTWB3d9oNW5X@casper.infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <18c1b662-8cd3-56ce-a54b-9db6fead425e@huawei.com>
Date: Thu, 8 Jun 2023 22:31:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ZH4VxTWB3d9oNW5X@casper.infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_073148_961805_9AAB2CC4 
X-CRM114-Status: GOOD (  12.86  )
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

1NogMjAyMy82LzYgMTowNSwgTWF0dGhldyBXaWxjb3gg0LS1wDoKPiBPbiBNb24sIEp1biAwNSwg
MjAyMyBhdCAwNTo1MDoyOFBNICswMTAwLCBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSB3cm90ZToK
Pj4gQ29udmVydCBmcm9tIHRoZSBvbGQgcGFnZSBBUElzIHRvIHRoZSBuZXcgZm9saW8gQVBJcyB3
aGljaCBzYXZlcwo+PiBhIGZldyBoaWRkZW4gY2FsbHMgdG8gY29tcG91bmRfaGVhZCgpLgo+IAo+
IEFyZ2guICBUaGlzIGZpeCB3YXMgc3VwcG9zZWQgdG8gYmUgZm9sZGVkIGluLgo+IAo+IAo+IGRp
ZmYgLS1naXQgYS9mcy91Ymlmcy9maWxlLmMgYi9mcy91Ymlmcy9maWxlLmMKPiBpbmRleCAxYjIw
NTVkNWVjNWYuLjY3Y2Y1MTM4Y2NjNCAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9maWxlLmMKPiAr
KysgYi9mcy91Ymlmcy9maWxlLmMKPiBAQCAtMTE2MSw3ICsxMTYxLDcgQEAgc3RhdGljIGludCBk
b190cnVuY2F0aW9uKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+
ICAgCQlzdHJ1Y3QgZm9saW8gKmZvbGlvOwo+ICAgCj4gICAJCWZvbGlvID0gZmlsZW1hcF9sb2Nr
X2ZvbGlvKGlub2RlLT5pX21hcHBpbmcsIGluZGV4KTsKPiAtCQlpZiAoZm9saW8pIHsKPiArCQlp
ZiAoIUlTX0VSUihmb2xpbykpIHsKPiAgIAkJCWlmIChmb2xpb190ZXN0X2RpcnR5KGZvbGlvKSkg
ewo+ICAgCQkJCS8qCj4gICAJCQkJICogJ3ViaWZzX2pubF90cnVuY2F0ZSgpJyB3aWxsIHRyeSB0
byB0cnVuY2F0ZQo+IC4KPiAKCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhh
bzFAaHVhd2VpLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
