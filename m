Return-Path: <SRS0=xEIb=XA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58796C43331
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:20:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3C182082E
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eGrK1o0w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Esj7f4QN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3C182082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XzRyxQN/6hbT8u31uAFpls02fklQQWaE8F+lYwyk46U=; b=eGrK1o0wNnRx8mgHylGYHj+q3Z
	qP5K8gaF4suYWOQ1LLhtRy9FiUVoPoIKHEY/ZKghEqoQWAIy/8PM7U47FzPgDzpP3ZpmIH8VoLRjy
	m0btiK69I6G4RQuDP2sk2tZP7E2x05mp2tPv23YNcoc1KKCN8XTHtDNEBREe38dhCsAMmK69FXMtE
	4TlmCJLDnQSksGFBM/vO49yZERbRHwZ5v5b8/3+k9/5SMHk8pefDAUmDdtogiSOzkSq96YkBH2CqA
	MRVOt/q91IwndJ6wFBI+nWkoH+DV5ptQoFV45Hn3qaxZGcpTLVEeyBpzA+UaNa/e6AGeZ3LC6j5xc
	cgWa6LNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5uUK-0003By-OI; Thu, 05 Sep 2019 16:20:00 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5uSa-00011d-RC
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2019 16:18:14 +0000
Received: by mail-pf1-x444.google.com with SMTP id x127so2068161pfb.7
 for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2019 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zGhRU3CF0nckn4q3RpFyAUKnMAipsfpJ2Ggo67IAKJc=;
 b=Esj7f4QN25ld+Ovd4UPXhi2gSS9+Lzc1VVLMSaLedss00TUu/574n7510/KARXCZI3
 7W6vE5cd7uARf9ipf0Ags1oPwG3CFAYVMe29Tybo5a64c/5svbgUNtDOdTUTjtzJgzsk
 BBVG0AUZqbY2eMEesm9XN02filAWjn0hrxTZtIA6mzGsPfn9CVvXwJMErc9ztNrFDZlQ
 hSJdg6l4K5XNAYyr1Od0KnturBe85nLy/GTao8rjSvtfT1nPC/0vFWd+7bbID+jHlLNF
 uVWRzrdTujIrO+oTLdms5SAw0eB7uKDL1CNjQPdxf+8SUROE+hX1TvIpDFBHgWNZSiuB
 ++TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zGhRU3CF0nckn4q3RpFyAUKnMAipsfpJ2Ggo67IAKJc=;
 b=uFOAgoZH5kkREPoms8vOFKNK5r5QKEvMEOmZdWmG+aC4MPzTvqV4hxTXUObJ4Xw9FW
 UXkpsui13wqgVxF0GMQvJLbowmw/gHoPQBfkw5vMQNg781q5lsU9JGa19+1Zu+mkv2LD
 4LofS4E9Dpshx8xwAJXLY2lwjS4jnoJVccfX54wqK6D9aiisgDJI6pK0VFW9YrTshr1c
 YXLjdvRHFr7lCKO1l3rVJKaPY1WaN1h7TxdNwvi/3GdL1dTbTvbcH+Onu2w7+fC9wtWH
 /LXn8M+AsONPu5ve9apFNQXrqdnDIglaQAeuIe63jd2UUyOe00BjGA24QhRv7UIFd6Td
 4czQ==
X-Gm-Message-State: APjAAAW54eKKzuR2C/dR/4v6/f+bK9V/OfighzPKSNG6TLNipy+IAtqg
 fy/Oq0H0uB4ZoKjtt4ZCv6AtVA==
X-Google-Smtp-Source: APXvYqxNw7e1zU8HXSUIIVJJi/ZzjnAKR5k1wwrrYFe2F5hAHe78MAzfLAz3iUKxFfZDzG3VAqGKEA==
X-Received: by 2002:a63:5f01:: with SMTP id t1mr3605020pgb.200.1567700292199; 
 Thu, 05 Sep 2019 09:18:12 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:11 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 09/18] misc: pci_endpoint_test: Prevent some integer
 overflows
Date: Thu,  5 Sep 2019 10:17:50 -0600
Message-Id: <20190905161759.28036-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_091812_939033_4160E480 
X-CRM114-Status: UNSURE (   8.34  )
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Dan Carpenter <dan.carpenter@oracle.com>

commit 378f79cab12b669928f3a4037f023837ead2ce0c upstream

"size + max" can have an arithmetic overflow when we're allocating:

	orig_src_addr = dma_alloc_coherent(dev, size + alignment, ...

I've added a few checks to prevent that.

Fixes: 13107c60681f ("misc: pci_endpoint_test: Add support to provide aligned buffer addresses")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/misc/pci_endpoint_test.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index 9849bf183299..504fa680825d 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -226,6 +226,9 @@ static bool pci_endpoint_test_copy(struct pci_endpoint_test *test, size_t size)
 	u32 src_crc32;
 	u32 dst_crc32;
 
+	if (size > SIZE_MAX - alignment)
+		goto err;
+
 	orig_src_addr = dma_alloc_coherent(dev, size + alignment,
 					   &orig_src_phys_addr, GFP_KERNEL);
 	if (!orig_src_addr) {
@@ -311,6 +314,9 @@ static bool pci_endpoint_test_write(struct pci_endpoint_test *test, size_t size)
 	size_t alignment = test->alignment;
 	u32 crc32;
 
+	if (size > SIZE_MAX - alignment)
+		goto err;
+
 	orig_addr = dma_alloc_coherent(dev, size + alignment, &orig_phys_addr,
 				       GFP_KERNEL);
 	if (!orig_addr) {
@@ -369,6 +375,9 @@ static bool pci_endpoint_test_read(struct pci_endpoint_test *test, size_t size)
 	size_t alignment = test->alignment;
 	u32 crc32;
 
+	if (size > SIZE_MAX - alignment)
+		goto err;
+
 	orig_addr = dma_alloc_coherent(dev, size + alignment, &orig_phys_addr,
 				       GFP_KERNEL);
 	if (!orig_addr) {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
