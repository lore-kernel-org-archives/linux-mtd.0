Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5633BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+Rk3GpPrBsJjRUvqE4FWQbqZmpZUT1SYvZT+veYutI=; b=N24CLyC1trGKKW
	B7/9wpIi8OtNJXKFg4ZD6usJzTUopu9gb59G/WJ7cQXj9zmKCF+SZaCIbzTlFzZb4vSXG8hT9/teM
	HZqu922NtKCYkij6z+jcVR5T1TXoOclks5/y61xGIPqakOcMHMPTrmBbczpGU8qsueWGgFg9XftSV
	lZoYeEVlhg56WUyrg0/2sh6l11fsGJ6p+tnveZNUtieoBNEaW6NEEo4JyQh7mKF/V0gQCWRUh+hhI
	OGbvQmMuQ0SJz7RzKUV/t/4KBFQZuXDeUCWl47r13cjv2mbXPWsnLhzJq/l7Gd0ernr2wHibRUaRl
	xf5z8VEQUxogNwCiZXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4Pz-002rp2-Bl; Mon, 23 May 2022 09:32:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2or-002AAA-Ma
 for linux-mtd@bombadil.infradead.org; Mon, 23 May 2022 07:49:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=S91S5YSl2qby4jcOZNzyZD401a43DQd0oxyZ1lnOhAY=; b=S9CIl+eWW4paqgsemBegQJL9nx
 Pzq8cw+kFo4OW8BmXBeCor7Th7kW7AO0XoB5/uGwS6MCGpn+rWb+zmFlHCQYHNoJLjcIb9JGiElW7
 IW6+vQuO2sCRk7AJt2ENBO5/F9Ty9mzX7IEFuwvP9zXQdIfypajrKzAVxOngmumdYErQS5H0o7vca
 JfKC7b7Hh2dR0vmZePHLwcCR/WMnXvBWmTTfVbeEi/ZluIi4zQUPb+Uy7gQY2uWNdPFw8DYFeE7B1
 QOiEBodG+78twwm5OpOuYIQx+FUrUZdQZN1rV7aw1oWkXv7rD1FmOgzUfBBpjpgVP2w8yZ47bv1M6
 zGok1yfQ==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt17y-000sat-Ln
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 06:01:18 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L668Z2CpDzgY8H;
 Mon, 23 May 2022 13:58:54 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 23 May 2022 14:00:21 +0800
Message-ID: <c2f49973-e5be-475a-1b92-77fc6e86ba37@huawei.com>
Date: Mon, 23 May 2022 14:00:21 +0800
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
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_070115_762908_453D3ED0 
X-CRM114-Status: UNSURE (   9.69  )
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

