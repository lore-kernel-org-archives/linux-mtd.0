Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3852ACA5FC7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2026 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MCFmoj45eZfklcyYk8yDCDZpbE2V/BN99duQQIwK3c=; b=EZaP+sqF4F+61m
	yYAZ98bALgxx/mr3PaETb5r6z/X9KnsO2PmvX/SiB4PNGKRmxVkfKpJO7tChwDSIpETG8/iP8I2ec
	sWJX0A/jnt5l5RtD4JAWBaunGQH5p8LLPYni3rK7foOZ0oYWrhd3UZJrNYTYTfvKIJoaInD6/tcmL
	5o661++Q6Xc9ThZFBI1MGrrMs54oUq6IQ7F6gUIrOZfBtXZ8B91Zr2mAmUYO1hv7gMhPdPgpbw0vA
	r0L8fsqZa3EWf1pJR1NyJ6A/BxbEkT3Vnh+dRw5+8hzwfZZ842yT6f+FxL2QZaAYk5XXCscSMr4Pc
	FtH+TzrnEX+HEkww1pAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv5j-00000006GYI-0B0h;
	Wed, 30 Sep 2026 14:15:27 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv5b-00000006GWi-2ZWm
	for linux-mtd@lists.infradead.org;
	Wed, 30 Sep 2026 14:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790777720; x=1822313720;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=+Y+W1NtAVnX4cXff5RXSRzwok/ylodMDatebHTE6VAM=;
  b=LRQCshcPdvVd0ds5V9/wMJlWUCGdhL4GV4aa0We+jbXqOGc8eZoW1kTN
   vscaOIgvoUS9lwyLh4s1lSJxy+XzUE9k8Aj5LYfBows699STrB3GdaCL/
   4PHk5NBlWMw+LfVXmB1d71eU6UZIZDhmGIgbuAYJEh3XwBmQDMq1x/qQ+
   gsJrX0fAExoEvwByre0vDw7VNtVBvUYuJ5pl+l8L/2YG+7xvUlhkYF+e/
   o+gTbKk2BUZp1sQZgQ1HI+ikkIdS4hVlZgDE4W0ZWpeRy0eZwn+80rBN6
   r4fxRdz5RJ/VttMVnLqsZm6f9fnerdaa/rle4tC5lziHsyWc+y0d18H47
   A==;
X-CSE-ConnectionGUID: 7tjCNZKGQbGdxH6nfLmGzA==
X-CSE-MsgGUID: UiwD9D4SSOODjtLIHBBGaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90470003"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90470003"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:15:02 -0700
X-CSE-ConnectionGUID: zAYicykvTDOhJOiV1qnzkw==
X-CSE-MsgGUID: 9bu09rbVR+uzybqT6FC05w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279499583"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:14:59 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Wed, 30 Sep 2026 17:14:46 +0300
Subject: [PATCH v3 1/2] mtd: mtd_intel_dg: add survivability partition
MIME-Version: 1.0
Message-Id: <20260930-cri_surviv-v3-1-357aeed5fc60@intel.com>
References: <20260930-cri_surviv-v3-0-357aeed5fc60@intel.com>
In-Reply-To: <20260930-cri_surviv-v3-0-357aeed5fc60@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Menachem Adin <menachem.adin@intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790777694; l=4348;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=+Y+W1NtAVnX4cXff5RXSRzwok/ylodMDatebHTE6VAM=;
 b=tYKbzy7Y6Glx6HLyf6ObdWEdMyUCTTZw3pMGpVmSL03oDAEJpNLBmA193phfO0t81nBB04GCp
 nXYcxT5Bpd0DXpUIldtHdI+SW9vLUQFxLyyueb2xpXHEv5uTxIPPheR
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_071519_721868_D26807B2 
X-CRM114-Status: GOOD (  16.14  )
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

