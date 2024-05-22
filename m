Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91B0C25B77
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2024 09:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6kC+EGPhRQxjTQSJ+kAli2g3jXZMHPlkCHYxjVPhw4=; b=smWHT3Fg1WxkTaIcvm2AvPDIm6
	eZGTn+Z+VJpeIwCwbPHLK8dcofHpAq2fNv+r95xh3LBKMsqDv727LWc6kipOM3LKMZ4ILgL7LM48d
	Gmes8U4UIDS2EUfel1QFgA+9e0XSqPWpjH1XgZD5LuFpvbNeJMmgz9UnJLeZzf/XsZsvbSFyLqFsP
	cGWFYckEwm09HCJ9DVxawSOCe5ssq+b7YwCpN1R+SFDBGtxn3nkDmvW4ci/eKuTqbR+29ttN+Or4s
	EdcJh0pSM38P+D4o2f0WkwE+E/kuxUVIGJ6vHeNMYwpR6yXOeKCNwwfwRrOZOLTwKSoarMCqXay1Q
	JArVk8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9iAz-00000002UKG-1d9g;
	Wed, 22 May 2024 09:22:25 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9iAu-00000002UHf-2OJ7
	for linux-mtd@lists.infradead.org;
	Wed, 22 May 2024 09:22:23 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Vkm1q58g1zxNj0;
	Wed, 22 May 2024 17:18:23 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 189E7140382;
	Wed, 22 May 2024 17:22:05 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 17:22:03 +0800
Subject: Re: [PATCH v3] ubi: block: fix null-pointer-dereference in
 ubiblock_create()
To: <linan666@huaweicloud.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
	<vigneshr@ti.com>, <chaitanya.kulkarni@wdc.com>, <axboe@kernel.dk>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yukuai3@huawei.com>, <yi.zhang@huawei.com>, <houtao1@huawei.com>,
	<yangerkun@huawei.com>
References: <20240522171035.3776026-1-linan666@huaweicloud.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <2ff2133d-ba50-08b4-a16f-b33d0470fa12@huawei.com>
Date: Wed, 22 May 2024 17:22:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240522171035.3776026-1-linan666@huaweicloud.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_022220_831845_70255A22 
X-CRM114-Status: GOOD (  19.30  )
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

