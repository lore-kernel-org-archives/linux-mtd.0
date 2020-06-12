Return-Path: <SRS0=prrA=7Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB7FC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 21:29:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BE7120663
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 21:29:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RYu+meLb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgiE7Yxv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BE7120663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5Aaejqu2+V5ThGOoYcatJkMgtUdoONlyJwvNSocunxw=; b=RYu+meLbkC/OHGd2SrpdCPAy5g
	uFLFkB1CuxxjIs4WB4BCYy1wLFOEvnAWnypeXig432VBjLrcOb3HlW9C9KW1m34QUTJNZGbk/C6rU
	jRWw9T9hfyFLnwfJ0ZDv0udvyCvTqo089mlp+BqqP1XqFy8CIoXbfOaBZsyILZza1VW9b/lah2350
	/BiWu305jZID2kXDvwlFlZwbG48Fn7bKUhZshp5g1GBIM5EYY+D/pHKfg6XD4Ic/602un7EmCTzxC
	ETyi65HsWYiqFVlqWNptwlgH9z9SUgIqzH6O7AOonvy+tBj+diJM8mu+irVMU2LltlhTtLUopEKwb
	rXvOg7yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjrEx-00064F-2e; Fri, 12 Jun 2020 21:29:31 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjrEr-0005vb-Dq
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2020 21:29:26 +0000
Received: by mail-wr1-x443.google.com with SMTP id j10so11381569wrw.8
 for <linux-mtd@lists.infradead.org>; Fri, 12 Jun 2020 14:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CMSRdAMjqQ0hUIKg7+9PjXGS1txRLKEo1w8Yv1LWP4U=;
 b=sgiE7Yxvxl9Y4Ht4Q2v4oPYkEK0Fz7gmbTbu2x+0VwWkT/K/4p2dxYX7VhNh8hUVBA
 Oz/l6pMJiXtm4wbmZgJnDpBgP0urRmoMv3VUdADKZZGhBnGnh8i3yOSXXZSmtYpicVeX
 yCKhHihBQAua3m8VhYbr+dpuccfVP3MSR9axQu9Z2RigKYwKhYxB5FjO3nfuHrD4vvgz
 aIyHvaJEr2pc2bS+Rivuo7A0E0mYiqlxFUsMw0Yw6yNa9O/K7xr7l4R/s8iYlP0QeYtY
 kLnAG6JqtsTt2lX/JhBwTBepzmeWIxblqFc8hp8QmLfXnWi7U4QmpWKTSzgdoAx3VBui
 KlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CMSRdAMjqQ0hUIKg7+9PjXGS1txRLKEo1w8Yv1LWP4U=;
 b=V3kVoDikuPDLOnyTztiieWxSaLsuBhUM3uqhb+KB8UrgoLj6RqJ3vpBe/ZNHHSXLzM
 6mloBBQISGSY5IxcBe6Cy9YbtVYYJjusYVCqCGehgXLj++dvfHHXkYDOjZSLKnOp4iPT
 +TzzkVRyj+RB50H24qenKYYdVNoyUecnTt2+MSrDJpVn95ntI6LdB8OyKZppCKbvoH63
 Q5+GUKhrnFo6/gAoGc47ZvSWQAMIdXvjbHJwy7T1l/pkvOciqekHqIYPJuiZVnOVbh8y
 oW3gXDKtHAytQHRFS8ZLgRNBdeTF7cJuE1EtOHuXF6GN9HbDnwClKLlXHQoBkni0nDWO
 9kZQ==
X-Gm-Message-State: AOAM5338p2r5s8ocVRYS7rcsLTVdm0rB+DrtvI4UD9kBXSG3aj1w8F/Z
 kdsABohX3FXZzS42a5DnIaU=
X-Google-Smtp-Source: ABdhPJyv5GIgPQ9eO6QSupsEk8hcs6qEXOwQe2ngWetm4fbiOaRcihoSEmG/ke54phMF/9AmFY5C4g==
X-Received: by 2002:adf:a34d:: with SMTP id d13mr16218472wrb.270.1591997363791; 
 Fri, 12 Jun 2020 14:29:23 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id n189sm10442048wmb.43.2020.06.12.14.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 14:29:23 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH v2 1/2] mtd: rawnand: brcmnand: Don't default to edu transfer
Date: Fri, 12 Jun 2020 17:29:01 -0400
Message-Id: <20200612212902.21347-2-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612212902.21347-1-kdasu.kdev@gmail.com>
References: <20200612212902.21347-1-kdasu.kdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_142925_469647_C50D1977 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When flash-dma is absent do not default to using flash-edu.
Make sure flash-edu is enabled before setting EDU transfer
function.

Fixes: a5d53ad26a8b ("mtd: rawnand: brcmnand: Add support for flash-edu for dma transfers")
Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 8f9ffb46a09f..0c1d6e543586 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2953,8 +2953,9 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 		if (ret < 0)
 			goto err;
 
-		/* set edu transfer function to call */
-		ctrl->dma_trans = brcmnand_edu_trans;
+		if (has_edu(ctrl))
+			/* set edu transfer function to call */
+			ctrl->dma_trans = brcmnand_edu_trans;
 	}
 
 	/* Disable automatic device ID config, direct addressing */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