Add option to expose additional fixed-sized partition starting
from the beginning of storage.
Xe driver can request this partition exposure if firmware or hardware
have detected failure that may involve corrupted partition table.
Fixed-sized partition allows full storage re-write in this situation.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/devices/mtd_intel_dg.c | 65 ++++++++++++++++++++++++++++----------
 include/linux/intel_dg_nvm_aux.h   |  1 +
 2 files changed, 50 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index a566e86eb5e3..976246e94e79 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -31,6 +31,7 @@ struct intel_dg_nvm {
 	void __iomem *base;
 	void __iomem *base2;
 	bool non_posted_erase;
+	bool survivability_enabled;
 
 	size_t size;
 	unsigned int nregions;
@@ -430,6 +431,15 @@ static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device,
 	/* clean error register, previous errors are ignored */
 	idg_nvm_error(nvm);
 
+	if (nvm->survivability_enabled) {
+		nvm->size = nvm->regions[0].offset + nvm->regions[0].size - 1;
+		dev_dbg(device, "Registered survivability region %s size=%lld\n",
+			nvm->regions[0].name,
+			nvm->regions[0].size);
+		n = 1;
+		goto out;
+	}
+
 	ret = idg_nvm_is_valid(nvm);
 	if (ret) {
 		dev_err(device, "The MEM is not valid %d\n", ret);
@@ -481,6 +491,7 @@ static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device,
 			n++;
 	}
 
+out:
 	nvm->non_posted_erase = non_posted_erase;
 
 	dev_dbg(device, "Registered %d regions\n", n);
@@ -753,15 +764,19 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 
 	device = &aux_dev->dev;
 
-	/* count available regions */
-	for (nregions = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
-		if (invm->regions[i].name)
-			nregions++;
-	}
+	if (invm->survivability_size) {
+		nregions = 1;
+	} else {
+		/* count available regions */
+		for (nregions = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
+			if (invm->regions[i].name)
+				nregions++;
+		}
 
-	if (!nregions) {
-		dev_err(device, "no regions defined\n");
-		return -ENODEV;
+		if (!nregions) {
+			dev_err(device, "no regions defined\n");
+			return -ENODEV;
+		}
 	}
 
 	nvm = kzalloc_flex(*nvm, regions, nregions);
@@ -771,21 +786,39 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 	kref_init(&nvm->refcnt);
 	mutex_init(&nvm->lock);
 	nvm->nregions = nregions;
+	nvm->survivability_enabled = !!invm->survivability_size;
 
-	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
-		if (!invm->regions[i].name)
-			continue;
-
+	if (invm->survivability_size) { /* survivability partition */
 		char *name = kasprintf(GFP_KERNEL, "%s.%s",
-				       dev_name(&aux_dev->dev), invm->regions[i].name);
+				       dev_name(&aux_dev->dev), "DATA");
 		if (!name) {
 			ret = -ENOMEM;
 			goto err_norpm;
 		}
 
-		nvm->regions[n].name = name;
-		nvm->regions[n].id = i;
-		n++;
+		nvm->regions[0].name = name;
+		nvm->regions[0].id = 0;
+		nvm->regions[0].offset  = 0;
+		nvm->regions[0].size = invm->survivability_size;
+		nvm->regions[0].is_readable = true;
+		nvm->regions[0].is_writable = true;
+		n = 1;
+	} else {
+		for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
+			if (!invm->regions[i].name)
+				continue;
+
+			char *name = kasprintf(GFP_KERNEL, "%s.%s",
+					       dev_name(&aux_dev->dev), invm->regions[i].name);
+			if (!name) {
+				ret = -ENOMEM;
+				goto err_norpm;
+			}
+
+			nvm->regions[n].name = name;
+			nvm->regions[n].id = i;
+			n++;
+		}
 	}
 
 	ret = devm_pm_runtime_enable(device);
diff --git a/include/linux/intel_dg_nvm_aux.h b/include/linux/intel_dg_nvm_aux.h
index 625d46a6b96e..84b5b6e0c4ea 100644
--- a/include/linux/intel_dg_nvm_aux.h
+++ b/include/linux/intel_dg_nvm_aux.h
@@ -21,6 +21,7 @@ struct intel_dg_nvm_dev {
 	struct auxiliary_device aux_dev;
 	bool writable_override;
 	bool non_posted_erase;
+	size_t survivability_size;
 	struct resource bar;
 	struct resource bar2;
 	const struct intel_dg_nvm_region *regions;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
