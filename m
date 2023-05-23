Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E831C7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 07:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VJt6AjHn1N+TVu4MnifO3gFe0mxNHlDBe/2DCjRNgmo=; b=oZ/WS303R2H2Ww
	INcLHwcZXVVQpbehjhoWAVIYCMAb49gZMHnA7UoCR8BQT2tVFb0DQTeFkOFWzObuWvsnxRRY91E3E
	mBa/PJyDanLYhbkPUnwFdndmpQEleR27HXz+l7vR5IFIgwh/hRF5GEsfyFbX+lQ2d+hLvSNef6UVV
	wYmAgVzVYiyr7aQlpfwY6WEXLm43itwo3rC8TCde8N0hIfll+CmrVsBE1mbsPv43fGbzzMDlYlh+S
	rFjXM7Gx/V6wjZ7cImBJslnr9yGeF44OlAmTvcycy0lvO/TJiyVJV7OiuPnDrqByWMh2NhsmsrXMt
	AAXNZG8IyxMer4uYNDzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1McP-009FcQ-0K;
	Tue, 23 May 2023 07:39:41 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1McM-009Fbb-2T
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 07:39:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684827578; x=1716363578;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cx/mB3gavOS5fYgm92g0eiR5Uhvh6InOnsMlrHqTa2k=;
  b=AP1sk3nflmrPi8VE/1AdBU/5cig1hy/a5yIsByMkJoUV/R1S7U8avPFV
   r41IL1fvn3WsmBYXya47ZFJFeW3lTXy9AtWR5e1Qvu4Wu9uyUSYPnVIZy
   HSX0ZNPcuDqLimYwT/HyFbXbc39U4u7FK6c2TAjt1WzJqzOm1p9qs2asD
   sClcT2kvZexrWUDV31CSjDuBJHgZmC6WUV/RolnjwyLlLh/7V0ZasqLVW
   WKKlpb7wBqAOR4QX+8GLaulxbWJ0UZCNdqmPz+49jNQWUl2tmg6OuhcGC
   24j0TjanJ34YA1rLydHEHaPI8xya4zLL7iKJrTn905m/ZfSq4BAV4l8X6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="337751250"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="337751250"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 00:39:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="793637944"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="793637944"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 23 May 2023 00:39:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 7C2F32AB; Tue, 23 May 2023 10:39:36 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Initialize n_banks for spi_nor_generic_flash
Date: Tue, 23 May 2023 10:39:36 +0300
Message-Id: <20230523073936.35203-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_003938_869019_665BB225 
X-CRM114-Status: GOOD (  12.09  )
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

If the flash chip in question is using spi_nor_generic_flash for
flash_info this results a division by zero during spi_nor_scan() because
its n_banks is 0.

Fix this by initializing n_banks for spi_nor_generic_flash to 1.

Fixes: 9d6c5d64f028 ("mtd: spi-nor: Introduce the concept of bank")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mtd/spi-nor/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0bb0ad14a2fc..94fc4f6d0844 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2024,6 +2024,7 @@ static const struct flash_info spi_nor_generic_flash = {
 	 */
 	.page_size = 256,
 	.parse_sfdp = true,
+	.n_banks = 1,
 };
 
 static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
