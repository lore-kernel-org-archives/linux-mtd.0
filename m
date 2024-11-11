Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8309AD12D5D
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 01:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fKsg6Hl7NIl19pfbwB38B7RYRjE2NlavHq0C2CYRnk=; b=urKfxX9k+ukp9UOjEINierbO09
	WhytpLMSezCI2R/6K8sHPPatQRnstnWlii4HdJuVo5wjS21ICsnMKx5v5UTSYG0RUJKnOErQx8RZl
	i9drKr+ufHhedPB0Jf6gjuYxyLwX7kJIwnBfQ2mxm3LygYnnS8Anxt1Yoxoax0wvDELLtWMuYyV9g
	++ayAHijeWY8vuqYNDen6FNJcLQe7CNehIvYdqrvV+TQy9LTjBnG1KcTs0V1Dpf+lU7XAIhLS9AcZ
	sc1RiYsMikc3IphGqdilcuKzvFFtCgsD17zERivw9AgSt91zn6+r+Zt0K//J8xRg/1TaSgjMvR2ID
	5mQKSA8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAJ9w-0000000G1I7-3Gvd;
	Mon, 11 Nov 2024 01:24:04 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAJ9s-0000000G1HR-0rRl
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 01:24:02 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XmsGM0gv8z1hwRD;
	Mon, 11 Nov 2024 09:22:03 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A36F1A0188;
	Mon, 11 Nov 2024 09:23:50 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 11 Nov 2024 09:23:49 +0800
Subject: Re: [PATCH v2] ubifs: Fix use-after-free in ubifs_tnc_end_commit
To: Waqar Hameed <waqar.hameed@axis.com>
CC: Richard Weinberger <richard@nod.at>, Sascha Hauer
	<s.hauer@pengutronix.de>, <kernel@axis.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <e7b5151bb1186e2342ed677cce0ef77592923084.1731088341.git.waqar.hameed@axis.com>
 <3c46013e-809e-cdcf-8648-2ffe2ab6c32b@huawei.com> <pndbjymzrnh.fsf@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f43655b7-0283-0008-1475-67174533d21a@huawei.com>
Date: Mon, 11 Nov 2024 09:23:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <pndbjymzrnh.fsf@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_172400_433448_038F704D 
X-CRM114-Status: GOOD (  15.06  )
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

