Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70A8C83F25
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jul 2025 06:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uiYsyYb8T8Eje2s6u9UNR52MkX6ihVqB0wbUIreN5Q8=; b=w5Ecz0fn8Wrptd7P+4pjUZWgBl
	55qziB+RRyUfkAvb7p3OQLrhgG0VkrKIgMl1hxY9PngnO6uDP7NEp1EqUMnhFbPd3XddBFVB6uvkv
	ubqSf53qDM+NlSt7taMr9eaurDuucwN4YuvpRsJZ9HiHkLJMo1egJrxMmluxDIhodBCg03YDUAX1P
	0kGOO9bSchHbtss041Eh+dsYT2cRv9c+dYSlE7z7+497IEzZWjQBpIxQgBlfACHSFafA+goiEbh2s
	BMf4I4W0sdBPO6hh6LAIgtEv8hT28suGcMPq3NMFTath9Hhd5uA9zJ8/Uq8BSPBHPSltglT8OL5lN
	UG1S1EUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueT5x-0000000497u-305G;
	Wed, 23 Jul 2025 06:36:53 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueT5v-0000000497F-0YcO
	for linux-mtd@lists.infradead.org;
	Wed, 23 Jul 2025 06:36:52 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 18E552A881B;
	Wed, 23 Jul 2025 08:36:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id i1GrfogD27I9; Wed, 23 Jul 2025 08:36:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 887A92ABFDC;
	Wed, 23 Jul 2025 08:36:39 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id d5j-uoKsvlmQ; Wed, 23 Jul 2025 08:36:39 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 65C3F2ABFC7;
	Wed, 23 Jul 2025 08:36:39 +0200 (CEST)
Date: Wed, 23 Jul 2025 08:36:39 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: hch <hch@lst.de>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1972249978.7474.1753252599284.JavaMail.zimbra@nod.at>
In-Reply-To: <20250723053403.GA18295@lst.de>
References: <20250711081116.564445-1-hch@lst.de> <35dcb159-ddf9-2403-f1dc-f11d8d4562ce@huawei.com> <20250723053403.GA18295@lst.de>
Subject: Re: [PATCH] ubifs: stop using write_cache_pages
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF140 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: stop using write_cache_pages
Thread-Index: U0zNn7YtC/xMh6B7evLMdmOUyxlOXA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_233651_312766_0F18F558 
X-CRM114-Status: UNSURE (   2.72  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImhjaCIgPGhjaEBsc3QuZGU+
Cj4gQW46ICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBDQzogImhj
aCIgPGhjaEBsc3QuZGU+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgImxpbnV4LW10ZCIg
PGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPgo+IEdlc2VuZGV0OiBNaXR0d29jaCwgMjMu
IEp1bGkgMjAyNSAwNzozNDowMwo+IEJldHJlZmY6IFJlOiBbUEFUQ0hdIHViaWZzOiBzdG9wIHVz
aW5nIHdyaXRlX2NhY2hlX3BhZ2VzCgo+IENhbiB5b3UgcGljayB0aGlzIGZvciA2LjE3PwoKV2ls
bCBkby4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
