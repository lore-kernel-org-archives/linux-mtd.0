Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898E8C02190
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 06:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDekkq2a6KJU56fL9tWbg49gbYhes9rk5Unbu3Eanqs=; b=IjIqSgpFNgBw2V
	Cw5/knwgU+Ex0zmV2zLjV8/xDqCGWyT7diyyhLCmXurXE3XElpWqCkIKNKBslBl29tpdRdG8jXz7C
	JlvkJXi7ZUzQGpAB8xrzGDb3/4cAwYM7S1FZZziTKTH15eaXvEx4OP/opx9L9G4Y5xzsj39zdV7M0
	mqGBQWWmsQHfhGuRx9B88LK71yLCv+bTQeHq239Sj5l9m0vji3CsrmFtWU/9wr9Kb7J0eY9jyALGn
	nv/swsF2mocYPd+gw19ahfglHUrO9YjKRGORwolBAz73VVFDFMXMPSKqHx/mauZ9ZJ76hM221xBvE
	kfs1rqVXZd7Az+Y1a1Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQu-0000000HANX-2maP;
	Sun, 26 Jan 2025 06:47:48 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQo-0000000HAIt-3k6w
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 06:47:44 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Yghq5581yz11T5d;
	Sun, 26 Jan 2025 14:44:17 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id C31A81802D2;
	Sun, 26 Jan 2025 14:47:31 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 26 Jan
 2025 14:47:31 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>
CC: <yangerkun@huawei.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils 5/7] tests: checkfs: Add previous prototype for do_pwr_dn()
Date: Sun, 26 Jan 2025 14:42:01 +0800
Message-ID: <20250126064203.3348494-6-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20250126064203.3348494-1-chengzhihao1@huawei.com>
References: <20250126064203.3348494-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_224743_145543_90183E9E 
X-CRM114-Status: GOOD (  10.46  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhlIGNvbXBpbGVyIGNvbXBsYWlucyBmb2xsb3dpbmcgbWVzc2FnZToKIHRlc3RzL2NoZWNrZnMv
Y29tbS5jOjM3OjU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3IKIOKAmGRvX3B3
cl9kbuKAmQpUaGUgZnVuY3Rpb24gZG9fcHdyX2RuKCkgaXMgb25seSB1c2VkIGluIHRlc3RzL2No
ZWNrZnMvY2hlY2tmcy5jLCBidXQKd2Ugc3RpbGwga2VlcCBpdCBpbiB0ZXN0cy9jaGVja2ZzL2Nv
bW0uYyBpbiBjYXNlIHRoZSBmdW5jdGlvbigpIGlzCnVzZWQgYnkgbW9yZSBjYWxsZXJzLiBGaXgg
aXQgYnkgYWRkaW5nIGEgcHJldmlvdXMgZGVjbGFyYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBaaGlo
YW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgotLS0KIHRlc3RzL2NoZWNrZnMvY29t
bS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3Rlc3RzL2NoZWNrZnMvY29tbS5jIGIvdGVzdHMvY2hlY2tmcy9jb21tLmMKaW5kZXggYzhjNDU3
ZS4uOWY0ZTIwZCAxMDA2NDQKLS0tIGEvdGVzdHMvY2hlY2tmcy9jb21tLmMKKysrIGIvdGVzdHMv
Y2hlY2tmcy9jb21tLmMKQEAgLTI4LDYgKzI4LDggQEAKICNpbmNsdWRlIDx1bmlzdGQuaD4KICNp
bmNsdWRlIDxzdHJpbmcuaD4KIAoraW50IGRvX3B3cl9kbihpbnQgZmQsIGludCBjeWNsZUNudCk7
CisKIC8qCiAgIFRoaXMgaXMgdGhlIHJvdXRpbmUgdGhhdCBmb3JtcyBhbmQKICAgc2VuZHMgdGhl
ICJvayB0byBwd3IgbWUgZG93biIgbWVzc2FnZQotLSAKMi4xMy42CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
