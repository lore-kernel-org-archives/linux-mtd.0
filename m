Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79ABC3A59D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Oct 2022 01:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GftcsIHlD7UYnZ0T19RqPn97xjF0SMNkt7x88+CJlo=; b=GwGxB80a8V8dyzwadull/xmvuE
	/UhmNxF+mpO8Do1fk1hfOF19UQ6N1mKlZOpw+3Y6D+7zfYfWwgZ95ctCjCiI+CRs8Kv4Cr+1igLOO
	lMIOKX4OqvzmyjKuhOGx3aAFn2QRYL/41xkXlXCPlwuJE7UEZW8nWT0eaYqhX16SZX3Q01n7FmqA5
	tRrFM6anzSqT+iv9ZV5zNmM/OvhDBilVVyFJdXaemM09h34hsTnvDT/PZEjgevXhl+M4P947Z7/Cp
	xvb1PEYiU88ABMpiy5vMwkWQJVsDlS42Os10gbZmGq4R7Cv0wkh4aIHjHB/wCOxoPOlXwzW780KsF
	9mM9uj7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ommJt-00GgRk-CJ; Mon, 24 Oct 2022 01:32:01 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ommJp-00GgPR-EG
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2022 01:31:59 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mwcqk2vXkz15M1S;
	Mon, 24 Oct 2022 09:26:58 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 09:31:48 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 09:31:47 +0800
Subject: Re: [PATCH] ubifs: Fix memory leak in alloc_wbufs()
To: Li Zetao <lizetao1@huawei.com>, <richard@nod.at>,
	<Artem.Bityutskiy@nokia.com>, <ext-adrian.hunter@nokia.com>
CC: <yi.zhang@huawei.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20221022115211.1969429-1-lizetao1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f4a4e992-9efd-b4ca-1788-efe99e4b7d87@huawei.com>
Date: Mon, 24 Oct 2022 09:31:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20221022115211.1969429-1-lizetao1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_183157_666257_54658F48 
X-CRM114-Status: GOOD (  11.33  )
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

