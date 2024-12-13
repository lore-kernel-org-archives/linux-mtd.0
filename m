Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121E9E7717F
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Dec 2024 02:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPqya0SeQ4iAFvj6y8znT0O0ARg9eACP/CleVAE5LDk=; b=clPRL8pE9yKDB/vPlsWzwkSSbd
	ayaY+2efV2q/Bot2GGQUWua6zusAEvO9k9/+g+xAcns/hjysvoLPJPxS40OCG1Q6jpLFexTBaiI33
	jxsq3JGgQCvdq+HpisjA9TuRixasxdHFRYx5EA6ZZeGUSU3r4lLtCXd9NZ5owwVfDYRPX8sGhEZxi
	hIT6vINROHlzFOZyxUPIYlpaG3Z9rQchF723wi5U5tBT4/olPN5uH2jy+A8sBVwS/ZFdsuMqaokB+
	/n7KvmOc0Zlt00Ex8C9X2CN3ptzjlWE/+4mdzU5s2orAlrUilqoktLaAO+P0zHHXIbpHpBiDdL73z
	GJR8RYrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLvYL-00000002WTy-37Hk;
	Fri, 13 Dec 2024 02:37:17 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLvYJ-00000002WSs-1Pfi
	for linux-mtd@lists.infradead.org;
	Fri, 13 Dec 2024 02:37:16 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Y8YN65y9hzRjGd
	for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2024 10:35:18 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B25AA1800CE
	for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2024 10:37:05 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 13 Dec 2024 10:37:05 +0800
Subject: Re: [PATCH mtd-utils] nand-utils: Fix integer overflow in
 nandflipbits.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241212183928.75259-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <baa7aa48-da85-c525-59db-3af05919b674@huawei.com>
Date: Fri, 13 Dec 2024 10:37:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241212183928.75259-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_183715_530337_A6F91C70 
X-CRM114-Status: GOOD (  14.40  )
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

1NogMjAyNC8xMi8xMyAyOjM5LCBBbnRvbiBNb3J5YWtvdiDQtLXAOgo+IFJlcG9ydCBvZiB0aGUg
c3RhdGljIGFuYWx5emVyOgo+IFRoZSB2YWx1ZSBvZiBhbiBhcml0aG1ldGljIGV4cHJlc3Npb24g
J2JpdF90b19mbGlwLT5ibG9jayAqIG10ZC5lYl9zaXplICsgYmxrb2ZmcycgaXMgYSBzdWJqZWN0
IHRvIG92ZXJmbG93IGJlY2F1c2UgaXRzIG9wZXJhbmRzIGFyZSBub3QgY2FzdCB0byBhIGxhcmdl
ciBkYXRhIHR5cGUgYmVmb3JlIHBlcmZvcm1pbmcgYXJpdGgkCj4gCj4gQ29ycmVjdGlvbnMgZXhw
bGFpbmVkOgo+IFByZXZlbnQgYXJpdGhtZXRpYyBvdmVyZmxvdyBpbiBPT0IgcmVhZCBvcGVyYXRp
b24KPiBSZXNvbHZlZCBhbiBpc3N1ZSB3aGVyZSB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIG9mZnNl
dCBpbiB0aGUgT09CIHJlYWQgb3BlcmF0aW9uIGNvdWxkIG92ZXJmbG93IGR1ZSB0byBvcGVyYW5k
cyBub3QgYmVpbmcgY2FzdCB0byBhIGxhcmdlciBkYXRhIHR5cGUuIFNwZWNpZmljYWxseSwgdGhl
IG11bHRpcGxpY2F0aW9uIG9mIGJpJAo+IAo+IFRyaWdnZXJzIGZvdW5kIGJ5IHN0YXRpYyBhbmFs
eXplciBTdmFjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRvbiBNb3J5YWtvdiA8YW50LnYubW9y
eWFrb3ZAZ21haWwuY29tPgo+IAo+IC0tLQo+ICAgbmFuZC11dGlscy9uYW5kZmxpcGJpdHMuYyB8
IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9uYW5kLXV0aWxzL25hbmRmbGlwYml0cy5jIGIvbmFuZC11dGlscy9u
YW5kZmxpcGJpdHMuYwo+IGluZGV4IDcwNjY0MDguLmVmNjYzYzYgMTAwNjQ0Cj4gLS0tIGEvbmFu
ZC11dGlscy9uYW5kZmxpcGJpdHMuYwo+ICsrKyBiL25hbmQtdXRpbHMvbmFuZGZsaXBiaXRzLmMK
PiBAQCAtMjUxLDcgKzI1MSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKPiAg
IAkJCWJ1Zm9mZnMgKz0gbXRkLm1pbl9pb19zaXplOwo+ICAgCj4gICAJCQlyZXQgPSBtdGRfcmVh
ZF9vb2IobXRkX2Rlc2MsICZtdGQsIGZkLAo+IC0JCQkJCSAgIGJpdF90b19mbGlwLT5ibG9jayAq
IG10ZC5lYl9zaXplICsKPiArCQkJCQkgICAobG9uZyBsb25nKWJpdF90b19mbGlwLT5ibG9jayAq
IChsb25nIGxvbmcpbXRkLmViX3NpemUgKwoKSGkgQW50b24uClR5cGUgY29udmVydGluZyBmb3Ig
J2JpdF90b19mbGlwLT5ibG9jaycgaXMgZW5vdWdoLCBhbmQgaXQgY291bGQgYmUgCmJldHRlciBt
YWtpbmcgdGhlIHR5cGUgYXMgJ3Vuc2lnbmVkIGxvbmcgbG9uZycuCj4gICAJCQkJCSAgIGJsa29m
ZnMsCj4gICAJCQkJCSAgIG10ZC5vb2Jfc2l6ZSwgYnVmZmVyICsgYnVmb2Zmcyk7Cj4gICAJCQlp
ZiAocmV0KSB7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
