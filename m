Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39187C7618A
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 02:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6B6HPbIX9IvpUn2QwZSWWbqhXpYMBwWC1dqlrM9i0/g=; b=XkGjSAkk11WUWnhcI4ktRihRju
	kpjLFZ6c+NI7dD4TLZUm3QaHSn8JQW4qZWunUMy+uEYgBM0F+Lgf0eUikTtMftuc76aJbspcvL4jp
	dnrYYQ0ckrERAeFNZu6t5EVh7P4hv9ni1LWAD95DKv34jv8PM3Sd5dQs9m5rWTev6heNefuUyC6Gw
	EYa7UFnZmLFBDNPevy2p+q+ME0RU4wkZMREvIEwcBtR+VK/IvfU08D9A1OUqwHT2H/hmE8GZ3QvNP
	XtpKjZKOEsLfBqsyBMPKJP2cMZ6OyWN2/ryRxOl2uudLGxa0GNtibflDmxySfP8mRhWVX0AsM/YXi
	ajRg1zyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe5Gb-007vCw-2f;
	Mon, 20 Mar 2023 02:28:57 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe5GY-007vC7-2D
	for linux-mtd@lists.infradead.org;
	Mon, 20 Mar 2023 02:28:56 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PfzBW52QfzKs3J;
	Mon, 20 Mar 2023 10:26:27 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 10:28:42 +0800
Subject: Re: [PATCH -next] mtd: ubi: Simplify bool conversion
To: Yang Li <yang.lee@linux.alibaba.com>, <miquel.raynal@bootlin.com>
CC: <vigneshr@ti.com>, <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Abaci Robot <abaci@linux.alibaba.com>
References: <20230215012117.83938-1-yang.lee@linux.alibaba.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <cce0dab6-01f4-11d4-6885-381171b7199e@huawei.com>
Date: Mon, 20 Mar 2023 10:28:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230215012117.83938-1-yang.lee@linux.alibaba.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_192854_913626_906D944B 
X-CRM114-Status: GOOD (  11.22  )
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

1NogMjAyMy8yLzE1IDk6MjEsIFlhbmcgTGkg0LS1wDoKPiAuL2RyaXZlcnMvbXRkL3ViaS9idWls
ZC5jOjEyNjE6MzMtMzg6IFdBUk5JTkc6IGNvbnZlcnNpb24gdG8gYm9vbCBub3QgbmVlZGVkIGhl
cmUKPiAKPiBSZXBvcnRlZC1ieTogQWJhY2kgUm9ib3QgPGFiYWNpQGxpbnV4LmFsaWJhYmEuY29t
Pgo+IExpbms6IGh0dHBzOi8vYnVnemlsbGEub3BlbmFub2xpcy5jbi9zaG93X2J1Zy5jZ2k/aWQ9
NDA2MQo+IFNpZ25lZC1vZmYtYnk6IFlhbmcgTGkgPHlhbmcubGVlQGxpbnV4LmFsaWJhYmEuY29t
Pgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgfCAyICstCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvdWJpL2J1aWxkLmMgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IGluZGV4IDA5
MDRlYjQwYzk1Zi4uZTljMTUzYjdjNDcxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9i
dWlsZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiBAQCAtMTI1OCw3ICsxMjU4
LDcgQEAgc3RhdGljIGludCBfX2luaXQgdWJpX2luaXQodm9pZCkKPiAgIAkJbXV0ZXhfbG9jaygm
dWJpX2RldmljZXNfbXV0ZXgpOwo+ICAgCQllcnIgPSB1YmlfYXR0YWNoX210ZF9kZXYobXRkLCBw
LT51YmlfbnVtLAo+ICAgCQkJCQkgcC0+dmlkX2hkcl9vZmZzLCBwLT5tYXhfYmViX3BlcjEwMjQs
Cj4gLQkJCQkJIHAtPmVuYWJsZV9mbSA9PSAwID8gdHJ1ZSA6IGZhbHNlKTsKPiArCQkJCQkgcC0+
ZW5hYmxlX2ZtID09IDApOwo+ICAgCQltdXRleF91bmxvY2soJnViaV9kZXZpY2VzX211dGV4KTsK
PiAgIAkJaWYgKGVyciA8IDApIHsKPiAgIAkJCXByX2VycigiVUJJIGVycm9yOiBjYW5ub3QgYXR0
YWNoIG10ZCVkXG4iLAo+IAoKTG9va3MgZ29vZC4KClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcg
PGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