cGluZwoK5ZyoIDIwMjIvNC8xMiAxNzozOCwgQmFva3VuIExpIOWGmemBkzoKPiBJZiBqZmZzMl9p
Z2V0KCkgb3IgZF9tYWtlX3Jvb3QoKSBpbiBqZmZzMl9kb19maWxsX3N1cGVyKCkgcmV0dXJucwo+
IGFuIGVycm9yLCB3ZSBjYW4gb2JzZXJ2ZSB0aGUgZm9sbG93aW5nIGttZW1sZWFrIHJlcG9ydDoK
Pgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gdW5yZWZl
cmVuY2VkIG9iamVjdCAweGZmZmY4ODgxMDVhNjUzNDAgKHNpemUgNjQpOgo+ICAgIGNvbW0gIm1v
dW50IiwgcGlkIDcxMCwgamlmZmllcyA0MzAyODUxNTU4IChhZ2UgNTguMjM5cykKPiAgICBoZXgg
ZHVtcCAoZmlyc3QgMzIgYnl0ZXMpOgo+ICAgICAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KPiAgICAgIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uCj4g
ICAgYmFja3RyYWNlOgo+ICAgICAgWzxmZmZmZmZmZjg1OWM0NWU1Pl0ga21lbV9jYWNoZV9hbGxv
Y190cmFjZSsweDQ3NS8weDhhMAo+ICAgICAgWzxmZmZmZmZmZjg2MTYwMTQ2Pl0gamZmczJfc3Vt
X2luaXQrMHg5Ni8weDFhMAo+ICAgICAgWzxmZmZmZmZmZjg2MTQwZTI1Pl0gamZmczJfZG9fbW91
bnRfZnMrMHg3NDUvMHgyMTIwCj4gICAgICBbPGZmZmZmZmZmODYxNDlmZWM+XSBqZmZzMl9kb19m
aWxsX3N1cGVyKzB4MzVjLzB4ODEwCj4gICAgICBbPGZmZmZmZmZmODYxNGFhZTk+XSBqZmZzMl9m
aWxsX3N1cGVyKzB4MmI5LzB4M2IwCj4gICAgICBbLi4uXQo+IHVucmVmZXJlbmNlZCBvYmplY3Qg
MHhmZmZmODg4MWJkN2YwMDAwIChzaXplIDY1NTM2KToKPiAgICBjb21tICJtb3VudCIsIHBpZCA3
MTAsIGppZmZpZXMgNDMwMjg1MTU1OCAoYWdlIDU4LjIzOXMpCj4gICAgaGV4IGR1bXAgKGZpcnN0
IDMyIGJ5dGVzKToKPiAgICAgIGJiIGJiIGJiIGJiIGJiIGJiIGJiIGJiIGJiIGJiIGJiIGJiIGJi
IGJiIGJiIGJiICAuLi4uLi4uLi4uLi4uLi4uCj4gICAgICBiYiBiYiBiYiBiYiBiYiBiYiBiYiBi
YiBiYiBiYiBiYiBiYiBiYiBiYiBiYiBiYiAgLi4uLi4uLi4uLi4uLi4uLgo+ICAgIGJhY2t0cmFj
ZToKPiAgICAgIFs8ZmZmZmZmZmY4NTg1NzliYT5dIGttYWxsb2Nfb3JkZXIrMHhkYS8weDExMAo+
ICAgICAgWzxmZmZmZmZmZjg1ODU3YTExPl0ga21hbGxvY19vcmRlcl90cmFjZSsweDIxLzB4MTMw
Cj4gICAgICBbPGZmZmZmZmZmODU5YzJlZDE+XSBfX2ttYWxsb2MrMHg3MTEvMHg4YTAKPiAgICAg
IFs8ZmZmZmZmZmY4NjE2MDE4OT5dIGpmZnMyX3N1bV9pbml0KzB4ZDkvMHgxYTAKPiAgICAgIFs8
ZmZmZmZmZmY4NjE0MGUyNT5dIGpmZnMyX2RvX21vdW50X2ZzKzB4NzQ1LzB4MjEyMAo+ICAgICAg
WzxmZmZmZmZmZjg2MTQ5ZmVjPl0gamZmczJfZG9fZmlsbF9zdXBlcisweDM1Yy8weDgxMAo+ICAg
ICAgWzxmZmZmZmZmZjg2MTRhYWU5Pl0gamZmczJfZmlsbF9zdXBlcisweDJiOS8weDNiMAo+ICAg
ICAgWy4uLl0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
Cj4gVGhpcyBpcyBiZWNhdXNlIHRoZSByZXNvdXJjZXMgYWxsb2NhdGVkIGluIGpmZnMyX3N1bV9p
bml0KCkgYXJlIG5vdAo+IHJlbGVhc2VkLiBDYWxsIGpmZnMyX3N1bV9leGl0KCkgdG8gcmVsZWFz
ZSB0aGVzZSByZXNvdXJjZXMgdG8gc29sdmUKPiB0aGUgcHJvYmxlbS4KPgo+IEZpeGVzOiBlNjMx
ZGRiYTU4ODcgKCJbSkZGUzJdIEFkZCBlcmFzZSBibG9jayBzdW1tYXJ5IHN1cHBvcnQgKG1vdW50
IHRpbWUgaW1wcm92ZW1lbnQpIikKPiBTaWduZWQtb2ZmLWJ5OiBCYW9rdW4gTGkgPGxpYmFva3Vu
MUBodWF3ZWkuY29tPgo+IC0tLQo+ICAgZnMvamZmczIvZnMuYyB8IDEgKwo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZnMvamZmczIvZnMuYyBiL2Zz
L2pmZnMyL2ZzLmMKPiBpbmRleCA3MWYwM2E1ZDM2ZWQuLmY4M2E0NjhiNjQ4OCAxMDA2NDQKPiAt
LS0gYS9mcy9qZmZzMi9mcy5jCj4gKysrIGIvZnMvamZmczIvZnMuYwo+IEBAIC02MDQsNiArNjA0
LDcgQEAgaW50IGpmZnMyX2RvX2ZpbGxfc3VwZXIoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgc3Ry
dWN0IGZzX2NvbnRleHQgKmZjKQo+ICAgCWpmZnMyX2ZyZWVfcmF3X25vZGVfcmVmcyhjKTsKPiAg
IAlrdmZyZWUoYy0+YmxvY2tzKTsKPiAgIAlqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0oYyk7
Cj4gKwlqZmZzMl9zdW1fZXhpdChjKTsKPiAgICBvdXRfaW5vaGFzaDoKPiAgIAlrZnJlZShjLT5p
bm9jYWNoZV9saXN0KTsKPiAgICBvdXRfd2J1ZjoKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
