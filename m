Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9720EE7717F
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Dec 2024 02:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJZIPfo62+gfFWAnFZ29D0+4sKMNFI1m9j/b/xPXu1E=; b=ZoZRnDMZGeAB22Dens2aTH9rBq
	nCYoVmWvexZBTCXpwV5XFd+xhtxlqUois0eAgRbyuspGmK2g/Vstas1P+kTnTNGg5wVFMZATbnqMV
	WRF8Aeq40nPyJylZpm7Y0vhjcKZWfkXg9on7SJM3ildyQ96p9lGyXhYyS1pL4v7e1Sl78MMlDxCrB
	aAPJwwH/EsE6tXqoBtsVgE2Bz0BDkbvMWuHvRfq5nHDzrrmw8x67yl9hM2aKFTbJb2dIEvAKWuCyN
	vVynJ6bxYghGmAv3EFkJvffifRALgD3SQoKs6q2e3UQ2bcmLm6UTE5JVjlvQPhHcuk5RQe4EzrYKT
	ZHGAUCQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMIL2-00000005ayO-05nA;
	Sat, 14 Dec 2024 02:57:04 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMIKx-00000005axX-2kn1
	for linux-mtd@lists.infradead.org;
	Sat, 14 Dec 2024 02:57:01 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Y99mJ4WPnz21mmf
	for <linux-mtd@lists.infradead.org>; Sat, 14 Dec 2024 10:54:56 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 62C7A180044
	for <linux-mtd@lists.infradead.org>; Sat, 14 Dec 2024 10:56:44 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 14 Dec 2024 10:56:43 +0800
Subject: Re: [PATCH mtd-utils] ubi-utils: Fix integer overflow in mtdinfo.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241213131500.99807-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <873116ad-baaf-83f1-cbf3-218426c3d1c2@huawei.com>
Date: Sat, 14 Dec 2024 10:56:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241213131500.99807-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_185659_840559_F91B7AFC 
X-CRM114-Status: GOOD (  16.00  )
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

1NogMjAyNC8xMi8xMyAyMToxNSwgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBSZXBvcnQgb2YgdGhl
IHN0YXRpYyBhbmFseXplcjoKPiBUaGUgdmFsdWUgb2YgYW4gYXJpdGhtZXRpYyBleHByZXNzaW9u
ICdyZWdpbmZvLT5vZmZzZXQgKyBpICogcmVnaW5mby0+ZXJhc2VzaXplJyBpcyBhIHN1YmplY3Qg
dG8gb3ZlcmZsb3cKPiBiZWNhdXNlIGl0cyBvcGVyYW5kcyBhcmUgbm90IGNhc3QgdG8gYSBsYXJn
ZXIgZGF0YSB0eXBlIGJlZm9yZSBwZXJmb3JtaW5nIGFyaXRobWV0aWMKPiAKPiBDb3JyZWN0aW9u
cyBleHBsYWluZWQ6Cj4gQWRkZWQgY2FzdGluZyByZWdpbmZvLT5vZmZzZXQgdG8gbG9uZyBsb25n
Cj4gCj4gVHJpZ2dlcnMgZm91bmQgYnkgc3RhdGljIGFuYWx5emVyIFN2YWNlLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFudG9uIE1vcnlha292IDxhbnQudi5tb3J5YWtvdkBnbWFpbC5jb20+Cj4gCj4g
LS0tCj4gICB1YmktdXRpbHMvbXRkaW5mby5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3ViaS11dGlscy9t
dGRpbmZvLmMgYi91YmktdXRpbHMvbXRkaW5mby5jCj4gaW5kZXggN2RmZjBkZS4uODUwMjk3YiAx
MDA2NDQKPiAtLS0gYS91YmktdXRpbHMvbXRkaW5mby5jCj4gKysrIGIvdWJpLXV0aWxzL210ZGlu
Zm8uYwo+IEBAIC0yMDMsNyArMjAzLDcgQEAgc3RhdGljIHZvaWQgcHJpbnRfcmVnaW9uX21hcChj
b25zdCBzdHJ1Y3QgbXRkX2Rldl9pbmZvICptdGQsIGludCBmZCwKPiAgIAkJcmV0X2xvY2tlZCA9
IHJldF9iYWQgPSBlcnJub19sb2NrZWQgPSBlcnJub19iYWQgPSAwOwo+ICAgCgpIaSBBbnRvbi4K
UGxlYXNlIG1ha2UgJ3N0YXJ0JyBiZSB0aGUgJ3Vuc2lnbmVkIGxvbmcgbG9uZycgdHlwZSwgb3Ro
ZXJ3aXNlIHR5cGUgCid1bnNpZ25lZCBsb25nJyBjb3VsZCBiZSAzMi1iaXQgd2lkdGggb24gYSAz
Mi1iaXQgcGxhdGZvcm0uCgo+ICAgCWZvciAoaSA9IDA7IGkgPCByZWdpbmZvLT5udW1ibG9ja3M7
ICsraSkgewo+IC0JCXN0YXJ0ID0gcmVnaW5mby0+b2Zmc2V0ICsgaSAqIHJlZ2luZm8tPmVyYXNl
c2l6ZTsKPiArCQlzdGFydCA9IHJlZ2luZm8tPm9mZnNldCArICh1bnNpZ25lZCBsb25nIGxvbmcp
aSAqIHJlZ2luZm8tPmVyYXNlc2l6ZTsKPiAgIAkJcHJpbnRmKCIgJSppOiAlMDhseCAiLCB3aWR0
aCwgaSwgc3RhcnQpOwo+ICAgCj4gICAJCWlmIChyZXRfbG9ja2VkICE9IC0xKSB7Cj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
