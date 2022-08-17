Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C8AC25B08
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Aug 2022 06:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSlGV6AD2jwH8FboxMcPTneJSThnEf6OgOerQMCF6IM=; b=upVZx60bFtDlyh4wxQkNxQLdTD
	g19a2u+uVO7maNaxodzfgINhrF3wA9FhsPrvTIB4iF9EvnIMKxxYJZyTjTntrmsG1FgeGCjki2DFc
	gcXlOPMohdK0pvFMOnc+0+sEo/5eQXxM4OegRfZehCg6PjW4w0GhT/X7dckQxfV3yS5MW4KSltHhF
	0AzYZBzXyyRHvVjSYhmDSYjegXIvuswduKksbO8n8FJZ5aTFgpSEpF7dUJ4DMSjBB9e2/qpfeoPEN
	48c5HhScJ/v/mR3eGH+KRkTyUcRTSF2S0Slu7lf+CNcIjugZyqS1JxnhSDaZizbVK7ZES4Hv8Dpnz
	ki2mNlXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOCFX-00BiKO-Ft; Wed, 17 Aug 2022 06:09:55 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOCFV-00BiHb-8a
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2022 06:09:54 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4M6yFd0stqz1M8wN;
	Wed, 17 Aug 2022 14:06:29 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 17 Aug 2022 14:09:49 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 17 Aug 2022 14:09:48 +0800
Subject: Re: [PATCH] mtd: rawnand: gpmi: Fix comment typo
To: Jason Wang <wangborong@cdjrlc.com>, <miquel.raynal@bootlin.com>
CC: <han.xu@nxp.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220811135854.27036-1-wangborong@cdjrlc.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <28935439-276f-50a9-2526-13da5ffcc9db@huawei.com>
Date: Wed, 17 Aug 2022 14:09:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20220811135854.27036-1-wangborong@cdjrlc.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_230953_519530_CC083640 
X-CRM114-Status: GOOD (  12.99  )
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

1NogMjAyMi84LzExIDIxOjU4LCBKYXNvbiBXYW5nINC0tcA6ClJldmlld2VkLWJ5OiBaaGloYW8g
Q2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiBUaGUgZG91YmxlIGB0aGUnIGlzIGR1
cGxpY2F0ZWQgaW4gdGhlIGNvbW1lbnQsIHJlbW92ZSBvbmUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SmFzb24gV2FuZyA8d2FuZ2Jvcm9uZ0BjZGpybGMuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2dwbWktbmFuZC9ncG1pLW5hbmQuYwo+IGluZGV4IDkzZGEyMzY4MmQ4Ni4uMDFjY2JkZTc0OGYz
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQu
Ywo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwo+IEBA
IC0xMzYxLDcgKzEzNjEsNyBAQCBzdGF0aWMgaW50IGdwbWlfYWxsb2NfZG1hX2J1ZmZlcihzdHJ1
Y3QgZ3BtaV9uYW5kX2RhdGEgKnRoaXMpCj4gICAvKgo+ICAgICogSGFuZGxlcyBibG9jayBtYXJr
IHN3YXBwaW5nLgo+ICAgICogSXQgY2FuIGJlIGNhbGxlZCBpbiBzd2FwcGluZyB0aGUgYmxvY2sg
bWFyaywgb3Igc3dhcHBpbmcgaXQgYmFjaywKPiAtICogYmVjYXVzZSB0aGUgdGhlIG9wZXJhdGlv
bnMgYXJlIHRoZSBzYW1lLgo+ICsgKiBiZWNhdXNlIHRoZSBvcGVyYXRpb25zIGFyZSB0aGUgc2Ft
ZS4KPiAgICAqLwo+ICAgc3RhdGljIHZvaWQgYmxvY2tfbWFya19zd2FwcGluZyhzdHJ1Y3QgZ3Bt
aV9uYW5kX2RhdGEgKnRoaXMsCj4gICAJCQkJdm9pZCAqcGF5bG9hZCwgdm9pZCAqYXV4aWxpYXJ5
KQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
