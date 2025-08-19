Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74744CA0EF5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Aug 2025 01:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vPvtXlIgoj6lZzlOcR6mlYX8jW9sdtcXs4JM0DsMjA=; b=BkKUedr40j6BalgfVAIwb/2vKz
	g4VTjoelrOduJ2PtjawJBdkU/BA9VC1Lcr9J2bOUOoJHDlqbJ1ymuOmWGx78h04xJ3WLnL1GyyldM
	91+CgjSwB37QMlCCgE+WZJhPdRzxy4k3SS+juNaAtyRb01HerKdL6pByoboaVld/2TwzjjVWlc1MA
	PKmemftryQnsn1koxKj68JQdTcnJRwo2lyByNq6mW5M54VXUCKhr7Rk6TaFP7ZsR9LbZNY21cHQY9
	2gX4qPLCgAJgNG7syQle2sTJkY4BC6t+vQCwLvqOjjG13dutPCsqbFglC/TAqke08ZtxaTONzPgin
	oTqpuDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoAyY-000000094DM-2uuj;
	Tue, 19 Aug 2025 01:17:22 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoAyW-000000094CL-13TL
	for linux-mtd@lists.infradead.org;
	Tue, 19 Aug 2025 01:17:21 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4c5Wlc4hBVzPqRD;
	Tue, 19 Aug 2025 09:12:28 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 7428B1402C4;
	Tue, 19 Aug 2025 09:17:04 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 Aug 2025 09:17:03 +0800
Subject: Re: [PATCH] ubifs: vmalloc(array_size()) -> vmalloc_array()
To: Qianfeng Rong <rongqianfeng@vivo.com>, Richard Weinberger
	<richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250817081238.44785-1-rongqianfeng@vivo.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <c46d7739-592e-b8c4-7a7e-6b39015156d7@huawei.com>
Date: Tue, 19 Aug 2025 09:17:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250817081238.44785-1-rongqianfeng@vivo.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_181720_431144_A158219B 
X-CRM114-Status: GOOD (  12.58  )
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

1NogMjAyNS84LzE3IDE2OjEyLCBRaWFuZmVuZyBSb25nINC0tcA6Cj4gUmVtb3ZlIGFycmF5X3Np
emUoKSBjYWxscyBhbmQgcmVwbGFjZSB2bWFsbG9jKCkgd2l0aCB2bWFsbG9jX2FycmF5KCkgaW4K
PiB1Ymlmc19jcmVhdGVfZGZsdF9scHQoKS9scHRfaW5pdF9yZCgpL2xwdF9pbml0X3dyKCkuIHZt
YWxsb2NfYXJyYXkoKSBpcwo+IG9wdGltaXplZCBiZXR0ZXIsIHJlc3VsdGluZyBpbiBsZXNzIGlu
c3RydWN0aW9ucyBiZWluZyB1c2VkIFsxXS4KPiAKPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvYWJjNjZlYzUtODVhNC00N2UxLTk3NTktMmY2MGFiMTExOTcxQHZpdm8uY29tLwo+
IAo+IFNpZ25lZC1vZmYtYnk6IFFpYW5mZW5nIFJvbmcgPHJvbmdxaWFuZmVuZ0B2aXZvLmNvbT4K
PiAtLS0KPiAgIGZzL3ViaWZzL2xwdC5jIHwgMTIgKysrKysrLS0tLS0tCj4gICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFpoaWhh
byBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gCj4gZGlmZiAtLWdpdCBhL2ZzL3Vi
aWZzL2xwdC5jIGIvZnMvdWJpZnMvbHB0LmMKPiBpbmRleCA0NDFkMGJlY2E0Y2YuLmRkZTBhYTMy
ODdmNCAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9scHQuYwo+ICsrKyBiL2ZzL3ViaWZzL2xwdC5j
Cj4gQEAgLTYyOCw4ICs2MjgsOCBAQCBpbnQgdWJpZnNfY3JlYXRlX2RmbHRfbHB0KHN0cnVjdCB1
Ymlmc19pbmZvICpjLCBpbnQgKm1haW5fbGVicywgaW50IGxwdF9maXJzdCwKPiAgIAlwbm9kZSA9
IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCB1Ymlmc19wbm9kZSksIEdGUF9LRVJORUwpOwo+ICAgCW5u
b2RlID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHViaWZzX25ub2RlKSwgR0ZQX0tFUk5FTCk7Cj4g
ICAJYnVmID0gdm1hbGxvYyhjLT5sZWJfc2l6ZSk7Cj4gLQlsdGFiID0gdm1hbGxvYyhhcnJheV9z
aXplKHNpemVvZihzdHJ1Y3QgdWJpZnNfbHB0X2xwcm9wcyksCj4gLQkJCQkgIGMtPmxwdF9sZWJz
KSk7Cj4gKwlsdGFiID0gdm1hbGxvY19hcnJheShjLT5scHRfbGVicywKPiArCQkJICAgICBzaXpl
b2Yoc3RydWN0IHViaWZzX2xwdF9scHJvcHMpKTsKPiAgIAlpZiAoIXBub2RlIHx8ICFubm9kZSB8
fCAhYnVmIHx8ICFsdGFiIHx8ICFsc2F2ZSkgewo+ICAgCQllcnIgPSAtRU5PTUVNOwo+ICAgCQln
b3RvIG91dDsKPiBAQCAtMTc3Nyw4ICsxNzc3LDggQEAgc3RhdGljIGludCBscHRfaW5pdF9yZChz
dHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiAgIHsKPiAgIAlpbnQgZXJyLCBpOwo+ICAgCj4gLQljLT5s
dGFiID0gdm1hbGxvYyhhcnJheV9zaXplKHNpemVvZihzdHJ1Y3QgdWJpZnNfbHB0X2xwcm9wcyks
Cj4gLQkJCQkgICAgIGMtPmxwdF9sZWJzKSk7Cj4gKwljLT5sdGFiID0gdm1hbGxvY19hcnJheShj
LT5scHRfbGVicywKPiArCQkJCXNpemVvZihzdHJ1Y3QgdWJpZnNfbHB0X2xwcm9wcykpOwo+ICAg
CWlmICghYy0+bHRhYikKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4gICAKPiBAQCAtMTg0Niw4ICsx
ODQ2LDggQEAgc3RhdGljIGludCBscHRfaW5pdF93cihzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiAg
IHsKPiAgIAlpbnQgZXJyLCBpOwo+ICAgCj4gLQljLT5sdGFiX2NtdCA9IHZtYWxsb2MoYXJyYXlf
c2l6ZShzaXplb2Yoc3RydWN0IHViaWZzX2xwdF9scHJvcHMpLAo+IC0JCQkJCSBjLT5scHRfbGVi
cykpOwo+ICsJYy0+bHRhYl9jbXQgPSB2bWFsbG9jX2FycmF5KGMtPmxwdF9sZWJzLAo+ICsJCQkJ
ICAgIHNpemVvZihzdHJ1Y3QgdWJpZnNfbHB0X2xwcm9wcykpOwo+ICAgCWlmICghYy0+bHRhYl9j
bXQpCj4gICAJCXJldHVybiAtRU5PTUVNOwo+ICAgCj4gCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
