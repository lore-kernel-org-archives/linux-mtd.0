Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4646DC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jan 2022 18:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKFK2g0HdFA8JKk3dw2wBXASbCRGGPshIhXs8rCM0vI=; b=ERowr/upNznxUJ
	MaDiYXupLNTb0E+WngCfheWciBiXE7dRfKMbt9in2kvi1UpzhlwtZNINLKusvAnXt0MMusNKoh+AP
	5MhTPnJZjsoNZ7OQ3NYR/dKRsfUKhAAtq8gRqzVL7bH2oFxrDnMENf0BFpE5/KP/cHCg12IxrorKl
	CeEbpylzJjY+dVlywR+UIWYG8od2V0k3xjI7zbPS59w6q2ECSqaLMfM/aAtxK4yD4cnedVgP/wwRw
	UmDev3GmS4wF/DyLhx1Zlw/08cd9rSWn9IxwhzVJ5TXxKddNUuhG7Zbjr6nH31s9XdRoNmwRVHu7/
	G/nu1HbY5egsS8N5511Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC42U-004V4R-0I; Mon, 24 Jan 2022 18:26:02 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC3dw-004Kq5-Ag
 for linux-mtd@lists.infradead.org; Mon, 24 Jan 2022 18:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643047240; x=1674583240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8JozRceOoyg4LNdwXwVz+BMwrK4+CMCruE+xcyfxVZ8=;
 b=ToCrzATE9rvMjMyNH/3NPykdU9+Uoo7uwezCKBuFTpeElQd9ktYTtVH7
 USb8OtHm3yvOXZfEsqVsXYJHtUn8EAbAF2zSkeAhUsAyYYdRxC5JKo70n
 jU+hhkzfEH/tm8l6v+nGcrQ1hPsfzIl7iXwJTPGQmZVnoToDOGdzVO02D
 YBtCZErKVZxcmbrI/3glFsXIv3Yuz3FYrUXNHjeLLE5vzNOZnMgA1XghY
 OEfJNmbJkkcbEv9fplukf38vcMHW/6iF4+CA2wVq4OLSdGRcedZSHg8FY
 w8gZfYU/++Tk1xIZhnuhjrrpwa3YmydUACRexEL+wvD1Jn6m+l4Iu1kEr Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="270545779"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="270545779"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 10:00:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="617333121"
Received: from black.fi.intel.com ([10.237.72.28])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2022 10:00:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 68D70616; Mon, 24 Jan 2022 20:00:42 +0200 (EET)
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
Subject: [PATCH v2 3/5] nvmem: core: Check input parameter for NULL in
 nvmem_unregister()
Date: Mon, 24 Jan 2022 20:00:38 +0200
Message-Id: <20220124180040.50660-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124180040.50660-1-andriy.shevchenko@linux.intel.com>
References: <20220124180040.50660-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_100040_415031_1D86F624 
X-CRM114-Status: GOOD (  13.91  )
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

nvmem_unregister() frees resources and standard pattern is to allow
caller to not care if it's NULL or not. This will reduce burden on
the callers to perform this check.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes
 drivers/nvmem/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 68db7d3303ac..53a43d843743 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -903,7 +903,8 @@ static void nvmem_device_release(struct kref *kref)
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
-	kref_put(&nvmem->refcnt, nvmem_device_release);
+	if (nvmem)
+		kref_put(&nvmem->refcnt, nvmem_device_release);
 }
 EXPORT_SYMBOL_GPL(nvmem_unregister);
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
