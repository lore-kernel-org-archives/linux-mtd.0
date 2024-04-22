Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C47C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2024 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bE+Q+T0NgBgrAXdTXcHuFDgha4KQNkjDQw/ItsQHFpY=; b=ip1vaRfhraGaYcXwR4WifH56yd
	hmYz5RrXiWaITLqDdx5EQ77BDjYCUr6yCB2wI3bjKFMpBjD0MUanfBhUDOSi8Q7LwVF6UmYZbfPaY
	TvTq1g5idJp0xqa1QfR1fLWX0qvR4rjm6grrmzHgReRBlqNzzY4j0jNLGpytoGNoGplYW+eOlJXPe
	UfqkC13v+V0y+SOBHtzcQNMM7pe1hcck0vWdyJbDlZZX5hzM0TsycidFQPXDmEkNH5AQW5JW0Tvrl
	SeZKnANYYnY+3cDn1OnQURTgv0xAetLTsYNeuwuT9xRoF8ynM3xN8TktyEIaFQjXZgQ1FRBAcZfaq
	uxFaIszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryuwa-0000000Dz5G-4ACS;
	Mon, 22 Apr 2024 14:46:56 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryuwX-0000000Dz2u-2G1d
	for linux-mtd@lists.infradead.org;
	Mon, 22 Apr 2024 14:46:55 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VNSfS3SlkzXlQn;
	Mon, 22 Apr 2024 22:43:12 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 2B024180072;
	Mon, 22 Apr 2024 22:46:39 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 22:46:38 +0800
Subject: Re: [PATCH 14/30] jffs2: Remove calls to set/clear the folio error
 flag
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	<linux-fsdevel@vger.kernel.org>
CC: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
	<richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <20240420025029.2166544-1-willy@infradead.org>
 <20240420025029.2166544-15-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <75dbe998-231a-4dd3-70de-d98bf8ee3349@huawei.com>
Date: Mon, 22 Apr 2024 22:46:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240420025029.2166544-15-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_074653_785354_E0C9E7A6 
X-CRM114-Status: GOOD (  21.11  )
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

1NogMjAyNC80LzIwIDEwOjUwLCBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSDQtLXAOgo+IE5vYm9k
eSBjaGVja3MgdGhlIGVycm9yIGZsYWcgb24gamZmczIgZm9saW9zLCBzbyBzdG9wIHNldHRpbmcg
YW5kCj4gY2xlYXJpbmcgaXQuICBXZSBjYW4gYWxzbyByZW1vdmUgdGhlIGNhbGwgdG8gY2xlYXIg
dGhlIHVwdG9kYXRlCj4gZmxhZzsgaXQgd2lsbCBhbHJlYWR5IGJlIGNsZWFyLgo+IAo+IENvbnZl
cnQgb25lIG9mIHRoZXNlIGludG8gYSBjYWxsIHRvIG1hcHBpbmdfc2V0X2Vycm9yKCkgd2hpY2gg
d2lsbAo+IGFjdHVhbGx5IGJlIGNoZWNrZWQgYnkgb3RoZXIgcGFydHMgb2YgdGhlIGtlcm5lbC4K
PiAKPiBDYzogRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPgo+IENjOiBSaWNo
YXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgV2lsY294IChPcmFjbGUpIDx3aWxs
eUBpbmZyYWRlYWQub3JnPgo+IC0tLQo+ICAgZnMvamZmczIvZmlsZS5jIHwgMTQgKysrLS0tLS0t
LS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQoKeGZzdGVzdHMgcGFzc2VkLiBMb29rcyBsaWtlIHRoZSBjaGFuZ2UgaXMgaGFybWxlc3MuCgpU
ZXN0ZWQtYnk6IFJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWku
Y29tPgo+IAo+IGRpZmYgLS1naXQgYS9mcy9qZmZzMi9maWxlLmMgYi9mcy9qZmZzMi9maWxlLmMK
PiBpbmRleCA2MmVhNzZkYTdmZGYuLmUxMmNiMTQ1MTQ3ZSAxMDA2NDQKPiAtLS0gYS9mcy9qZmZz
Mi9maWxlLmMKPiArKysgYi9mcy9qZmZzMi9maWxlLmMKPiBAQCAtOTUsMTMgKzk1LDggQEAgc3Rh
dGljIGludCBqZmZzMl9kb19yZWFkcGFnZV9ub2xvY2sgKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0
cnVjdCBwYWdlICpwZykKPiAgIAlyZXQgPSBqZmZzMl9yZWFkX2lub2RlX3JhbmdlKGMsIGYsIHBn
X2J1ZiwgcGctPmluZGV4IDw8IFBBR0VfU0hJRlQsCj4gICAJCQkJICAgICBQQUdFX1NJWkUpOwo+
ICAgCj4gLQlpZiAocmV0KSB7Cj4gLQkJQ2xlYXJQYWdlVXB0b2RhdGUocGcpOwo+IC0JCVNldFBh
Z2VFcnJvcihwZyk7Cj4gLQl9IGVsc2Ugewo+ICsJaWYgKCFyZXQpCj4gICAJCVNldFBhZ2VVcHRv
ZGF0ZShwZyk7Cj4gLQkJQ2xlYXJQYWdlRXJyb3IocGcpOwo+IC0JfQo+ICAgCj4gICAJZmx1c2hf
ZGNhY2hlX3BhZ2UocGcpOwo+ICAgCWt1bm1hcChwZyk7Cj4gQEAgLTMwNCwxMCArMjk5LDggQEAg
c3RhdGljIGludCBqZmZzMl93cml0ZV9lbmQoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCBhZGRy
ZXNzX3NwYWNlICptYXBwaW5nLAo+ICAgCj4gICAJa3VubWFwKHBnKTsKPiAgIAo+IC0JaWYgKHJl
dCkgewo+IC0JCS8qIFRoZXJlIHdhcyBhbiBlcnJvciB3cml0aW5nLiAqLwo+IC0JCVNldFBhZ2VF
cnJvcihwZyk7Cj4gLQl9Cj4gKwlpZiAocmV0KQo+ICsJCW1hcHBpbmdfc2V0X2Vycm9yKG1hcHBp
bmcsIHJldCk7Cj4gICAKPiAgIAkvKiBBZGp1c3Qgd3JpdHRlbmxlbiBmb3IgdGhlIHBhZGRpbmcg
d2UgZGlkLCBzbyB3ZSBkb24ndCBjb25mdXNlIG91ciBjYWxsZXIgKi8KPiAgIAl3cml0dGVubGVu
IC09IG1pbih3cml0dGVubGVuLCAoc3RhcnQgLSBhbGlnbmVkX3N0YXJ0KSk7Cj4gQEAgLTMzMCw3
ICszMjMsNiBAQCBzdGF0aWMgaW50IGpmZnMyX3dyaXRlX2VuZChzdHJ1Y3QgZmlsZSAqZmlscCwg
c3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4gICAJCSAgIGl0IGdldHMgcmVyZWFkICov
Cj4gICAJCWpmZnMyX2RiZygxLCAiJXMoKTogTm90IGFsbCBieXRlcyB3cml0dGVuLiBNYXJraW5n
IHBhZ2UgIXVwdG9kYXRlXG4iLAo+ICAgCQkJX19mdW5jX18pOwo+IC0JCVNldFBhZ2VFcnJvcihw
Zyk7Cj4gICAJCUNsZWFyUGFnZVVwdG9kYXRlKHBnKTsKPiAgIAl9Cj4gICAKPiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
