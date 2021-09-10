Return-Path: <SRS0=TiF7=OA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898BEC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Sep 2021 21:15:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4617561208
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Sep 2021 21:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4617561208
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eomL/6TM+gFCcqZFKyGL8AiRJw3hcbI30W96jiEzzH8=; b=kW9joTP6kiI0OQ
	44VDxLeiiY5vlPHTOZC0UB5khexqe8AXNc9byvYeOuikr+0y7+Jb+UDaaab59nHNSGinBuIHh3W8q
	AjJVv/8Vx2/79exzRMVQ7dj8dq3DytgwqClmSBhKcug1rA9xIeu4PLDxtJ/cKXmLDbCydZQcuY7wx
	JwOvUCKJfW39PjmR7s9W65RhdOGUCuTsBjlNbW1vHy1P23xEfxZd1NcVp8sFn540chMvfo4yPnZXN
	7Cx/CdHYgSF817HS3RUBoqvMDDCAwuPe8Ayc8l2w7MrFBZbuaj5SMjiyPBmEMSk/F9yLylt/dcMvy
	nmfmDIOBexsk6sdVilmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOnr7-00DpKu-0k; Fri, 10 Sep 2021 21:14:41 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOnqs-00DpIC-2J
 for linux-mtd@lists.infradead.org; Fri, 10 Sep 2021 21:14:27 +0000
Received: by mail-qk1-x731.google.com with SMTP id c10so3549143qko.11
 for <linux-mtd@lists.infradead.org>; Fri, 10 Sep 2021 14:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version; bh=yy9VTL19A1dzaIba5Ts/1jixvPZOXCIX550FYcGYhkU=;
 b=Jwy7PDHFW0wMYuW/30SGKbZrc/Anvs/RNtFbFLCY7xQJvrJFYcdeuHRpsblyIoE4R6
 uGr76mQODUI0LyT/2YgqyMZgOVmnF8VMC0kAB9aENEvkqyGcBQ8mcJX+SKuzYmridFi9
 +LQuij1VcNbrjnvjzZVd2VSWOE8P7539pOHqJfizXa2k17cGQP759MV+N19IhE+c/PLw
 jFs7Yee6/XRImguCtMausS506pfQyMIUfJ2/Jvln2iPXu0MZBvgJU0nHFExlG94cdN5x
 5K0VgeNeJ/ZdDzF4d44kjdX4bPd0bBBdp6S4sAm2L5alCBDb3+g5YrCTOO3clfHZxi+E
 HIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version;
 bh=yy9VTL19A1dzaIba5Ts/1jixvPZOXCIX550FYcGYhkU=;
 b=msnEbez2r8q9DWUshfdh+sajyL9iUwC0SkDoK5W8n9p7F1T8Xc2N1qJunScZLnp3OR
 uorHxN/671p6b+mR4fnAHo9yfoOsN1YDuYk6szZeczM7hfq2Ufwf8f5sp/PbC8xYmKYZ
 yR8Nz+w3bhALGnpctiDAmvJYxXktTBBE5kRE7Vf3fiKzib7U8KXe2EyRTA1QJ0ZGeFex
 HjtpmHxgDHher1XlWLvkD6+Bo8Q77o2r3iom71An8gXf42vcuJlSOyMOfY6vQNcPZeCQ
 x0ud5YFBeJhVo834VInIlgd5tuHni4TRyCtkS8w8ZufUtPNf7Ej9/3To0d9W/bjMb9P/
 4ErA==
X-Gm-Message-State: AOAM5311t6lZVS6Ex3Lm01KZ6QbHzYSCBmQ7zbLrMh9k6m6jFu6nRffr
 o2KKinoPmQyjuuyAs2ZHbI7zJJ7nF1aQhXopWvOUz8WrOpPb0Os7RcJhA1syKSr0JRh2Od5CNtz
 nTRfQmCaC7nrn/7SspgVM1+s8IgPLxMWolU+pq5wBJMuVsbjGGYBYzB+vS+1kbv2vgozbO5WK/S
 nZrZcSOXCRT29P
X-Google-Smtp-Source: ABdhPJyjXr0uwUDg/gLPGaeklLo7SaRjYj/bvJVMkCVayixPgbGcBgFOuG+QDshVwpR9W+fFiVfbbA==
X-Received: by 2002:a37:a6cc:: with SMTP id p195mr9413547qke.161.1631308464946; 
 Fri, 10 Sep 2021 14:14:24 -0700 (PDT)
Received: from localhost ([186.122.181.76])
 by smtp.gmail.com with UTF8SMTPSA id s20sm3823668qtw.14.2021.09.10.14.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 14:14:24 -0700 (PDT)
