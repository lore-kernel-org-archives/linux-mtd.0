Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7631EC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 13:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDQTdMTeYdjLrFXSiPVHZoc7HzjpRBbqxFr51tYzqM4=; b=dJARh1EeX4u8Hw
	Nt5qTaIqf7QEROecQowhq+gI1p4q4PvOlpLTl3VwyUsfgCBGJtXkNJrTWabU8bWRCOrk4EiMT5Q66
	cdvcMTGVV7RBEe5C2+dDlB71kJyeeU976EZbH34QxrY7kpemxTR6M98GNKHfRQYiGmX6T1gsTgohC
	zbGblfMiFBZpQVrQHDYlI4RlrvWzI/9oYEjmOWEmEAKiSUoUF0DayR0jFhe9+ljC/Tz52dUPIMW3o
	UgKmkM+IwxQyZRxWA1Yc5tID2Ok2HHaF90pr49EMGuHA65UUBsTpm5yrgNrL8z82z7vGVZBgMj6Jz
	uLv2Q7BtnLSmSd3E+Hbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4k1g-00BXGo-GX; Tue, 04 Jan 2022 13:38:56 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4k1Q-00BXAI-NF
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 13:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641303520; x=1672839520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iKpVHqbLjmy+GnZIzKt6LP0hTcWqlU2qKV4ybnoaZ5Y=;
 b=mMOIaXtbXhjeZsZpMJh0/6gU5Q9tSa1t5Ydb84/74nIgrZVvLbIL1OkR
 5sLbZYkzg51PLJq2wjOLQGRmdMmxAFZgaC7fVU7iEpuaLWEKmp5cwRKwu
 4EU33dqfDgBgqvJQvRAkcnXyCJKd/jZia1QMwEjc79NQL4Q/q/BYn5n78
 9dESaONKJTDWq+8lxCtU3wWZpTERoxLDXs0UFNOGFz42O4fj2qt0Yw8Wm
 1rpaGsrY+fpczfalt+B2Jp/w4aUj9Jr8cq+il8xRWkIHbo3zYxmoE7shA
 /8Vp6ZTmv8P6lVhsLvTnabeFXleY8KGGbJ9pTgEWl7vMs7BOIqVudJD6c Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="242430111"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="242430111"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 05:38:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="590678804"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 04 Jan 2022 05:38:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id D87DC18E; Tue,  4 Jan 2022 15:38:45 +0200 (EET)
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
Subject: [PATCH v1 2/5] nvmem: core: Use devm_add_action_or_reset()
Date: Tue,  4 Jan 2022 15:38:40 +0200
Message-Id: <20220104133843.44272-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104133843.44272-1-andriy.shevchenko@linux.intel.com>
References: <20220104133843.44272-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_053840_798397_F5D3B228 
X-CRM114-Status: GOOD (  13.84  )
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
 drivers/nvmem/core.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index fbf7dec775fb..6946d14876dc 100644
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
