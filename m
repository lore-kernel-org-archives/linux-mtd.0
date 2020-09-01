Return-Path: <SRS0=YYjO=CK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38865C433E7
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 15:27:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03C3F20BED
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 15:27:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cTe7Du/b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7+IM86k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03C3F20BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dFD8AhmXSDt/NoieyAN/WutrXYqlhMhuO2h/UUocvY=; b=cTe7Du/bewGR6e5vDi5Uf5ex3g
	Gq5Rc4mj3DxHC4bqnBtl+B8NwqXTBmuDgWFhyUDfNeKxmXRUTGLbLn3HiS/HCqbLQdCapXk/PgsbT
	pACI2TdyOAAicDn/ZK4svEe802vZpXwvbY749JWiBJW1ori3tnZZXCJkMwbOo7a/QJm/K/L4iEfUy
	7wg15ckW1diKvGFwfPbtzE28Cs7skXvuCZvcCIzcTkHiASvbYsPvfTRNUqlSzSVNL6LcIczrOwADW
	5MJ9vnc3J++Yfz1R50K+f554s9pjw+H5pbGGVzJ2/TmGkyzGl5A1B8cBAmzxr9GunL5M0vV2XcASA
	s+LLVYeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8Ao-0000Ua-Af; Tue, 01 Sep 2020 15:26:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD8Ad-0000PH-II; Tue, 01 Sep 2020 15:26:04 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ABC482151B;
 Tue,  1 Sep 2020 15:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598973963;
 bh=dmuzdEMkWpJ2XunLy5TWSr/ChN5Y2eJJuRVReEFs1o8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y7+IM86krsVpZqXeWOsl7Hl53BXun2lQDzl3t/nJFFL0zhoFU5iuqUywOQoFtdv+v
 AsGipIUi3I8al3evi43iyzt7mwxwg4hkociDaHxNk2OmDtv/9kL2rJ9dDmknQ5gl+8
 vdQY/uMsVqSh1hpyvIzJ4WMdYp1phgli4sq3w7jA=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Han Xu <han.xu@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/6] mtd: rawnand: atmel: Simplify with dev_err_probe()
Date: Tue,  1 Sep 2020 16:25:31 +0200
Message-Id: <20200901142535.12819-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901142535.12819-1-krzk@kernel.org>
References: <20200901142535.12819-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_112603_682837_27FF210D 
X-CRM114-Status: GOOD (  14.29  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index c9818f548d07..71e2b83485d7 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1976,13 +1976,9 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 	platform_set_drvdata(pdev, nc);
 
 	nc->pmecc = devm_atmel_pmecc_get(dev);
-	if (IS_ERR(nc->pmecc)) {
-		ret = PTR_ERR(nc->pmecc);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Could not get PMECC object (err = %d)\n",
-				ret);
-		return ret;
-	}
+	if (IS_ERR(nc->pmecc))
+		return dev_err_probe(dev, PTR_ERR(nc->pmecc),
+				     "Could not get PMECC object\n");
 
 	if (nc->caps->has_dma && !atmel_nand_avoid_dma) {
 		dma_cap_mask_t mask;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
