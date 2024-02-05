Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A1BC4828D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 11:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOM5IuxCK10PsiScGYCdOqZDwkFeBopQJbRvBfRn/Mw=; b=466dDruKyKoqeov8WZRx28fud1
	agZwUd7HytpDDO2GucSa5BWeBJR57WUMx4jkCOnevPdoc3WWcjx7cmWerErJx9iOzH8I/V9UB0m55
	ewV9chwQm/iQ5O0CV98t6cithW5Zd9KHeq3X8H/MRKcKqJUZftvnUFbVizaWkcpO29qH77YaFqCum
	Fw2cRx8vJ7R78k2kmdNCCArH8Wsw64/oZ9hBt59yFKdz0NWwaCZaoV8xinKDu80OxYRl0xs0HTPg0
	3pCvDuTk31PEPxtPephbOss9sgX/hs5mGYPfpQQOI8nqoVFzlNydO//0z2nDQmF9EA2OTy3bT3xv4
	0vENhlwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWxLZ-000000031Ru-2oVC;
	Mon, 05 Feb 2024 11:41:09 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWxLV-000000031Pt-3Trd
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 11:41:07 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TT4CR1MrWz29lHD;
	Mon,  5 Feb 2024 19:38:59 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 120B61A0172;
	Mon,  5 Feb 2024 19:40:54 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 19:40:53 +0800
Subject: Re: [PATCH] jffs2: Simplify the allocation of slab caches
To: Kunwu Chan <chentao@kylinos.cn>, <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240205075144.431567-1-chentao@kylinos.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <fe71e834-3b13-9b9c-db87-ba106e8c78e0@huawei.com>
Date: Mon, 5 Feb 2024 19:40:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240205075144.431567-1-chentao@kylinos.cn>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_034106_196037_7BC8491C 
X-CRM114-Status: GOOD (  12.00  )
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

