Return-Path: <SRS0=OCz7=HG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73911C433E0
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Feb 2021 08:17:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B2964DD6
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Feb 2021 08:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6B2964DD6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/u4KHxcb0ymK0d1yRWz2nAKG5VSKwjsKXurqzOecvWo=; b=xlOA4V4tihS/7c/JiSLDqhD0K
	PDgmjjr5zKAcrDY/8IKKY9nw53jam6R1zrQB2KlRf1Xz7EV0O7TK61b3fZiKHUecv/En8LDxZHrtZ
	Hvr8RynGeunM5wxo0/FNy+uB3agYWKtpro9feTwUWWW/YFH5i+lgXDtU/XP4d5HdU4qRrUDsP1EQ4
	RiXs8NIAcfdXykSKMtEceDZPmaiH6US0p4Q9+To63YcAQSE9hiSTvBPuYAJjvXNa0cioPPDHWvAhC
	7/5sfPY0ix63P/laP0KanoD+sQ51SsLrVNxKseJz0vLOhln0nVxcmrYBvAlGX6Yvc1Pe0E8/wpkoQ
	587k5Uudw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Zp0-0002s3-AL; Thu, 04 Feb 2021 08:17:02 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Zox-0002qe-1Q
 for linux-mtd@lists.infradead.org; Thu, 04 Feb 2021 08:17:00 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id EB9156083275;
 Thu,  4 Feb 2021 09:16:56 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vGAdpr9ywbHg; Thu,  4 Feb 2021 09:16:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A62D1627AFCA;
 Thu,  4 Feb 2021 09:16:56 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LfjoeOid8NwN; Thu,  4 Feb 2021 09:16:56 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 862466089E03;
 Thu,  4 Feb 2021 09:16:56 +0100 (CET)
Date: Thu, 4 Feb 2021 09:16:56 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <429874131.360828.1612426616380.JavaMail.zimbra@nod.at>
In-Reply-To: <20210204091215.38ca0f99@xps13>
References: <1612410921-80984-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <20210204091215.38ca0f99@xps13>
Subject: Re: [PATCH] mtd: convert sysfs sprintf/snprintf family to sysfs_emit
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: convert sysfs sprintf/snprintf family to sysfs_emit
Thread-Index: PU/qtLePlYN2al0TaSfCrYOqoCJsYg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_031659_271584_825EB8D5 
X-CRM114-Status: UNSURE (   5.06  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBGaXggdGhlIGZvbGxvd2luZyBjb2Nj
aWNoZWNrIHdhcm5pbmc6Cj4+IAo+PiAuL2RyaXZlcnMvbXRkL210ZGNvcmUuYzogV0FSTklORzog
dXNlIHNjbnByaW50ZiBvciBzcHJpbnRmLgo+IAo+IFRoYXQncyBub3Qgd2hhdCB5b3UgZG8gaW4g
dGhlIGJlbG93IGNoYW5nZSA6KQoKV2VsbCwgc3lzZnNfZW1pdCgpIGlzIHRoZSBzeXNmcyBlcXVp
dmFsZW50IG9mIHNjbnByaW50ZigpLgpCdXQgdGhlIHBhdGNoIGZhaWxzIHRvIGV4cGxhaW4gKndo
eSogaXQgaXMgbmVlZGVkLiAKClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
