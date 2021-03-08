Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AFCC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 20:29:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3623D60235
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 20:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3623D60235
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zTLUgVPNkwBtbnY2MnLQeIBX0NtdY1pIvQS6NXMgjyM=; b=ImlrtFUnGQxMrWI5bIIsyL/Qcw
	xDSXI2kAixD0U0Kst1gqjjFJf6DNl1I3+Z8beQiehLHgT2IdRpdYoTz7zAV0vsLYSte5yr9k3JR+g
	RqzjSXB95jd30OYTA8fm1zBI2pcIkf/sx5cjNyIj6unl0KGCsk7hsftMRqU9QhIBsp/dOGCbVgCS6
	dNz6MkrZDt5vEEmBSF1R1/JaxNBlHnh0/KC19DDTCWjh7IFmBesoqaeSP4dFtJp1oAZd7okJWdZuf
	ey+9E5VqurcXGl8EDk3Gs86nrg++LRIMiRhKyiXtmemT/HQwgO8tAvqKU2Vl6ZkpNWJXKEJoyqaf7
	74Js5LhA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJMUR-002cwZ-SO; Mon, 08 Mar 2021 20:28:32 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJMUB-002cmB-Kl
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 20:28:20 +0000
Received: by mail-ej1-x62d.google.com with SMTP id c10so22943838ejx.9
 for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2021 12:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NvadRTyAu2bEatgntz1xTlD/+6CQIU+QXTtOxiL9MKw=;
 b=R3qxIbr3UgiLtn1YDTg5ZL8C8NoVeG7eQEpYzYraQxiKyZe2CHRiTFdOtgslbKG14I
 Rc7r70128QSamfdv/gH3JQD3ywkUVtx/0oVjqrIc9yWNGsWnpz5Ro7bxeyKu3IOUhdGC
 Cz5cqDqK+f+rgF7Fj70uwi6pfNNX9Ha56x6BC21Nh306ahrPzn0X/M1iRwMaTOghIdNU
 4dznjLtyuOBDVeQP0Dwy0PDnhrvMwANGp1jYWxviTIsfe1NB8HXxYdIPo3JCWFn0BNMZ
 pB85XeWez9+7apPn9IzxJoR0FcJpMWZG4OxoJ08QeftPfz7DXyqrzMRcUAcRq5S+k0Ye
 6drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NvadRTyAu2bEatgntz1xTlD/+6CQIU+QXTtOxiL9MKw=;
 b=AcNxd2wERmH1W+dwFxffIdJIg2D4pWf6R9k6OIRApkIIeBdV5IQEcpGHt6AedFAKzr
 SfUa5LsOY2I8aAfMPWSLyhtOVy4eQ+7cpDYdhDQ3ZY98XZHDnT/AOjMf4r5DRX+eruG9
 IC0z3RsdD+tXbCOk+6lxPgc1hS456MKIONN32d8NEASvttvBlat20cuMn4iiN6sA8vi3
 HpYNixIg5OaZAdg/CMxCaIWBiTVl9k5oJUDwKWrbjWA4VEtvchSLeST1vEvxJI/KqT+K
 5am8IL0IlTSdzcx0ecZWarVATLapp1k4sfo8iA1sT/C2AVsZX0bwqNl10faYhZYWPe5+
 agfA==
X-Gm-Message-State: AOAM530+CqhjMX/Of9/mfKX47FGTOH0A4gd3XGpGDEGILcF+PLWu/soH
 YbM3SRT1R4dGW7Q1lE5rAQ8=
X-Google-Smtp-Source: ABdhPJxpY0jUBKzaAkFqi8ozlLFtpXzb8704Bf70GDoclXb/s+d9vZUg1OIVmD1Q282elH1zahm1RQ==
X-Received: by 2002:a17:906:2db2:: with SMTP id
 g18mr17131388eji.73.1615235294986; 
 Mon, 08 Mar 2021 12:28:14 -0800 (PST)
Received: from Ansuel-xps.localdomain
 (host-95-247-48-130.retail.telecomitalia.it. [95.247.48.130])
 by smtp.googlemail.com with ESMTPSA id c18sm7624483edu.20.2021.03.08.12.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 12:28:14 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] mtd: core: add nvmem-cells compatible to parse mtd as
 nvmem cells
Date: Mon,  8 Mar 2021 02:18:44 +0100
Message-Id: <20210308011853.19360-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_202817_984028_2A6657A0 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Partitions that contains the nvmem-cells compatible will register
their direct subonodes as nvmem cells and the node will be treated as a
nvmem provider.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
Depends on [PATCH] mtd: parsers: ofpart: limit parsing of deprecated DT syntax
---
 drivers/mtd/mtdcore.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2d6423d89a17..ac1b4f176a17 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -531,6 +531,7 @@ static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
 
 static int mtd_nvmem_add(struct mtd_info *mtd)
 {
+	struct device_node *node = mtd_get_of_node(mtd);
 	struct nvmem_config config = {};
 
 	config.id = -1;
@@ -543,7 +544,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	config.stride = 1;
 	config.read_only = true;
 	config.root_only = true;
-	config.no_of_node = true;
+	config.no_of_node = !of_device_is_compatible(node, "nvmem-cells");
 	config.priv = mtd;
 
 	mtd->nvmem = nvmem_register(&config);
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
