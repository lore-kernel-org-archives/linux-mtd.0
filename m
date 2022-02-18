Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4062C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 06:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plmAbG2vnOxMxf9DYWmkCkATItIUdxj3i6OGthZnE90=; b=wmkiRYlB0JhWY4zRPdRKhNVgn1
	4SalHKcUBssDqPGE/J+NIZ8qpjPLotHuXAZKNIQ+OUo3BDn9CHFLXx5LbMPhGkhabPE3LbjvinR+9
	0NyFrilOoRvrE2EBVmepb6sPjN77pbiUJa62usqM4NObY2s9RUWSdv5QlHXPyPAcDPFz9J2B7aL++
	YAG5rvxXh7l5Km9DMFW75nqTEXMGVf0DUbGw4gpsFTamxdxlDajjRHPbaGamltJlgg1COIX10cbCp
	pIoFQ4QjzwaMY8bWCWvfHS5T90Ymd+IaCOBL4+OCIx1+Nq5ClSnblwHGVIBd5pUw9ZW+R19jKzaSQ
	/z+3M3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKwW5-00D1n4-OL; Fri, 18 Feb 2022 06:13:17 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKwW2-00D1ha-Uj
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 06:13:16 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4K0Lq66Y9xz1FDLR;
 Fri, 18 Feb 2022 14:08:34 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Feb 2022 14:12:58 +0800
Subject: Re: [PATCH -next] jffs2: fix use-after-free in
 jffs2_clear_xattr_subsystem
To: <richard@nod.at>, <dwmw2@infradead.org>, <christian.brauner@ubuntu.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <yukuai3@huawei.com>, <stable@vger.kernel.org>, Hulk Robot
 <hulkci@huawei.com>, Baokun Li <libaokun1@huawei.com>
References: <20211228125430.1880252-1-libaokun1@huawei.com>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <fcc5cec6-63d0-e1e3-1f33-e6a424daff85@huawei.com>
Date: Fri, 18 Feb 2022 14:12:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20211228125430.1880252-1-libaokun1@huawei.com>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_221315_350407_8133BD86 
X-CRM114-Status: GOOD (  20.16  )
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

