Return-Path: <SRS0=6kki=IC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AAEC433E0
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Mar 2021 14:11:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4779564EEC
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Mar 2021 14:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4779564EEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=782Z/yZ/h7tF7/iYAJhkku4f64thhikqpKeDouv1uDQ=; b=Ada5fndYrbH5bqAUOwZSHT92EF
	qYd6Tq11Fb5GZB8jaq6EzdTPjATlRJ8SPUYcn10vhCTNeoDUSCaq74xPaGf4knK5cRMhGWavlsPrf
	kv+aMlwE8q8BIpabls2DeK08aNAUDx5BQ0nmd+UAOfNkyZvvFNlXjFgA5VeMHEXPiN+mmFyTZlB2g
	ivWwHAPeX48DCECCwXGVK3vrJQDdnkmoUSx08Fpd7eeb6Ia8C9t3Z0cIwwH2d/fAqkegOcke6bU6+
	EVV6KqQNVuHhtqmb0xFjyi69fFM/Fz/QwtVeVE17dCKek2B52mE0NIjsr6QPJvNXUz6jLi9YOqUbV
	+ZYfF2tA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHogH-008r9Q-6C; Thu, 04 Mar 2021 14:10:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHogB-008r8X-0Q
 for linux-mtd@desiato.infradead.org; Thu, 04 Mar 2021 14:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=aKdMn4+VUdpA0AC6/eLIrZLXgXFkYHDr2v6uxhz1YAw=; b=HBtbhINAbHNR7e88s1PjsNQx2j
 vR07CMD/MW6E7Pg/cYp8Mg39kly8j6JBfAtqmCNxrYl+wZTBeOgL49Q2WQGaAkawthBvPctgXXb7A
 9px8FTTb7k86YT6nsKcMXaAwXml0LQ0Ih1ESf0XA24EA0CMa6pQTzwQuOYbHI5F5HN38YiEjysBQG
 3BvtqI/uqifx3I3zZOKzrof5ZDmvZZT/XqcsDTdxYjZd/LFT/LGtI/f/M68h/NlLv6Q1fOfhPNP2p
 c/f082aMVB8KBddrJcU3JJdmIvZNvPCfa+CC0GIB8y/RirYlOuNcNUHmMR1TIq5WfI5uY68zwoYqK
 MyAeccOw==;
Received: from mga05.intel.com ([192.55.52.43])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHofm-007KWu-PP
 for linux-mtd@lists.infradead.org; Thu, 04 Mar 2021 14:10:01 +0000
IronPort-SDR: 3AQ9YgqsZ4prUNdP5D+9A3MQWtfjscIDbPOz2mXgraf2efjc8PZPYGAWzz/VHwS7RUI5YZB79A
 MW46lFm+/YKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="272423910"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; d="scan'208";a="272423910"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:08:31 -0800
IronPort-SDR: 02+rxAD9CzE71lZ5ajR74ZwXJM1eBqPqdf+tv2E3DmuYynN9BlsmKsR+OmK/EczcVRBxLPBIJw
 H26alurPbbOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; d="scan'208";a="368193323"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 04 Mar 2021 06:08:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id D1E641F1; Thu,  4 Mar 2021 16:08:28 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 1/1] mtd: spi-nor: intel-spi: Move platform data header to
 x85 subfolder
Date: Thu,  4 Mar 2021 16:08:20 +0200
Message-Id: <20210304140820.56692-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210304_141001_328851_5F36B524 
X-CRM114-Status: GOOD (  10.05  )
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

In order to group x86 related platform data move intel-spi.h to x85 folder.

While at it, remove duplicate inclusion in C file.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mtd/spi-nor/controllers/intel-spi.c       | 1 -
 drivers/mtd/spi-nor/controllers/intel-spi.h       | 2 +-
 include/linux/mfd/lpc_ich.h                       | 2 +-
 include/linux/platform_data/{ => x86}/intel-spi.h | 0
 4 files changed, 2 insertions(+), 3 deletions(-)
 rename include/linux/platform_data/{ => x86}/intel-spi.h (100%)

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
index b54a56a68100..a413892ff449 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
@@ -15,7 +15,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/spi-nor.h>
-#include <linux/platform_data/intel-spi.h>
 
 #include "intel-spi.h"
 
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.h b/drivers/mtd/spi-nor/controllers/intel-spi.h
index e2f41b8827bf..f2871179fd34 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.h
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.h
@@ -9,7 +9,7 @@
 #ifndef INTEL_SPI_H
 #define INTEL_SPI_H
 
-#include <linux/platform_data/intel-spi.h>
+#include <linux/platform_data/x86/intel-spi.h>
 
 struct intel_spi;
 struct resource;
diff --git a/include/linux/mfd/lpc_ich.h b/include/linux/mfd/lpc_ich.h
index 6ddca2bbb3a8..39967a5eca6d 100644
--- a/include/linux/mfd/lpc_ich.h
+++ b/include/linux/mfd/lpc_ich.h
@@ -8,7 +8,7 @@
 #ifndef LPC_ICH_H
 #define LPC_ICH_H
 
-#include <linux/platform_data/intel-spi.h>
+#include <linux/platform_data/x86/intel-spi.h>
 
 /* GPIO resources */
 #define ICH_RES_GPIO	0
diff --git a/include/linux/platform_data/intel-spi.h b/include/linux/platform_data/x86/intel-spi.h
similarity index 100%
rename from include/linux/platform_data/intel-spi.h
rename to include/linux/platform_data/x86/intel-spi.h
-- 
2.30.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
