Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1910BC52D6F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 06:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5qftmEa/lKV1/rczSDkj0HMZg+gg7kX32EpWvCr+Wk=; b=A+KJ467BT5pjzawPF8gB5gKWvl
	ImZt0WqmgjGjD51Nomic4zsSxmR5aJhUZFcFWTo7zjNaG03iTuonO28rx+997KsefMNqJm9w5wtw5
	pCLnXjdyaeRPMfzdPiJrdP3/hkgrrr9tMjSlLaydbRElTzLxOjqj0smjPF3INlObbfOuH3iobvR1p
	hsN9usZNxTn0jeLAl3VzxJLHivnWvY29ImnS7EPvvYuFWDW/eCrBPVKG0JUQkMQKxpZXwq8y2SBCq
	65ZkLeczXFK/2F3pQt6hC68mlW6yeoGuwUb+1QnSiAyxFRJE76pREVIsR4O4djTCY4jg1alK8xPNk
	kSxQrpPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgf5f-00000007lSJ-3jna;
	Wed, 21 Aug 2024 06:45:07 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgf5d-00000007lRB-2XEH
	for linux-mtd@lists.infradead.org;
	Wed, 21 Aug 2024 06:45:07 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WpcGP1MJzzhY29;
	Wed, 21 Aug 2024 14:42:53 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id A75961401F4;
	Wed, 21 Aug 2024 14:44:53 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 14:44:53 +0800
Subject: Re: [PATCH -next] ubifs: Display the inode number when orphan twice
 happens
To: Liu Mingrui <liumingrui@huawei.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240821063059.2317249-1-liumingrui@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <368218ec-faa9-8f39-d779-db02055f424b@huawei.com>
Date: Wed, 21 Aug 2024 14:44:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240821063059.2317249-1-liumingrui@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_234505_918664_DDE3A0A0 
X-CRM114-Status: GOOD (  12.20  )
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

1NogMjAyNC84LzIxIDE0OjMwLCBMaXUgTWluZ3J1aSDQtLXAOgo+IERpc3BsYXkgdGhlIGlub2Rl
IG51bWJlciBpbiBlcnJvciBtZXNzYWdlIHdoZW4gdGhlIHNhbWUgb3JwaGFuIGlub2RlCj4gaXMg
YWRkZWQgdHdpY2UsIHdoaWNoIGNvdWxkIHByb3ZpZGUgbW9yZSBpbmZvcm1hdGlvbiBmb3IgZGVi
dWdnaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExpdSBNaW5ncnVpIDxsaXVtaW5ncnVpQGh1YXdl
aS5jb20+Cj4gLS0tCj4gICBmcy91Ymlmcy9vcnBoYW4uYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAoKUmV2aWV3ZWQtYnk6IFpoaWhh
byBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZz
L29ycGhhbi5jIGIvZnMvdWJpZnMvb3JwaGFuLmMKPiBpbmRleCBmYjk1N2Q5NjNiYTYuLjU1NTVk
ZDc0MDg4OSAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9vcnBoYW4uYwo+ICsrKyBiL2ZzL3ViaWZz
L29ycGhhbi5jCj4gQEAgLTc2LDcgKzc2LDcgQEAgaW50IHViaWZzX2FkZF9vcnBoYW4oc3RydWN0
IHViaWZzX2luZm8gKmMsIGlub190IGludW0pCj4gICAJCWVsc2UgaWYgKGludW0gPiBvLT5pbnVt
KQo+ICAgCQkJcCA9ICYoKnApLT5yYl9yaWdodDsKPiAgIAkJZWxzZSB7Cj4gLQkJCXViaWZzX2Vy
cihjLCAib3JwaGFuZWQgdHdpY2UiKTsKPiArCQkJdWJpZnNfZXJyKGMsICJpbm8gJWx1IG9ycGhh
bmVkIHR3aWNlIiwgKHVuc2lnbmVkIGxvbmcpaW51bSk7Cj4gICAJCQlzcGluX3VubG9jaygmYy0+
b3JwaGFuX2xvY2spOwo+ICAgCQkJa2ZyZWUob3JwaGFuKTsKPiAgIAkJCXJldHVybiAtRUlOVkFM
Owo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
