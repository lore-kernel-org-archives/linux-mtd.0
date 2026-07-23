Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7547CC4453D
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 03:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cle7/BMPlkoqvrRZQcQ+QZRyMEtfbcok/ZDODC+9TWI=; b=hcOGaQMd77FjVhwWRb0qZztD83
	dMxcwibaDUOZ7EYQzsYEKKXu09AGckSgzUQDiUr1Rb10M8YAMCjBEoaa/qwDDe/xMzXIsLOEH64mP
	1TGyXyBB1dsLr9s7BAOxIczWYaa69qgF6uLZ/5HkcK+aAJKKqKsN1mqHwZvmHhPTKDOnYJckqI+Rh
	kcY/Yrfm2zFtp3rYDIjAht8waWjWDJJQIjHj4ek67FZNQfYVgbuu0hVrEHdAn6Mms1KyTQ4DTpryU
	0C2SnkLTf5KyYYiZ6ETO4OFy/xHkSADQbK6N1l6UZAZleXZwcBrQmCV3/g3q150hiry6FsNX7u4bf
	qDE/opqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjgX-0000000DH5b-26iU;
	Thu, 23 Jul 2026 03:01:21 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjgT-0000000DH52-0zgd
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 03:01:19 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uIWdmlpVm7JjDhegqPdb1O7R9OzIm+ndXeUpsXZfUhI=;
	b=WX4J53/4t6DDohMUZHN6frK/TDJ0FV8/fxCS1fftvmmEncY70sihguIwU7E9kidQqvZquYEN5
	FB2dxrFNNQd21DHRnI3yGLIP2jclX6lWuNlLurDIbEIa6go1Ltp6boBWGt3E4HCgnUgdDjzFaY2
	Wl/Wi4lAkKP/d/KCyHi3wsI=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4h5Fy900YyzLlTk;
	Thu, 23 Jul 2026 10:51:44 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 158B04056C;
	Thu, 23 Jul 2026 11:01:08 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 23 Jul 2026 11:01:06 +0800
Subject: Re: [PATCH 2/2] UBI: support per-device wear-leveling threshold
To: Ran Hongyun <ranhongyun1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>, <vapier@gentoo.org>,
	<artem.bityutskiy@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yangerkun@huawei.com>, <yi.zhang@huawei.com>
References: <20260723020233.3079997-1-ranhongyun1@huawei.com>
 <20260723020233.3079997-3-ranhongyun1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7971d65d-ae24-d508-23ff-52afdc0b8d09@huawei.com>
Date: Thu, 23 Jul 2026 11:01:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260723020233.3079997-3-ranhongyun1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_200117_743806_53236AD5 
X-CRM114-Status: GOOD (  10.19  )
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

1NogMjAyNi83LzIzIDEwOjAyLCBSYW4gSG9uZ3l1biDQtLXAOgo+IFRoZSBVQkkgd2Vhci1sZXZl
bGluZyB0aHJlc2hvbGQgKENPTkZJR19NVERfVUJJX1dMX1RIUkVTSE9MRCkgaXMKPiBjdXJyZW50
bHkgYSBjb21waWxlLXRpbWUgY29uc3RhbnQgc2hhcmVkIGJ5IGFsbCBVQkkgZGV2aWNlcy4gV2hl
biBhCj4gc2luZ2xlIGtlcm5lbCBpbWFnZSBtdXN0IHN1cHBvcnQgbXVsdGlwbGUgTkFORCBmbGFz
aGVzIHdpdGggZGlmZmVyZW50Cj4gZXJhc2UgbGlmZXRpbWVzLCBvbmUgZ2xvYmFsIHRocmVzaG9s
ZCBjYW5ub3Qgc3VpdCBhbGwgZGV2aWNlcy4KPiAKPiBBZGQgYSBwZXItZGV2aWNlIGNvbmZpZ3Vy
YWJsZSB3bF90aHJlc2hvbGQgcGFyYW1ldGVyOgo+IAo+ICAgIC0gVUFQSTogYWRkIF9fczMyIHds
X3RocmVzaG9sZCB0byBzdHJ1Y3QgdWJpX2F0dGFjaF9yZXEsIGNhcnZlZAo+ICAgICAgZnJvbSB0
aGUgZXhpc3RpbmcgcGFkZGluZy4KPiAKPiAgICAtIE1vZHVsZSBwYXJhbWV0ZXI6IHViaS5tdGQg
Z2FpbnMgYSBuZXcgb3B0aW9uYWwgdG9rZW4KPiAgICAgICJ3bF90aHJlc2hvbGQiOgo+ICAgICAg
ICB1YmkubXRkPTAsMCwwLDAsMCwwLDI1NiAgdWJpLm10ZD0xLDAsMCwwLDAsMCw0MDk2Cj4gCj4g
MCBtZWFucyAidXNlIHRoZSBrZXJuZWwgZGVmYXVsdCIsIHRoZSBhY2NlcHRlZCByYW5nZSBpcwo+
IDItNjU1MzYuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFuIEhvbmd5dW4gPHJhbmhvbmd5dW4xQGh1
YXdlaS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL210ZC91YmkvYnVpbGQuYyAgICAgIHwgNDMgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gICBkcml2ZXJzL210ZC91YmkvY2Rl
di5jICAgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvbXRkL3ViaS9mYXN0bWFwLXdsLmMgfCAgOCAr
KystLS0tCj4gICBkcml2ZXJzL210ZC91YmkvdWJpLmggICAgICAgIHwgMjEgKysrKysrKysrKysr
KysrKystCj4gICBkcml2ZXJzL210ZC91Ymkvd2wuYyAgICAgICAgIHwgMzkgKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGluY2x1ZGUvdWFwaS9tdGQvdWJpLXVzZXIuaCAgfCAx
MCArKysrKysrKy0KPiAgIDYgZmlsZXMgY2hhbmdlZCwgNzkgaW5zZXJ0aW9ucygrKSwgNDQgZGVs
ZXRpb25zKC0pCj4gCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVh
d2VpLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
