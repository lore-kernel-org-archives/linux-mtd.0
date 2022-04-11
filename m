Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C704AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 11:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mBRpTkgUlhWrOQqPvn+kKxNMRy/HnLvVwBM+BizgSDQ=; b=lHvDv1sLjIbAYx
	cAQJv1/LhkUo8psX/KH/pLonczqwCSB+3ZS4n0i6omDJmQrveRS5ceNpz5zQAuy8GHtl4K0+GHMFm
	okCZHtWO4HN6TD7cZO0+N5LgJJoFBXcklEwphPPAO6XpEGufqDBtIzz+CPn2BI+7j4xQc0e4eyWFf
	cdJf/TIS92K76fMoRsTIx0tB70porj46/7ksZIxtc3fagYSKeksqjR7KAkPefnv+TqzwfcEq6uM9t
	lAsEDlYBN1BYA/1tWupzqw9seuw9zAYaH01mXctVMY9dpIcPzq5ILWtaGkbzIpT1kZNetJpWSjHC5
	RmKxK9/lZ51vJJ5w7Qpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndsHE-008iKZ-Cv; Mon, 11 Apr 2022 11:32:12 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndsH6-008iEo-ND
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 11:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649676724; x=1681212724;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+tDJ2OKrRtfXTUVjXpUksDaCFN9DSpKkw2XjLuA95J0=;
 b=JKjGaZrC/mnPDO5QGl+m5H3S96O5+afR0b0LUPDUK4ow4m5YKqUjieVR
 rin0nNK3Y9P3NfItjIf2ZM8oOSqEstawcJyBMzW7q3vziKYiCJMxkYNow
 L25fAO5lw25m9lAHp4bt36N9KqFVXcXxx9kPKjHQx7cYD3UYxr//zf+Ri
 084NPnxsXwJ0p5SeUhs99FcBnaB5xEG8bZ5APoLU34YcPERnmu/NhB2KA
 9/TsbJsWxaJS6s4osbOY1sFC5glBbZbQCt+9kTx6k1niLeeh1iE6QBMkT
 waATmVtw/9i8ZV/0gYLXPCd/jj7JJ/MUjkrGigXR59NAXSoMfCZ3q2hLp Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="287101259"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="287101259"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 04:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="507073731"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 11 Apr 2022 04:31:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 7891618E; Mon, 11 Apr 2022 14:31:58 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Hongli Li <hongli.li@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] spi: intel: Fix typo in kernel-doc of intel_spi_probe()
Date: Mon, 11 Apr 2022 14:31:57 +0300
Message-Id: <20220411113158.2037-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_043204_826244_B30E50A2 
X-CRM114-Status: GOOD (  13.16  )
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

Should be 'specific' not 'spefific'. Fix this.

Reported-by: Hongli Li <hongli.li@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/spi/spi-intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-intel.c b/drivers/spi/spi-intel.c
index e937cfe85559..1bdb227e0ca2 100644
--- a/drivers/spi/spi-intel.c
+++ b/drivers/spi/spi-intel.c
@@ -1205,7 +1205,7 @@ static int intel_spi_populate_chip(struct intel_spi *ispi)
  * intel_spi_probe() - Probe the Intel SPI flash controller
  * @dev: Pointer to the parent device
  * @mem: MMIO resource
- * @info: Platform spefific information
+ * @info: Platform specific information
  *
  * Probes Intel SPI flash controller and creates the flash chip device.
  * Returns %0 on success and negative errno in case of failure.
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
