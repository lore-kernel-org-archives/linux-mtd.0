Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21A8C001DE
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Aug 2023 17:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iB7DXlOsyGuOlOHiE8xzoMBxFl/rPKRSSSYUnJYY4Qc=; b=WM89qSo3qMlcoM
	OY+6G+QrfhB04XiNjWUgApC9pGJazxmnCfzA3pnb73PPkY9bg0s8fMqSRfhFTTqPZockPTLtJUkeo
	Ivutmnds6tNBs5PrrTkYhg+sDiuNGEItWZBV8rokhYyI5jnhoINTRNtbdfAA00dXBVd6TnUU84LiJ
	ZLPuLRlwkBWGlqXcAQ9Q0a+fqrbaQgKGg/OdLbyI/eD/JHNnsO3xo4Cs44e5YuL2qUnE6ggpaQ9Ds
	ObFXVQbkVwwFL+zWr9upDU1AVbCox9wjjKGF6g2GxaU1rcadzBXsxbILff50exKbb0TXclRLf71gW
	YYZa3yAUf/Mkm1O20hOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLIa-00EPAf-38;
	Sat, 05 Aug 2023 17:42:44 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLIU-00EP53-0X
	for linux-mtd@lists.infradead.org;
	Sat, 05 Aug 2023 17:42:43 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-564ca521549so870083a12.1
        for <linux-mtd@lists.infradead.org>; Sat, 05 Aug 2023 10:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257355; x=1691862155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HN0f2LOKeZ6eEoWkB3wmreNy3AFR6iUd1H9kbvp/ehA=;
        b=kAh3rzHl75lVGO7PZrVPAypy0Oexu0VKTje94TlCGbSduQ+Man2JdW9EbqXb7oNuJD
         Uc3fItb3E9yDaFi0dayjguINssLDunrCXo2we89n4zjze6JekLxTQhV2RiiZZ+gDv7lX
         /c0EDF4xL8NMKtp69j9pc0+k17hR3sHwo3tzmrcK4/yyJHT7B669scqmRJYcsENqdLrv
         0ecYm0IuWiMAFg3OZFHOn+GLL+ovcplRgWCNezFF2UiiKENlKru/EskP01YIqKX2lLXt
         nbrTaCNxB5UZnoGRuDcowQQQZ9NKJyqpMoFbO/B8sWhj7cu4zeeNdHMISM4JObt+soxW
         MSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257355; x=1691862155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HN0f2LOKeZ6eEoWkB3wmreNy3AFR6iUd1H9kbvp/ehA=;
        b=PxMsm6Txe+iI0njRe8ukkNyypaihnBOg6aFeoOOmGKXCsrxoIKIOCatfT+G39A3/+7
         S6yh/bTvd6Zzo2q5OLnb26IBNJFxyZL3uLZMizv8qdvSN+J/1qR31GiwOe00KJp10qef
         roVFXweWaRuwhCdWzzgVwjHurt6wdRG8b2Po1EID4w1cnWGbdiEwb+Yy57emouS+CG9I
         aggrZp+G7Rgao8qtSPaPR0HylUu6uou6N9QsrX688/5hf08R9DVcwAdAJcrfGoc8N19h
         tF/a37K6nP9/c4LMhGdLekheMgsTQfigpsmRHIZu2r9QLm7jicJcdHMMU5RC4Qa0cfBW
         QMUQ==
X-Gm-Message-State: AOJu0YxiwgjwDsH9TE+9Yu/Nwc8mGE/GdxtakcGkwfZcRvU/OnAzsIPX
	PAXkvmWq2r25addm7vC4LQIb
X-Google-Smtp-Source: AGHT+IFjBXPzDhGC+YxAaUnKhYgvfBaOEAF4Hp9xdEsX8uxBumlNIYcVEzsjcorJg843xxFN9GBbUA==
X-Received: by 2002:a05:6a21:789a:b0:133:7276:324b with SMTP id bf26-20020a056a21789a00b001337276324bmr6489967pzc.23.1691257355606;
        Sat, 05 Aug 2023 10:42:35 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:35 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_mdalam@quicinc.com,
	quic_srichara@quicinc.com,
	dan.carpenter@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 10/10] mtd: rawnand: qcom: Sort includes alphabetically
Date: Sat,  5 Aug 2023 23:11:46 +0530
Message-Id: <20230805174146.57006-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
References: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_104238_220696_8B47936F 
X-CRM114-Status: UNSURE (   9.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Sort includes in alphabetical order.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 0fbc6d1a558c..d4ba0d04c970 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2,19 +2,19 @@
 /*
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
  */
-#include <linux/clk.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
 #include <linux/bitops.h>
-#include <linux/dma/qcom_adm.h>
-#include <linux/dma-mapping.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma/qcom_adm.h>
+#include <linux/dma/qcom_bam_dma.h>
 #include <linux/module.h>
-#include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/of.h>
-#include <linux/delay.h>
-#include <linux/dma/qcom_bam_dma.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
 
 /* NANDc reg offsets */
 #define	NAND_FLASH_CMD			0x00
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
