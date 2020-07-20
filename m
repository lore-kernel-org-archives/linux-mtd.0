Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B847FC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 13:15:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 804E12065E
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 13:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HZSlOs0x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="BWP1nuON"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 804E12065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=85WTjzckI8ECo7elHcS6nChv6N+7vPx1ggy0EuTae8A=; b=HZSlOs0x7mLQ0Wkv7eEkpY4Ih
	jMYumQ7eyFrTldmKIMhT3ETOqtxwH/Fk1YDbEJopHLePuY1hTFxC6UC6LhTn9N7KpsGvg9gbwXiQp
	dbemrJ2q4YhSh0Jj4Nokh+cNOckeOn1d+8JDbV02L1qOx49j/VrKZ9cogoAdUzrV79MWwEBWSlh8b
	OPEYZiCncT78uYoYmI5hYfBsO3eEKxsNZ5YTChXkcj4/H9hujfExENY6f8LS7Z/3R/kpBnOW5MIdT
	Fo/gRvvd+c+fDskcWE8IaAfrZHIP28hjmTynanqIb3vBT7BaDspAWo6B2EZG73ePN4n8EGk4NkAgH
	j6Xu3GO8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxVcb-00073g-Cp; Mon, 20 Jul 2020 13:14:21 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxVcR-0006yF-4U
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 13:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595250850; x=1626786850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oIbYRy1hxuOw7zH/MuGRp+Vl/RqZPuV6n/AmSUin5WI=;
 b=BWP1nuON14T/CBBqBB5BWf6a6Ne6BD3bvjY48u2hL8+2FKI5ei81e3C/
 WHO95OsQKOISFmCk81qkDhZwDUAzrg4vtaJelNlJUwF96ea8tsACfAGWV
 B6gM+Sa2+swvRXy+sRl4yltDIxNSFi+1fs6MHvBXykcFs/gk4CwbB1/g2
 i9uj9tKK4yebs8aXWxc+LymdnTkt7+Hyn3a0zrJZnY6g1ZqrhTVqo26pC
 Wgtpp/Stjc1zoOq1D2do6Edj2Kaq8ctL2/Gwj3rNORr6I2E5R769+lD/P
 Pjfa8I4wkdQ6t539+krIE6UVarsAOSTQYROe2BRmKubGwI1IqjUzJgrTT w==;
IronPort-SDR: kLoSNxVobU69tam2BCl5MnTL8BgMgr72yYUTd3r2lJtGHBK/NTOZaoXEOoJIDdUSSWDW8qvMk5
 xCS5Alqx5pMRzzlY7OKB32vMw0FaesWdmN5euVYmimpqrMJMIGPAIslvab2YiV4GmG/7j/kzeq
 /mYVUx7MrqRY3rI8VfYRW47CBU2kAmEpU7J1oJaM4+sDpcslNGO14+xY44sCBLOVA6qwKXr0T3
 ZjYXklvJh21g+77GTbNqSZYYzukKugTAEDvTiEePaQ0WnN2RR4VHNKvXj8QSWiVAgJBPToi0aS
 c/Y=
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="88315440"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jul 2020 06:14:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 20 Jul 2020 06:13:30 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 20 Jul 2020 06:13:28 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <boris.brezillon@collabora.com>
Subject: [PATCH v5 4/6] mtd: rawnand: atmel: Use nand_prog_page_end_op()
Date: Mon, 20 Jul 2020 16:13:54 +0300
Message-ID: <20200720131356.1579073-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720131356.1579073-1-tudor.ambarus@microchip.com>
References: <20200720131356.1579073-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_091411_352672_E99BF24A 
X-CRM114-Status: UNSURE (   9.17  )
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

The nand_prog_page_end_op() sequence is open-coded in
atmel_hsmc_nand_pmecc_write_pg(). Let's use the generic helper here.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index a3f901e64bfb..3fe0b3caa5b9 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -902,7 +902,7 @@ static int atmel_hsmc_nand_pmecc_write_pg(struct nand_chip *chip,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct atmel_nand *nand = to_atmel_nand(chip);
 	struct atmel_hsmc_nand_controller *nc;
-	int ret, status;
+	int ret;
 
 	nc = to_hsmc_nand_controller(chip->controller);
 
@@ -936,19 +936,7 @@ static int atmel_hsmc_nand_pmecc_write_pg(struct nand_chip *chip,
 
 	nand_write_data_op(chip, chip->oob_poi, mtd->oobsize, false);
 
-	nc->op.cmds[0] = NAND_CMD_PAGEPROG;
-	nc->op.ncmds = 1;
-	nc->op.cs = nand->activecs->id;
-	ret = atmel_nfc_exec_op(nc, false);
-	if (ret)
-		dev_err(nc->base.dev, "Failed to program NAND page (err = %d)\n",
-			ret);
-
-	status = chip->legacy.waitfunc(chip);
-	if (status & NAND_STATUS_FAIL)
-		return -EIO;
-
-	return ret;
+	return nand_prog_page_end_op(chip);
 }
 
 static int atmel_hsmc_nand_pmecc_write_page(struct nand_chip *chip,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
