Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EFCC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 06:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FtKBPox4F2BujHk5UauDjY1SRvDFBtnuwyPxPjWgkJ8=; b=yrw3x0v2elKmXm
	3yQ3GWP94UctPYGSr7oXmwASnlDbzpHDQ6FAfX9tRE2BKBJlpG/pm48Dkl9ApOIDKL6pVVgc4TaWy
	kVSnG+TNpc24xXlq/BGQw3m1HNIWhcf9mkMqODVhzpyNlFrIAPNJvGZw43Tiql72FtScrCypkr80V
	hoQiRUxzSF0zFzT6zSP3vxZWqJEWyyB5Cosc/KCGH+7vP1GcF2M6OlLBI3ca6vchH29DBpWVXySrw
	cbpV7TAgbH/MyCAwWxyYh1q2FOU61OjrL9fKcvn5K65TdsCNzjXbVTTjzImUT6O9Udf20A9mh/1BA
	LmBcLJv/6MBKscrisC5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkKQb-009qS8-8H; Fri, 29 Apr 2022 06:48:33 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkKQY-009qQZ-7M
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 06:48:31 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KqNNQ0V5CzhYLS;
 Fri, 29 Apr 2022 14:48:06 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 14:48:21 +0800
Message-ID: <61e808ce-9bcf-6534-14be-ef5e8ba4972f@huawei.com>
Date: Fri, 29 Apr 2022 14:48:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH -next] jffs2: fix memory leak in jffs2_do_fill_super
To: <richard@nod.at>, <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
CC: <yukuai3@huawei.com>, Baokun Li <libaokun1@huawei.com>
References: <20220412093816.2280678-1-libaokun1@huawei.com>
From: "libaokun (A)" <libaokun1@huawei.com>
In-Reply-To: <20220412093816.2280678-1-libaokun1@huawei.com>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_234830_490647_F939814A 
X-CRM114-Status: UNSURE (   9.23  )
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

