Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133AAECAAD5
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Aug 2022 18:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PCcZtrScTJ/cCLPzZAfCm/YTDnpY2k6Ittp93b/Gdl8=; b=UEaDg1UcdF+GuG
	lJZFM6xiiVNtQ3oBUc+fa3x0zrqft2rwAuIHur4WGzIW0glOE14hv47ENqs1vfEywoqGwkkeE3CgI
	5GAxBnpl87+fc6UmnJ5IQDajIGaS65mwm4hB3bGJLyk2BgRZ8Z9RqDIRze7zGzLi0NIj4BVX8n1lz
	zL87A5oPYmafcZyh/tECC3VgY9FJrQEIlFiKHr0WafW/ZjXXJvXJ0srYMhkxlusauMF3W6JZwYIp6
	sWL/jkykpxYt7nlO3cSG57MC4AVksdJm4xNKRBYvc1gcrqrJRLL0SY2Yg3APOyZPKTG6eIdOB5PpO
	rmJiWwYxpOh+YxdaT3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT63L-001Dqx-Up; Tue, 30 Aug 2022 18:33:36 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT63I-001DoQ-U9
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2022 18:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661884412; x=1693420412;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=h1BxaOOoiltf/jjn9jarqjcp6JmDX52ctebixNc5/GI=;
  b=FaEJ5VRnxchQti4Bz+Yg5QVdyNAyeksswkBEuAaowKncX9yPQA1/xhsO
   UfLS3g2E/BpWNmw8chP1b24KUokzc46Ux144gGAnF16aa4kVmK/b7Z5SK
   P2sl9KPBe4/Qb1Y8fISs9tz8WT1E51U8FKRbrfzUctDwDV41FdUiGOlsk
   SeTrLgcYOLwIRIdACzFGXgRhC4nY5O/BArPpNOuB/koiNYUs3prhcM7Qh
   73jZi/0splORQlEJOkhXJ5F1dK3zSRf/yK3PB5rpxzeI5Mxte9tbr9sdW
   WUwf0feaR75JzC8NjNfT4W8i/CHbUSqIaad3bsOOEZiDj5geUD/xZ8ahD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="381567826"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="381567826"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 11:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="754149113"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2022 11:33:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 31461AD; Tue, 30 Aug 2022 21:33:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] mtd: rawnand: Replace of_gpio_named_count() by gpiod_count()
Date: Tue, 30 Aug 2022 21:33:36 +0300
Message-Id: <20220830183336.49966-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_113333_008323_554AD9CF 
X-CRM114-Status: GOOD (  12.44  )
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

As a preparation to unexport of_gpio_named_count(), convert the
driver to use gpiod_count() instead.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mtd/nand/raw/nand_base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 6b67b7dfe7ce..2200276c7f25 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5331,11 +5331,10 @@ static int of_get_nand_secure_regions(struct nand_chip *chip)
 int rawnand_dt_parse_gpio_cs(struct device *dev, struct gpio_desc ***cs_array,
 			     unsigned int *ncs_array)
 {
-	struct device_node *np = dev->of_node;
 	struct gpio_desc **descs;
 	int ndescs, i;
 
-	ndescs = of_gpio_named_count(np, "cs-gpios");
+	ndescs = gpiod_count(dev, "cs");
 	if (ndescs < 0) {
 		dev_dbg(dev, "No valid cs-gpios property\n");
 		return 0;
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