1NogMjAyNC81LzIzIDE6MTAsIGxpbmFuNjY2QGh1YXdlaWNsb3VkLmNvbSDQtLXAOgo+IEZyb206
IExpIE5hbiA8bGluYW4xMjJAaHVhd2VpLmNvbT4KPiAKPiBTaW1pbGFyIHRvIGNvbW1pdCBhZGJm
NGM0OTU0ZTMgKCJ1Ymk6IGJsb2NrOiBmaXggbWVtbGVhayBpbgo+IHViaWJsb2NrX2NyZWF0ZSgp
IiksICdkZXYtPmdkJyBpcyBub3QgYXNzaWduZWQgYnV0IGRlcmVmZXJlbmNlZCBpZgo+IGJsa19t
cV9hbGxvY190YWdfc2V0KCkgZmFpbHMsIGFuZCBsZWFkaW5nIHRvIGEgbnVsbC1wb2ludGVyLWRl
cmVmZXJlbmNlLgo+IEZpeCBpdCBieSB1c2luZyBwcl9lcnIoKSBhbmQgdmFyaWFibGUgJ2Rldicg
dG8gcHJpbnQgZXJyb3IgbG9nLgo+IAo+IEFkZGl0aW9uYWxseSwgdGhlIGxvZyBpbiB0aGUgZXJy
b3IgaGFuZGxlIHBhdGggb2YgaWRyX2FsbG9jKCkgaGFzCj4gYmVlbiBpbXByb3ZlZCBieSB1c2lu
ZyBwcl9lcnIoKSwgdG9vLiBCZWZvcmUgaW5pdGlhbGl6aW5nIGRldmljZQo+IG5hbWUsIHVzaW5n
IGRldl9lcnIoKSB3aWxsIHByaW50IGVycm9yIGxvZyB3aXRoICdudWxsJyBpbnN0ZWFkIG9mCj4g
dGhlIGFjdHVhbCBkZXZpY2UgbmFtZSwgbGlrZSB0aGlzOgo+ICAgIGJsb2NrIChudWxsKTogLi4u
Cj4gICAgICAgICAgfn5+fn5+Cj4gSXQgaXMgdW5jbGVhci4gVXNpbmcgcHJfZXJyKCkgY2FuIHBy
aW50IG1vcmUgZGV0YWlscyBvZiB0aGUgZGV2aWNlLgo+IFRoZSBpbXByb3ZlZCBsb2cgaXM6Cj4g
ICAgdWJpYmxvY2swXzA6IC4uLgo+IAo+IEZpeGVzOiA3NzU2N2IyNWFiOWYgKCJ1Ymk6IHVzZSBi
bGtfbXFfYWxsb2NfZGlzayBhbmQgYmxrX2NsZWFudXBfZGlzayIpCj4gUmVwb3J0ZWQtYnk6IERh
biBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBM
aSBOYW4gPGxpbmFuMTIyQGh1YXdlaS5jb20+Cj4gLS0tCj4gdjM6IHNwbGl0aW5nIHRoaXMgcGF0
Y2ggaW50byB0d28gaW4gdjIgaXMgbm90IGEgZ29vZCBpZGVhLiBUaGlzIHZlcnNpb24KPiBpcyBj
b25zaXN0ZW50IHdpdGggdjEsIGJ1dCBvbmx5IG9wdGltaXplcyB0aGUgY29tbWl0IG1lc3NhZ2Uu
Cj4gCj4gICBkcml2ZXJzL210ZC91YmkvYmxvY2suYyB8IDcgKysrKy0tLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBaaGlo
YW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC91YmkvYmxvY2suYyBiL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4gaW5kZXggZjgy
ZTM0MjNhY2I5Li5iZjczMDhlOGVjMmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2Js
b2NrLmMKPiArKysgYi9kcml2ZXJzL210ZC91YmkvYmxvY2suYwo+IEBAIC0zOTAsNyArMzkwLDgg
QEAgaW50IHViaWJsb2NrX2NyZWF0ZShzdHJ1Y3QgdWJpX3ZvbHVtZV9pbmZvICp2aSkKPiAgIAo+
ICAgCXJldCA9IGJsa19tcV9hbGxvY190YWdfc2V0KCZkZXYtPnRhZ19zZXQpOwo+ICAgCWlmIChy
ZXQpIHsKPiAtCQlkZXZfZXJyKGRpc2tfdG9fZGV2KGRldi0+Z2QpLCAiYmxrX21xX2FsbG9jX3Rh
Z19zZXQgZmFpbGVkIik7Cj4gKwkJcHJfZXJyKCJ1YmlibG9jayVkXyVkOiBibGtfbXFfYWxsb2Nf
dGFnX3NldCBmYWlsZWRcbiIsCj4gKwkJCWRldi0+dWJpX251bSwgZGV2LT52b2xfaWQpOwo+ICAg
CQlnb3RvIG91dF9mcmVlX2RldjsKPiAgIAl9Cj4gICAKPiBAQCAtNDA3LDggKzQwOCw4IEBAIGlu
dCB1YmlibG9ja19jcmVhdGUoc3RydWN0IHViaV92b2x1bWVfaW5mbyAqdmkpCj4gICAJZ2QtPm1p
bm9ycyA9IDE7Cj4gICAJZ2QtPmZpcnN0X21pbm9yID0gaWRyX2FsbG9jKCZ1YmlibG9ja19taW5v
cl9pZHIsIGRldiwgMCwgMCwgR0ZQX0tFUk5FTCk7Cj4gICAJaWYgKGdkLT5maXJzdF9taW5vciA8
IDApIHsKPiAtCQlkZXZfZXJyKGRpc2tfdG9fZGV2KGdkKSwKPiAtCQkJImJsb2NrOiBkeW5hbWlj
IG1pbm9yIGFsbG9jYXRpb24gZmFpbGVkIik7Cj4gKwkJcHJfZXJyKCJ1YmlibG9jayVkXyVkOiBi
bG9jazogZHluYW1pYyBtaW5vciBhbGxvY2F0aW9uIGZhaWxlZFxuIiwKPiArCQkJZGV2LT51Ymlf
bnVtLCBkZXYtPnZvbF9pZCk7Cj4gICAJCXJldCA9IC1FTk9ERVY7Cj4gICAJCWdvdG8gb3V0X2Ns
ZWFudXBfZGlzazsKPiAgIAl9Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
