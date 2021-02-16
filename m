Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4574C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 19:57:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 611EB64E79
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 19:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 611EB64E79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xUM4ZKrXxpLOPBarbcmfWfhMFG6R8dBy8EBo1zJS17U=; b=KeB8OPvDIzKbMD2aQU1EZi9bL
	iqfsYo8ycRWQP0Wo+56zoguNVZHgRXaMKqlXnqNuy7O8aBmj97Z0eLv0oPt+8YpZWoiWoNfoWcge2
	K6oXYOf3lYXcIHdQYOquLjHOe+43ZGTAy3qJcXFRfbMkaHstEM+IMrw6awm0it4aT8TFlk+SRu3Hz
	FMheh4cAWAiEtGN98gMHr8EBxA6UFjHEc5HpQCnrzi04npbrm32YEwAh1SVe3CXusw+i8x5kuokRJ
	2QbgC5eHjxgEWrtjd7BNkc/zRDtNhV9oQ+L/oSaQQ6C88hTZH9Jg9GxejRGxTGn3xvFQTiHutIQWF
	0rturhaHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC6Sg-0006Xa-GA; Tue, 16 Feb 2021 19:56:42 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC6Se-0006Wc-HG
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 19:56:41 +0000
Received: by mail-ed1-x529.google.com with SMTP id h10so9082028edl.6
 for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2021 11:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mw6ldDIPHpBoRiawt77fVDG0nsr8XAXcGyvERLsKDMI=;
 b=WNV44HZOqaFZg53RT5bumXB0KIrzTa2Ev0n48Gmus92+TJdTVGCELuURUgNnK9O2vR
 QMaFPp7wxhHiQHg+5LpwhwultmDctvh9kluFmwKchw/bkYkiIfuPigkCkfmFLL/ATxe0
 K8PkhahyiBJwdpTuJqEvD+bLLGEI+bzeTkmGh24Zotd222GcExLUYgxd9zRTl+UBelej
 clMLDJLBGi2YworI/1V5ECosVo5/2CoHumuYV4KMbSru2Zfs3KciFFLw1U8P6qIb+700
 HAvAzN3y2tM1uuD7qK+/mTZ6bf9IToQpWr+sirILq8fqTy8yGt6GNdSe8QNChaGlExCx
 32vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mw6ldDIPHpBoRiawt77fVDG0nsr8XAXcGyvERLsKDMI=;
 b=C9E3DBrHuz8H0aobb/JGDZPwB16kF6lzbZbE+ZsTZRmaLIC0rvt/kL/Gsz79F03/3F
 J0fCQsQAn79V6cTh5kzH0M5eF4jHSl/vI0D+e1WzFDUqc79hTiN8xCQPFDBw7N3xnACx
 tXC/XPttUTVx94UZyLbR2Ll1gzTlDrVpAKFj7SGhPOHxmqO5xoDVOvwgizsdYH07pz1z
 89ylS8h5ywt9QayMf6U9UEtrYOS/WZIPWKb/Ln3Sr6G0QuPUZcjHwhFOfGmJ2HYhKkS0
 KNJzd1ayQWcsIVb5xFf++hIOftZL+DOOBSuLf0wQ52FDV7i21deyzaFT3Kr2DC/f8I+R
 Egkg==
X-Gm-Message-State: AOAM530tTDmH2gWRnsgl93i+WReJ6391B/ljQBcKvzHEru53ftk6LF1d
 XBMufYyQBb+UrvzDv0NLq8I=
X-Google-Smtp-Source: ABdhPJyIx+qTiJArsI17Ha4K46SPsv9hT71NBkwO40EDIk2uD2lO4V5LCEvO156XrnhIQSawajuD8Q==
X-Received: by 2002:a05:6402:d:: with SMTP id
 d13mr22982687edu.274.1613505399220; 
 Tue, 16 Feb 2021 11:56:39 -0800 (PST)
Received: from Ansuel-xps.localdomain
 (host-87-6-252-11.retail.telecomitalia.it. [87.6.252.11])
 by smtp.googlemail.com with ESMTPSA id rh22sm963332ejb.105.2021.02.16.11.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 11:56:38 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/3] mtd: core: add nvmem-partitions compatible to parse mtd
 as nvmem cells
Date: Tue, 16 Feb 2021 20:56:10 +0100
Message-Id: <20210216195618.27959-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216195618.27959-1-ansuelsmth@gmail.com>
References: <20210216195618.27959-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_145640_587560_E279D03C 
X-CRM114-Status: GOOD (  14.32  )
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ansuel Smith <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Partitions that contains the nvmem-partitions compatible will register
their direct subonodes as nvmem cells and the node will be treated as a
nvmem provider.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2d6423d89a17..2a40b00ec3d0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -543,7 +543,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	config.stride = 1;
 	config.read_only = true;
 	config.root_only = true;
-	config.no_of_node = true;
+	config.no_of_node = !of_device_is_compatible(node, "nvmem-partitions");
 	config.priv = mtd;
 
 	mtd->nvmem = nvmem_register(&config);
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
