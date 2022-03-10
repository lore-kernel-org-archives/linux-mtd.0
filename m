Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BCEC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Mar 2022 08:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCrGxK9lTxSLvt62Mwnktabmnp2NGUtYWMDNl77xU90=; b=o9nPayJJrDyGMg0SDxO21D1qme
	J0gsmrKKawOhMrwj3mAIdQaRz2ZXMHAZ4zIaUaNWyBRp7+ddWIJ4yMBXSqqsUH6Bgw9R08AphZoW1
	ee5pKBwMADxpWJQX1UQc3pziHN/ZcfuTp5NmdRQKvTQMK8jEsNMAAgiuTamb5wVFtxuVLayesQJwU
	kezWq/ycye0TjgG5KFVamCDsw0zl4LzEoyG46RUO/2LEzqtMM4DcNiL6ucGa1bThK8PjLZ7uPieDT
	nAqNkGRczPvAFwo9COlwTVWpEnK/0DlO6s1vY64+t+lelyu6hGniTThsLV2KKajggq5pZ/uIuCRr1
	6TuL+WmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSEGF-00Bvm8-VY; Thu, 10 Mar 2022 08:35:04 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSEFq-00BvYz-QN
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2022 08:34:40 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KDj0p1RvYzcb1c;
 Thu, 10 Mar 2022 16:29:46 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 10 Mar 2022 16:34:36 +0800
Subject: Re: [PATCH -next v3 0/2] jffs2: fix two memory leak when mount jffs2
To: <richard@nod.at>, <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
CC: <yukuai3@huawei.com>, Baokun Li <libaokun1@huawei.com>
References: <20220114102854.3399585-1-libaokun1@huawei.com>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <c0d05cca-2827-481c-f534-d4fb30b91533@huawei.com>
Date: Thu, 10 Mar 2022 16:34:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20220114102854.3399585-1-libaokun1@huawei.com>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_003439_054543_903B37DB 
X-CRM114-Status: UNSURE (   9.81  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QSBnZW50bGUgcGluZywgc29ycnkgZm9yIHRoZSBub2lzZS4KCuWcqCAyMDIyLzEvMTQgMTg6Mjgs
IEJhb2t1biBMaSDlhpnpgZM6Cj4gVjEtPlYyOgo+IAlJbiBqZmZzMl9zY2FuX21lZGl1bSwKPiAJ
aWYgcyA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCBqZmZzMl9zdW1tYXJ5KSwgR0ZQX0tFUk5FTCk7
Cj4gCXJldHVybnMgZXJyb3IsIGdvIHRvICJvdXQiIHRvIGRvIGNsZWFyLiBOdWxsIHBvaW50ZXIg
ZGVyZWZlcmVuY2UKPiAJb2NjdXJzIHdoZW4gaWYgKHMtPnN1bV9saXN0X2hlYWQpIGlzIGV4ZWN1
dGVkIGluICJvdXQiLgo+Cj4gVjItPlYzOgo+IAlTb3JyeSBmb3IgdGhlIG5vaXNlLCBidXQgdGhl
cmUgc2VlbXMgdG8gYmUgYSBtb3JlIGVsZWdhbnQgd2F5IHRvCj4gCWZpeCB0aGUgbWVtb3J5IGxl
YWsgaW4gamZmczJfc2Nhbl9tZWRpdW0uIFdoZW4gbWVtb3J5IGFsbG9jYXRpb24KPiAJZmFpbHMg
b3IgQ09ORklHX0pGRlMyX1NVTU1BUlkgaXMgTiwgcyBpcyBOVUxMLkZvciB0aGUgZm9ybWVyIGNh
c2UsCj4gCWFkZCB0aGUgbmV3IHRhZyAib3V0X2J1ZiIgdG8gYXZvaWQgaXQuSW4gdGhlIGxhdHRl
ciBjYXNlLAo+IAlqZmZzMl9zdW1fcmVzZXRfY29sbGVjdGVkIGlzIGFsc28gYW4gZW1wdHkgZnVu
Y3Rpb24gYW5kIGRvZXMgbm90aGluZy4KPgo+IEJhb2t1biBMaSAoMik6Cj4gICAgamZmczI6IGZp
eCBtZW1vcnkgbGVhayBpbiBqZmZzMl9kb19tb3VudF9mcwo+ICAgIGpmZnMyOiBmaXggbWVtb3J5
IGxlYWsgaW4gamZmczJfc2Nhbl9tZWRpdW0KPgo+ICAgZnMvamZmczIvYnVpbGQuYyB8IDQgKysr
LQo+ICAgZnMvamZmczIvc2Nhbi5jICB8IDYgKysrKy0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkJh
b2t1biBMaQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
