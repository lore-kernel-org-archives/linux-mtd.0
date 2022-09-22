Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E978C6FA82
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 13:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ZyTk0xmd4HjYayRximypQKY+EhfL0rBdDA1+jKj5T4=; b=fsfJAAnxZ/kby5
	IAPlqlJff2+LHU/MEXUsPO4KbNYU42qbFavXNv9GO16kYG1t1IpLO2miPYc7OSRoTPOtyo0IHoRJm
	TmjOCjGGGM793mkZuMgvRu617eXSgco+x+BW9xuhepecFEOt98idyI0ba3OfD9m7aPMXzEedWwPOv
	WfRRArU9HJbmU1rFG9Ed+IFCqHZhklxI4FpVYmsZqRBGigtW5yWRp6JSMoUOI5nid+0cUPLuxREQF
	2K/btCFBizXmRKDs4N1iLX6tw8BAUuQiiA9GBsxO8XZSasok3PUNRcbG2whBHyPoNMmFub0wTG8Z3
	xJoVkz8hDsc0JdHNJ1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMYq-00Fm7Z-VA; Thu, 22 Sep 2022 13:48:16 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMYo-00Fm47-PY
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 13:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663854494; x=1695390494;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3WuF4vzp3qNZOgBQ8C/kFf37GbZlIrz9jjfI+DqubA8=;
  b=JL9hth2Gmz01yu5FQ50LYeVJlAyFQfT1SyWRs8JDunBYcv22pXzUAU8b
   mQBKP5f/NiTvfwSmlIIL0iYOjwHWQ3bN1nlntrOh4Xv49mkV/ReIAOPAA
   KZq5OJ4qoNxw0K1NohvyR1QkuC99eTBCW7flH+o91UyXXLq8qjhCHzzx+
   NriXhhylQWzUSeHN0HgYmYXMfAWL5OJjoZGbpAHjzXuLHk66Dv0hQk44n
   pHNVF6AgSt/gDhKlwH+yjDr/U1YYnpGPXLR5TPmJ+mfWa9almGp4XQjda
   +abxjgz/fIiF3NvBjrW2fe5GxBFd0HjLu7K2A1ursZgtBdMruKNfERMWf
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="283352158"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="283352158"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 06:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="622098593"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 22 Sep 2022 06:48:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D8CA9238; Thu, 22 Sep 2022 16:48:24 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Hongyu Ning <hongyu.ning@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] Revert "mtd: spi-nor: core: Return error code from set_4byte_addr_mode()"
Date: Thu, 22 Sep 2022 16:48:24 +0300
Message-Id: <20220922134824.46758-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_064814_927096_139CA837 
X-CRM114-Status: GOOD (  13.29  )
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

This reverts commit 08412e72afba3a2daef3e7f3378c3753255a0017.

The Intel SPI-NOR controller does not support this opcode so the driver
ends up returning -EOPNOTSUPP and that makes the SPI flash chip probe
fail like this:

  [ 12.291082] spi-nor: probe of spi0.0 failed with error -524

Whereas previously it worked just fine (and hence the return value
probably was ignored in the first place).

Reported-by: Hongyu Ning <hongyu.ning@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: stable@vger.kernel.org
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f2c64006f8d7..3af2fcf1f683 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2724,7 +2724,7 @@ static int spi_nor_init(struct spi_nor *nor)
 		 */
 		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
-		return nor->params->set_4byte_addr_mode(nor, true);
+		nor->params->set_4byte_addr_mode(nor, true);
 	}
 
 	return 0;
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
