Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A481C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 06:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5l2Wovorj34MI++ZMOjjNXWwWIpmMXQuG7JaNv44Wc=; b=qyWA11nOho9JAGcwp3rzXg6guo
	9oK8my/wZJBR/31bME1gjKgHaqzlRDyQ41tWykCSYh+MJj+34tR//Ex+dSHYEJCehV7tpMNFQOs63
	fSeaXmEPonlPDunjp5sXVRFEV2e67jz7C5RZvM7p3a+iH7tgGiSnm39EmO25+r3sWgWNGOR5u5nqe
	ikWaIC7Jq3/S6yxdSQKB4PBdiaJ7mIP3q+8cMtUHV0FYXKVudHZELM5CUJw4zqv+YM3RWGJ1HDFWi
	HCOA6ghgpkgut3Y8NYt8BbhxrmWKY93Fh3cmdwyCuUxJ88hKRQvOQwveuN7Wq/tUGXnegLyc4UlFu
	3vaQteQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKwX9-00D1xU-75; Fri, 18 Feb 2022 06:14:23 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKwX5-00D1wF-KQ
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 06:14:21 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4K0Lrc6tsGzZfjP;
 Fri, 18 Feb 2022 14:09:52 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Feb 2022 14:14:16 +0800
Subject: Re: [PATCH -next v3 0/2] jffs2: fix two memory leak when mount jffs2
To: <richard@nod.at>, <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
CC: <yukuai3@huawei.com>, Baokun Li <libaokun1@huawei.com>
References: <20220114102854.3399585-1-libaokun1@huawei.com>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <807c22e0-4d0d-c658-87f7-06689833e578@huawei.com>
Date: Fri, 18 Feb 2022 14:14:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20220114102854.3399585-1-libaokun1@huawei.com>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_221419_867528_F2303337 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

1NogMjAyMi8xLzE0IDE4OjI4LCBCYW9rdW4gTGkg0LS1wDoKCnBpbmcKCj4gVjEtPlYyOgo+IAlJ
biBqZmZzMl9zY2FuX21lZGl1bSwKPiAJaWYgcyA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCBqZmZz
Ml9zdW1tYXJ5KSwgR0ZQX0tFUk5FTCk7Cj4gCXJldHVybnMgZXJyb3IsIGdvIHRvICJvdXQiIHRv
IGRvIGNsZWFyLiBOdWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UKPiAJb2NjdXJzIHdoZW4gaWYgKHMt
PnN1bV9saXN0X2hlYWQpIGlzIGV4ZWN1dGVkIGluICJvdXQiLgo+Cj4gVjItPlYzOgo+IAlTb3Jy
eSBmb3IgdGhlIG5vaXNlLCBidXQgdGhlcmUgc2VlbXMgdG8gYmUgYSBtb3JlIGVsZWdhbnQgd2F5
IHRvCj4gCWZpeCB0aGUgbWVtb3J5IGxlYWsgaW4gamZmczJfc2Nhbl9tZWRpdW0uIFdoZW4gbWVt
b3J5IGFsbG9jYXRpb24KPiAJZmFpbHMgb3IgQ09ORklHX0pGRlMyX1NVTU1BUlkgaXMgTiwgcyBp
cyBOVUxMLkZvciB0aGUgZm9ybWVyIGNhc2UsCj4gCWFkZCB0aGUgbmV3IHRhZyAib3V0X2J1ZiIg
dG8gYXZvaWQgaXQuSW4gdGhlIGxhdHRlciBjYXNlLAo+IAlqZmZzMl9zdW1fcmVzZXRfY29sbGVj
dGVkIGlzIGFsc28gYW4gZW1wdHkgZnVuY3Rpb24gYW5kIGRvZXMgbm90aGluZy4KPgo+IEJhb2t1
biBMaSAoMik6Cj4gICAgamZmczI6IGZpeCBtZW1vcnkgbGVhayBpbiBqZmZzMl9kb19tb3VudF9m
cwo+ICAgIGpmZnMyOiBmaXggbWVtb3J5IGxlYWsgaW4gamZmczJfc2Nhbl9tZWRpdW0KPgo+ICAg
ZnMvamZmczIvYnVpbGQuYyB8IDQgKysrLQo+ICAgZnMvamZmczIvc2Nhbi5jICB8IDYgKysrKy0t
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
