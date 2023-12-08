Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6B8C10DC1
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 07:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sIN5vx1JsCjVS61GBtYPBhcRZZTtdVErP6vFSsnoIM=; b=3Z1kdYUZfo65c5BrHci0gCZEcf
	YQ0o1q9v0X40kh9yaE687wJUKYZJCIHEgkPlOXkpnIH9nDxiS/c4CdWQFelW6nrqiEGC426Sp+CmC
	bQiiofBxfK1CWnC9frkkAJrajQnW3CANJ2lXKo/K0mCCWx7PhNMsk4xrtRtQXie0XBjXs3HTIl6kr
	SkzpZwjGWAewWnVthcv6Jv4370IHdfY7CF9COOnfAaeUM9pUuDGUhlft8Cz5T0fm3ZmfU5f2blplY
	2BBnwqdVXML5lFeBIah6zCEdPDvxqoU5/HvP9G6+0Pe+tuQ7Kn0W20g8t5LJI8LVeoJdsCaPqQ6Ma
	h3giBkXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBVJ4-00Excm-0y;
	Fri, 08 Dec 2023 07:29:54 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBVJ1-00Exc4-2S
	for linux-mtd@lists.infradead.org;
	Fri, 08 Dec 2023 07:29:53 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4SmjRq5zG7zWj96;
	Fri,  8 Dec 2023 15:28:39 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 15:29:36 +0800
Subject: Re: [PATCH] ubi: block: fix null-pointer-dereference in
 ubiblock_create()
To: <linan666@huaweicloud.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
	<vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linan122@huawei.com>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>,
	<houtao1@huawei.com>, <yangerkun@huawei.com>
References: <20231208071317.1268465-1-linan666@huaweicloud.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a1e3aa71-d89e-0579-b55f-125c17b45f29@huawei.com>
Date: Fri, 8 Dec 2023 15:29:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231208071317.1268465-1-linan666@huaweicloud.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_232951_960408_37FDFD71 
X-CRM114-Status: GOOD (  12.85  )
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

1NogMjAyMy8xMi84IDE1OjEzLCBsaW5hbjY2NkBodWF3ZWljbG91ZC5jb20g0LS1wDoKPiBGcm9t
OiBMaSBOYW4gPGxpbmFuMTIyQGh1YXdlaS5jb20+Cj4KPiBJZiBpZHJfYWxsb2MoKSBmYWlscywg
ZGV2LT5nZCB3aWxsIGJlIHB1dCBhZnRlciBnb3RvIG91dF9jbGVhbnVwX2Rpc2sgaW4KPiB1Ymli
bG9ja19jcmVhdGUoKSwgYnV0IGRldi0+Z2QgaGFzIG5vdCBiZWVuIGFzc2lnbmVkIHlldCBhdCB0
aGlzIHRpbWUsIGFuZAo+IGFjY2Vzc2luZyBpdCB3aWxsIHRyaWdnZXIgYSBudWxsLXBvaW50ZXIt
ZGVyZWZlcmVuY2UgaXNzdWUuIEZpeCBpdCBieSBwdXQKPiBnZCBkaXJlY3RseS4KRnVuY3Rpb24g
J3B1dF9kaXNrKCknIGNoZWNrcyBkaXNrIHdoZXRoZXIgaXMgTlVMTCwgc28gSSB0aGluayBpdCdz
IGEgCidtZW1sZWFrJyBwcm9ibGVtLCBub3QgYSBudWxsLXB0ci1kZXJlZiBwcm9ibGVtLgo+Cj4g
U2lnbmVkLW9mZi1ieTogTGkgTmFuIDxsaW5hbjEyMkBodWF3ZWkuY29tPgo+IC0tLQo+ICAgZHJp
dmVycy9tdGQvdWJpL2Jsb2NrLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvYmxv
Y2suYyBiL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4gaW5kZXggMzA5YTQyYWVhYTRjLi42NTRi
ZDczNzJjZDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMKPiArKysgYi9k
cml2ZXJzL210ZC91YmkvYmxvY2suYwo+IEBAIC00MzQsNyArNDM0LDcgQEAgaW50IHViaWJsb2Nr
X2NyZWF0ZShzdHJ1Y3QgdWJpX3ZvbHVtZV9pbmZvICp2aSkKPiAgIAlsaXN0X2RlbCgmZGV2LT5s
aXN0KTsKPiAgIAlpZHJfcmVtb3ZlKCZ1YmlibG9ja19taW5vcl9pZHIsIGdkLT5maXJzdF9taW5v
cik7Cj4gICBvdXRfY2xlYW51cF9kaXNrOgo+IC0JcHV0X2Rpc2soZGV2LT5nZCk7Cj4gKwlwdXRf
ZGlzayhnZCk7CgpGb3IgbWVtbGVhayBzb2x1dGlvbjoKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hl
bmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiAgIG91dF9mcmVlX3RhZ3M6Cj4gICAJYmxr
X21xX2ZyZWVfdGFnX3NldCgmZGV2LT50YWdfc2V0KTsKPiAgIG91dF9mcmVlX2RldjoKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
