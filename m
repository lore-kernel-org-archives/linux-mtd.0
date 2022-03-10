Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E52C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Mar 2022 08:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PMth+xp7wcK3mHKEx701FIEEFQfmTKCZfmE5Td1JTk=; b=LsSwlrmoejE4UGCSL2Xo0iRPsY
	ZOnRK+rV+WwWn+Sx8Hk9JNpHTAWCU0PMfKRaevC6tbD+bOE78LZ4imK6bbgl/nj/E7CaA+M3zACBW
	SSOUwg4gQIogePRa1ZpyEsALlstWVXijKJvwaHebpy3lHhozfETX1U2lF4NwhLPBOgMxf1BW/KAP6
	UIC3ferVG4OR/0ZYRC0w3HCGP39pdQFE+Qrd7bJTB4m9YZKv/3UHv4J3XGNzf5qgCIuQ+m2n3xo+Q
	GeqLRLCIMQoKfhWmH2zwgjU4RuxTLKfGJhcibyARtVVMCYR4tEbMtuJ3it81eNt1lch14P+Omnf3b
	prP3l7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSEHg-00BwNP-NT; Thu, 10 Mar 2022 08:36:32 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSEGX-00Bvu6-T3
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2022 08:35:23 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KDj5b68lLzfYsH;
 Thu, 10 Mar 2022 16:33:55 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 10 Mar 2022 16:35:18 +0800
Subject: Re: [PATCH -next] jffs2: fix use-after-free in
 jffs2_clear_xattr_subsystem
To: <richard@nod.at>, <dwmw2@infradead.org>, <christian.brauner@ubuntu.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <yukuai3@huawei.com>, <stable@vger.kernel.org>, Hulk Robot
 <hulkci@huawei.com>, Baokun Li <libaokun1@huawei.com>
References: <20211228125430.1880252-1-libaokun1@huawei.com>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <8a175ec6-1555-8575-1f03-0002efac1740@huawei.com>
Date: Thu, 10 Mar 2022 16:35:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20211228125430.1880252-1-libaokun1@huawei.com>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_003522_357176_122635C0 
X-CRM114-Status: GOOD (  20.90  )
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

