Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18F8C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jan 2022 18:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZHGgDCcL4/J+ej+0RJKZH5EQyBNRcwaiZwODVWpye8Y=; b=lz3j7db/un1yx+
	JDKh0BNCkIGGbiv0Jd1C634dwelPbLZUUM8EYsFV03O+R7MAow5Av1Bsw3J+2dmeTyv7jjbmtjxp3
	l4Njs+rspJ/Pe1QUGCsPyD9DXWcqDRbrXfsJIbv9GI0jIxfQjY6bGP4hyJExicnbYu8WVwTO7x9D7
	0Q3vZfuLhbIRXOcxmVIRDObZ9LrV7DG2Gwwz5PQa2niqpXi3+lGiJO3ekzGsZSKlfg+D7E/tM7jbN
	Gzzi7P3XtUuEBolsY3c+Pxp3YmblwpGyztxhYJa4S6DxoXs6fjI6vyRuApeoVxTuF0zgUtdZ/WPpZ
	2nqUOcAcnAukG5VMl58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC41Z-004Uke-Vq; Mon, 24 Jan 2022 18:25:06 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC3du-004KmN-Py
 for linux-mtd@lists.infradead.org; Mon, 24 Jan 2022 18:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643047238; x=1674583238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CNrKOx69eGmZ3K24njISK38bi6jWQ4/aJUl4ds2Q64o=;
 b=ItmYIRjNrmJGqXsZKr5cGNaWr3hBCfsQhZeAY8nZevYtG3cAPo/n0KQk
 V51Rowt8LloMGSQf6qKjMVxvZSSJpbdodR7Xi25IIChjnMyjR75GhwnPr
 wfV2NhoFW8JgeaIMWTq4fkNAtxpNodyKFehGIU9pui69URmrP/jRNZo77
 wpjY1AH0fYzBq2Dlb6CDXdHHIJ87a8oZAxi3K7tgBywTgMdU78fU5Tw05
 5u6TwnH/jDWQbSiVcWo4bkbh1UjRF15+MR0NztFOsoSoL3RDoj7pdMDRb
 cgveIU6mFasr3ZHNFXg0TYZEuzRaTHnYW/EBTggMKZdE8LbPQCVL7WB+z g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="270545775"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="270545775"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 10:00:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="617333123"
Received: from black.fi.intel.com ([10.237.72.28])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2022 10:00:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 751A49E7; Mon, 24 Jan 2022 20:00:42 +0200 (EET)
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
Subject: [PATCH v2 4/5] mtd: core: Drop duplicate NULL checks around
 nvmem_unregister()
Date: Mon, 24 Jan 2022 20:00:39 +0200
Message-Id: <20220124180040.50660-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124180040.50660-1-andriy.shevchenko@linux.intel.com>
References: <20220124180040.50660-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_100038_897564_D9F47622 
X-CRM114-Status: GOOD (  13.89  )
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

Since nvmem_unregister() checks for NULL, no need to repeat in
the caller. Drop duplicate NULL checks.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
v2: added tag (Miquel)
 drivers/mtd/mtdcore.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 70f492dce158..010ffc34532a 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -742,8 +742,7 @@ int del_mtd_device(struct mtd_info *mtd)
 		debugfs_remove_recursive(mtd->dbg.dfs_dir);
 
 		/* Try to remove the NVMEM provider */
-		if (mtd->nvmem)
-			nvmem_unregister(mtd->nvmem);
+		nvmem_unregister(mtd->nvmem);
 
 		device_unregister(&mtd->dev);
 
@@ -921,8 +920,7 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 	return 0;
 
 err:
-	if (mtd->otp_user_nvmem)
-		nvmem_unregister(mtd->otp_user_nvmem);
+	nvmem_unregister(mtd->otp_user_nvmem);
 	return err;
 }
 
@@ -1026,11 +1024,8 @@ int mtd_device_unregister(struct mtd_info *master)
 		memset(&master->reboot_notifier, 0, sizeof(master->reboot_notifier));
 	}
 
-	if (master->otp_user_nvmem)
-		nvmem_unregister(master->otp_user_nvmem);
-
-	if (master->otp_factory_nvmem)
-		nvmem_unregister(master->otp_factory_nvmem);
+	nvmem_unregister(master->otp_user_nvmem);
+	nvmem_unregister(master->otp_factory_nvmem);
 
 	err = del_mtd_partitions(master);
 	if (err)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
