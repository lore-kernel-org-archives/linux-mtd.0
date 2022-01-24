Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB03C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jan 2022 18:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=niinIIFnygrtKj5vb0v46UuCwhpxZ3Vo7cTtSLo8TOU=; b=319OqYgIeEro4T
	5x1dITxfpFsHJzeR9XS6Jro0ZSALm161WAbMZ1bu39Lsco/Qda44K/Xj4YMYZJ9J4Gx+Y5747JC2S
	rgj2QUyLtsY4TeTDufXY53+zk+92zSJuTT11LZhWmAtJ0XUoW3QHnDsb35cBz1ni4BPBUmgDqxtjn
	sSLb8SFIaWeTzFOpKa2akmx02YtcEJkwRM4dlSNk8FZ3g21wBJXWVWulOr/RB6m0n0lL5pv4AJu/m
	X6RTntNnYIbJGEBrVCS3ooUiXYlOZPU1isFAMASyU9YKhLO8r76r4MUEInys+kmRKQG+wapVAqg0C
	xdLHonQFRxr6acwJRopw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC40a-004UPA-Ky; Mon, 24 Jan 2022 18:24:04 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC3dq-004KmN-9O
 for linux-mtd@lists.infradead.org; Mon, 24 Jan 2022 18:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643047234; x=1674583234;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BQSospdD4gesHVIwJjnamUSWWSLW6vXQL72nOd9YKGI=;
 b=cOtPJTYFj1uVveNxh1Py9kNXOkiI2MBDze96zKtICIM74WTCtOCYjtUj
 F++XBoqzgkg1vQs9AKuclQNnp5ES1mz8ot/O+jc9a92Hqt41DyDcawK+b
 deZcHk0ePOOUiw3tvAb86+zGBZpmQDIbtjA2hsv59zRn1/gARvibkxLDM
 9LJx0/V3GeieVhO2Blmlwyb7pdnQy0ukPGmX8T/sbFHPrzypZdhqPIJfj
 ACBRjpBwexUX9scrlSr8pu+1DO/kq8WKvWd1TXmVWeJrWiF39DU+j6kBq
 RgeTxbCuy6/Af26RcpZSQFQ3foX46m4iIM6+Z9OWswNEzQjPlInxl/9Kg Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="270545753"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="270545753"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 10:00:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="624164228"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2022 10:00:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 52C3D178; Mon, 24 Jan 2022 20:00:42 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: [PATCH v2 1/5] nvmem: core: Remove unused devm_nvmem_unregister()
Date: Mon, 24 Jan 2022 20:00:36 +0200
Message-Id: <20220124180040.50660-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_100034_369642_4B365E03 
X-CRM114-Status: GOOD (  13.07  )
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

There are no users and seems no will come of the devm_nvmem_unregister().
Remove the function and remove the unused devm_nvmem_match() along with it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: removed unused devm_nvmem_match() (lkp)
 drivers/nvmem/core.c           | 22 ----------------------
 include/linux/nvmem-provider.h |  8 --------
 2 files changed, 30 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 23a38dcf0fc4..1a70b3bdb71d 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -945,28 +945,6 @@ struct nvmem_device *devm_nvmem_register(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_nvmem_register);
 
-static int devm_nvmem_match(struct device *dev, void *res, void *data)
-{
-	struct nvmem_device **r = res;
-
-	return *r == data;
-}
-
-/**
- * devm_nvmem_unregister() - Unregister previously registered managed nvmem
- * device.
- *
- * @dev: Device that uses the nvmem device.
- * @nvmem: Pointer to previously registered nvmem device.
- *
- * Return: Will be negative on error or zero on success.
- */
-int devm_nvmem_unregister(struct device *dev, struct nvmem_device *nvmem)
-{
-	return devres_release(dev, devm_nvmem_release, devm_nvmem_match, nvmem);
-}
-EXPORT_SYMBOL(devm_nvmem_unregister);
-
 static struct nvmem_device *__nvmem_device_get(void *data,
 			int (*match)(struct device *dev, const void *data))
 {
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 98efb7b5660d..99c01c43d7a8 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -133,8 +133,6 @@ void nvmem_unregister(struct nvmem_device *nvmem);
 struct nvmem_device *devm_nvmem_register(struct device *dev,
 					 const struct nvmem_config *cfg);
 
-int devm_nvmem_unregister(struct device *dev, struct nvmem_device *nvmem);
-
 void nvmem_add_cell_table(struct nvmem_cell_table *table);
 void nvmem_del_cell_table(struct nvmem_cell_table *table);
 
@@ -153,12 +151,6 @@ devm_nvmem_register(struct device *dev, const struct nvmem_config *c)
 	return nvmem_register(c);
 }
 
-static inline int
-devm_nvmem_unregister(struct device *dev, struct nvmem_device *nvmem)
-{
-	return -EOPNOTSUPP;
-}
-
 static inline void nvmem_add_cell_table(struct nvmem_cell_table *table) {}
 static inline void nvmem_del_cell_table(struct nvmem_cell_table *table) {}
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
