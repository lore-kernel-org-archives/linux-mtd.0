Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3889DE77182
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Dec 2024 03:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FozH4eTpREAwPa7NQN8r/MwqaVHvo9uiV0LoQ1Pv6os=; b=dWUPLteUJw1GL3YgOJXk02EKAr
	N3Br9SEJZumrjzOK6YHrLbzGh+z7/sNkthGzGCNaYFg2O1/bgXnt7IZillVA2QKNo7k9MokMINTQH
	TpNBT1j1UKORY6OKGT3mEzzRBsIE/ARzrPcjsM4O57+gCLEGRQJGjr1lfAue5F2ux9rs+ZjbRtMZx
	uqIxGNKlo6h9kMLobuITvIH9ZZTd1eVh2AcXDVawhEM6AFXwQ3C/KZGufkRKKuWDSS8aPmr6OX4jx
	0RRncUM1O1TMX6Pse9Fij3XefL9W6V8aMN0FxR/+TGYooMjLW1O9m7YA7W/JX4mpjYckMYbwbQKfK
	0L7tjfhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLZuD-0000000GoV0-1v6l;
	Thu, 12 Dec 2024 03:30:25 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLXwt-0000000Gfa4-3tyY
	for linux-mtd@lists.infradead.org;
	Thu, 12 Dec 2024 01:25:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Y7vpP4tZPz1kvpx
	for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2024 09:22:21 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 146371A0188
	for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2024 09:24:48 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 12 Dec 2024 09:24:44 +0800
Subject: Re: [PATCH mtd-utils] misc-utils: flash_erase: FIX integer overflow
 in flash_erase.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241211140403.1340141-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ada04679-98b4-c188-9918-c78aadb5f527@huawei.com>
Date: Thu, 12 Dec 2024 09:24:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241211140403.1340141-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_172504_183841_57B69707 
X-CRM114-Status: GOOD (  15.63  )
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

1NogMjAyNC8xMi8xMSAyMjowNCwgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBSZXBvcnQgb2YgdGhl
IHN0YXRpYyBhbmFseXplcjoKPiBUaGUgdmFsdWUgb2YgYW4gYXJpdGhtZXRpYyBleHByZXNzaW9u
ICdlYl9jbnQgKiBtdGQuZWJfc2l6ZScgaXMgYSBzdWJqZWN0IHRvIG92ZXJmbG93IGJlY2F1c2Ug
aXRzIG9wZXJhbmRzIGFyZSBub3QgY2FzdCB0byBhIGxhcmdlciBkYXRhIHR5cGUgYmVmb3JlIHBl
cmZvcm1pbmcgYXJpdGhtZXRpYwo+IAo+IENvcnJlY3Rpb25zIGV4cGxhaW5lZDoKPiBBZGRlZCBl
eHBsaWNpdCBjYXN0aW5nIG9mIGViX2NudCB0byBsb25nIGxvbmcgaW4gdGhlIGNvbmRpdGlvbgo+
IGlmIChlYl9zdGFydCA9PSAwICYmIG10ZC5zaXplID09IGViX2NudCAqIG10ZC5lYl9zaXplKQo+
IHRvIGVuc3VyZSB0aGUgbXVsdGlwbGljYXRpb24gaXMgcGVyZm9ybWVkIGluIGEgNjQtYml0IGNv
bnRleHQsCj4gcHJldmVudGluZyBwb3RlbnRpYWwgb3ZlcmZsb3cgZm9yIGxhcmdlIHZhbHVlcyBv
ZiBlYl9jbnQgYW5kIG10ZC5lYl9zaXplLgo+IFRoaXMgZW5zdXJlcyBjb3JyZWN0IGhhbmRsaW5n
IG9mIGRldmljZXMgd2l0aCBsYXJnZSBibG9jayBjb3VudHMgb3IgYmxvY2sgc2l6ZXMuCj4gCj4g
VHJpZ2dlcnMgZm91bmQgYnkgc3RhdGljIGFuYWx5emVyIFN2YWNlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFudG9uIE1vcnlha292IDxhbnQudi5tb3J5YWtvdkBnbWFpbC5jb20+Cj4gCj4gLS0tCj4g
ICBtaXNjLXV0aWxzL2ZsYXNoX2VyYXNlLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQgYS9taXNjLXV0aWxzL2ZsYXNo
X2VyYXNlLmMgYi9taXNjLXV0aWxzL2ZsYXNoX2VyYXNlLmMKPiBpbmRleCBjNmY2ZjY2Li43OGEz
YmQxIDEwMDY0NAo+IC0tLSBhL21pc2MtdXRpbHMvZmxhc2hfZXJhc2UuYwo+ICsrKyBiL21pc2Mt
dXRpbHMvZmxhc2hfZXJhc2UuYwo+IEBAIC0yMzksNyArMjM5LDcgQEAgaW50IG1haW4oaW50IGFy
Z2MsIGNoYXIgKmFyZ3ZbXSkKPiAgIAlpZiAoZWJfY250ID09IDApCj4gICAJCWViX2NudCA9ICht
dGQuc2l6ZSAvIG10ZC5lYl9zaXplKSAtIGViX3N0YXJ0Owo+ICAgCj4gLQlpZiAoZWJfc3RhcnQg
PT0gMCAmJiBtdGQuc2l6ZSA9PSBlYl9jbnQgKiBtdGQuZWJfc2l6ZSkKPiArCWlmIChlYl9zdGFy
dCA9PSAwICYmIG10ZC5zaXplID09IChsb25nIGxvbmcpZWJfY250ICogbXRkLmViX3NpemUpCj4g
ICAJCWVyYXNlX2NoaXAgPSB0cnVlOwo+ICAgCj4gICAJLyogSWYgTVREIGRldmljZSBtYXkgaGF2
ZSBiYWQgZXJhc2VibG9ja3MsCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
