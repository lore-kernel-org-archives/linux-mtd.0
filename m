Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E971DC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 13:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ucjzjIcMRHKjuSsBOp4WvxWDKywzCmhuHeJy0MVja5w=; b=x9ItvbqoNv9NVe
	78kJs7tpjnL5go+jTAcJsfOY0Qd4WatMweoRLIHUuhaV83NqEmlgY4nGvrZDCXMQq2x/TXGCcNr6x
	5lE8lpX7X/Bznobs7COTK3WhQptyDkiLqYGq+c1gaeEWux42wUy3/aWYFuh/SPnMHC5XOodzGD7gs
	rjnY997i5TJdzN4AnxnYg2eLDXldSa/qtIDHqzasuL1XRIPtkdWhW26t45Q5nNrhLFUOwfd0i2Zk1
	5KBGTUSDpFXRigLpwvhp5FhpsVcOIbRlfbKPTAM1RFt+8/HikL+3HjZS/34RahiNHUOThYQVhnoP9
	rkqxsdIHhgeuipDVlk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4k2A-00BXNl-EY; Tue, 04 Jan 2022 13:39:26 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4k1R-00BXAL-4I
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 13:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641303521; x=1672839521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1faGgl1n5RMDy4eY/oAFnPrRhLAJ+Ie+KfhM2G1o9gw=;
 b=csDtXQtv/9A+6F4OQnOxnBF6NRYuMaEoe8UHnbEYzWOppexr+Egetipc
 kX9xuc1tYRpNYbdRLbXtt5cMyg3EwgY2zB81RVkyB4pnMPJim72dYCVI2
 snmd9w/RZ40LH/dsSuYYL/tfZeZWRKDr9C+tMLhgCLn07RvA1dYC3d+se
 A8SNqzbomH/5ZiS+kaO6aQ0Squ6JapVjt71vpTF1yDhe5LzKgKP/u64Qd
 cHopVqcXQCuVN3j8kaGbuKlHp/sJ3jK2qhOe89qHMhoTW0HWLEC6/h+uI
 k+bEozIsNqun62YvQ1x1GZa0+EKD3P46wzM0RB015qNEqNLoEY0lJXsqd g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="266491433"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="266491433"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 05:38:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="556169291"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 04 Jan 2022 05:38:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id CFCB41F8; Tue,  4 Jan 2022 15:38:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v1 1/5] nvmem: core: Remove unused devm_nvmem_unregister()
Date: Tue,  4 Jan 2022 15:38:39 +0200
Message-Id: <20220104133843.44272-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_053841_202671_BF633A27 
X-CRM114-Status: GOOD (  12.61  )
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
Remove the function.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/nvmem/core.c           | 15 ---------------
 include/linux/nvmem-provider.h |  8 --------
 2 files changed, 23 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 23a38dcf0fc4..fbf7dec775fb 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -952,21 +952,6 @@ static int devm_nvmem_match(struct device *dev, void *res, void *data)
 	return *r == data;
 }
 
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
