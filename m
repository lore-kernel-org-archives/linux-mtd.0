Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD46DC982C3
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2026 13:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1d5PzPSS3HHGEP3bSWBxV/LSHEi9rBVM49d8/fLJPY=; b=w+2pozi6B1jFj8
	reYWnS5ob21AVhv9ljAv7DOfy6/+5m9Yd5MMdj9QcORbolh36Euq+NhpmVMcWi7gYeVcd7MafX9mx
	9c9pDgyHZvPP9IW/ozWuW6mDtafljRpKd5hlb/qc3C4+hjEkfxMIkUlFCyqg1brTigzqjgMnqJVcF
	AaJ6oh8SeEW1tsUGxUvOdsV/l6+ffL0J49CAMJ4i/AZ4Ubee6U3uTNRGiK6050Wka4tJQAopqz1wB
	34mz+tmnGiewml6nUv0Gg/6/hz1FQ5slI/79op0kqJtuKjBpkSx0/8RUtINUMB+6UF3bqyDHG4AgP
	VPR3ouIpQ9XySfs/n5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6q9p-00000009LrY-2EST;
	Wed, 16 Sep 2026 13:58:41 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6q9j-00000009LpT-3rK4
	for linux-mtd@lists.infradead.org;
	Wed, 16 Sep 2026 13:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789567116; x=1821103116;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=zf+IMIf7sXYnu6i7H7mWWyuhTK/3Fhb0KGmCf5FwydE=;
  b=lCJJ80gUzvbMEVdGprv2tit86X+Vpb/F2CNxVsp61ydrLF6772o2sPBK
   DMN+Jp0eHKCexyogm6pZa/1lAqH5LNfVy7zqu7uyma3gyIw0gjxbbsUKS
   3yhHd2NQ2cvGA1BVn3qLPHap+ZIQs30IxyWleZOTgS5zmNmPpYIzW00/n
   JyXyL3O22ILh91JdrJ/8d3JG4m++bVlncakVtgsOhXz2iIlLjAs9hMTxL
   7r6KN/SZ82bTF7ZgAo41Ls8j9A8l5bjvZNso4px53oESCdZQB5UXKNXiH
   F21tTHmLuhmgZ+1q3lfAvloin6SeHBCSJul9NGxripYTCuhRvpIX4ZwsY
   Q==;
X-CSE-ConnectionGUID: qUuUgKCESaWxs0YiUCmyoQ==
X-CSE-MsgGUID: iReYWMfVQEWZRPYvZmd/Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89881943"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89881943"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 06:58:35 -0700
X-CSE-ConnectionGUID: +MRWrjlwQMWkscvNqcf/CQ==
X-CSE-MsgGUID: 8pIh7MFxTmesWxLyrE4F6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277475759"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 06:58:33 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Wed, 16 Sep 2026 16:58:15 +0300
Subject: [PATCH v2 1/2] mtd: mtd_intel_dg: add survivability partition
MIME-Version: 1.0
Message-Id: <20260916-cri_surviv-v2-1-7de1b5328204@intel.com>
References: <20260916-cri_surviv-v2-0-7de1b5328204@intel.com>
In-Reply-To: <20260916-cri_surviv-v2-0-7de1b5328204@intel.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789567108; l=4298;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=zf+IMIf7sXYnu6i7H7mWWyuhTK/3Fhb0KGmCf5FwydE=;
 b=Dm7dnBuV8dMzawqzo1DyqzzVvvcc73k0O8f+2VKpiBBd2WGJrfU2RCjaR11yW1EMuupcxErrH
 fUCK5IJQkUXCczkEWt63a8zefQxyMdaRVGGeucH5qCpb2TnFKOeidLy
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_065836_128115_C73581B9 
X-CRM114-Status: GOOD (  15.77  )
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

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/devices/mtd_intel_dg.c | 66 +++++++++++++++++++++++++++++---------
 include/linux/intel_dg_nvm_aux.h   |  1 +
 2 files changed, 51 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index a566e86eb5e3..962f30779c51 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -31,6 +31,7 @@ struct intel_dg_nvm {
 	void __iomem *base;
 	void __iomem *base2;
 	bool non_posted_erase;
+	bool survivability_enabled;
 
 	size_t size;
 	unsigned int nregions;
@@ -430,6 +431,16 @@ static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device,
 	/* clean error register, previous errors are ignored */
 	idg_nvm_error(nvm);
 
+
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
@@ -481,6 +492,7 @@ static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device,
 			n++;
 	}
 
+out:
 	nvm->non_posted_erase = non_posted_erase;
 
 	dev_dbg(device, "Registered %d regions\n", n);
@@ -753,15 +765,19 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 
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
@@ -771,21 +787,39 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
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
