Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED5EC433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 07:07:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F25002074B
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 07:07:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BSvG7Q7X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LWvw8Akz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F25002074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUoUIzOz1ygVTcB9Xe8VXq5xOqOzA8EKwvluhjbpXXI=; b=BSvG7Q7XYslb0O
	AjLWlYjY68v9WlJNPRhFl46Z4d1guh/sbaySDmsVzDpuU6uCb/dy2DSPf2/NDXWBqypBrs5GJa67a
	BJs83I85gyALayYNUITU1bMcWY+3P7TEuQKiTTEtd8GXO+TiWeHRw5dvu9MjegcaV+GMs8t/34iSX
	lOS6DljdFM6KvnCRACC/LApthICdX5AXYLHXaCsangbVUcrvk0wk4J1AOlXpPKk3htnysyjK/o4Cc
	vQdwv58wKzFsuwZzAaoM8toEG550JIf20JxyH7xKcT+DM25Wzhuk1N8sYKm8cqun0XwW+DABMLN+K
	9MvuQAfabn6f8FIyHeFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfeX6-0006kN-TN; Mon, 01 Jun 2020 07:06:52 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfeW8-0005o3-8d
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 07:05:56 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05175muG014787;
 Mon, 1 Jun 2020 02:05:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590995148;
 bh=jY9DCJOAaosq5gwJu8ALTUFkZtJ1Ywe+yMWjig0XeuI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=LWvw8AkzMeZD4hVP/yCc3jU58d4oYDZt9f/6tOwwVBqgQ+DEe+ycrne1upBinyhDe
 eJkN18D4GYRenJ7wmeW9o59ick5/yCedqQ5UBUqiWdmrC9XnU2psRZp4/wonQqybBY
 i+N+mlJObo8GiYS7eSYq+OXGTc9yX2J5L6N4QY5I=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05175mfj052757;
 Mon, 1 Jun 2020 02:05:48 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 1 Jun
 2020 02:05:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 1 Jun 2020 02:05:48 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 051758s8016257;
 Mon, 1 Jun 2020 02:05:41 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>
Subject: [RESEND PATCH v3 6/8] mtd: spi-nor: cadence-quadspi: Drop redundant
 WREN in erase path
Date: Mon, 1 Jun 2020 12:34:42 +0530
Message-ID: <20200601070444.16923-7-vigneshr@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200601070444.16923-1-vigneshr@ti.com>
References: <20200601070444.16923-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_000552_466992_CE8F4D67 
X-CRM114-Status: UNSURE (   8.94  )
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
Cc: marex@denx.de, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Drop redundant WREN command in cqspi_erase() as SPI NOR core takes care
of sending WREN command before sending erase command.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/controllers/cadence-quadspi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
index 0570ebca135a9..6b1cbad25e3f6 100644
--- a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
@@ -1016,11 +1016,6 @@ static int cqspi_erase(struct spi_nor *nor, loff_t offs)
 	if (ret)
 		return ret;
 
-	/* Send write enable, then erase commands. */
-	ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WREN, NULL, 0);
-	if (ret)
-		return ret;
-
 	/* Set up command buffer. */
 	ret = cqspi_command_write_addr(nor, nor->erase_opcode, offs);
 	if (ret)
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