5ZyoIDIwMjQvMTEvMTEgNTo0OCwgV2FxYXIgSGFtZWVkIOWGmemBkzoKPiBPbiBTYXQsIE5vdiAw
OSwgMjAyNCBhdCAxMDozNCArMDgwMCBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWku
Y29tPiB3cm90ZToKPiAKPj4g5ZyoIDIwMjQvMTAvOSAyMjo0NiwgV2FxYXIgSGFtZWVkIOWGmemB
kzoKPj4gMyBuaXRzIGJlbG93Lgo+Pgo+PiAxLiBNYWtlIHRoZSB0aXRsZSBhcyAndWJpZnM6IGF1
dGhlbnRpY2F0aW9uOiBGaXggdXNlLWFmdGVyLWZyZWUgaW4KPj4gdWJpZnNfdG5jX2VuZF9jb21t
aXQnCj4+Cj4+IDIuIEF0IHRoZSBiZWdpbmluZyBvZiB0aGUgY29tbWl0IG1zZywgZGVzY3JpYmUg
dGhlIHByb2JsZW06Cj4+IEFmdGVyIFROQyB0cmVlIGluc2VydGluZyh3aGljaCBtYXkgdHJpZ2dl
ciBhIHpub2RlIHNwbGl0IGFuZCBjaGFuZ2UgdGhlCj4+IHpub2RlLT5wYXJlbnQpIGFuZCBkZWxl
dGluZyh3aGljaCBtYXkgdHJpZ2dlciB6bm9kZSBmcmVlaW5nKSwgdGhlCj4+IHpub2RlLT5jcGFy
ZW50KHdoaWNoIHN0aWxsIHBvaW50cyB0byBhIGZyZWVkIHpub2RlKSBtYXkgbm90IGJlIHVwZGF0
ZWQgYXQgdGhlCj4+IGJlZ2luaW5nIG9mIGNvbW1pdCwgd2hpY2ggY291bGQgdHJpZ2dlciBhbiBV
QUYgcHJvYmxlbSB3aGlsZSBhY2Nlc3NpbmcKPj4gem5vZGUtPmNwYXJlbnQgaW4gd3JpdGVfaW5k
ZXgoKS4KPiAKPiBBbHJpZ2h0LCB3aWxsIHJlcGhyYXNlIHRoZSBjb21taXQgbWVzc2FnZSBhIGJp
dC4KPiAKPj4KPj4+IFJ1bm5pbmcKPj4+ICAgICBybSAtZiAvZXRjL3Rlc3QtZmlsZS5iaW4KPj4+
ICAgICBkZCBpZj0vZGV2L3VyYW5kb20gb2Y9L2V0Yy90ZXN0LWZpbGUuYmluIGJzPTFNIGNvdW50
PTYwIGNvbnY9ZnN5bmMKPj4+IGluIGEgbG9vcCwgd2l0aCBgQ09ORklHX1VCSUZTX0ZTX0FVVEhF
TlRJQ0FUSU9OYCwgS0FTQU4gcmVwb3J0czoKPj4+ICAgICBCVUc6IEtBU0FOOiB1c2UtYWZ0ZXIt
ZnJlZSBpbiB1Ymlmc190bmNfZW5kX2NvbW1pdCsweGE1Yy8weDE5NTAKPj4+ICAgICBXcml0ZSBv
ZiBzaXplIDMyIGF0IGFkZHIgZmZmZmZmODAwYTNhZjg2YyBieSB0YXNrIHViaWZzX2JndDBfMjAv
MTUzCj4+PiAgICAgQ2FsbCB0cmFjZToKPj4KPj4gWy4uLl0KPj4+IGRpZmYgLS1naXQgYS9mcy91
Ymlmcy90bmNfY29tbWl0LmMgYi9mcy91Ymlmcy90bmNfY29tbWl0LmMKPj4+IGluZGV4IGE1NWUw
NDgyMmQxNi4uYTQ2NGViNTU3NTg1IDEwMDY0NAo+Pj4gLS0tIGEvZnMvdWJpZnMvdG5jX2NvbW1p
dC5jCj4+PiArKysgYi9mcy91Ymlmcy90bmNfY29tbWl0LmMKPj4+IEBAIC02NTcsNiArNjU3LDcg
QEAgc3RhdGljIGludCBnZXRfem5vZGVzX3RvX2NvbW1pdChzdHJ1Y3QgdWJpZnNfaW5mbyAqYykK
Pj4+ICAgIAkJem5vZGUtPmFsdCA9IDA7Cj4+PiAgICAJCWNuZXh0ID0gZmluZF9uZXh0X2RpcnR5
KHpub2RlKTsKPj4+ICAgIAkJaWYgKCFjbmV4dCkgewo+Pgo+PiAzLiBJJ2QgbGlrZSB0byBhZGQg
dGhlIHRoZSBhc3NlcnRpb24gJ3ViaWZzX2Fzc2VydChjLCAhem5vZGUtPnBhcmVudCk7Jwo+IAo+
IFdvdWxkbid0IHRoZSBhc3NlcnQgYWx3YXlzIGJlIHRydWU/IFNpbmNlIHRoZSByb290IG5vZGUg
d291bGRuJ3QgaGF2ZSBhCj4gcGFyZW50LiBPciBhcmUgd2UgYWZyYWlkIG9mIHNvbWUgb3RoZXIg
ZWRnZSBjYXNlcyAoYnVncz8pIHRoYXQgbWlnaHQKPiBoYXZlIGJlZW4gbWlzc2VkIGFuZCB3YW50
IHRvIGJlIGRlZmVuc2l2ZSBoZXJlPyBFaXRoZXIgd2F5LCBJJ2xsIGFkZCB0aGUKPiBhc3NlcnQu
CgpBIGRlZmVuc2l2ZSBjb2RlIGhlcmUgaXMgdG8gcHJldmVudCBzb21lIHVua25vd24gYnVncywg
aW4gd2hpY2ggdGhlIGxhc3QgCnJldHVybmVkIHpub2RlIGhhcyBhIHBhcmVudCwgYWx0aG91Z2gg
aXQgbG9va3MgaW1wb3NzaWJsZSBmb3IgY3VycmVudCAKcmVhbGl6YXRpb24uCj4gCj4+PiArCQkJ
em5vZGUtPmNwYXJlbnQgPSBOVUxMOwo+Pj4gICAgCQkJem5vZGUtPmNuZXh0ID0gYy0+Y25leHQ7
Cj4+PiAgICAJCQlicmVhazsKPj4+ICAgIAkJfQo+Pj4KPiAuCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