From: Mauro Lima <mauro.lima@eclypsium.com>
To: linux-mtd@lists.infradead.org
Cc: daniel.gutson@eclypsium.com, richard@hughsie.com,
 tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, mika.westerberg@linux.intel.com, mauro.lima@eclypsium.com
Subject: [PATCH 1/4] mtd: intel-spi: rename intel-spi to intel-spi-base
Date: Fri, 10 Sep 2021 18:13:45 -0300
Message-Id: <20210910211348.642103-2-mauro.lima@eclypsium.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910211348.642103-1-mauro.lima@eclypsium.com>
References: <20210910211348.642103-1-mauro.lima@eclypsium.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_141426_157605_35D0C64D 
X-CRM114-Status: GOOD (  11.74  )
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

Rename the files we want to split as base files.
Include the new files in intel-spi-{pci|platform}.c.
Change the intel-spi obj Makefile to be built with
intel-spi-base.

Suggested-by: Daniel Gutson <daniel.gutson@eclypsium.com>
Suggested-by: Richard Hughes <richard@hughsie.com>
Signed-off-by: Mauro Lima <mauro.lima@eclypsium.com>
---
 drivers/mtd/spi-nor/controllers/Makefile                        | 1 +
 .../mtd/spi-nor/controllers/{intel-spi.c => intel-spi-base.c}   | 2 +-
 .../mtd/spi-nor/controllers/{intel-spi.h => intel-spi-base.h}   | 0
 drivers/mtd/spi-nor/controllers/intel-spi-pci.c                 | 2 +-
 drivers/mtd/spi-nor/controllers/intel-spi-platform.c            | 2 +-
 5 files changed, 4 insertions(+), 3 deletions(-)
 rename drivers/mtd/spi-nor/controllers/{intel-spi.c => intel-spi-base.c} (99%)
 rename drivers/mtd/spi-nor/controllers/{intel-spi.h => intel-spi-base.h} (100%)

diff --git a/drivers/mtd/spi-nor/controllers/Makefile b/drivers/mtd/spi-nor/controllers/Makefile
index e7abba491d98..fa2dc480d2c8 100644
--- a/drivers/mtd/spi-nor/controllers/Makefile
+++ b/drivers/mtd/spi-nor/controllers/Makefile
@@ -3,5 +3,6 @@ obj-$(CONFIG_SPI_ASPEED_SMC)	+= aspeed-smc.o
 obj-$(CONFIG_SPI_HISI_SFC)	+= hisi-sfc.o
 obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
 obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
+intel-spi-y := intel-spi-base.o
 obj-$(CONFIG_SPI_INTEL_SPI_PCI)	+= intel-spi-pci.o
 obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)	+= intel-spi-platform.o
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi-base.c
similarity index 99%
rename from drivers/mtd/spi-nor/controllers/intel-spi.c
rename to drivers/mtd/spi-nor/controllers/intel-spi-base.c
index a413892ff449..362fb41b969e 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-base.c
@@ -16,7 +16,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/spi-nor.h>
 
-#include "intel-spi.h"
+#include "intel-spi-base.h"
 
 /* Offsets are from @ispi->base */
 #define BFPREG				0x00
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.h b/drivers/mtd/spi-nor/controllers/intel-spi-base.h
similarity index 100%
rename from drivers/mtd/spi-nor/controllers/intel-spi.h
rename to drivers/mtd/spi-nor/controllers/intel-spi-base.h
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
index 1bc53b8bb88a..46db2743e244 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
@@ -11,7 +11,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 
-#include "intel-spi.h"
+#include "intel-spi-base.h"
 
 #define BCR		0xdc
 #define BCR_WPD		BIT(0)
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-platform.c b/drivers/mtd/spi-nor/controllers/intel-spi-platform.c
index f80f1086f928..5d6b6125c4b5 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi-platform.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-platform.c
@@ -10,7 +10,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#include "intel-spi.h"
+#include "intel-spi-base.h"
 
 static int intel_spi_platform_probe(struct platform_device *pdev)
 {
-- 
2.31.1


-- 


This e-mail and any attachments may contain information that is 
privileged, confidential,  and/or exempt from disclosure under applicable 
law.  If you are not the intended recipient, you are hereby notified that 
any disclosure, copying, distribution or use of any information contained 
herein is strictly prohibited. If you have received this transmission in 
error, please immediately notify the sender and destroy the original 
transmission and any attachments, whether in electronic or hard copy 
format, without reading or saving.













______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
