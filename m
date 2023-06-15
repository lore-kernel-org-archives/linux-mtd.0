Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE9BEB64D9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 16:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1QOO4SKU7yp4fkYtrOFZTXz6IRjukacHGtfkZTgHnpU=; b=HvgpJpk+vobeNH
	1Mkh4psZoXt4CjKVRqDOUoVlgbWN+Y1zzTHSqeAQ9LVIYPM+af52qU2qYsiRXAHeYNEsZS7WJ1oj1
	gaiCk/YwlTzgsht2j1gA8ILMv0k66RQ3Pp63J8WHpXWLpB/s0D7sPU/XNg0Lnqcv9faY+/b1LeDWG
	VH7KpSP+8Q4X+UuF2sHNv1u9IxdBDVk3aOwSwQigHYvB04zbCp8Q/v++n2to2wsVgKdJOAKPAkJtC
	OfroRDyjctgq7f7gEdnn84Ybwm5BfWrxZP3sHiGrs221bn52FV7YPBJ68xhNA9i39z722ZQQ1JfvE
	UmpiOJ6wVxoWvSGbQaZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9q2z-00FSqo-17;
	Thu, 15 Jun 2023 16:42:09 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9q2v-00FSp2-2m
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 16:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686847325; x=1718383325;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SjfkhPAqQ8PyzFqydNEFnaWjUK63HBu4s/AtSRqBNIk=;
  b=Hvaz0Q7p0XIaxUydNFugAE9dQOWiGn9PuOJb3GyIgKSadpv7PhUhT8YD
   YMebWk6R7sM5P3rSmClUff7CvaIsPgXPcQKShhNUSjVwYmTW+4F7PL4il
   31Cdmf2M8h0cjT1tCbkAK1bvufr/j27AbzyhUa5iC3BZxIT1/5aO+ZZfj
   1ldQQHyKW7bRBlD6OxvpNwkOBNHB1c6bNKGLvdtLWIL1XERfErRmCkFU+
   u9j7XQz3p0SPzFL9cfotMv2+M0/u2LXBCGj2IqraBFBt/7tlvKHYXeNEE
   CEXrht0KoBiXdj7ONWMoHNNloRpcZARwpNe2peiSVamhYJovf+WCWkz9e
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343702877"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="343702877"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 09:42:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="777742128"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="777742128"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jun 2023 09:42:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 624C5379; Thu, 15 Jun 2023 19:42:11 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	JaimeLiao <jaimeliao.tw@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] mtd: rawnand: Remove unused of_gpio.h inclusion
Date: Thu, 15 Jun 2023 19:42:10 +0300
Message-Id: <20230615164210.25515-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_094205_942410_F66B1A6C 
X-CRM114-Status: GOOD (  11.08  )
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

The of_gpio.h is not and shouldn't be used in the drivers. Remove it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mtd/nand/raw/nand_base.c | 1 -
 drivers/mtd/nand/raw/xway_nand.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a6af521832aa..132e3bee8f5a 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -42,7 +42,6 @@
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/gpio/consumer.h>
 
 #include "internals.h"
diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index 6b1e2a2bba15..5a19b6b314b4 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/mtd/rawnand.h>
-#include <linux/of_gpio.h>
 #include <linux/of_platform.h>
 
 #include <lantiq_soc.h>
-- 
2.40.0.1.gaa8946217a0b


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
