Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86929C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 13:14:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C93820729
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 13:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0VYbi80v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Y2qwNEg3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C93820729
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PbfrIlxuslFolDVUOi+0JjbbTMctLnGmmsCUphxiJi0=; b=0VYbi80vWPLmDHPVVsLSuxETG
	DraTAOKeFnHk4VqKBz2Jae4T0/MBaMrynBIlqGZXsFcSlh377bZW+qcux/wWHJ2M0o6QxoEgzh1Ev
	fTYXoKv9cOsXh4KelSOUpYsnw2uQ78fmxjFHPilTQmTf86qUotkzcE601ysQIsy/fn71BTWAz4qDQ
	ZRmlNTmRVyR1wahfkpl3JFmcDRDyNs5ENMgr+/PKqP5fpReepFwzHndaKD8Bl97WDDwhxG4x7re2m
	h0KHzKBGNm3G2q0oBjW2O/zQD6euuXzwZkaCjYtrNZtsNZcuXf0TSKWr8xTGGoRVF/NmDKRv1OgBK
	WyIX+IoEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxVcS-0006yn-LM; Mon, 20 Jul 2020 13:14:12 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxVcL-0006tp-3r
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 13:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595250845; x=1626786845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gO9niSwxi/QKNJcD3KZTWAm9gZSdNnnYjdD4I1SXr1s=;
 b=Y2qwNEg3UnHRT3Vakjoy7stZtzhNZ9hmp04dvKNOq/dE8gpMbi5oE8dc
 edlHr4e5hNyoNCESSpWZ9DClCYXl2OnekN7NYIiDg9J8Ctst75xdU0D9L
 yrDenjMgqqjrQg6ce7nAO+CTiKQAs9iWGFyJzip1EOw+P3L0dJflaCV7n
 gkhntQxkr4/C/J4yKEs86s3WrCX09di+g+F6XrTmCXE/zniSKYTpigUfA
 j90hrJ77QDXInRAROtGQRAxt//MUOn6+nineDUrvUlVHukBvE6cxRqbPl
 +2k1NKt2guWXcFbDS1Y32gmsW4+aZBwIYOf7+OLakifOesVhrVq7ZTPgo A==;
IronPort-SDR: 6bQx1586HbBcEHBc4dlGcNzsdubHXCS8sb83zku20+mJpdRzZR6gdw0T7DiwRe/+knVTWHD34n
 /rcja4gDbpr64Ne49xP36bl8WHt0BmkYNdhAILkp5v8LpCUkp8w5g/V8YW5Z5Em1DOZLufq9NP
 rLJAsIzo+lso8ABgne33B4T7tiEPgsZ3Z2SPGtmGZeKelUMWj+7scV2QkxnEda9O0m61j0rpuK
 P3emL7pnZIXVjyZksHE0olBd0xVVRi2aaKo2ssF8HZ0gYJ3lNO0+Ti3NW0gI/MdbKTgulEjJqn
 EQw=
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="83873088"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jul 2020 06:14:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 20 Jul 2020 06:14:04 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 20 Jul 2020 06:13:23 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <boris.brezillon@collabora.com>
Subject: [PATCH v5 2/6] mtd: rawnand: atmel: Drop redundant nand_read_page_op()
Date: Mon, 20 Jul 2020 16:13:52 +0300
Message-ID: <20200720131356.1579073-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720131356.1579073-1-tudor.ambarus@microchip.com>
References: <20200720131356.1579073-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_091405_334493_9F4CF7AE 
X-CRM114-Status: UNSURE (   8.20  )
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

The legacy page read path in atmel_hsmc_nand_pmecc_read_pg() issues
a nand_read_page_op() that's already issued by
atmel_nand_pmecc_read_pg(). Let's get rid of the unneeded one.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index e85652512daa..f738c4bfbd77 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -983,12 +983,9 @@ static int atmel_hsmc_nand_pmecc_read_pg(struct nand_chip *chip, u8 *buf,
 	 * connected to a native SoC R/B pin. If that's not the case, fallback
 	 * to the non-optimized one.
 	 */
-	if (nand->activecs->rb.type != ATMEL_NAND_NATIVE_RB) {
-		nand_read_page_op(chip, page, 0, NULL, 0);
-
+	if (nand->activecs->rb.type != ATMEL_NAND_NATIVE_RB)
 		return atmel_nand_pmecc_read_pg(chip, buf, oob_required, page,
 						raw);
-	}
 
 	nc->op.cmds[nc->op.ncmds++] = NAND_CMD_READ0;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
