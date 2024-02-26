Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698C3C54798
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 02:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7es3pFPuKNvtkCXrG+ruYwd2H7yIKoleIy1IgQhsgY=; b=UmC87m120jJLF2lHcN3kuJUDcc
	b6JpWNyHNhbKxO9+I8z5rl+cSoDOJ8Buekz8ZCtRDi/i+cxPlNaBOB8CfWHUK/SbKEHTsPhJWWfhR
	c3UodnQZtOG2anwdkHAlb39hPd/xnFSCcvbqdKtqcJ+riarwXirphSvB/jW+wSnQ0EbSItkG8d2v9
	v2WlzK8UBNcbmf2W0vjCk8D2vCq/CmBJaJX3mjao9to3pIYO41Op9RRiwEdhF34KYxtK8HMW4VOH4
	2jxdNex61MgqjA4ArxCOgun+fRvqIp9BpyZeQHvSne3i7kC9ewq31PkcwsJ7byPjQW3P1djiyxDs3
	Sdj4s2+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reQUG-0000000G9FD-0SOY;
	Mon, 26 Feb 2024 02:13:00 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reQUC-0000000G9Cw-2h88
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 02:12:58 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Tjkbt4VsQz1X3QJ;
	Mon, 26 Feb 2024 10:10:34 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id DE5981400D3;
	Mon, 26 Feb 2024 10:12:47 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 10:12:46 +0800
Subject: Re: [PATCH] ubifs: remove SLAB_MEM_SPREAD flag usage
To: <chengming.zhou@linux.dev>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <vbabka@suse.cz>, <roman.gushchin@linux.dev>,
	<Xiongwei.Song@windriver.com>, Chengming Zhou <zhouchengming@bytedance.com>
References: <20240224135217.830331-1-chengming.zhou@linux.dev>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3384a81a-e6c9-6f2e-e66e-c9b9a9433c0f@huawei.com>
Date: Mon, 26 Feb 2024 10:12:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240224135217.830331-1-chengming.zhou@linux.dev>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_181256_878995_1506908C 
X-CRM114-Status: GOOD (  11.49  )
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

1NogMjAyNC8yLzI0IDIxOjUyLCBjaGVuZ21pbmcuemhvdUBsaW51eC5kZXYg0LS1wDoKPiBGcm9t
OiBDaGVuZ21pbmcgWmhvdSA8emhvdWNoZW5nbWluZ0BieXRlZGFuY2UuY29tPgo+IAo+IFRoZSBT
TEFCX01FTV9TUFJFQUQgZmxhZyBpcyBhbHJlYWR5IGEgbm8tb3AgYXMgb2YgNi44LXJjMSwgcmVt
b3ZlCj4gaXRzIHVzYWdlIHNvIHdlIGNhbiBkZWxldGUgaXQgZnJvbSBzbGFiLiBObyBmdW5jdGlv
bmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZ21pbmcgWmhvdSA8emhvdWNoZW5n
bWluZ0BieXRlZGFuY2UuY29tPgo+IC0tLQo+ICAgZnMvdWJpZnMvc3VwZXIuYyB8IDQgKystLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKClJl
dmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IGRpZmYg
LS1naXQgYS9mcy91Ymlmcy9zdXBlci5jIGIvZnMvdWJpZnMvc3VwZXIuYwo+IGluZGV4IGY3ODA3
MjllZWMwNi4uOGFlNzY0ODAyMWE4IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL3N1cGVyLmMKPiAr
KysgYi9mcy91Ymlmcy9zdXBlci5jCj4gQEAgLTI0MzMsOCArMjQzMyw4IEBAIHN0YXRpYyBpbnQg
X19pbml0IHViaWZzX2luaXQodm9pZCkKPiAgIAo+ICAgCXViaWZzX2lub2RlX3NsYWIgPSBrbWVt
X2NhY2hlX2NyZWF0ZSgidWJpZnNfaW5vZGVfc2xhYiIsCj4gICAJCQkJc2l6ZW9mKHN0cnVjdCB1
Ymlmc19pbm9kZSksIDAsCj4gLQkJCQlTTEFCX01FTV9TUFJFQUQgfCBTTEFCX1JFQ0xBSU1fQUND
T1VOVCB8Cj4gLQkJCQlTTEFCX0FDQ09VTlQsICZpbm9kZV9zbGFiX2N0b3IpOwo+ICsJCQkJU0xB
Ql9SRUNMQUlNX0FDQ09VTlQgfCBTTEFCX0FDQ09VTlQsCj4gKwkJCQkmaW5vZGVfc2xhYl9jdG9y
KTsKPiAgIAlpZiAoIXViaWZzX2lub2RlX3NsYWIpCj4gICAJCXJldHVybiAtRU5PTUVNOwo+ICAg
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
