Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9082C02198
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 12:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mV7IkhD2JuTIuV2xuWCZ3WLhBqKQMV5VZuvt1x686lE=; b=AlezcUd8y8PWQS+H+vqWMu8Bew
	MPuogdAfi3qiEao4CNSvRg81U1/pr+42OSSDGEpuCBgIQbgaMG9OPHHbHHzVe4iCIsAMocU3A7iM8
	tzlTnwukpUaB2bSi5cwI4t6v2JZVwkNvwzwWZVp00mPtq37+vu9NXfz4B34gTwTlVMgYK4tc5+iPi
	5tPYEEBoptKqtmVeD5pqoFSH6p8iQ69NNZDORHzq68x3Hav74s2LNLvEDue6Sn1dCqqrjCtMxM92g
	hAc7/BJRa26oqIn/HcQzxv0zpG0r3qd68tGcLwsNKjpoYlCczaIXXBjf/ArvP65WiLP3PpOnxt08Y
	5vYRkf3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMhT-000000088lz-3Y3i;
	Tue, 18 Feb 2025 12:27:43 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMIJ-0000000842H-2Ad6
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 12:01:45 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YxynH0KL1zpk4J;
	Tue, 18 Feb 2025 20:02:11 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 63E24180214;
	Tue, 18 Feb 2025 20:01:40 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 18 Feb 2025 20:01:39 +0800
Subject: Re: [PATCH v2 mtd-utils 3/4] configure.ac: Add a check for execinfo
 and backtrace
To: Fabio Estevam <festevam@gmail.com>, <david.oberhollenzer@sigma-star.at>
CC: <raj.khem@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20250218113123.1956575-1-festevam@gmail.com>
 <20250218113123.1956575-3-festevam@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <432bda12-6463-3a0b-4a7d-1c9c1ce44e7a@huawei.com>
Date: Tue, 18 Feb 2025 20:01:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250218113123.1956575-3-festevam@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_040143_739234_7227529F 
X-CRM114-Status: GOOD (  13.90  )
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

1NogMjAyNS8yLzE4IDE5OjMxLCBGYWJpbyBFc3RldmFtINC0tcA6Cj4gbXVzbCByZWxpZXMgb24g
YW4gZXh0ZW5hbCBleGVjaW5mbyBsaWJyYXJ5IHRvIHByb3ZpZGUgYmFja3RyYWNlCj4gZnVuY3Rp
b25hbGl0eS4KPiAKPiBBZGQgc3VwcG9ydCBmb3IgaXQuCj4gCj4gfCAvd29yay9mZXN0ZXZhbS9v
ZS9wb2t5L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgtbXVzbC9tdGQtdXRpbHMv
Mi4zLjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4veDg2XzY0LXBva3ktbGludXgtbXVz
bC8uLi8uLi9saWJleGVjL3g4Nl82NC1wb2t5LWxpbnV4LW11c2wvZ2NjL3g4Nl82NC1wb2t5LWxp
bnV4LW11c2wvMTQuMi4wL2xkOiB1Ymlmcy11dGlscy9saWJ1Ymlmcy9ta2ZzX3ViaWZzLWlvLm86
IGluIGZ1bmN0aW9uIGBkdW1wX3N0YWNrJzoKPiB8IC91c3Ivc3JjL2RlYnVnL210ZC11dGlscy8y
LjMuMC91Ymlmcy11dGlscy9jb21tb24vZGVmcy5oOjcxOigudGV4dCsweDI1KTogdW5kZWZpbmVk
IHJlZmVyZW5jZSB0byBgYmFja3RyYWNlJwo+IC4uLi4KPiB8IGNvbGxlY3QyOiBlcnJvcjogbGQg
cmV0dXJuZWQgMSBleGl0IHN0YXR1cwo+IHwgbWFrZTogKioqIFtNYWtlZmlsZToyOTU5OiBta2Zz
LnViaWZzXSBFcnJvciAxCj4gCj4gU2lnbmVkLW9mZi1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2
YW1AZ21haWwuY29tPgo+IC0tLQo+IENoYW5nZXMgc2luY2UgdjE6Cj4gLSBOb25lLgo+IAo+ICAg
Y29uZmlndXJlLmFjIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKClJl
dmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRp
ZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKPiBpbmRleCAyYTc5YmE4MjBm
YzAuLjY1YWZiMjQ1ZDg5YyAxMDA2NDQKPiAtLS0gYS9jb25maWd1cmUuYWMKPiArKysgYi9jb25m
aWd1cmUuYWMKPiBAQCAtMjM4LDYgKzIzOCw3IEBAIGlmIHRlc3QgIngkbmVlZF9jbW9ja2EiID0g
Inh5ZXMiOyB0aGVuCj4gICAJUEtHX0NIRUNLX01PRFVMRVMoQ01PQ0tBLCBbY21vY2thXSwgW10s
IFtjbW9ja2FfbWlzc2luZz0ieWVzIl0pCj4gICBmaQo+ICAgCj4gK0FDX0NIRUNLX0xJQihbZXhl
Y2luZm9dLCBbYmFja3RyYWNlXSkKPiAgIEFDX0NIRUNLX0hFQURFUlMoW2V4ZWNpbmZvLmhdKQo+
ICAgCj4gICAjIyMjIyBwcm9kdWNlIHN1bW1hcnkgb24gZGVwZW5kZW5jaWVzICMjIyMjCj4gCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
