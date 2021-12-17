Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A1FC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 12:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxsGv7fw3I6zDUgI97hwJCagMc3ugI6CbFi5Sn9I+QQ=; b=hiy+KDGIY1zO+y
	hVH8QSHiyo8eoRneB3GZ6QUCqjpDOQcKx3gVzXnkrLKvDtb2zFGBrr8d0xdbApwHOPeJ7t8v1lzcX
	l5I4WSmffIq1gqWsqIrWxi9L+ctB1qhlq7ftOPc+MSDEPi0yyInd0EE4f5dP4+xBJf1I2G8rpPwfA
	//3t7Q6Y5GYDBfUFY0Q8aZud2Rh5R0zct6O7iqHSLz2sIJ7Mw7UZQ7B5Lg8bGBbAvjMP0+nqSRdbp
	4t74oJb3gKXAPYeoGYzYAfAGLV6QviHakMUQcG55ZcESYIh/p6hqyglu89E3oHcNEl3xnhWD3rzlB
	GSolREqe8D84Schy+qog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCKf-00A7vy-O4; Fri, 17 Dec 2021 12:27:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCJx-00A7fT-Ea
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 12:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639744005; x=1671280005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V5ZR6s8MB7+mpb2lz2QxEhkfyBBpZFRy1C+27uyk7k4=;
 b=D3YG/RLFXjetWuexsd0Gj84KrYt7yusDD4B9GwNEUQkESkiAnuvHBY2s
 376e62O8aAaHuK9C7Tsmt28p+2mm+wwHClHD3HGsP3r5SeKsXOHjnr4OV
 CmaXIj7UKiOYH09xUbVMrAGFkhMRWvh/dbosYb5sxCiEND+y1ewLFyBxk
 PaLjqMRtx2Ny0eFgGHwJFk1UBVlEO+1wllVFQJaGCO9OkRNhasFdCB1SF
 AGxowSnFZrHPertUIQ6HuZlYcOXM/6NbHnOokdFDGzl2LDBtPQdsBaDOH
 OlUtcgSvGBx1bDhcK93mMVN+Nv/LziupMB+Hylid6+skNjE0iA+WisTj6 g==;
IronPort-SDR: vrusUyFqdmu3lle/KGNTDzL8oeCzklp9GWQ4094UuC0+YBvFSLNeYyRXrWKbo9WmtUkBoZ8s/K
 9NWUSLvP33Eku8rSvuwVRc+0xY6U/FZhi1mwD1nQIx+AXhANtKQB4XefFF4brFsMSqK024PKii
 tNOCtXgYWfNtTUSk9ob/8umQsaqcD+NrtaZVGTCbKnMMnMAq/p1ORToDXJOOzC/eKRGfVOIgIk
 BFN/bdoN/tZPFLSZDun5uAX37sR2l+XtoU92jKYukrUQl/8g1lt4M2JlL6mE77hrd0m1iwiSOI
 EXO6hgHsxQIGC1e6qq9bP53R
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="140126600"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 05:26:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 05:26:44 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 17 Dec 2021 05:26:41 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <zhuohao@chromium.org>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH 1/2] mtd: spi-nor: Remove debugfs entries that duplicate sysfs
 entries
Date: Fri, 17 Dec 2021 14:26:35 +0200
Message-ID: <20211217122636.474976-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217122636.474976-1-tudor.ambarus@microchip.com>
References: <20211217122636.474976-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_042645_601737_54FEA714 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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

SPI NOR sysfs defines partname and jedec_id device attributes, which
duplicate the information from debugfs. Since the sysfs directory
structure and the attributes in each directory define an ABI between the
kernel and user space, thus it can never be removed, remove the debugfs
entries so that we don't duplicate the information.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2e21d5ac0e2d..435bd17af0b4 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3126,16 +3126,6 @@ static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
 	return NULL;
 }
 
-static void spi_nor_debugfs_init(struct spi_nor *nor,
-				 const struct flash_info *info)
-{
-	struct mtd_info *mtd = &nor->mtd;
-
-	mtd->dbg.partname = info->name;
-	mtd->dbg.partid = devm_kasprintf(nor->dev, GFP_KERNEL, "spi-nor:%*phN",
-					 info->id_len, info->id);
-}
-
 static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 						       const char *name)
 {
@@ -3243,8 +3233,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	nor->info = info;
 
-	spi_nor_debugfs_init(nor, info);
-
 	mutex_init(&nor->lock);
 
 	/* Init flash parameters based on flash_info struct and SFDP */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
