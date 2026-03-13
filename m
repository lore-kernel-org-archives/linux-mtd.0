Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5786C105F79B
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 11:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=La9x4bJj4DwW6M0yhft7Q6mWhd9n8iQ48d4ZdpMy8Mc=; b=RTCFcV4Cc/gDQe
	x98v0a1ruswjYUbBw5+Y94XQp7JH030tnse4O10DEpcET/UhJ8hfGIwbYfBHW5XH0UWMl75xYY8EL
	AytSRJZq35LXAnc8qSdP6Wv3o6YRxN2xMeJA79LNYCz0GJtbJ5my4eEZTHMGf1Vm0K655WIVQJrrw
	7LTUihSJ+sYQulXXbNV/aYf3E40b8oxvfRjNG6QeD1/Tx3m5/iUTgVEW3DEmLCnj0Ghs9EFpDt+6x
	6ieW4eFryNZZx04BAKXs7wL5pX/ckMOCmQ2k0inNYOo653Di1OQp6rOo8viOUq4/4anXlA7g69Tkr
	AwakQMSWcC8s2byqUHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10ma-000000002Hc-3vxf;
	Fri, 13 Mar 2026 11:34:20 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10mW-000000002Gs-2v3G
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 11:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773401657; x=1804937657;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E9k5WhavXOV3CoklW3s8uAAYJohTF5l8prMTXGhCazk=;
  b=jjL65YX6oLknkcoLrmgHiaB/WeJA/99xhFwWxcWj+LGBBGpvAhp77Tat
   wN+DP7NxhVj8yB1oEqVygkDK0KwoAl+xIZp4EGPZeEeUStsSdbS3IwEPT
   tk/HMNf4UPo9ZWBmdUiVx+xuzixChcP5jqghEzG0WFghhiaOxMXVUdak3
   K1p9oWWLfbh8D/M1GH9nT5Cjnz7Dgq6AgL6sSgCX93TtUOUj50u3BJovr
   JNQanbFDA2VdFMsqI6i3448xhY7AOmLz9qbmV1yM8qaURZKOu36t2pBq1
   0Tbx2vjlrUTDmGLvXzimddB3QtOeOlhHXqhoiaSZUiv6IDAivQRjv+WzK
   g==;
X-CSE-ConnectionGUID: CVz56zwLQUWBKcYJiIhn2w==
X-CSE-MsgGUID: w2ziHLlYSkm5rSaDNXpyXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85987435"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="85987435"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 04:34:16 -0700
X-CSE-ConnectionGUID: lIerqHqhTD2yqdQbwRnN/w==
X-CSE-MsgGUID: LwC8TsBMTvGlnRXtLGItoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="217571376"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 13 Mar 2026 04:34:13 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id A057095; Fri, 13 Mar 2026 12:34:12 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	kernel test robot <lkp@intel.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 1/1] mtd: physmap: Drop leftovers of removed code for Baikal SoC
Date: Fri, 13 Mar 2026 12:34:09 +0100
Message-ID: <20260313113409.1151020-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_043416_959285_5C0CC48F 
X-CRM114-Status: GOOD (  10.33  )
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

The previous clean up killed the driver along with dropping some calls
but missed one place to drop. Do it here.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603121229.PPSg4X8q-lkp@intel.com/
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/r/abK8KXC70RC2K_fW@sirena.org.uk
Fixes: 16d68d10f5b93 "(mtd: physmap: physmap-bt1-rom: Remove not-going-to-be-supported code for Baikal SoC)"
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mtd/maps/physmap-core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 2e31c30d266c..dcda7685fc99 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -364,10 +364,6 @@ static int physmap_flash_of_init(struct platform_device *dev)
 		info->maps[i].bankwidth = bankwidth;
 		info->maps[i].device_node = dp;
 
-		err = of_flash_probe_bt1_rom(dev, dp, &info->maps[i]);
-		if (err)
-			return err;
-
 		err = of_flash_probe_gemini(dev, dp, &info->maps[i]);
 		if (err)
 			return err;
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