QSBnZW50bGUgcGluZywgc29ycnkgZm9yIHRoZSBub2lzZS4KCuWcqCAyMDIxLzEyLzI4IDIwOjU0
LCBCYW9rdW4gTGkg5YaZ6YGTOgo+IFdoZW4gd2UgbW91bnQgYSBqZmZzMiBpbWFnZSwgYXNzdW1l
IHRoYXQgdGhlIGZpcnN0IGZldyBibG9ja3Mgb2YKPiB0aGUgaW1hZ2UgYXJlIG5vcm1hbCBhbmQg
Y29udGFpbiBhdCBsZWFzdCBvbmUgeGF0dHItcmVsYXRlZCBpbm9kZSwKPiBidXQgdGhlIG5leHQg
YmxvY2sgaXMgYWJub3JtYWwuIEFzIGEgcmVzdWx0LCBhbiBlcnJvciBpcyByZXR1cm5lZAo+IGlu
IGpmZnMyX3NjYW5fZXJhc2VibG9jaygpLiBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0oKSBp
cyB0aGVuCj4gY2FsbGVkIGluIGpmZnMyX2J1aWxkX2ZpbGVzeXN0ZW0oKSBhbmQgdGhlbiBhZ2Fp
biBpbgo+IGpmZnMyX2RvX2ZpbGxfc3VwZXIoKS4KPgo+IEZpbmFsbHkgd2UgY2FuIG9ic2VydmUg
dGhlIGZvbGxvd2luZyByZXBvcnQ6Cj4gICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAgIEJVRzogS0FTQU46IHVzZS1h
ZnRlci1mcmVlIGluIGpmZnMyX2NsZWFyX3hhdHRyX3N1YnN5c3RlbSsweDk1LzB4NmFjCj4gICBS
ZWFkIG9mIHNpemUgOCBhdCBhZGRyIGZmZmY4ODgxMjQzMzg0ZTAgYnkgdGFzayBtb3VudC83MTkK
Pgo+ICAgQ2FsbCBUcmFjZToKPiAgICBkdW1wX3N0YWNrKzB4MTE1LzB4MTZiCj4gICAgamZmczJf
Y2xlYXJfeGF0dHJfc3Vic3lzdGVtKzB4OTUvMHg2YWMKPiAgICBqZmZzMl9kb19maWxsX3N1cGVy
KzB4ODRmLzB4YzMwCj4gICAgamZmczJfZmlsbF9zdXBlcisweDJlYS8weDRjMAo+ICAgIG10ZF9n
ZXRfc2IrMHgyNTQvMHg0MDAKPiAgICBtdGRfZ2V0X3NiX2J5X25yKzB4NGYvMHhkMAo+ICAgIGdl
dF90cmVlX210ZCsweDQ5OC8weDg0MAo+ICAgIGpmZnMyX2dldF90cmVlKzB4MjUvMHgzMAo+ICAg
IHZmc19nZXRfdHJlZSsweDhkLzB4MmUwCj4gICAgcGF0aF9tb3VudCsweDUwZi8weDFlNTAKPiAg
ICBkb19tb3VudCsweDEwNy8weDEzMAo+ICAgIF9fc2Vfc3lzX21vdW50KzB4MWM1LzB4MmYwCj4g
ICAgX194NjRfc3lzX21vdW50KzB4YzcvMHgxNjAKPiAgICBkb19zeXNjYWxsXzY0KzB4NDUvMHg3
MAo+ICAgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKPgo+ICAgQWxs
b2NhdGVkIGJ5IHRhc2sgNzE5Ogo+ICAgIGthc2FuX3NhdmVfc3RhY2srMHgyMy8weDYwCj4gICAg
X19rYXNhbl9rbWFsbG9jLmNvbnN0cHJvcC4wKzB4MTBiLzB4MTIwCj4gICAga2FzYW5fc2xhYl9h
bGxvYysweDEyLzB4MjAKPiAgICBrbWVtX2NhY2hlX2FsbG9jKzB4MWMwLzB4ODcwCj4gICAgamZm
czJfYWxsb2NfeGF0dHJfcmVmKzB4MmYvMHhhMAo+ICAgIGpmZnMyX3NjYW5fbWVkaXVtLmNvbGQr
MHgzNzEzLzB4NDc5NAo+ICAgIGpmZnMyX2RvX21vdW50X2ZzLmNvbGQrMHhhNy8weDIyNTMKPiAg
ICBqZmZzMl9kb19maWxsX3N1cGVyKzB4MzgzLzB4YzMwCj4gICAgamZmczJfZmlsbF9zdXBlcisw
eDJlYS8weDRjMAo+ICAgWy4uLl0KPgo+ICAgRnJlZWQgYnkgdGFzayA3MTk6Cj4gICAga21lbV9j
YWNoZV9mcmVlKzB4Y2MvMHg3YjAKPiAgICBqZmZzMl9mcmVlX3hhdHRyX3JlZisweDc4LzB4OTgK
PiAgICBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0rMHhhMS8weDZhYwo+ICAgIGpmZnMyX2Rv
X21vdW50X2ZzLmNvbGQrMHg1ZTYvMHgyMjUzCj4gICAgamZmczJfZG9fZmlsbF9zdXBlcisweDM4
My8weGMzMAo+ICAgIGpmZnMyX2ZpbGxfc3VwZXIrMHgyZWEvMHg0YzAKPiAgIFsuLi5dCj4KPiAg
IFRoZSBidWdneSBhZGRyZXNzIGJlbG9uZ3MgdG8gdGhlIG9iamVjdCBhdCBmZmZmODg4MTI0MzM4
NGI4Cj4gICAgd2hpY2ggYmVsb25ncyB0byB0aGUgY2FjaGUgamZmczJfeGF0dHJfcmVmIG9mIHNp
emUgNDgKPiAgIFRoZSBidWdneSBhZGRyZXNzIGlzIGxvY2F0ZWQgNDAgYnl0ZXMgaW5zaWRlIG9m
Cj4gICAgNDgtYnl0ZSByZWdpb24gW2ZmZmY4ODgxMjQzMzg0YjgsIGZmZmY4ODgxMjQzMzg0ZTgp
Cj4gICBbLi4uXQo+ICAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09Cj4KPiBUaGUgdHJpZ2dlcmluZyBvZiB0aGUgQlVHIGlz
IHNob3duIGluIHRoZSBmb2xsb3dpbmcgc3RhY2s6Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBqZmZzMl9maWxsX3N1cGVyCj4g
ICAgamZmczJfZG9fZmlsbF9zdXBlcgo+ICAgICAgamZmczJfZG9fbW91bnRfZnMKPiAgICAgICAg
amZmczJfYnVpbGRfZmlsZXN5c3RlbQo+ICAgICAgICAgIGpmZnMyX3NjYW5fbWVkaXVtCj4gICAg
ICAgICAgICBqZmZzMl9zY2FuX2VyYXNlYmxvY2sgICAgICAgIDwtLS0gRVJST1IKPiAgICAgICAg
ICBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0gICAgPC0tLSBmcmVlCj4gICAgICBqZmZzMl9j
bGVhcl94YXR0cl9zdWJzeXN0ZW0gICAgICAgIDwtLS0gZnJlZSBhZ2Fpbgo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4KPiBBbiBl
cnJvciBpcyByZXR1cm5lZCBpbiBqZmZzMl9kb19tb3VudF9mcygpLiBJZiB0aGUgZXJyb3IgaXMg
cmV0dXJuZWQKPiBieSBqZmZzMl9zdW1faW5pdCgpLCB0aGUgamZmczJfY2xlYXJfeGF0dHJfc3Vi
c3lzdGVtKCkgZG9lcyBub3QgbmVlZCB0bwo+IGJlIGV4ZWN1dGVkLiBJZiB0aGUgZXJyb3IgaXMg
cmV0dXJuZWQgYnkgamZmczJfYnVpbGRfZmlsZXN5c3RlbSgpLCB0aGUKPiBqZmZzMl9jbGVhcl94
YXR0cl9zdWJzeXN0ZW0oKSBhbHNvIGRvZXMgbm90IG5lZWQgdG8gYmUgZXhlY3V0ZWQgYWdhaW4u
Cj4gU28gbW92ZSBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0oKSBmcm9tICdvdXRfaW5vaGFz
aCcgdG8gJ291dF9yb290Jwo+IHRvIGZpeCB0aGlzIFVBRiBwcm9ibGVtLgo+Cj4gRml4ZXM6IGFh
OThkN2NmNTliNSAoIltKRkZTMl1bWEFUVFJdIFhBVFRSIHN1cHBvcnQgb24gSkZGUzIgKHZlcnNp
b24uIDUpIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFJlcG9ydGVkLWJ5OiBIdWxr
IFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBCYW9rdW4gTGkgPGxp
YmFva3VuMUBodWF3ZWkuY29tPgo+IC0tLQo+ICAgZnMvamZmczIvZnMuYyB8IDIgKy0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdp
dCBhL2ZzL2pmZnMyL2ZzLmMgYi9mcy9qZmZzMi9mcy5jCj4gaW5kZXggMmFjNDEwNDc3YzRmLi43
MWYwM2E1ZDM2ZWQgMTAwNjQ0Cj4gLS0tIGEvZnMvamZmczIvZnMuYwo+ICsrKyBiL2ZzL2pmZnMy
L2ZzLmMKPiBAQCAtNjAzLDggKzYwMyw4IEBAIGludCBqZmZzMl9kb19maWxsX3N1cGVyKHN0cnVj
dCBzdXBlcl9ibG9jayAqc2IsIHN0cnVjdCBmc19jb250ZXh0ICpmYykKPiAgIAlqZmZzMl9mcmVl
X2lub19jYWNoZXMoYyk7Cj4gICAJamZmczJfZnJlZV9yYXdfbm9kZV9yZWZzKGMpOwo+ICAgCWt2
ZnJlZShjLT5ibG9ja3MpOwo+IC0gb3V0X2lub2hhc2g6Cj4gICAJamZmczJfY2xlYXJfeGF0dHJf
c3Vic3lzdGVtKGMpOwo+ICsgb3V0X2lub2hhc2g6Cj4gICAJa2ZyZWUoYy0+aW5vY2FjaGVfbGlz
dCk7Cj4gICAgb3V0X3didWY6Cj4gICAJamZmczJfZmxhc2hfY2xlYW51cChjKTsKCi0tIApXaXRo
IEJlc3QgUmVnYXJkcywKQmFva3VuIExpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
