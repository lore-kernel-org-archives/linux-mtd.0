Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34622C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jan 2022 18:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLdrkVEqFCxny9B6IA2hs/RViuy/2hQi2u3iBkoXSXE=; b=ywZlcWXdeTr3Pe
	/6/iCijVYrMSZi5yXdy9xcai6B1QVJNKCBHkO6BojMHR15Q9DHrpCrCD9jp3t7srpWrMpbJd0mEnh
	yvzcT3i0nIvliBwmv+Nia3GN9j/geAriOERj+EMqxeIPliFKK21CC4ye0Fbp6gxCw6P/oYRMjyHhe
	MFYf4Wyh/1b0hzGrb0tg6sbycVL+y3OUk6ECzMPQGDU72WfY2K0v301eud+mp6rNAMb5Ih0srq+ZI
	qQHgMT7zb7eJG95ABW4KodZJO4o7trt8+hAm+8OUiZo59bKV5dipc3BTvP39gOnyaPvVtMmDgA/BA
	Tvwb+D6BcVWBGvz2Amyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC43l-004VTL-Pa; Mon, 24 Jan 2022 18:27:22 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC3eB-004Kuw-Ti
 for linux-mtd@lists.infradead.org; Mon, 24 Jan 2022 18:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643047255; x=1674583255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y8ZjakMo/mJ3Wq1rrQTj9HsDSrE7UOgOlZKX2oN9x20=;
 b=Tu35DCZePLJX7x9n2/dtNXueh6Lto/2Pg2jpHz5rNexBx8GZu7DCimUw
 HNGj3yoOF0xB8jK/EA+BPVJNS0vvoCRvIX28LCqb/eEZJZlCybBmE41eP
 5fAzvtHrhFlPo0kIoZDWWL0dm/rSFj7YDUKwH+iJR1T2FDmOQpA2/XYsE
 IqqTLK/SaMHVhwsIkAWBDvQ+nyp1vPrtWJZ9wCaEdsg5AN29V5yJiyXsK
 G2iWoiUcfI7O4IoKJ+UlxunQkHBWfeuq12heF/kO+LqB9eq8tzvwuavzA
 tWTBcZQ0mJ6IVfqYvxCe4LPGaWAI4JroddftcxJSpMIMEQSZZbDm6eTaU g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="309428091"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="309428091"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 10:00:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="695511924"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga005.jf.intel.com with ESMTP; 24 Jan 2022 10:00:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 5D751B7; Mon, 24 Jan 2022 20:00:42 +0200 (EET)
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
Subject: [PATCH v2 2/5] nvmem: core: Use devm_add_action_or_reset()
Date: Mon, 24 Jan 2022 20:00:37 +0200
Message-Id: <20220124180040.50660-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124180040.50660-1-andriy.shevchenko@linux.intel.com>
References: <20220124180040.50660-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_100056_051176_AC991238 
X-CRM114-Status: GOOD (  12.26  )
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

Slightly simplify the devm_nvmem_register() by using the
devm_add_action_or_reset().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes
 drivers/nvmem/core.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 1a70b3bdb71d..68db7d3303ac 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -907,9 +907,9 @@ void nvmem_unregister(struct nvmem_device *nvmem)
 }
 EXPORT_SYMBOL_GPL(nvmem_unregister);
 
-static void devm_nvmem_release(struct device *dev, void *res)
+static void devm_nvmem_unregister(void *nvmem)
 {
-	nvmem_unregister(*(struct nvmem_device **)res);
+	nvmem_unregister(nvmem);
 }
 
 /**
@@ -926,20 +926,16 @@ static void devm_nvmem_release(struct device *dev, void *res)
 struct nvmem_device *devm_nvmem_register(struct device *dev,
 					 const struct nvmem_config *config)
 {
-	struct nvmem_device **ptr, *nvmem;
-
-	ptr = devres_alloc(devm_nvmem_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return ERR_PTR(-ENOMEM);
+	struct nvmem_device *nvmem;
+	int ret;
 
 	nvmem = nvmem_register(config);
+	if (IS_ERR(nvmem))
+		return nvmem;
 
-	if (!IS_ERR(nvmem)) {
-		*ptr = nvmem;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
+	ret = devm_add_action_or_reset(dev, devm_nvmem_unregister, nvmem);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return nvmem;
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
