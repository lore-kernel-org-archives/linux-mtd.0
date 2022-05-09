Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA90C43217
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 01:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oienmyVNXPioyQRY1F5lnIrF6y3v45cPn+DPO7Vp0N4=; b=A95tMSzUGvCZga
	6CZ+OdOg9atHk2uSR5k4ERQRhJuFb4fHPaQ3COexqTCr6rCFyNIJqosnpO3cS/wwXtOtvpzTaGqlU
	eFqVWrjEdy2eyvQvM1kQS6K5XzTVUD50/J8LhikR+eKiO42iWFjpQvgMzOnkWj6z/sKjfFZpQ2VoY
	JKAqn9PgeSlIZx8AnpooMEEhgEOOlzEwcii/O2Wn0wtCoTfxJ6U2Naz4YrjKoxIntx3/VDN6dVZeA
	Fz7c1Y8fa39DaFpF9kDKkDRjEHLMmUIbFaR3Q5rdHRvIiLFkMwDQ0mAJl+l3eqQLhfuONaKRKZRjg
	a+ITlk4YSZielK2rEEnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nns8k-00BwXC-1Y; Mon, 09 May 2022 01:24:46 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nns8g-00BwUz-BG
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 01:24:44 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KxNjn6Xf3zhZ1W;
 Mon,  9 May 2022 09:23:57 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 9 May 2022 09:24:33 +0800
Message-ID: <55b319f1-77dd-5049-f734-462dfbf59d31@huawei.com>
Date: Mon, 9 May 2022 09:24:25 +0800
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
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_182442_597763_F0D7490E 
X-CRM114-Status: UNSURE (   9.55  )
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

