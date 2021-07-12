Return-Path: <SRS0=7PWl=ME=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8A6C07E99
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jul 2021 13:37:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8654A61006
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jul 2021 13:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8654A61006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwOxTtsp2Rz6JSRHDp7MhRbup57DSN9CLyiNUarGboE=; b=XyEYJAv5KJZWb2LZ+w0o3tw54V
	G6MXubQdOpMzCdN4QTCHwm5Znw693Z2AkPksDBvQgqd0gACH1FSRF4BcuEgpZPmLYgW0cBdz7uoWa
	AY+I43jDQsjduhSGYbEgqtggRFVzxtm3OTZTE9bLhbZrG/CR6i7y1yPrn/W1O0ZHeTBY+WkHPF3+y
	CfZa/K5CwGQ+QcmbXuX/lhxJdtSpb8j1beOegiwAK2XIOdshDbzLefLYWfHafQymraB3hrfz2tQ5r
	vHwlxHZfaV81EGqiPtudkPpVSmjFRtVf2r5VkIpre6RjHZEj/sgwL3905pH8MbXUjVpWPAvwSvcFL
	jQUXv6iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2w7H-007PbB-VK; Mon, 12 Jul 2021 13:37:00 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2w7E-007Pa2-81
 for linux-mtd@lists.infradead.org; Mon, 12 Jul 2021 13:36:58 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GNl8b5dTjzYrTf;
 Mon, 12 Jul 2021 21:33:35 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 12 Jul 2021 21:36:50 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 dggema761-chm.china.huawei.com (10.1.198.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 12 Jul 2021 21:36:49 +0800
Subject: Re: [PATCH v2] mtd: mtd_blkdevs: Get|Put mtd_device in
 add|del_mtd_blktrans
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <computersforpeace@gmail.com>, <maximlevitsky@gmail.com>,
 <David.Woodhouse@intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yukuai3@huawei.com>
References: <20210615091302.3428611-1-chengzhihao1@huawei.com>
 <13509562-158e-f883-5a70-094126dca993@nokia.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <2641a9cb-e3d4-53a0-ecaa-dfd9091848b7@huawei.com>
Date: Mon, 12 Jul 2021 21:36:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <13509562-158e-f883-5a70-094126dca993@nokia.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_063656_560777_A08C0B3D 
X-CRM114-Status: UNSURE (   6.51  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjEvNi8xNSAxNzoyNywgQWxleGFuZGVyIFN2ZXJkbGluIOWGmemBkzoKPiBIZWxsbyEK
Pgo+IE9uIDE1LzA2LzIwMjEgMTE6MTMsIFpoaWhhbyBDaGVuZyB3cm90ZToKPj4gVGhlcmUgYXJl
IHR3byByZWFzb25zIHRvIG1vdmUgbXRkX2RldmljZSBnZXR8cHV0IG9wZXJhdGlvbnMgaW50byBt
dGQKPj4gYmxrdHJhbnMgYWRkaW5nL2RlbGV0aW5nOgo+IC4uLgo+Cj4+IEZpeGVzOiAwNzNkYjRh
NTFlZTQzYyAoIm10ZDogZml4OiBhdm9pZCByYWNlIGNvbmRpdGlvbiB3aGVuIC4uLiIpCj4+IEZp
eGVzOiAwMDhjNzUxZWM3ODU4NyAoIm10ZDogYWxsb3cgdG8gdW5sb2FkIHRoZSBtdGR0cmFucyBt
b2R1bGUgaWYgLi4uIikKPj4gU2lnbmVkLW9mZi1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhh
bzFAaHVhd2VpLmNvbT4KPiBSZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5k
ZXIuc3ZlcmRsaW5Abm9raWEuY29tPgpmcmllbmRseSBwaW5nCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
