Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61149C433E4
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 04:29:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30BFE207DD
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 04:29:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mJ3S02gy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="wBnvKuz5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30BFE207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lyiYULOPnE25FZU+ia/06EOyQAW9Li/scmZOqEnciHs=; b=mJ3S02gyN/ZaltLKVCD/5wCDT
	hFSi+WysxwPQbTmyUluqLSSxTHx+KgbLZ6JMBLa4iotLLcWln1KjAIKiD5TtmE3MBu2eVZ6Aduaaq
	LR+fnnet23J8xrjvHNUIPDgfkeeJowNsY6yjNHLEr0L5JFyYkleJAaonI+PnHPiP7iOPevph1q7G3
	aTdTCsG6BPaM6s4akSpad7BdvD02u2jPmybEH1TyK9jYdS/H34ioUl2WqVgw58zwVURA7Qg/jOK8W
	ukeL7WvQQAUvwTi1OdMt08qy8ssfLDB+MAk3Q8je1rNX2VQaSsU0bVmWWFR6RsHa9U1BxBKNKQ70V
	SuoX1WiIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxNPR-0006Ls-7b; Mon, 20 Jul 2020 04:28:13 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxNPN-0006KU-JY
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 04:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595219289; x=1626755289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EsSY8wLNz6MP+4zdlXMAZf8Iwzxu5mz+tBmkY/uww3U=;
 b=wBnvKuz5c8hts6KZ+G1h1YCGVwXj5uSQEaqAr+ecebbq0PHCgeFmaNxE
 aGpckd19/DIWaXJfy3sry1GOii9RCdxZ0/wqOBD0e+wzGv+uf0OBzyzLG
 PMADBCF/MeXrGaKlP2f6sfF04CzOpgGmo2/B9e3BGoqShykm7cqi6xdDE
 aFxnLGVEJQQYXWgbj6iG26IF95iyOWS1QSD3XPHJckbYKCNd/LmGf6RM5
 Pc2tv7LAfwgsX2tlWOQvNkSki5aD6BWkXwrLoGs7/9b6nDqoPpgmpDd5O
 sV5DWGYkVFOKT5G3NrGmL/99Yoox7hK9m+xJNhkPcmb5BHnX65b/AHMiq w==;
IronPort-SDR: C7ThQqKuLLJEyccw0viSaAL1qDrm3q/TyByeWslayF8si0WaTKCJBj4PPubFJT7XlnuyaRrqEv
 Y7QywS+p3JQyNYF+6zOD/RENQkDOER9TpL7IVD/x/JIFRTCOauT7G5JDq0gBYpSfCrKc2fDgUI
 jjJWKg58kGekplBeib2OARcXfwGNRwZxTw8xYy7T4SmHqAh1krVsmu5OwGp3FrpSq/AhOyN/Zf
 BerFH3DjudHsRPLUd/xeC3CG1qccsDVD85s6/0d6gXPHS6OHPUToEzZaS2tvz8zKOqZky11ENe
 4q8=
X-IronPort-AV: E=Sophos;i="5.75,373,1589266800"; d="scan'208";a="80520590"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Jul 2020 21:28:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 19 Jul 2020 21:27:28 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Sun, 19 Jul 2020 21:27:28 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <boris.brezillon@collabora.com>
Subject: [PATCH v4 1/6] mtd: rawnand: atmel: Enable the NFC controller at
 probe time
Date: Mon, 20 Jul 2020 07:27:54 +0300
Message-ID: <20200720042759.1482341-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720042759.1482341-1-tudor.ambarus@microchip.com>
References: <20200720042759.1482341-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_002809_766184_DB6E4F71 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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
Cc: alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@collabora.com>

No need to enable it everytime select_chip() is called. If we really
care about PM, we should implement runtime PM hooks and disable the
controller and all its clocks when the controller has been unused for
some time.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index c9818f548d07..e85652512daa 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -525,11 +525,8 @@ static void atmel_hsmc_nand_select_chip(struct nand_chip *chip, int cs)
 
 	atmel_nand_select_chip(chip, cs);
 
-	if (!nand->activecs) {
-		regmap_write(nc->base.smc, ATMEL_HSMC_NFC_CTRL,
-			     ATMEL_HSMC_NFC_CTRL_DIS);
+	if (!nand->activecs)
 		return;
-	}
 
 	if (nand->activecs->rb.type == ATMEL_NAND_NATIVE_RB)
 		chip->legacy.dev_ready = atmel_hsmc_nand_dev_ready;
@@ -542,8 +539,6 @@ static void atmel_hsmc_nand_select_chip(struct nand_chip *chip, int cs)
 			   ATMEL_HSMC_NFC_CFG_PAGESIZE(mtd->writesize) |
 			   ATMEL_HSMC_NFC_CFG_SPARESIZE(mtd->oobsize) |
 			   ATMEL_HSMC_NFC_CFG_RSPARE);
-	regmap_write(nc->base.smc, ATMEL_HSMC_NFC_CTRL,
-		     ATMEL_HSMC_NFC_CTRL_EN);
 }
 
 static int atmel_nfc_exec_op(struct atmel_hsmc_nand_controller *nc, bool poll)
@@ -2248,6 +2243,9 @@ atmel_hsmc_nand_controller_remove(struct atmel_nand_controller *nc)
 		return ret;
 
 	hsmc_nc = container_of(nc, struct atmel_hsmc_nand_controller, base);
+	regmap_write(hsmc_nc->base.smc, ATMEL_HSMC_NFC_CTRL,
+		     ATMEL_HSMC_NFC_CTRL_DIS);
+
 	if (hsmc_nc->sram.pool)
 		gen_pool_free(hsmc_nc->sram.pool,
 			      (unsigned long)hsmc_nc->sram.virt,
@@ -2300,6 +2298,8 @@ static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 	/* Initial NFC configuration. */
 	regmap_write(nc->base.smc, ATMEL_HSMC_NFC_CFG,
 		     ATMEL_HSMC_NFC_CFG_DTO_MAX);
+	regmap_write(nc->base.smc, ATMEL_HSMC_NFC_CTRL,
+		     ATMEL_HSMC_NFC_CTRL_EN);
 
 	ret = atmel_nand_controller_add_nands(&nc->base);
 	if (ret)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