1NogMjAyNC8yLzUgMTU6NTEsIEt1bnd1IENoYW4g0LS1wDoKPiBVc2UgdGhlIG5ldyBLTUVNX0NB
Q0hFKCkgbWFjcm8gaW5zdGVhZCBvZiBkaXJlY3Qga21lbV9jYWNoZV9jcmVhdGUKPiB0byBzaW1w
bGlmeSB0aGUgY3JlYXRpb24gb2YgU0xBQiBjYWNoZXMuCj4gQW5kIGNoYW5nZSBjYWNoZSBuYW1l
IGZyb20gJ2pmZnMyX3RtcF9kbm9kZScgdG8gJ2pmZnMyX3RtcF9kbm9kZV9pbmZvJy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBLdW53dSBDaGFuIDxjaGVudGFvQGt5bGlub3MuY24+Cj4gLS0tCj4gICBm
cy9qZmZzMi9tYWxsb2MuYyB8IDMyICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKClJldmll
d2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiAKPiBkaWZm
IC0tZ2l0IGEvZnMvamZmczIvbWFsbG9jLmMgYi9mcy9qZmZzMi9tYWxsb2MuYwo+IGluZGV4IGNl
MTE4OTc5MzI4OC4uNDExZGU4YjM2MWIyIDEwMDY0NAo+IC0tLSBhL2ZzL2pmZnMyL21hbGxvYy5j
Cj4gKysrIGIvZnMvamZmczIvbWFsbG9jLmMKPiBAQCAtMzMsMjcgKzMzLDE5IEBAIHN0YXRpYyBz
dHJ1Y3Qga21lbV9jYWNoZSAqeGF0dHJfcmVmX2NhY2hlOwo+ICAgCj4gICBpbnQgX19pbml0IGpm
ZnMyX2NyZWF0ZV9zbGFiX2NhY2hlcyh2b2lkKQo+ICAgewo+IC0JZnVsbF9kbm9kZV9zbGFiID0g
a21lbV9jYWNoZV9jcmVhdGUoImpmZnMyX2Z1bGxfZG5vZGUiLAo+IC0JCQkJCSAgICBzaXplb2Yo
c3RydWN0IGpmZnMyX2Z1bGxfZG5vZGUpLAo+IC0JCQkJCSAgICAwLCAwLCBOVUxMKTsKPiArCWZ1
bGxfZG5vZGVfc2xhYiA9IEtNRU1fQ0FDSEUoamZmczJfZnVsbF9kbm9kZSwgMCk7Cj4gICAJaWYg
KCFmdWxsX2Rub2RlX3NsYWIpCj4gICAJCWdvdG8gZXJyOwo+ICAgCj4gLQlyYXdfZGlyZW50X3Ns
YWIgPSBrbWVtX2NhY2hlX2NyZWF0ZSgiamZmczJfcmF3X2RpcmVudCIsCj4gLQkJCQkJICAgIHNp
emVvZihzdHJ1Y3QgamZmczJfcmF3X2RpcmVudCksCj4gLQkJCQkJICAgIDAsIFNMQUJfSFdDQUNI
RV9BTElHTiwgTlVMTCk7Cj4gKwlyYXdfZGlyZW50X3NsYWIgPSBLTUVNX0NBQ0hFKGpmZnMyX3Jh
d19kaXJlbnQsIFNMQUJfSFdDQUNIRV9BTElHTik7Cj4gICAJaWYgKCFyYXdfZGlyZW50X3NsYWIp
Cj4gICAJCWdvdG8gZXJyOwo+ICAgCj4gLQlyYXdfaW5vZGVfc2xhYiA9IGttZW1fY2FjaGVfY3Jl
YXRlKCJqZmZzMl9yYXdfaW5vZGUiLAo+IC0JCQkJCSAgIHNpemVvZihzdHJ1Y3QgamZmczJfcmF3
X2lub2RlKSwKPiAtCQkJCQkgICAwLCBTTEFCX0hXQ0FDSEVfQUxJR04sIE5VTEwpOwo+ICsJcmF3
X2lub2RlX3NsYWIgPSBLTUVNX0NBQ0hFKGpmZnMyX3Jhd19pbm9kZSwgU0xBQl9IV0NBQ0hFX0FM
SUdOKTsKPiAgIAlpZiAoIXJhd19pbm9kZV9zbGFiKQo+ICAgCQlnb3RvIGVycjsKPiAgIAo+IC0J
dG1wX2Rub2RlX2luZm9fc2xhYiA9IGttZW1fY2FjaGVfY3JlYXRlKCJqZmZzMl90bXBfZG5vZGUi
LAo+IC0JCQkJCQlzaXplb2Yoc3RydWN0IGpmZnMyX3RtcF9kbm9kZV9pbmZvKSwKPiAtCQkJCQkJ
MCwgMCwgTlVMTCk7Cj4gKwl0bXBfZG5vZGVfaW5mb19zbGFiID0gS01FTV9DQUNIRShqZmZzMl90
bXBfZG5vZGVfaW5mbywgMCk7Cj4gICAJaWYgKCF0bXBfZG5vZGVfaW5mb19zbGFiKQo+ICAgCQln
b3RvIGVycjsKPiAgIAo+IEBAIC02MywyOCArNTUsMjAgQEAgaW50IF9faW5pdCBqZmZzMl9jcmVh
dGVfc2xhYl9jYWNoZXModm9pZCkKPiAgIAlpZiAoIXJhd19ub2RlX3JlZl9zbGFiKQo+ICAgCQln
b3RvIGVycjsKPiAgIAo+IC0Jbm9kZV9mcmFnX3NsYWIgPSBrbWVtX2NhY2hlX2NyZWF0ZSgiamZm
czJfbm9kZV9mcmFnIiwKPiAtCQkJCQkgICBzaXplb2Yoc3RydWN0IGpmZnMyX25vZGVfZnJhZyks
Cj4gLQkJCQkJICAgMCwgMCwgTlVMTCk7Cj4gKwlub2RlX2ZyYWdfc2xhYiA9IEtNRU1fQ0FDSEUo
amZmczJfbm9kZV9mcmFnLCAwKTsKPiAgIAlpZiAoIW5vZGVfZnJhZ19zbGFiKQo+ICAgCQlnb3Rv
IGVycjsKPiAgIAo+IC0JaW5vZGVfY2FjaGVfc2xhYiA9IGttZW1fY2FjaGVfY3JlYXRlKCJqZmZz
Ml9pbm9kZV9jYWNoZSIsCj4gLQkJCQkJICAgICBzaXplb2Yoc3RydWN0IGpmZnMyX2lub2RlX2Nh
Y2hlKSwKPiAtCQkJCQkgICAgIDAsIDAsIE5VTEwpOwo+ICsJaW5vZGVfY2FjaGVfc2xhYiA9IEtN
RU1fQ0FDSEUoamZmczJfaW5vZGVfY2FjaGUsIDApOwo+ICAgCWlmICghaW5vZGVfY2FjaGVfc2xh
YikKPiAgIAkJZ290byBlcnI7Cj4gICAKPiAgICNpZmRlZiBDT05GSUdfSkZGUzJfRlNfWEFUVFIK
PiAtCXhhdHRyX2RhdHVtX2NhY2hlID0ga21lbV9jYWNoZV9jcmVhdGUoImpmZnMyX3hhdHRyX2Rh
dHVtIiwKPiAtCQkJCQkgICAgIHNpemVvZihzdHJ1Y3QgamZmczJfeGF0dHJfZGF0dW0pLAo+IC0J
CQkJCSAgICAgMCwgMCwgTlVMTCk7Cj4gKwl4YXR0cl9kYXR1bV9jYWNoZSA9IEtNRU1fQ0FDSEUo
amZmczJfeGF0dHJfZGF0dW0sIDApOwo+ICAgCWlmICgheGF0dHJfZGF0dW1fY2FjaGUpCj4gICAJ
CWdvdG8gZXJyOwo+ICAgCj4gLQl4YXR0cl9yZWZfY2FjaGUgPSBrbWVtX2NhY2hlX2NyZWF0ZSgi
amZmczJfeGF0dHJfcmVmIiwKPiAtCQkJCQkgICBzaXplb2Yoc3RydWN0IGpmZnMyX3hhdHRyX3Jl
ZiksCj4gLQkJCQkJICAgMCwgMCwgTlVMTCk7Cj4gKwl4YXR0cl9yZWZfY2FjaGUgPSBLTUVNX0NB
Q0hFKGpmZnMyX3hhdHRyX3JlZiwgMCk7Cj4gICAJaWYgKCF4YXR0cl9yZWZfY2FjaGUpCj4gICAJ
CWdvdG8gZXJyOwo+ICAgI2VuZGlmCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
