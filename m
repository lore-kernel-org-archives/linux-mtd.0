Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09A7C41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 14:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3eFnRO/T9EfdVa+85y5BTJ1OVkZPv0hr54C5iz/Kfk=; b=gmo6eMj177wLh9
	2cWooGXYneJiPdsDW9x01HDchir9GEZTXyRSycVnrVHz2o3FeJxq10+IdoIwXJauTSMgpsSw8XX7u
	Ku43I/G+S2tZN6geZiiZQIc/FtGwphkxHyt10fXZzTWXP5NqUjfhyuxQGR5tAQthnSR7LIe8r3k3J
	o/p8v8+2ilwOklpJJ5RjuTHQFEFPC8tS5OP9zudk/ksHl48YVRcmaw3WuzzgErcr8g1FmBqN9lgb5
	+mMPrSwKsZEZj3Hg9hfxA0h242M8Qs4Ce4fQWUHpFo/wFpGNZozQplTqJgfjWUQr0su6BHEE0vgkk
	ewYH7ncCJS87kq9+7TGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFbDc-00EOcp-2L;
	Tue, 19 Dec 2023 14:37:12 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFbDY-00EOYx-2r
	for linux-mtd@lists.infradead.org;
	Tue, 19 Dec 2023 14:37:11 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SvfPn6J2DzvSD7;
	Tue, 19 Dec 2023 22:35:57 +0800 (CST)
Received: from dggpemd200001.china.huawei.com (unknown [7.185.36.224])
	by mail.maildlp.com (Postfix) with ESMTPS id 68B5C140390;
	Tue, 19 Dec 2023 22:36:51 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemd200001.china.huawei.com (7.185.36.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.28; Tue, 19 Dec 2023 22:36:50 +0800
Message-ID: <04b4c375-d890-9458-5d62-0a9ba74b8c68@huawei.com>
Date: Tue, 19 Dec 2023 22:36:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3] mtd: Fix gluebi NULL pointer dereference caused by ftl
 notifier
To: Richard Weinberger <richard@nod.at>, Miquel Raynal
	<miquel.raynal@bootlin.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Artem Bityutskiy
	<Artem.Bityutskiy@nokia.com>, dpervushin <dpervushin@embeddedalley.com>,
	linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, chengzhihao1 <chengzhihao1@huawei.com>, yi
 zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
References: <20231027012033.50280-1-wangzhaolong1@huawei.com>
 <20231027194026.1bc32dfe@xps-13>
 <174426702.13324.1698438610904.JavaMail.zimbra@nod.at>
 <20231029145033.0ad2682a@xps-13>
 <142222867.20038.1698593973984.JavaMail.zimbra@nod.at>
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
In-Reply-To: <142222867.20038.1698593973984.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemd200001.china.huawei.com (7.185.36.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_063709_132856_96DCB9D4 
X-CRM114-Status: UNSURE (   5.65  )
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

RnJpZW5kbHkgcGluZy4uLgoKSSdkIGxpa2UgdG8ga25vdyB3aGF0IHRoZSBjdXJyZW50IHN0YXR1
cyBvZiB0aGlzIHBhdGNoIGlzLiBJcyB0aGVyZSBhIApuZWVkIGZvciBmdXJ0aGVyIHByb2dyYW1t
ZSBpbXByb3ZlbWVudHM/CgpCYXN0IHJlZ2FyZHMsClpoYW9Mb25nIFdhbmcKCgo+IC0tLS0tIFVy
c3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+Cj4+IEFjay4gSSdsbCBxdWV1ZSB0aGlzIG9uY2UgdGhlIGxvZyBm
aXhlZCBhbmQgeW91ciBvZmZpY2lhbCBBY2stYnkKPj4gcmVjZWl2ZWQgZm9yIG10ZC9uZXh0IGFm
dGVyIC1yYzEgaXMgb3V0Lgo+IAo+IEFja2VkLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hh
cmRAbm9kLmF0Pgo+IAo+IFRoYW5rcywKPiAvL3JpY2hhcmQKPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
