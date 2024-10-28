Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86EBD13590
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2024 01:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFsG7DaGK/2VdA+jJvxLtLLnCkHOFX4jxAIOI32N34w=; b=GH3wyMsfvlBO71YAu5rK+9uFRe
	rTqVDLv5jV+r70fL409L6gVChEw2jvL39ZQsLBY4k0rFKqipkV3maMmEKHYCl8eaYy3bVM7bnjLmX
	a6u4jzMD9bVbvOaLtJUX1QJGsrVv2tObqKCHEeAi5pQaQq5EWTK7eoIRND696qY98NEdasITXK3DR
	5THkKzN+dq8/xinY2F8GTn9/IlD/wiXRHY0IUl3UTpiFk/1VRGrurZGdu6mwhXLgFu7UQsMgKtVtX
	6rPrxyoUx11PlO3fXzurW3zO3rFcnLDrcnuqmMXFlFrga+Lbn3FQNxZSGnSC37uaikzg3+OS7Y0bs
	w0s2SeNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5EKh-00000009C7r-0WUT;
	Mon, 28 Oct 2024 01:14:11 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5EKZ-00000009C1u-0JvI
	for linux-mtd@lists.infradead.org;
	Mon, 28 Oct 2024 01:14:07 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XcFhN2cPMzfdG0;
	Mon, 28 Oct 2024 09:11:16 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id D4A4C180115;
	Mon, 28 Oct 2024 09:13:48 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 28 Oct 2024 09:13:47 +0800
Subject: Re: [PATCH] jffs2: Use str_yes_no() helper function
To: Thorsten Blum <thorsten.blum@linux.dev>, David Woodhouse
	<dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Randy Dunlap
	<rdunlap@infradead.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241026111903.112647-2-thorsten.blum@linux.dev>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <cb01b563-a636-ed47-4cbd-42c5ed806860@huawei.com>
Date: Mon, 28 Oct 2024 09:13:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241026111903.112647-2-thorsten.blum@linux.dev>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_181403_416782_D567BF1A 
X-CRM114-Status: GOOD (  10.59  )
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

1NogMjAyNC8xMC8yNiAxOToxOSwgVGhvcnN0ZW4gQmx1bSDQtLXAOgo+IFJlbW92ZSBoYXJkLWNv
ZGVkIHN0cmluZ3MgYnkgdXNpbmcgdGhlIHN0cl95ZXNfbm8oKSBoZWxwZXIgZnVuY3Rpb24uCj4g
Cj4gU2lnbmVkLW9mZi1ieTogVGhvcnN0ZW4gQmx1bSA8dGhvcnN0ZW4uYmx1bUBsaW51eC5kZXY+
Cj4gLS0tCj4gICBmcy9qZmZzMi9ub2RlbWdtdC5jIHwgOSArKysrKy0tLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCgpSZXZpZXdlZC1ieTog
WmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBkaWZmIC0tZ2l0IGEvZnMv
amZmczIvbm9kZW1nbXQuYyBiL2ZzL2pmZnMyL25vZGVtZ210LmMKPiBpbmRleCBiYmFiMmJkYzcx
YjYuLjY5NTY5ODY0NjMwZSAxMDA2NDQKPiAtLS0gYS9mcy9qZmZzMi9ub2RlbWdtdC5jCj4gKysr
IGIvZnMvamZmczIvbm9kZW1nbXQuYwo+IEBAIC0xNSw2ICsxNSw3IEBACj4gICAjaW5jbHVkZSA8
bGludXgvbXRkL210ZC5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2NvbXBpbGVyLmg+Cj4gICAjaW5j
bHVkZSA8bGludXgvc2NoZWQvc2lnbmFsLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zdHJpbmdfY2hv
aWNlcy5oPgo+ICAgI2luY2x1ZGUgIm5vZGVsaXN0LmgiCj4gICAjaW5jbHVkZSAiZGVidWcuaCIK
PiAgIAo+IEBAIC0zMTcsOSArMzE4LDkgQEAgc3RhdGljIGludCBqZmZzMl9maW5kX25leHRibG9j
ayhzdHJ1Y3QgamZmczJfc2JfaW5mbyAqYykKPiAgIAkJCSAgIEFuZCB0aGVyZSdzIG5vIHNwYWNl
IGxlZnQuIEF0IGFsbC4gKi8KPiAgIAkJCXByX2NyaXQoIkFyZ2guIE5vIGZyZWUgc3BhY2UgbGVm
dCBmb3IgR0MuIG5yX2VyYXNpbmdfYmxvY2tzIGlzICVkLiBucl9mcmVlX2Jsb2NrcyBpcyAlZC4g
KGVyYXNhYmxlZW1wdHk6ICVzLCBlcmFzaW5nZW1wdHk6ICVzLCBlcmFzZXBlbmRpbmdlbXB0eTog
JXMpXG4iLAo+ICAgCQkJCWMtPm5yX2VyYXNpbmdfYmxvY2tzLCBjLT5ucl9mcmVlX2Jsb2NrcywK
PiAtCQkJCWxpc3RfZW1wdHkoJmMtPmVyYXNhYmxlX2xpc3QpID8gInllcyIgOiAibm8iLAo+IC0J
CQkJbGlzdF9lbXB0eSgmYy0+ZXJhc2luZ19saXN0KSA/ICJ5ZXMiIDogIm5vIiwKPiAtCQkJCWxp
c3RfZW1wdHkoJmMtPmVyYXNlX3BlbmRpbmdfbGlzdCkgPyAieWVzIiA6ICJubyIpOwo+ICsJCQkJ
c3RyX3llc19ubyhsaXN0X2VtcHR5KCZjLT5lcmFzYWJsZV9saXN0KSksCj4gKwkJCQlzdHJfeWVz
X25vKGxpc3RfZW1wdHkoJmMtPmVyYXNpbmdfbGlzdCkpLAo+ICsJCQkJc3RyX3llc19ubyhsaXN0
X2VtcHR5KCZjLT5lcmFzZV9wZW5kaW5nX2xpc3QpKSk7Cj4gICAJCQlyZXR1cm4gLUVOT1NQQzsK
PiAgIAkJfQo+ICAgCj4gQEAgLTg4Myw3ICs4ODQsNyBAQCBpbnQgamZmczJfdGhyZWFkX3Nob3Vs
ZF93YWtlKHN0cnVjdCBqZmZzMl9zYl9pbmZvICpjKQo+ICAgCj4gICAJamZmczJfZGJnKDEsICIl
cygpOiBucl9mcmVlX2Jsb2NrcyAlZCwgbnJfZXJhc2luZ19ibG9ja3MgJWQsIGRpcnR5X3NpemUg
MHgleCwgdmRpcnR5X2Jsb2NrcyAlZDogJXNcbiIsCj4gICAJCSAgX19mdW5jX18sIGMtPm5yX2Zy
ZWVfYmxvY2tzLCBjLT5ucl9lcmFzaW5nX2Jsb2NrcywKPiAtCQkgIGMtPmRpcnR5X3NpemUsIG5y
X3ZlcnlfZGlydHksIHJldCA/ICJ5ZXMiIDogIm5vIik7Cj4gKwkJICBjLT5kaXJ0eV9zaXplLCBu
cl92ZXJ5X2RpcnR5LCBzdHJfeWVzX25vKHJldCkpOwo+ICAgCj4gICAJcmV0dXJuIHJldDsKPiAg
IH0KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
