Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C017BC56201
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 18:26:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FEA5246AD
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 18:26:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="osewi4Lm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CGTYQB+b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FEA5246AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FsQtoHlqNYEDLPFRa3hGVUZJI7zD8EYTHDdrJ44Md/E=; b=osewi4LmcvIirU9d9zZcD/1qK
	itQUwfdESwf5RN2uzwk6mxcZ743UB/NWSD/fjTSsTAIPo8TLTZ7bSxVtVAoFRfThhktJBPZFAAnCb
	+3AoL3CLgiyKVya5wH8AFeE5oWSViLeitXdW8xkyydBGk0LtWw9LerE8250oEhxVRu0kimN7pAZZ5
	FgNAR/gnNyYgdsDugp34k3uvxjHnKHW1S5Tm/5L8qOHYpkBE37/IdnvYOkWXA743x6zUHBs9ECT8V
	3xZp+agLHUfMwt5lRvN7Xa3W4ueo+KMreq/dyGk6FkeN1hRbunQ8A1y9z7C/+PYuGGFR7H1v1ni3a
	S8clSEmuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfS8q-0000OZ-RV; Wed, 18 Nov 2020 18:25:16 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfS8k-0000Mw-9k
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 18:25:11 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AIIP862027626;
 Wed, 18 Nov 2020 12:25:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605723908;
 bh=zgJ9D6V64b9OtSRC/9vMjTSFxYSVWn2NuaBtAZpLOzQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=CGTYQB+boDGWK+Xepuoge62o5ICEzosb9jIOKadXXaZDCH6PVv+fU+zSGytEccKz0
 mL04GPB3MiyzaYJYbPAK7t9st98R3ey+ArPsMul2KS2qjQGi97qbCICrY4ycWlPAJG
 NQ+n3HOiJrAz1d8XoWI16Rpzrutw84XVQ4ClY1mY=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AIIP8Jp120422
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Nov 2020 12:25:08 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 18
 Nov 2020 12:25:07 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 18 Nov 2020 12:25:07 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AIIP0Dw022682;
 Wed, 18 Nov 2020 12:25:06 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] mtd: spi-nor: core: Allow flashes to specify MTD
 writesize
Date: Wed, 18 Nov 2020 23:54:58 +0530
Message-ID: <20201118182459.18197-3-p.yadav@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201118182459.18197-1-p.yadav@ti.com>
References: <20201118182459.18197-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_132510_475591_BFF68099 
X-CRM114-Status: GOOD (  16.85  )
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
---

Notes:
    New in v2.

 drivers/mtd/spi-nor/core.c | 4 +++-
 drivers/mtd/spi-nor/core.h | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5bee7c8da4dc..80fbcb9c0828 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3054,6 +3054,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	if (!nor->params)
 		return -ENOMEM;
 
+	nor->params->writesize = 1;
+
 	spi_nor_info_init_params(nor);
 
 	spi_nor_manufacturer_init_params(nor);
@@ -3430,7 +3432,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		mtd->name = dev_name(dev);
 	mtd->priv = nor;
 	mtd->type = MTD_NORFLASH;
-	mtd->writesize = 1;
+	mtd->writesize = nor->params->writesize;
 	mtd->flags = MTD_CAP_NORFLASH;
 	mtd->size = nor->params->size;
 	mtd->_erase = spi_nor_erase;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 0a775a7b5606..413ea311e632 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -197,6 +197,8 @@ struct spi_nor_locking_ops {
  * @rdsr_dummy:		dummy cycles needed for Read Status Register command.
  * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
  *			command.
+ * @writesize		Minimal writable flash unit size. Defaults to 1. Set to
+ *			ECC unit size for ECC-ed flashes.
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
  * @reads:		read capabilities ordered by priority: the higher index
@@ -222,6 +224,7 @@ struct spi_nor_flash_parameter {
 	u32				page_size;
 	u8				rdsr_dummy;
 	u8				rdsr_addr_nbytes;
+	u32				writesize;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