QSBnZW50bGUgcGluZy4gXCjvv6PvuLbvv6MqXCkpCgrlnKggMjAyMi80LzEyIDE3OjM4LCBCYW9r
dW4gTGkg5YaZ6YGTOgo+IElmIGpmZnMyX2lnZXQoKSBvciBkX21ha2Vfcm9vdCgpIGluIGpmZnMy
X2RvX2ZpbGxfc3VwZXIoKSByZXR1cm5zCj4gYW4gZXJyb3IsIHdlIGNhbiBvYnNlcnZlIHRoZSBm
b2xsb3dpbmcga21lbWxlYWsgcmVwb3J0Ogo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiB1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZmZjg4ODEwNWE2NTM0
MCAoc2l6ZSA2NCk6Cj4gICAgY29tbSAibW91bnQiLCBwaWQgNzEwLCBqaWZmaWVzIDQzMDI4NTE1
NTggKGFnZSA1OC4yMzlzKQo+ICAgIGhleCBkdW1wIChmaXJzdCAzMiBieXRlcyk6Cj4gICAgICAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgLi4uLi4uLi4u
Li4uLi4uLgo+ICAgICAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KPiAgICBiYWNrdHJhY2U6Cj4gICAgICBbPGZmZmZmZmZm
ODU5YzQ1ZTU+XSBrbWVtX2NhY2hlX2FsbG9jX3RyYWNlKzB4NDc1LzB4OGEwCj4gICAgICBbPGZm
ZmZmZmZmODYxNjAxNDY+XSBqZmZzMl9zdW1faW5pdCsweDk2LzB4MWEwCj4gICAgICBbPGZmZmZm
ZmZmODYxNDBlMjU+XSBqZmZzMl9kb19tb3VudF9mcysweDc0NS8weDIxMjAKPiAgICAgIFs8ZmZm
ZmZmZmY4NjE0OWZlYz5dIGpmZnMyX2RvX2ZpbGxfc3VwZXIrMHgzNWMvMHg4MTAKPiAgICAgIFs8
ZmZmZmZmZmY4NjE0YWFlOT5dIGpmZnMyX2ZpbGxfc3VwZXIrMHgyYjkvMHgzYjAKPiAgICAgIFsu
Li5dCj4gdW5yZWZlcmVuY2VkIG9iamVjdCAweGZmZmY4ODgxYmQ3ZjAwMDAgKHNpemUgNjU1MzYp
Ogo+ICAgIGNvbW0gIm1vdW50IiwgcGlkIDcxMCwgamlmZmllcyA0MzAyODUxNTU4IChhZ2UgNTgu
MjM5cykKPiAgICBoZXggZHVtcCAoZmlyc3QgMzIgYnl0ZXMpOgo+ICAgICAgYmIgYmIgYmIgYmIg
YmIgYmIgYmIgYmIgYmIgYmIgYmIgYmIgYmIgYmIgYmIgYmIgIC4uLi4uLi4uLi4uLi4uLi4KPiAg
ICAgIGJiIGJiIGJiIGJiIGJiIGJiIGJiIGJiIGJiIGJiIGJiIGJiIGJiIGJiIGJiIGJiICAuLi4u
Li4uLi4uLi4uLi4uCj4gICAgYmFja3RyYWNlOgo+ICAgICAgWzxmZmZmZmZmZjg1ODU3OWJhPl0g
a21hbGxvY19vcmRlcisweGRhLzB4MTEwCj4gICAgICBbPGZmZmZmZmZmODU4NTdhMTE+XSBrbWFs
bG9jX29yZGVyX3RyYWNlKzB4MjEvMHgxMzAKPiAgICAgIFs8ZmZmZmZmZmY4NTljMmVkMT5dIF9f
a21hbGxvYysweDcxMS8weDhhMAo+ICAgICAgWzxmZmZmZmZmZjg2MTYwMTg5Pl0gamZmczJfc3Vt
X2luaXQrMHhkOS8weDFhMAo+ICAgICAgWzxmZmZmZmZmZjg2MTQwZTI1Pl0gamZmczJfZG9fbW91
bnRfZnMrMHg3NDUvMHgyMTIwCj4gICAgICBbPGZmZmZmZmZmODYxNDlmZWM+XSBqZmZzMl9kb19m
aWxsX3N1cGVyKzB4MzVjLzB4ODEwCj4gICAgICBbPGZmZmZmZmZmODYxNGFhZTk+XSBqZmZzMl9m
aWxsX3N1cGVyKzB4MmI5LzB4M2IwCj4gICAgICBbLi4uXQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4KPiBUaGlzIGlzIGJlY2F1c2UgdGhlIHJlc291cmNl
cyBhbGxvY2F0ZWQgaW4gamZmczJfc3VtX2luaXQoKSBhcmUgbm90Cj4gcmVsZWFzZWQuIENhbGwg
amZmczJfc3VtX2V4aXQoKSB0byByZWxlYXNlIHRoZXNlIHJlc291cmNlcyB0byBzb2x2ZQo+IHRo
ZSBwcm9ibGVtLgo+Cj4gRml4ZXM6IGU2MzFkZGJhNTg4NyAoIltKRkZTMl0gQWRkIGVyYXNlIGJs
b2NrIHN1bW1hcnkgc3VwcG9ydCAobW91bnQgdGltZSBpbXByb3ZlbWVudCkiKQo+IFNpZ25lZC1v
ZmYtYnk6IEJhb2t1biBMaSA8bGliYW9rdW4xQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBmcy9qZmZz
Mi9mcy5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYg
LS1naXQgYS9mcy9qZmZzMi9mcy5jIGIvZnMvamZmczIvZnMuYwo+IGluZGV4IDcxZjAzYTVkMzZl
ZC4uZjgzYTQ2OGI2NDg4IDEwMDY0NAo+IC0tLSBhL2ZzL2pmZnMyL2ZzLmMKPiArKysgYi9mcy9q
ZmZzMi9mcy5jCj4gQEAgLTYwNCw2ICs2MDQsNyBAQCBpbnQgamZmczJfZG9fZmlsbF9zdXBlcihz
dHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCj4gICAJamZmczJf
ZnJlZV9yYXdfbm9kZV9yZWZzKGMpOwo+ICAgCWt2ZnJlZShjLT5ibG9ja3MpOwo+ICAgCWpmZnMy
X2NsZWFyX3hhdHRyX3N1YnN5c3RlbShjKTsKPiArCWpmZnMyX3N1bV9leGl0KGMpOwo+ICAgIG91
dF9pbm9oYXNoOgo+ICAgCWtmcmVlKGMtPmlub2NhY2hlX2xpc3QpOwo+ICAgIG91dF93YnVmOgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
