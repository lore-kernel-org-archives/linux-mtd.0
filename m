Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8653AC43334
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jul 2022 09:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2z6LQvrZuObaB6lN4kGccoVcMWxT29pm593qMns0R/Y=; b=KuGx7O32wEAPPsRvyKytOC3O3C
	UFqxwBBL8KWDvixgaxlhI980jPSixm961Xd0M5m6fS9Y7BxNJhZBzz+ovakdnCgCMqqWYEZHlUUpG
	lw97aS3FHyWslNrSIKqNaxOTSJ0552gfWqMmzGcf+SicQaN2yxETEo54XfiYu9RqRiaJjQrL7ttRv
	EPXJ0mFaE/Loiz7facGgMmQ02LyfFxt0rMrxw0rRLpDLmIGzMqh1a1p2gbrgy+pOuOzdlinRvwM1t
	V8wanuTZ/Wxw3X6kiepVs5EC2Kx9TL4vAwBy+Kf3pMZgSz5kjF4ug5wwqxxo+yjWf2z3nzUFH43tf
	pt0szkew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9juk-002kz4-9e; Fri, 08 Jul 2022 09:04:42 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9juf-002kwD-QA
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2022 09:04:39 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LfS4b0cy2zpWBr
	for <linux-mtd@lists.infradead.org>; Fri,  8 Jul 2022 17:03:43 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 17:04:33 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 17:04:32 +0800
Subject: Re: [PATCH] mtd: ubi: block: Fix typo in code
To: <linux-mtd@lists.infradead.org>
References: <20220701011357.3029-1-kunyu@nfschina.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <562332ac-8dd7-c2b9-642d-af06bc9f482e@huawei.com>
Date: Fri, 8 Jul 2022 17:04:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20220701011357.3029-1-kunyu@nfschina.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_020438_091228_EB525BFD 
X-CRM114-Status: GOOD (  11.53  )
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

1NogMjAyMi83LzEgOToxMywgTGkga3VueXUg0LS1wDoKPiBSZW1vdmUgdGhlIHJlcGVhdGVkICc7
JyBmcm9tIGNvZGUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBMaSBrdW55dSA8a3VueXVAbmZzY2hpbmEu
Y29tPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMgfCAyICstCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMgYi9kcml2ZXJzL210ZC91YmkvYmxvY2suYwo+IGluZGV4
IGE3OGZkZjNiMzBmNy4uNzc0ZGI4MzQ2Yjc0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3Vi
aS9ibG9jay5jCj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMKPiBAQCAtNDA5LDcgKzQw
OSw3IEBAIGludCB1YmlibG9ja19jcmVhdGUoc3RydWN0IHViaV92b2x1bWVfaW5mbyAqdmkpCj4g
ICAJcmV0ID0gYmxrX21xX2FsbG9jX3RhZ19zZXQoJmRldi0+dGFnX3NldCk7Cj4gICAJaWYgKHJl
dCkgewo+ICAgCQlkZXZfZXJyKGRpc2tfdG9fZGV2KGRldi0+Z2QpLCAiYmxrX21xX2FsbG9jX3Rh
Z19zZXQgZmFpbGVkIik7Cj4gLQkJZ290byBvdXRfZnJlZV9kZXY7Owo+ICsJCWdvdG8gb3V0X2Zy
ZWVfZGV2Owo+ICAgCX0KPiAgIAo+ICAgCj4gCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxj
aGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
