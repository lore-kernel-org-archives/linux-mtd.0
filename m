Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFA1C369D1
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Apr 2025 03:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uUsvEx+hwAUuaArURR8YGEDmFW+/gtOitGCk1OHQvY=; b=0rgl9UVAjGTSR911S65I2gs7SL
	pz/qCJBumucpR0tBAaaKuhSVVsKjzCED1+hNb/CaM4SxPOWbbHxea7P+28H2HpMLw3nzPkyUr8nvJ
	gexHCrqVmi+xSMNgncjDghMrQJydJ//DKnfvY8DFhULse93rje7LVP21Y+980/z5pBzJvC6hm08oF
	BKX3JVHp5YLz9aYYYM7b/NDaHaKI/NcT1V3d9GjooBuG8UqX/Yxa+Ub9fa/B9F/y8v/U7XxdMPNCc
	divw6PTAvwzgTLHirOQb57/DC8Fn2j7emsyttnOuy/dKynlOtdl+ogaIiadbVmAjg1QLZ+m/zWPv0
	52T6DBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89eE-0000000FqpE-0lfV;
	Fri, 25 Apr 2025 03:22:42 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89e9-0000000Fqof-0a9y
	for linux-mtd@lists.infradead.org;
	Fri, 25 Apr 2025 03:22:39 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4ZkJ6l3JMPzsSgg
	for <linux-mtd@lists.infradead.org>; Fri, 25 Apr 2025 11:22:07 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id DA7871A0188
	for <linux-mtd@lists.infradead.org>; Fri, 25 Apr 2025 11:22:26 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 25 Apr 2025 11:22:26 +0800
Subject: Re: [PATCH] ubifs-utils: common: fix memory leak in devtable.c
To: <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20250424181922.17531-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e3b58d69-ca9a-2201-ae8b-e5a7e51bcd2e@huawei.com>
Date: Fri, 25 Apr 2025 11:22:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250424181922.17531-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_202237_325061_D3F0220E 
X-CRM114-Status: GOOD (  11.29  )
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

1NogMjAyNS80LzI1IDI6MTksIGFudC52Lm1vcnlha292QGdtYWlsLmNvbSDQtLXAOgo+IEZyb206
IEFudG9uTW9yeWFrb3YgPGFudC52Lm1vcnlha292QGdtYWlsLmNvbT4KPiAKPiBSZXBvcnQgb2Yg
dGhlIHN0YXRpYyBhbmFseXplcjoKPiBEeW5hbWljIG1lbW9yeSwgcmVmZXJlbmNlZCBieSAnbGlu
ZScsIGlzIGFsbG9jYXRlZCBhdCBkZXZ0YWJsZS5jOjM1Ngo+IGJ5IGNhbGxpbmcgZnVuY3Rpb24g
J2dldGxpbmUnIGFuZCBsb3N0IGF0IGRldnRhYmxlLmM6Mzg4Lgo+IChsaW5lOiB3aGlsZSAoZ2V0
bGluZSgmbGluZSwgJmxlbiwgZikgIT0gLTEpIHspCj4gCj4gQ29ycmVjdCBleHBsYWluZWQ6Cj4g
Tm93IGxpbmUgaXMgZnJlZWQgaW4gYW55IGV4aXQgc2NlbmFyaW8gdmlhIG91dF9jbG9zZSB3aGlj
aCBlbGltaW5hdGVzIHRoaXMgZXJyb3IuCj4gCj4gVHJpZ2dlcnMgZm91bmQgYnkgc3RhdGljIGFu
YWx5emVyIFN2YWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFudG9uIE1vcnlha292IDxhbnQudi5t
b3J5YWtvdkBnbWFpbC5jbwo+IAo+IC0tLQo+ICAgdWJpZnMtdXRpbHMvY29tbW9uL2RldnRhYmxl
LmMgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKCkFjY29yZGluZyB0
byB0aGUgcmVhbGl6YXRpb24gb2YgZ2V0bGluZVsxXSwgZmVlbCBmcmVlIHRvIGFkZDoKClJldmll
d2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKWzFdIGh0dHBz
Oi8vZ2l0aHViLmNvbS9ibWlub3IvZ2xpYmMvYmxvYi9tYXN0ZXIvbGliaW8vaW9nZXRkZWxpbS5j
I0w0MAo+IAo+IGRpZmYgLS1naXQgYS91Ymlmcy11dGlscy9jb21tb24vZGV2dGFibGUuYyBiL3Vi
aWZzLXV0aWxzL2NvbW1vbi9kZXZ0YWJsZS5jCj4gaW5kZXggNzM0N2YwOS4uMmU1ODFmZiAxMDA2
NDQKPiAtLS0gYS91Ymlmcy11dGlscy9jb21tb24vZGV2dGFibGUuYwo+ICsrKyBiL3ViaWZzLXV0
aWxzL2NvbW1vbi9kZXZ0YWJsZS5jCj4gQEAgLTM5Miw2ICszOTIsNyBAQCBpbnQgcGFyc2VfZGV2
dGFibGUoY29uc3QgY2hhciAqdGJsX2ZpbGUpCj4gICAKPiAgIG91dF9jbG9zZToKPiAgIAlmY2xv
c2UoZik7Cj4gKwlmcmVlKGxpbmUpOwo+ICAgCWZyZWVfZGV2dGFibGVfaW5mbygpOwo+ICAgCXJl
dHVybiAtMTsKPiAgIH0KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