1NogMjAyMS8xMi8yOCAyMDo1NCwgQmFva3VuIExpINC0tcA6CgpwaW5nCgo+IFdoZW4gd2UgbW91
bnQgYSBqZmZzMiBpbWFnZSwgYXNzdW1lIHRoYXQgdGhlIGZpcnN0IGZldyBibG9ja3Mgb2YKPiB0
aGUgaW1hZ2UgYXJlIG5vcm1hbCBhbmQgY29udGFpbiBhdCBsZWFzdCBvbmUgeGF0dHItcmVsYXRl
ZCBpbm9kZSwKPiBidXQgdGhlIG5leHQgYmxvY2sgaXMgYWJub3JtYWwuIEFzIGEgcmVzdWx0LCBh
biBlcnJvciBpcyByZXR1cm5lZAo+IGluIGpmZnMyX3NjYW5fZXJhc2VibG9jaygpLiBqZmZzMl9j
bGVhcl94YXR0cl9zdWJzeXN0ZW0oKSBpcyB0aGVuCj4gY2FsbGVkIGluIGpmZnMyX2J1aWxkX2Zp
bGVzeXN0ZW0oKSBhbmQgdGhlbiBhZ2FpbiBpbgo+IGpmZnMyX2RvX2ZpbGxfc3VwZXIoKS4KPgo+
IEZpbmFsbHkgd2UgY2FuIG9ic2VydmUgdGhlIGZvbGxvd2luZyByZXBvcnQ6Cj4gICA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KPiAgIEJVRzogS0FTQU46IHVzZS1hZnRlci1mcmVlIGluIGpmZnMyX2NsZWFyX3hhdHRyX3N1
YnN5c3RlbSsweDk1LzB4NmFjCj4gICBSZWFkIG9mIHNpemUgOCBhdCBhZGRyIGZmZmY4ODgxMjQz
Mzg0ZTAgYnkgdGFzayBtb3VudC83MTkKPgo+ICAgQ2FsbCBUcmFjZToKPiAgICBkdW1wX3N0YWNr
KzB4MTE1LzB4MTZiCj4gICAgamZmczJfY2xlYXJfeGF0dHJfc3Vic3lzdGVtKzB4OTUvMHg2YWMK
PiAgICBqZmZzMl9kb19maWxsX3N1cGVyKzB4ODRmLzB4YzMwCj4gICAgamZmczJfZmlsbF9zdXBl
cisweDJlYS8weDRjMAo+ICAgIG10ZF9nZXRfc2IrMHgyNTQvMHg0MDAKPiAgICBtdGRfZ2V0X3Ni
X2J5X25yKzB4NGYvMHhkMAo+ICAgIGdldF90cmVlX210ZCsweDQ5OC8weDg0MAo+ICAgIGpmZnMy
X2dldF90cmVlKzB4MjUvMHgzMAo+ICAgIHZmc19nZXRfdHJlZSsweDhkLzB4MmUwCj4gICAgcGF0
aF9tb3VudCsweDUwZi8weDFlNTAKPiAgICBkb19tb3VudCsweDEwNy8weDEzMAo+ICAgIF9fc2Vf
c3lzX21vdW50KzB4MWM1LzB4MmYwCj4gICAgX194NjRfc3lzX21vdW50KzB4YzcvMHgxNjAKPiAg
ICBkb19zeXNjYWxsXzY0KzB4NDUvMHg3MAo+ICAgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdm
cmFtZSsweDQ0LzB4YTkKPgo+ICAgQWxsb2NhdGVkIGJ5IHRhc2sgNzE5Ogo+ICAgIGthc2FuX3Nh
dmVfc3RhY2srMHgyMy8weDYwCj4gICAgX19rYXNhbl9rbWFsbG9jLmNvbnN0cHJvcC4wKzB4MTBi
LzB4MTIwCj4gICAga2FzYW5fc2xhYl9hbGxvYysweDEyLzB4MjAKPiAgICBrbWVtX2NhY2hlX2Fs
bG9jKzB4MWMwLzB4ODcwCj4gICAgamZmczJfYWxsb2NfeGF0dHJfcmVmKzB4MmYvMHhhMAo+ICAg
IGpmZnMyX3NjYW5fbWVkaXVtLmNvbGQrMHgzNzEzLzB4NDc5NAo+ICAgIGpmZnMyX2RvX21vdW50
X2ZzLmNvbGQrMHhhNy8weDIyNTMKPiAgICBqZmZzMl9kb19maWxsX3N1cGVyKzB4MzgzLzB4YzMw
Cj4gICAgamZmczJfZmlsbF9zdXBlcisweDJlYS8weDRjMAo+ICAgWy4uLl0KPgo+ICAgRnJlZWQg
YnkgdGFzayA3MTk6Cj4gICAga21lbV9jYWNoZV9mcmVlKzB4Y2MvMHg3YjAKPiAgICBqZmZzMl9m
cmVlX3hhdHRyX3JlZisweDc4LzB4OTgKPiAgICBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0r
MHhhMS8weDZhYwo+ICAgIGpmZnMyX2RvX21vdW50X2ZzLmNvbGQrMHg1ZTYvMHgyMjUzCj4gICAg
amZmczJfZG9fZmlsbF9zdXBlcisweDM4My8weGMzMAo+ICAgIGpmZnMyX2ZpbGxfc3VwZXIrMHgy
ZWEvMHg0YzAKPiAgIFsuLi5dCj4KPiAgIFRoZSBidWdneSBhZGRyZXNzIGJlbG9uZ3MgdG8gdGhl
IG9iamVjdCBhdCBmZmZmODg4MTI0MzM4NGI4Cj4gICAgd2hpY2ggYmVsb25ncyB0byB0aGUgY2Fj
aGUgamZmczJfeGF0dHJfcmVmIG9mIHNpemUgNDgKPiAgIFRoZSBidWdneSBhZGRyZXNzIGlzIGxv
Y2F0ZWQgNDAgYnl0ZXMgaW5zaWRlIG9mCj4gICAgNDgtYnl0ZSByZWdpb24gW2ZmZmY4ODgxMjQz
Mzg0YjgsIGZmZmY4ODgxMjQzMzg0ZTgpCj4gICBbLi4uXQo+ICAgPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4KPiBUaGUg
dHJpZ2dlcmluZyBvZiB0aGUgQlVHIGlzIHNob3duIGluIHRoZSBmb2xsb3dpbmcgc3RhY2s6Cj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiBqZmZzMl9maWxsX3N1cGVyCj4gICAgamZmczJfZG9fZmlsbF9zdXBlcgo+ICAgICAgamZm
czJfZG9fbW91bnRfZnMKPiAgICAgICAgamZmczJfYnVpbGRfZmlsZXN5c3RlbQo+ICAgICAgICAg
IGpmZnMyX3NjYW5fbWVkaXVtCj4gICAgICAgICAgICBqZmZzMl9zY2FuX2VyYXNlYmxvY2sgICAg
ICAgIDwtLS0gRVJST1IKPiAgICAgICAgICBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0gICAg
PC0tLSBmcmVlCj4gICAgICBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0gICAgICAgIDwtLS0g
ZnJlZSBhZ2Fpbgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4KPiBBbiBlcnJvciBpcyByZXR1cm5lZCBpbiBqZmZzMl9kb19tb3Vu
dF9mcygpLiBJZiB0aGUgZXJyb3IgaXMgcmV0dXJuZWQKPiBieSBqZmZzMl9zdW1faW5pdCgpLCB0
aGUgamZmczJfY2xlYXJfeGF0dHJfc3Vic3lzdGVtKCkgZG9lcyBub3QgbmVlZCB0bwo+IGJlIGV4
ZWN1dGVkLiBJZiB0aGUgZXJyb3IgaXMgcmV0dXJuZWQgYnkgamZmczJfYnVpbGRfZmlsZXN5c3Rl
bSgpLCB0aGUKPiBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0oKSBhbHNvIGRvZXMgbm90IG5l
ZWQgdG8gYmUgZXhlY3V0ZWQgYWdhaW4uCj4gU28gbW92ZSBqZmZzMl9jbGVhcl94YXR0cl9zdWJz
eXN0ZW0oKSBmcm9tICdvdXRfaW5vaGFzaCcgdG8gJ291dF9yb290Jwo+IHRvIGZpeCB0aGlzIFVB
RiBwcm9ibGVtLgo+Cj4gRml4ZXM6IGFhOThkN2NmNTliNSAoIltKRkZTMl1bWEFUVFJdIFhBVFRS
IHN1cHBvcnQgb24gSkZGUzIgKHZlcnNpb24uIDUpIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBCYW9rdW4gTGkgPGxpYmFva3VuMUBodWF3ZWkuY29tPgo+IC0tLQo+ICAgZnMv
amZmczIvZnMuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2pmZnMyL2ZzLmMgYi9mcy9qZmZzMi9mcy5j
Cj4gaW5kZXggMmFjNDEwNDc3YzRmLi43MWYwM2E1ZDM2ZWQgMTAwNjQ0Cj4gLS0tIGEvZnMvamZm
czIvZnMuYwo+ICsrKyBiL2ZzL2pmZnMyL2ZzLmMKPiBAQCAtNjAzLDggKzYwMyw4IEBAIGludCBq
ZmZzMl9kb19maWxsX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHN0cnVjdCBmc19jb250
ZXh0ICpmYykKPiAgIAlqZmZzMl9mcmVlX2lub19jYWNoZXMoYyk7Cj4gICAJamZmczJfZnJlZV9y
YXdfbm9kZV9yZWZzKGMpOwo+ICAgCWt2ZnJlZShjLT5ibG9ja3MpOwo+IC0gb3V0X2lub2hhc2g6
Cj4gICAJamZmczJfY2xlYXJfeGF0dHJfc3Vic3lzdGVtKGMpOwo+ICsgb3V0X2lub2hhc2g6Cj4g
ICAJa2ZyZWUoYy0+aW5vY2FjaGVfbGlzdCk7Cj4gICAgb3V0X3didWY6Cj4gICAJamZmczJfZmxh
c2hfY2xlYW51cChjKTsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
