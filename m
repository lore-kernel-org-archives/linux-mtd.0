Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ECAC0218D
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 06:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gs4xWw1TWWQazOCqFZeYSrJ61cwOz4iDPGokWeT/Mzo=; b=0FKYDxLp13RJvW
	XJry4GdDyhn3QGqox8lYfbx+ajTDe5kdvlLJJxE3gF7WuTp2w8lcF8mu8l96jvnfwCw4KCZS+4V1v
	m6bCxDViAXy0VIFyj+qq56mYyIM3j833iStGWIuzTTJCE0R1mDEU/2LID2ZVdPmSl77WUGxrjkrTy
	OOjhAvra4UT16LP1Mnb55yz56PDSLbbj6aYP1BBSPY3a6FFt/LeuGNHqJv59VgBDPcwR2qfZXxFXS
	M9qyac2WG6sR8x0sTxgoKAEmJv/vTLGtuAtpmqFCcmIBkAT/Zf2dfltSkdQ+r8XTne83Mw4hxRU7w
	VhaFjwrQv68sgKFCGivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQs-0000000HAMX-2Rie;
	Sun, 26 Jan 2025 06:47:46 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQo-0000000HAIy-3HxK
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 06:47:44 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Yghps4N7Fz2Fc3J;
	Sun, 26 Jan 2025 14:44:05 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id AEA3A14010C;
	Sun, 26 Jan 2025 14:47:29 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 26 Jan
 2025 14:47:29 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>
CC: <yangerkun@huawei.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils 1/7] ubi-utils: mtdinfo: Fix type truncation compiling warning for 'start' variable
Date: Sun, 26 Jan 2025 14:41:57 +0800
Message-ID: <20250126064203.3348494-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20250126064203.3348494-1-chengzhihao1@huawei.com>
References: <20250126064203.3348494-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_224742_998857_14A1050A 
X-CRM114-Status: GOOD (  10.47  )
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

Rml4IGZvbGxvd2luZyBjb21waWxpbmcgd2FybmluZyBieSB1c2luZyB0aGUgcmlnaHQgZm9ybWF0
OgogdWJpLXV0aWxzL210ZGluZm8uYzoyMDc6MjE6IHdhcm5pbmc6IGZvcm1hdCDigJglbHjigJkg
ZXhwZWN0cyBhcmd1bWVudCBvZgogdHlwZSDigJhsb25nIHVuc2lnbmVkIGludOKAmSwgYnV0IGFy
Z3VtZW50IDQgaGFzIHR5cGUg4oCYbG9uZyBsb25nIHVuc2lnbmVkCiBpbnTigJkKCkZpeGVzOiA3
OGY0ZjM4YmQzZGU4ICgidWJpLXV0aWxzOiBGaXggaW50ZWdlciBvdmVyZmxvdyBpbiBtdGRpbmZv
LmMiKQpTaWduZWQtb2ZmLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29t
PgotLS0KIHViaS11dGlscy9tdGRpbmZvLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS91YmktdXRpbHMvbXRkaW5mby5j
IGIvdWJpLXV0aWxzL210ZGluZm8uYwppbmRleCAxMmQzNWViLi42MWNlN2JjIDEwMDY0NAotLS0g
YS91YmktdXRpbHMvbXRkaW5mby5jCisrKyBiL3ViaS11dGlscy9tdGRpbmZvLmMKQEAgLTIwNCw3
ICsyMDQsNyBAQCBzdGF0aWMgdm9pZCBwcmludF9yZWdpb25fbWFwKGNvbnN0IHN0cnVjdCBtdGRf
ZGV2X2luZm8gKm10ZCwgaW50IGZkLAogCiAJZm9yIChpID0gMDsgaSA8IHJlZ2luZm8tPm51bWJs
b2NrczsgKytpKSB7CiAJCXN0YXJ0ID0gcmVnaW5mby0+b2Zmc2V0ICsgKHVuc2lnbmVkIGxvbmcg
bG9uZylpICogcmVnaW5mby0+ZXJhc2VzaXplOwotCQlwcmludGYoIiAlKmk6ICUwOGx4ICIsIHdp
ZHRoLCBpLCBzdGFydCk7CisJCXByaW50ZigiICUqaTogJTA4bGx4ICIsIHdpZHRoLCBpLCBzdGFy
dCk7CiAKIAkJaWYgKHJldF9sb2NrZWQgIT0gLTEpIHsKIAkJCXJldF9sb2NrZWQgPSBtdGRfaXNf
bG9ja2VkKG10ZCwgZmQsIGkpOwotLSAKMi4xMy42CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
