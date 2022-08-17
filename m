Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B66FC25B08
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Aug 2022 06:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPw2RgT/aTDQx7LlQa4WEjcrtQ0YwwO3iFg5iBTQf6A=; b=cMzHAjDpfhz+xxu42IuzapOfp7
	d+Uvd7Lvmjey4qso564PYPh23xxK3uDgVVSCrrycG6MBrX3j7eULq/v8yQMYoBC2SJg+LuoK62wJh
	2al3zHcteya6qvCEfYvSC4si/+AaT0uZeafnIIXaEJE6gOW3LT+7SQRXqzynpxFcBFfN7JhCXvIE+
	Pk8Yl0JurmsWGYkXBQbXbW9TZZm1gpTmGkVtC2g4aAPRFe/uyDngkl7U8Wc7n3KM/B7aRocvB6iMr
	aZe9133QSZVPLa55Qxc+WlnAJVvsIM8OnqqAyY8e6/qYpHkT0JCtWI7gNHq9mbiR6ZcEi3xnMHNvF
	yiGSHgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOCFH-00Bhyb-Ia; Wed, 17 Aug 2022 06:09:39 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOCFF-00BhuI-AX
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2022 06:09:38 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4M6yFJ2rfWzkWJh;
	Wed, 17 Aug 2022 14:06:12 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 17 Aug 2022 14:09:33 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 17 Aug 2022 14:09:32 +0800
Subject: Re: [PATCH] ubi: ubi-media.h: Fix comment typo
To: Jason Wang <wangborong@cdjrlc.com>, <vigneshr@ti.com>
CC: <richard@nod.at>, <miquel.raynal@bootlin.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220811135730.25480-1-wangborong@cdjrlc.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6a7ce5c9-a59d-e8e2-5c70-a688d8fceeb9@huawei.com>
Date: Wed, 17 Aug 2022 14:09:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20220811135730.25480-1-wangborong@cdjrlc.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_230937_615529_5A6339B5 
X-CRM114-Status: GOOD (  14.62  )
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

1NogMjAyMi84LzExIDIxOjU3LCBKYXNvbiBXYW5nINC0tcA6ClJldmlld2VkLWJ5OiBaaGloYW8g
Q2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiBUaGUgZG91YmxlIGB0aGUnIGlzIGR1
cGxpY2F0ZWQgaW4gdGhlIGNvbW1lbnQsIHJlbW92ZSBvbmUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SmFzb24gV2FuZyA8d2FuZ2Jvcm9uZ0BjZGpybGMuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQv
dWJpL3ViaS1tZWRpYS5oIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS91YmktbWVk
aWEuaCBiL2RyaXZlcnMvbXRkL3ViaS91YmktbWVkaWEuaAo+IGluZGV4IDM4NmRiMDU5OGU5NS4u
MmM5Y2QzYjY0MzRmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS91YmktbWVkaWEuaAo+
ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS91YmktbWVkaWEuaAo+IEBAIC0xMzEsNyArMTMxLDcgQEAg
ZW51bSB7Cj4gICAgKiBpcyBjaGFuZ2VkIHJhZGljYWxseS4gVGhpcyBmaWVsZCBpcyBkdXBsaWNh
dGVkIGluIHRoZSB2b2x1bWUgaWRlbnRpZmllcgo+ICAgICogaGVhZGVyLgo+ICAgICoKPiAtICog
VGhlIEB2aWRfaGRyX29mZnNldCBhbmQgQGRhdGFfb2Zmc2V0IGZpZWxkcyBjb250YWluIHRoZSBv
ZmZzZXQgb2YgdGhlIHRoZQo+ICsgKiBUaGUgQHZpZF9oZHJfb2Zmc2V0IGFuZCBAZGF0YV9vZmZz
ZXQgZmllbGRzIGNvbnRhaW4gdGhlIG9mZnNldCBvZiB0aGUKPiAgICAqIHZvbHVtZSBpZGVudGlm
aWVyIGhlYWRlciBhbmQgdXNlciBkYXRhLCByZWxhdGl2ZSB0byB0aGUgYmVnaW5uaW5nIG9mIHRo
ZQo+ICAgICogcGh5c2ljYWwgZXJhc2VibG9jay4gVGhlc2UgdmFsdWVzIGhhdmUgdG8gYmUgdGhl
IHNhbWUgZm9yIGFsbCBwaHlzaWNhbAo+ICAgICogZXJhc2VibG9ja3MuCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
