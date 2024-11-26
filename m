Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3BED3B98B
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Nov 2024 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pL7Cz9rSwHPWvxuRIxo3/QFLiOCnSiKJiheJKXILTg=; b=tG6hdW4sBI0ZsDVSCEZKqfzRjE
	IVgS+uJQhAfQJYRVyDZSUoZ0T2q2ktLMygujWrkcZHTaaDGUpvDLlfYFMaJAZEV2IomsgIaZO2STi
	OUonQqoh8yklPrJZQ4bZAL1GfSj07g+qgvQUfAgmAu+ZXfVWg4t3QQaEMJpwudGK9+OfDMy5eilCd
	PpWHNGNJVCerVuWD78PRBgraFXXObdVAnhRBMMxSeg5ts/VIuYV2Q76Sps5zTJDAEGEfwSBvnJnEl
	43o3bkchOhDwD4M5pP98rc3iXQJ8WAg3EfEQdyM44znmYB2qx3/H6aQbMvzpEsdJCTWrFCMFHGYcF
	I8a2kvSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwBU-0000000Ao3V-2s87;
	Tue, 26 Nov 2024 14:04:56 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwBS-0000000Ao2D-0Hnq
	for linux-mtd@lists.infradead.org;
	Tue, 26 Nov 2024 14:04:55 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XyPRf6SHvz21lsR;
	Tue, 26 Nov 2024 22:03:10 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id ACF4F14010C;
	Tue, 26 Nov 2024 22:04:39 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 26 Nov 2024 22:04:38 +0800
Subject: Re: [PATCH v2] mtd: ubi: Added a check for ubi_num
To: Denis Arefev <arefev@swemel.ru>, Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20241126125453.6610-1-arefev@swemel.ru>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9002ea77-64af-2a4a-3163-f3df0410fd00@huawei.com>
Date: Tue, 26 Nov 2024 22:04:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241126125453.6610-1-arefev@swemel.ru>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_060454_260073_DDA99DA3 
X-CRM114-Status: GOOD (  15.35  )
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

1NogMjAyNC8xMS8yNiAyMDo1NCwgRGVuaXMgQXJlZmV2INC0tcA6Cj4gQWRkZWQgYSBjaGVjayBm
b3IgdWJpX251bSBmb3IgbmVnYXRpdmUgbnVtYmVycwo+IElmIHRoZSB2YXJpYWJsZSB1YmlfbnVt
IHRha2VzIG5lZ2F0aXZlIHZhbHVlcyB0aGVuIHdlIGdldDoKPiAKPiBxZW11LXN5c3RlbS1hcm0g
Li4uIC1hcHBlbmQgInViaS5tdGQ9MCwwLDAsLTIyMjIyMzQ1IiAuLi4KPiBbICAgIDAuNzQ1MDY1
XSAgdWJpX2F0dGFjaF9tdGRfZGV2IGZyb20gdWJpX2luaXQrMHgxNzgvMHgyMTgKPiBbICAgIDAu
NzQ1MjMwXSAgdWJpX2luaXQgZnJvbSBkb19vbmVfaW5pdGNhbGwrMHg3MC8weDFhYwo+IFsgICAg
MC43NDUzNDRdICBkb19vbmVfaW5pdGNhbGwgZnJvbSBrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDE5
OC8weDIyNAo+IFsgICAgMC43NDU0NzRdICBrZXJuZWxfaW5pdF9mcmVlYWJsZSBmcm9tIGtlcm5l
bF9pbml0KzB4MTgvMHgxMzQKPiBbICAgIDAuNzQ1NjAwXSAga2VybmVsX2luaXQgZnJvbSByZXRf
ZnJvbV9mb3JrKzB4MTQvMHgyOAo+IFsgICAgMC43NDU3MjddIEV4Y2VwdGlvbiBzdGFjaygweDkw
MDE1ZmIwIHRvIDB4OTAwMTVmZjgpCj4gCj4gRm91bmQgYnkgTGludXggVmVyaWZpY2F0aW9uIENl
bnRlciAobGludXh0ZXN0aW5nLm9yZykgd2l0aCBTVkFDRS4KPiAKPiBGaXhlczogODNmZjU5YTA2
NjYzICgiVUJJOiBzdXBwb3J0IHViaV9udW0gb24gbXRkLnViaSBjb21tYW5kIGxpbmUiKQo+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogRGVuaXMgQXJlZmV2IDxh
cmVmZXZAc3dlbWVsLnJ1Pgo+IC0tLQo+IFYxIC0+IFYyOiBjaGFuZ2VkIHRoZSB0YWcgRml4ZXMg
YW5kIG1vdmVkIHRoZSBjaGVjayB0byB1YmlfbXRkX3BhcmFtX3BhcnNlKCkKPiAgIGRyaXZlcnMv
bXRkL3ViaS9idWlsZC5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFA
aHVhd2VpLmNvbT4KPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgYi9k
cml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IGluZGV4IDMwYmU0ZWQ2OGZhZC4uZWY2YTIyZjM3MmY5
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4gKysrIGIvZHJpdmVycy9t
dGQvdWJpL2J1aWxkLmMKPiBAQCAtMTUzNyw3ICsxNTM3LDcgQEAgc3RhdGljIGludCB1YmlfbXRk
X3BhcmFtX3BhcnNlKGNvbnN0IGNoYXIgKnZhbCwgY29uc3Qgc3RydWN0IGtlcm5lbF9wYXJhbSAq
a3ApCj4gICAJaWYgKHRva2VuKSB7Cj4gICAJCWludCBlcnIgPSBrc3RydG9pbnQodG9rZW4sIDEw
LCAmcC0+dWJpX251bSk7Cj4gICAKPiAtCQlpZiAoZXJyKSB7Cj4gKwkJaWYgKGVyciB8fCBwLT51
YmlfbnVtIDwgVUJJX0RFVl9OVU1fQVVUTykgewo+ICAgCQkJcHJfZXJyKCJVQkkgZXJyb3I6IGJh
ZCB2YWx1ZSBmb3IgdWJpX251bSBwYXJhbWV0ZXI6ICVzXG4iLAo+ICAgCQkJICAgICAgIHRva2Vu
KTsKPiAgIAkJCXJldHVybiAtRUlOVkFMOwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