1NogMjAyMi8xMC8yMiAxOTo1MiwgTGkgWmV0YW8g0LS1wDoKPiBrbWVtbGVhayByZXBvcnRlZCBh
IHNlcXVlbmNlIG9mIG1lbW9yeSBsZWFrcywgYW5kIHNob3cgdGhlbSBhcyBmb2xsb3dpbmc6Cj4g
Cj4gICAgdW5yZWZlcmVuY2VkIG9iamVjdCAweGZmZmY4ODgxNTc1Zjg0MDAgKHNpemUgMTAyNCk6
Cj4gICAgICBjb21tICJtb3VudCIsIHBpZCAxOTYyNSwgamlmZmllcyA0Mjk3MTE5NjA0IChhZ2Ug
MjAuMzgzcykKPiAgICAgIGhleCBkdW1wIChmaXJzdCAzMiBieXRlcyk6Cj4gICAgICAgIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4u
Li4uCj4gICAgICAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwICAuLi4uLi4uLi4uLi4uLi4uCj4gICAgICBiYWNrdHJhY2U6Cj4gICAgICAgIFs8ZmZmZmZm
ZmY4MTc2Y2VjZD5dIF9fa21hbGxvYysweDRkLzB4MTUwCj4gICAgICAgIFs8ZmZmZmZmZmZhMDQw
NmIyYj5dIHViaWZzX21vdW50KzB4MzA3Yi8weDcxNzAgW3ViaWZzXQo+ICAgICAgICBbPGZmZmZm
ZmZmODE5ZmE4ZmQ+XSBsZWdhY3lfZ2V0X3RyZWUrMHhlZC8weDFkMAo+ICAgICAgICBbPGZmZmZm
ZmZmODE5MzZmMmQ+XSB2ZnNfZ2V0X3RyZWUrMHg3ZC8weDIzMAo+ICAgICAgICBbPGZmZmZmZmZm
ODE5YjJiZDQ+XSBwYXRoX21vdW50KzB4ZGQ0LzB4MTdiMAo+ICAgICAgICBbPGZmZmZmZmZmODE5
YjM3YWE+XSBfX3g2NF9zeXNfbW91bnQrMHgxZmEvMHgyNzAKPiAgICAgICAgWzxmZmZmZmZmZjgz
YzE0Mjk1Pl0gZG9fc3lzY2FsbF82NCsweDM1LzB4ODAKPiAgICAgICAgWzxmZmZmZmZmZjgzZTAw
MDZhPl0gZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDYvMHhiMAo+IAo+ICAgIHVu
cmVmZXJlbmNlZCBvYmplY3QgMHhmZmZmODg4MTc5OGE2ZTAwIChzaXplIDUxMik6Cj4gICAgICBj
b21tICJtb3VudCIsIHBpZCAxOTY3NywgamlmZmllcyA0Mjk3MTIxOTEyIChhZ2UgMzcuODE2cykK
PiAgICAgIGhleCBkdW1wIChmaXJzdCAzMiBieXRlcyk6Cj4gICAgICAgIDZiIDZiIDZiIDZiIDZi
IDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZiICBra2tra2tra2tra2tra2trCj4gICAg
ICAgIDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZiICBra2tr
a2tra2tra2tra2trCj4gICAgICBiYWNrdHJhY2U6Cj4gICAgICAgIFs8ZmZmZmZmZmY4MTc2Y2Vj
ZD5dIF9fa21hbGxvYysweDRkLzB4MTUwCj4gICAgICAgIFs8ZmZmZmZmZmZhMDQxODM0Mj5dIHVi
aWZzX3didWZfaW5pdCsweDUyLzB4NDgwIFt1Ymlmc10KPiAgICAgICAgWzxmZmZmZmZmZmEwNDA2
Y2E1Pl0gdWJpZnNfbW91bnQrMHgzMWY1LzB4NzE3MCBbdWJpZnNdCj4gICAgICAgIFs8ZmZmZmZm
ZmY4MTlmYThmZD5dIGxlZ2FjeV9nZXRfdHJlZSsweGVkLzB4MWQwCj4gICAgICAgIFs8ZmZmZmZm
ZmY4MTkzNmYyZD5dIHZmc19nZXRfdHJlZSsweDdkLzB4MjMwCj4gICAgICAgIFs8ZmZmZmZmZmY4
MTliMmJkND5dIHBhdGhfbW91bnQrMHhkZDQvMHgxN2IwCj4gICAgICAgIFs8ZmZmZmZmZmY4MTli
MzdhYT5dIF9feDY0X3N5c19tb3VudCsweDFmYS8weDI3MAo+ICAgICAgICBbPGZmZmZmZmZmODNj
MTQyOTU+XSBkb19zeXNjYWxsXzY0KzB4MzUvMHg4MAo+ICAgICAgICBbPGZmZmZmZmZmODNlMDAw
NmE+XSBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0Ni8weGIwCj4gCj4gVGhlIHBy
b2JsZW0gaXMgdGhhdCB0aGUgdWJpZnNfd2J1Zl9pbml0KCkgcmV0dXJucyBhbiBlcnJvciBpbiB0
aGUKPiBsb29wIHdoaWNoIGluIHRoZSBhbGxvY193YnVmcygpLCB0aGVuIHRoZSB3YnVmLT5idWYg
YW5kIHdidWYtPmlub2Rlcwo+IHRoYXQgd2VyZSBzdWNjZXNzZnVsbHkgYWxsb2NlZCBiZWZvcmUg
YXJlIG5vdCBmcmVlZC4KPiAKPiBGaXggaXQgYnkgYWRkaW5nIGVycm9yIGhhbmdpbmcgcGF0aCBp
biBhbGxvY193YnVmcygpIHdoaWNoIGZyZWVzCj4gdGhlIG1lbW9yeSBhbGxvY2VkIGJlZm9yZSB3
aGVuIHViaWZzX3didWZfaW5pdCgpIHJldHVybnMgYW4gZXJyb3IuCj4gCj4gRml4ZXM6IDFlNTE3
NjRhM2MyYSAoIlVCSUZTOiBhZGQgbmV3IGZsYXNoIGZpbGUgc3lzdGVtIikKPiBTaWduZWQtb2Zm
LWJ5OiBMaSBaZXRhbyA8bGl6ZXRhbzFAaHVhd2VpLmNvbT4KPiAtLS0KPiAgIGZzL3ViaWZzL3N1
cGVyLmMgfCAxNyArKysrKysrKysrKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVu
Z3poaWhhbzFAaHVhd2VpLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
