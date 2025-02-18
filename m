Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473F4C021AE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 12:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VN54sd5ylFFx0CZm63qYvGUPcUQmwiBx32ZTb5LD0cc=; b=Y0ufr8tI7iFU6289UmaajhSW93
	LL5Gj7VbUmsz5/ZQlGXMek3hFecWCWc/1HPLDuiBjGbYGWTT5SJVbYN6p4j3zCxPHrD5nvHLIYPvZ
	KssFD4+W3QkT77RhKomjRvy2zZFRuaWzL4nK/WXYRAmKQOEfeRLqKnqrR1WC0/iAlFcg6PfhQ68sW
	hVM8I3kUq/peWQx6Azu83XXNI3zEKw/MmsXJxqPWDoO1wN/sMym2vFOWOzZ2ouu95ceLVS780uYYR
	ZDkLXllZ6ZvvVFbSkg9UJLw2zfLZEzFiRQkWRqgzxlkW53wYONHEE93wxJxzTqrx4PVZFhrPC7Xec
	47ga3vZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMhS-000000088ll-3jYW;
	Tue, 18 Feb 2025 12:27:42 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMHN-000000083pa-0Zg2
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 12:00:46 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Yxyft0fqXz1wn5h;
	Tue, 18 Feb 2025 19:56:38 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 40E80180214;
	Tue, 18 Feb 2025 20:00:32 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 18 Feb 2025 20:00:31 +0800
Subject: Re: [PATCH v2 mtd-utils 1/4] ubifs-utils: ubifs.h: Include <fcntl.h>
To: Fabio Estevam <festevam@gmail.com>, <david.oberhollenzer@sigma-star.at>
CC: <raj.khem@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20250218113123.1956575-1-festevam@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <4696c4ad-f22f-191f-a353-9eb761e0213d@huawei.com>
Date: Tue, 18 Feb 2025 20:00:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250218113123.1956575-1-festevam@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_040045_354114_8CF0026E 
X-CRM114-Status: GOOD (  11.93  )
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

1NogMjAyNS8yLzE4IDE5OjMxLCBGYWJpbyBFc3RldmFtINC0tcA6Cj4gSW5jbHVkZSB0aGUgPGZj
bnRsLmg+IGhlYWRlciBmaWxlIHRvIGZpeCB0aGUgZm9sbG93aW5nIGVycm9yCj4gd2hlbiBidWls
ZGluZyB3aXRoIG11c2w6Cj4gCj4gfCBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vZ2l0L3ViaWZz
LXV0aWxzL2NvbW1vbi9jb21wci5jOjQyOgo+IHwgLi4vZ2l0L3ViaWZzLXV0aWxzL2xpYnViaWZz
L3ViaWZzLmg6MzEzOjk6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAnbG9mZl90JzsgZGlkIHlv
dSBtZWFuICdvZmZfdCc/Cj4gfCAgIDMxMyB8ICAgICAgICAgbG9mZl90IHVpX3NpemU7Cj4gfCAg
ICAgICB8ICAgICAgICAgXn5+fn5+Cj4gfCAgICAgICB8ICAgICAgICAgb2ZmX3QKPiB8IC4uL2dp
dC91Ymlmcy11dGlscy9saWJ1Ymlmcy91Ymlmcy5oOjEzNDE6OTogZXJyb3I6IHVua25vd24gdHlw
ZSBuYW1lICdsb2ZmX3QnOyBkaWQgeW91IG1lYW4gJ29mZl90Jz8KPiB8ICAxMzQxIHwgICAgICAg
ICBsb2ZmX3QgaV9zaXplOwo+IHwgICAgICAgfCAgICAgICAgIF5+fn5+fgo+IHwgICAgICAgfCAg
ICAgICAgIG9mZl90Cj4gfCAuLi9naXQvdWJpZnMtdXRpbHMvbGlidWJpZnMvdWJpZnMuaDoxMzQy
Ojk6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAnbG9mZl90JzsgZGlkIHlvdSBtZWFuICdvZmZf
dCc/Cj4gfCAgMTM0MiB8ICAgICAgICAgbG9mZl90IGRfc2l6ZTsKPiB8ICAgICAgIHwgICAgICAg
ICBefn5+fn4KPiB8ICAgICAgIHwgICAgICAgICBvZmZfdAo+IHwgLi4vZ2l0L3ViaWZzLXV0aWxz
L2xpYnViaWZzL3ViaWZzLmg6MTg5OTo0NDogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICdsb2Zm
X3QnOyBkaWQgeW91IG1lYW4gJ29mZl90Jz8KPiB8ICAxODk5IHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnQgZGVsZXRpb24sIGxvZmZfdCBuZXdfc2l6ZSk7Cj4gfCAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KPiB8ICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9mZl90Cj4gfCBt
YWtlOiAqKiogW01ha2VmaWxlOjQ4Nzg6IHViaWZzLXV0aWxzL2NvbW1vbi9ta2ZzX3ViaWZzLWNv
bXByLm9dIEVycm9yIDEKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZh
bUBnbWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAtIE5vbmUuCj4gCj4gICB1
Ymlmcy11dGlscy9saWJ1Ymlmcy91Ymlmcy5oIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3
ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQgYS91Ymlmcy11dGlscy9saWJ1Ymlmcy91Ymlmcy5oIGIv
dWJpZnMtdXRpbHMvbGlidWJpZnMvdWJpZnMuaAo+IGluZGV4IDA5MDhhMjI4OTIwOC4uMWM3YmM3
YmQwYzgwIDEwMDY0NAo+IC0tLSBhL3ViaWZzLXV0aWxzL2xpYnViaWZzL3ViaWZzLmgKPiArKysg
Yi91Ymlmcy11dGlscy9saWJ1Ymlmcy91Ymlmcy5oCj4gQEAgLTExLDYgKzExLDcgQEAKPiAgICNp
Zm5kZWYgX19VQklGU19IX18KPiAgICNkZWZpbmUgX19VQklGU19IX18KPiAgIAo+ICsjaW5jbHVk
ZSA8ZmNudGwuaD4KPiAgICNpbmNsdWRlIDxzdHJpbmcuaD4KPiAgIAo+ICAgI2luY2x1ZGUgImxp
bnV4X3R5cGVzLmgiCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