QSBnZW50bGUgcGluZy4KCuWcqCAyMDIyLzQvMTIgMTc6MzgsIEJhb2t1biBMaSDlhpnpgZM6Cj4g
SWYgamZmczJfaWdldCgpIG9yIGRfbWFrZV9yb290KCkgaW4gamZmczJfZG9fZmlsbF9zdXBlcigp
IHJldHVybnMKPiBhbiBlcnJvciwgd2UgY2FuIG9ic2VydmUgdGhlIGZvbGxvd2luZyBrbWVtbGVh
ayByZXBvcnQ6Cj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+IHVucmVmZXJlbmNlZCBvYmplY3QgMHhmZmZmODg4MTA1YTY1MzQwIChzaXplIDY0KToKPiAg
ICBjb21tICJtb3VudCIsIHBpZCA3MTAsIGppZmZpZXMgNDMwMjg1MTU1OCAoYWdlIDU4LjIzOXMp
Cj4gICAgaGV4IGR1bXAgKGZpcnN0IDMyIGJ5dGVzKToKPiAgICAgIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uCj4gICAgICAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgLi4uLi4uLi4u
Li4uLi4uLgo+ICAgIGJhY2t0cmFjZToKPiAgICAgIFs8ZmZmZmZmZmY4NTljNDVlNT5dIGttZW1f
Y2FjaGVfYWxsb2NfdHJhY2UrMHg0NzUvMHg4YTAKPiAgICAgIFs8ZmZmZmZmZmY4NjE2MDE0Nj5d
IGpmZnMyX3N1bV9pbml0KzB4OTYvMHgxYTAKPiAgICAgIFs8ZmZmZmZmZmY4NjE0MGUyNT5dIGpm
ZnMyX2RvX21vdW50X2ZzKzB4NzQ1LzB4MjEyMAo+ICAgICAgWzxmZmZmZmZmZjg2MTQ5ZmVjPl0g
amZmczJfZG9fZmlsbF9zdXBlcisweDM1Yy8weDgxMAo+ICAgICAgWzxmZmZmZmZmZjg2MTRhYWU5
Pl0gamZmczJfZmlsbF9zdXBlcisweDJiOS8weDNiMAo+ICAgICAgWy4uLl0KPiB1bnJlZmVyZW5j
ZWQgb2JqZWN0IDB4ZmZmZjg4ODFiZDdmMDAwMCAoc2l6ZSA2NTUzNik6Cj4gICAgY29tbSAibW91
bnQiLCBwaWQgNzEwLCBqaWZmaWVzIDQzMDI4NTE1NTggKGFnZSA1OC4yMzlzKQo+ICAgIGhleCBk
dW1wIChmaXJzdCAzMiBieXRlcyk6Cj4gICAgICBiYiBiYiBiYiBiYiBiYiBiYiBiYiBiYiBiYiBi
YiBiYiBiYiBiYiBiYiBiYiBiYiAgLi4uLi4uLi4uLi4uLi4uLgo+ICAgICAgYmIgYmIgYmIgYmIg
YmIgYmIgYmIgYmIgYmIgYmIgYmIgYmIgYmIgYmIgYmIgYmIgIC4uLi4uLi4uLi4uLi4uLi4KPiAg
ICBiYWNrdHJhY2U6Cj4gICAgICBbPGZmZmZmZmZmODU4NTc5YmE+XSBrbWFsbG9jX29yZGVyKzB4
ZGEvMHgxMTAKPiAgICAgIFs8ZmZmZmZmZmY4NTg1N2ExMT5dIGttYWxsb2Nfb3JkZXJfdHJhY2Ur
MHgyMS8weDEzMAo+ICAgICAgWzxmZmZmZmZmZjg1OWMyZWQxPl0gX19rbWFsbG9jKzB4NzExLzB4
OGEwCj4gICAgICBbPGZmZmZmZmZmODYxNjAxODk+XSBqZmZzMl9zdW1faW5pdCsweGQ5LzB4MWEw
Cj4gICAgICBbPGZmZmZmZmZmODYxNDBlMjU+XSBqZmZzMl9kb19tb3VudF9mcysweDc0NS8weDIx
MjAKPiAgICAgIFs8ZmZmZmZmZmY4NjE0OWZlYz5dIGpmZnMyX2RvX2ZpbGxfc3VwZXIrMHgzNWMv
MHg4MTAKPiAgICAgIFs8ZmZmZmZmZmY4NjE0YWFlOT5dIGpmZnMyX2ZpbGxfc3VwZXIrMHgyYjkv
MHgzYjAKPiAgICAgIFsuLi5dCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPgo+IFRoaXMgaXMgYmVjYXVzZSB0aGUgcmVzb3VyY2VzIGFsbG9jYXRlZCBpbiBq
ZmZzMl9zdW1faW5pdCgpIGFyZSBub3QKPiByZWxlYXNlZC4gQ2FsbCBqZmZzMl9zdW1fZXhpdCgp
IHRvIHJlbGVhc2UgdGhlc2UgcmVzb3VyY2VzIHRvIHNvbHZlCj4gdGhlIHByb2JsZW0uCj4KPiBG
aXhlczogZTYzMWRkYmE1ODg3ICgiW0pGRlMyXSBBZGQgZXJhc2UgYmxvY2sgc3VtbWFyeSBzdXBw
b3J0IChtb3VudCB0aW1lIGltcHJvdmVtZW50KSIpCj4gU2lnbmVkLW9mZi1ieTogQmFva3VuIExp
IDxsaWJhb2t1bjFAaHVhd2VpLmNvbT4KPiAtLS0KPiAgIGZzL2pmZnMyL2ZzLmMgfCAxICsKPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2pmZnMy
L2ZzLmMgYi9mcy9qZmZzMi9mcy5jCj4gaW5kZXggNzFmMDNhNWQzNmVkLi5mODNhNDY4YjY0ODgg
MTAwNjQ0Cj4gLS0tIGEvZnMvamZmczIvZnMuYwo+ICsrKyBiL2ZzL2pmZnMyL2ZzLmMKPiBAQCAt
NjA0LDYgKzYwNCw3IEBAIGludCBqZmZzMl9kb19maWxsX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9j
ayAqc2IsIHN0cnVjdCBmc19jb250ZXh0ICpmYykKPiAgIAlqZmZzMl9mcmVlX3Jhd19ub2RlX3Jl
ZnMoYyk7Cj4gICAJa3ZmcmVlKGMtPmJsb2Nrcyk7Cj4gICAJamZmczJfY2xlYXJfeGF0dHJfc3Vi
c3lzdGVtKGMpOwo+ICsJamZmczJfc3VtX2V4aXQoYyk7Cj4gICAgb3V0X2lub2hhc2g6Cj4gICAJ
a2ZyZWUoYy0+aW5vY2FjaGVfbGlzdCk7Cj4gICAgb3V0X3didWY6CgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
