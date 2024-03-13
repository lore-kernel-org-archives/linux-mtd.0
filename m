Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679C9C54E66
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 17:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9zp3+eb1t2M61HVcyH6EfRjpddDKNPJzCuATWe1nhI=; b=RCTzhaldNA4WHb
	Qv/hWHRMa5/DNvu3eCjvo9PN7yykXl14L2a5OlVHqTy/GNrpqtdxbLJUWv2wTD5qjqxY/3WnaQH6J
	awEmHpSmwPE3oDjxDZlH8gqSZeMacdW3wog067L0Qt4qnQZ7z8gkunfofrWJttDveAf7HG5Fev4ct
	g0n2oAUcEUn2B8t9gUm7sYON/L7TzearEbfhrpx38WnNDkQmZD3dG0neqpe05dekcH8nFKxyYalXX
	ik6j1Cfnv70HYO55ZmL3hbin7RfKTZIYm/R70kLlCca/wunqS4p5Ssu4CfC/T6xdIqZxPiwUwu1o6
	GAHO8gklmVo/xCBWRzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkSV2-0000000B3pz-30wr;
	Wed, 13 Mar 2024 17:34:44 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkSUz-0000000B3jp-1QAM
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 17:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710351281; x=1741887281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hcmCNGQf3LZVFWDeyJ0vaw/0Q23MVCylFqJOi+YXmTE=;
  b=dAK6WNBbFdoR5EE8Vm/tR2cC/bcLVZJnSUEiMpzVSOwskksMj2yNU91V
   DQBrqnXk2+xPnyYRJg2XUJq29lxW5rAOvG/6X5Tc2qvnuukpYpitWWR+g
   zQ6ZEMXBC0NX7zr27atA17F7YHmee/dV2Bmi7+ryH9X/evj51su2Htdt3
   QuHHtEkvlG3aorQ4ZNVF4iVs5Nhm7oXUiU+jS6qL3shA+hOgovLoHsO5U
   ZJMqHaOKSfs+1dGj5B6glJbVxQHpAzxRm4BdJ9ZLizfLYyK38CzQDCOzB
   ekx+qe/T8hZE2NLgCnsG3bM7tEURXHPjMNqLxH5J1ezmnLVKEShdKEV2r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15772896"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="15772896"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 10:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="35132868"
Received: from unknown (HELO localhost) ([10.237.72.159])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 10:34:39 -0700
From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
To: mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: mika.westerberg@linux.intel.com,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>
Subject: [PATCH v2 2/2] mtd: core: Don't fail mtd_otp_nvmem_add() if OTP is unsupported
Date: Wed, 13 Mar 2024 19:34:25 +0200
Message-ID: <20240313173425.1325790-3-aapo.vienamo@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240313173425.1325790-1-aapo.vienamo@linux.intel.com>
References: <20240313173425.1325790-1-aapo.vienamo@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_103441_513364_DC404A3F 
X-CRM114-Status: GOOD (  12.23  )
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
 drivers/mtd/mtdcore.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c365c97e7232..9e18422fdc77 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1014,7 +1014,11 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 
 err:
 	nvmem_unregister(mtd->otp_user_nvmem);
-	return dev_err_probe(dev, err, "Failed to register OTP NVMEM device\n");
+	/* Don't report error if OTP is not supported. */
+	if (err != -EOPNOTSUPP)
+		return dev_err_probe(dev, err,
+				     "Failed to register OTP NVMEM device\n");
+	return 0;
 }
 
 /**
-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
