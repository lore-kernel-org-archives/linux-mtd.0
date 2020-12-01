Return-Path: <SRS0=jbuo=FF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE886C64E8A
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 10:28:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CCE4207FF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 10:28:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lG3ckmFc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nja+3E7f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CCE4207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p4uGPfGKOnbhZnn8Gbw3mj1eWw/gnMXl2a60pW19Y3U=; b=lG3ckmFcbHlBRL18kkZdpBhwm
	e3vM3Thv1vQJxcnwQQzaqyfBqjZFKoz0CZFFtdLyOtMz0VVNNeUFFh6YUZiXmh4z4KrwkhPuTIln2
	K/kj6rxlJSt5Uq2bypYMQTJr8W5Doi8VWINJie6xTXn8yIDnf57DuyKM8l5MtmwJiHbX+95rSeRBq
	UJgarVAjIIU/ZpARv4LiJsud96DMhgRN7CZPIKUmiIr/aCLNwg5r4U3xf7KvoD+E+U9FdcWm3zMAY
	kL2bFTLH24xbPEfpi8+RK7kwCmh8+uMN0g6hH1xTy5+OM2Nxck6gSx2d99mELLgInRdppZiYPhthX
	tp4nsraUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk2sZ-0005ql-7q; Tue, 01 Dec 2020 10:27:27 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk2sV-0005pE-O9
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2020 10:27:24 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1ARKE1046678;
 Tue, 1 Dec 2020 04:27:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606818440;
 bh=bNKFnJDWgAyvAYESkqyC5cpvfMeRZZDUgPqru83PpEg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=nja+3E7fWS/FcjuTCWKVb7pRo70LBOcqE1oWQHuJTJdX/WreV/b7rbRSjPawA/yvV
 GzwcnhK0sL+q25Fat1LdkWyGZdWjY6IkhpzykU7SUUrveSclbcNawL+34ZnC3ztT2Q
 efKDo5SIyM8HXgC3Mo3pkn8yhbR0kLydCz/RoKpM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1ARKtA074657
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 04:27:20 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 04:27:19 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 04:27:19 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1ARCua080862;
 Tue, 1 Dec 2020 04:27:17 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/3] mtd: spi-nor: core: Allow flashes to specify MTD
 writesize
Date: Tue, 1 Dec 2020 15:57:10 +0530
Message-ID: <20201201102711.8727-3-p.yadav@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201201102711.8727-1-p.yadav@ti.com>
References: <20201201102711.8727-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_052724_008355_60E47229 
X-CRM114-Status: GOOD (  17.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some flashes like the Cypress S28 family use ECC. Under this ECC scheme,
multi-pass writes to an ECC block is not allowed. In other words, once
data is programmed to an ECC block, it can't be programmed again without
erasing it first.

Upper layers like file systems need to be given this information so they
do not cause error conditions on the flash by attempting multi-pass
programming. This can be done by setting 'writesize' in 'struct
mtd_info'.

Set the default to 1 but allow flashes to modify it in fixup hooks. If
more flashes show up with this constraint in the future it might be
worth it to add it to 'struct flash_info', but for now increasing its
size is not worth it.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---

Notes:
    Changes in v3:
    
    - Initialize params->writesize in spi_nor_info_init_params() instead of
      spi_nor_init_params().
    
    - Put writesize before page_size in struct spi_nor_flash_parameter.
    
    New in v2.

 drivers/mtd/spi-nor/core.c | 3 ++-
 drivers/mtd/spi-nor/core.h | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5bee7c8da4dc..e77b38de47ed 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2885,6 +2885,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	nor->flags |= SNOR_F_HAS_16BIT_SR;
 
 	/* Set SPI NOR sizes. */
+	params->writesize = 1;
 	params->size = (u64)info->sector_size * info->n_sectors;
 	params->page_size = info->page_size;
 
@@ -3430,7 +3431,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		mtd->name = dev_name(dev);
 	mtd->priv = nor;
 	mtd->type = MTD_NORFLASH;
-	mtd->writesize = 1;
+	mtd->writesize = nor->params->writesize;
 	mtd->flags = MTD_CAP_NORFLASH;
 	mtd->size = nor->params->size;
 	mtd->_erase = spi_nor_erase;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 0a775a7b5606..5ab3f269a23c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -193,6 +193,8 @@ struct spi_nor_locking_ops {
  * Serial Flash Discoverable Parameters (SFDP) tables.
  *
  * @size:		the flash memory density in bytes.
+ * @writesize		Minimal writable flash unit size. Defaults to 1. Set to
+ *			ECC unit size for ECC-ed flashes.
  * @page_size:		the page size of the SPI NOR flash memory.
  * @rdsr_dummy:		dummy cycles needed for Read Status Register command.
  * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
@@ -219,6 +221,7 @@ struct spi_nor_locking_ops {
  */
 struct spi_nor_flash_parameter {
 	u64				size;
+	u32				writesize;
 	u32				page_size;
 	u8				rdsr_dummy;
 	u8				rdsr_addr_nbytes;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
