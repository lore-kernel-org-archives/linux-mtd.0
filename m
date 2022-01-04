Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC188C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 13:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HcEEGdRtJ1Knm8FW5DvTULaUlDF78ik77lphmjjM1Iw=; b=RNoRuI/bN6660I
	WU32HcxnAUqYFLGcNk81li66ljiO3WQ6wRahiJpcfRbPYrW58O1oOq8PoY1tZ2KBQ4y3iSDVDQ7tf
	4o1RaPtV/nz4VrjaS2ed+6jRoSmHzTw6WNmblcKvTAVVzKs/dvm6aWtxqHgQ6cGbiKUZ+eIzwN8kQ
	pQvJabVm/bSrvRQ/rBAi8DpbvMs1IBMTDohDAXLs8Wd2ejrSnQG6lK8RazZQk81uaqm0JzBrOiXCB
	gfUuP43ZybbSYifDSbZZu+mkPu7METLIRTCUahkQuUvJ8EbYTEnIJtuBB7ZTdOJsgsled/j2Osb+/
	x5emSnH/nTUT769DT42A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4k1t-00BXIa-2O; Tue, 04 Jan 2022 13:39:09 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4k1Q-00BXAK-QJ
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 13:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641303520; x=1672839520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dk8eR+nk6aw16X9+1NKLpwmWVQ9jkxr8X5sDpD7O+wM=;
 b=XAzWstszSYKWrqYrh2Fb2ed/xtcjPf6jGubJckvfnFAlxNiLdN6yMyge
 rZhEz8Ow1IUWiCEvskVzK3qlNLSrTAcTdmEBLMfrJJSzncy3yHNfR/orF
 VtBa+YpG7cEGX2XAqxx5Zj18gRoqutkhVedqAm5UuTY8FGeLQ/DxYWhiK
 KjW+F8hOPMGHBQSGdn5av0C7Y1euV66iVKd7Vi9f08gz9/qgQsagZfZGo
 H24Q1rqQKBRPRTDILwH8f12M5NrvoAQsokOhWoqJL4Dd0bSwBEd1sF5dZ
 +UfnllYIuh6IQKBPN9ffZQOJX9fqTZHEG0XW/TBNrxW2tCJ+NVgbm6mBj A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="302975570"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="302975570"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 05:38:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="472066537"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 04 Jan 2022 05:38:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id EC8F449B; Tue,  4 Jan 2022 15:38:45 +0200 (EET)
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
Subject: [PATCH v1 4/5] mtd: core: Drop duplicate NULL checks around
 nvmem_unregister()
Date: Tue,  4 Jan 2022 15:38:42 +0200
Message-Id: <20220104133843.44272-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104133843.44272-1-andriy.shevchenko@linux.intel.com>
References: <20220104133843.44272-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_053840_920091_BC1CF88B 
X-CRM114-Status: GOOD (  11.52  )
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
---
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
