Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C27C54E4A
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 13:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xm8KjL7g5Nh44FIkWgN1ooFt8V9GB+0wnFzRt2RemGE=; b=0JSIjWzjYXN5vE
	mfYORi0a8usaAH2IuWYYZjYcnJvb7oHkaNBcI/IG5h9SZhtP/w2G2Yjq9aDPYLLXQWJ/wiV25ai0X
	pbDYKFAxELdck0X2efF/Jq2i9ByjADG2T8Q6FlWVAbLSlOUJQqv9HaSI0cLxUcINCqvhoTEsFg6Q/
	Y9Y3YYGtQw707GKYtVol7X5CrLCKxeUtJ2KkiC2KZ/nl9mP2zvAMxyPFkSGXWmbayNietCZo7mR/z
	tGC2Va2IN2pAMGQwU27kPNdA8dIgt+u5qALJNfZTeXT1rp9MBHMyKBQpCkU6ApkCnygVXyFC9EnSR
	hD2pvyhLEiKgF1Ef+uBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riDQT-00000004exW-0BFP;
	Thu, 07 Mar 2024 13:04:45 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riDQQ-00000004ewL-1yfb
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 13:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709816683; x=1741352683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jCANyFRHGluvmBv/j72/Poax8EPScfUXe9zU4k1OyiA=;
  b=hfoHt9Mx9rdJFjQ5KwZPMZsuXzlAZtMeXYgf6tw3DfMYyX8/fWxiFCKL
   ZhuY4AyaVSYRVG4TjTtI62hdyG2xrQYg/2e2kQ1hmnGFcsvhYqMB3M3x4
   PL9KRcbTedNkQ7SIjGMxZOInsU0c1VeSTgfp6jbb9wCMeYTWgUelokCbN
   H73Lhwjoi6ZMXiUH3+K/ZaJKHprQ8FAY8wccyFqOicCjiXpofsnblvuYT
   dUjyAIDXVOsONOXizM6jGCETlXL9FvQfPpHHpovd+7rCGWe1uM6GyLIQd
   d59gxmMoPpClukOmrfTuL40Ln1qJuLbfoGZb8E/AE6B9rirEnB3ukAqU4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="5068072"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="5068072"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 05:04:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="14592328"
Received: from unknown (HELO localhost) ([10.237.72.159])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 05:04:39 -0800
From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
To: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] mtd: core: Don't fail mtd_device_parse_register() if OTP is unsupported
Date: Thu,  7 Mar 2024 15:04:18 +0200
Message-ID: <20240307130418.3131898-3-aapo.vienamo@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240307130418.3131898-1-aapo.vienamo@linux.intel.com>
References: <20240307130418.3131898-1-aapo.vienamo@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_050442_587578_D3E253A8 
X-CRM114-Status: GOOD (  13.38  )
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

Handle the case where -EOPNOTSUPP is returned from OTP driver.

This addresses an issue that occurs with the Intel SPI flash controller,
which has a limited supported opcode set. Whilst the OTP functionality
is not available due to this restriction, other parts of the MTD
functionality of the device are intact. This change allows the driver
to gracefully handle the restriction by allowing the supported
functionality to remain available instead of failing the probe
altogether.

Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mtd/mtdcore.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c365c97e7232..1cfc8bb5187d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1054,8 +1054,14 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 
 	mtd_set_dev_defaults(mtd);
 
+	/*
+	 * Don't abort MTD init if OTP functionality is unsupported. The
+	 * cleanup of the OTP init is contained within mtd_otp_nvmem_add().
+	 * Omitting goto out here is safe since the cleanup code there
+	 * should be no-ops.
+	 */
 	ret = mtd_otp_nvmem_add(mtd);
-	if (ret)
+	if (ret && ret != -EOPNOTSUPP)
 		goto out;
 
 	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
