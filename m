Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C72BEE49A3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AmjOBM7oAVR9wyJbhmg3bUnd2freZg2GMWzmPNOqqfc=; b=rstssdoatMxgzK
	J2ddYLsTEthQSqtIotT4AX7aNdy2gQv6upzOk5EkoCUBPOAA3RRig42JQlfSAW/A91CgbxnLADQhh
	1N2pAhQceVjYSmg2MBi+Yj6IFBf7aQD7iOZUVZ70Vgt59Ck4/2pkjst1eqUJqjckyV46z7V0X6thq
	7rMaK2KWYUqVsUbO6pq3eeHMiB201ah4HZrGN3qNNDK2/WuroFpesADb0ckG42g40pU5DTShEiCo/
	Ssve8lcbmJaI0qRzcFv7XIKRsRwF9mqkefjw4hlHcmIhvrq9zzY9Y+oFAyRLey6LdltauvbXBd0Jf
	VdjjSvnsAGQh5DxkWxYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXn-00FJ6j-0V;
	Tue, 22 Aug 2023 07:11:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXP-00FImk-1P
	for linux-mtd@bombadil.infradead.org;
	Tue, 22 Aug 2023 07:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gBCpuVU/pd44YCVNRKiXUy+CVJBTcFq+JBSIfZh7EkM=; b=DHkIwJD0NWXcahvFZIHch41q/x
	X88HVUhgV6h4yoXGpkQCzOicoByhjFX9MRchXiPSHB43uBQCFN1au5K/S0oFOC/px5QDrDjG25Mav
	7h4FQALj+6Z300XfSWAFI4VeYUGBSiOjBNDOGW1QjTLQ/x+23J70PH51fyAwJauAYzBnxo9Y1Ncgw
	sd82Qdo5dUk/M4y21lKcDZoKTXGoN9p4aH8Edcbpu0ICr1CxKWD2dztVMdkgnu0fwHEdxRixA0rlY
	RVo+j+t8TDYzJ4rk10+oyQ6qMB4Q0S0sAlXxDSyYkBq/NOyf5Ul/EYaLMM8toXdsoP/3BtiYyEdp1
	xS0Xe24Q==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXH-002YaF-0f
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:10:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D8E36168A;
	Tue, 22 Aug 2023 07:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8336C433C7;
	Tue, 22 Aug 2023 07:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688236;
	bh=qrtlb3Inp+0PAFufVQ6/JFPnxSSyzXyjdaLgPSqbaiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nOGo3pil1/gkWPoExVzoflFCYD8btxkzwg/oQ6hr6HF8V5/ZWffWM9tKR8/oTQl28
	 gDrwIfDZoIlTeVhOvaisvBS0f3QSbxNQ1GviHgyfrSRepxP9nIzhCzFNxMHeGvp9db
	 RG8F0Zpn/Zv4/GSPp/vwryzpsLbhCfDqn3dPQMHfmirXQjXz8C2YwWSesG5mCiDqSY
	 rU1FhfhzBWT2sUBNWDryLg1V03VuIShWsc5GNrQ650Doc0oD6EBIhLFOS21KZP6rC8
	 5sVJKLnWsMWPxVq5uwb3M3BF3caVb7tV5wqi+UH2nW6wl2b9R/HFjA1HOWKV3kQqPb
	 aZDZBtLfqKxHg==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:46 +0200
Subject: [PATCH v2 30/41] mtd: spi-nor: xmc: convert flash_info to new
 format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-30-291a0f39f8d8@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_081043_463577_492FB541 
X-CRM114-Status: GOOD (  12.03  )
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

The INFOx() macros are going away. Convert the flash_info database to
the new format.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/xmc.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index 48062ccb22fa..d5a06054b0dd 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -9,12 +9,17 @@
 #include "core.h"
 
 static const struct flash_info xmc_nor_parts[] = {
-	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+	{
+		.id = SNOR_ID(0x20, 0x70, 0x17),
+		.name = "XM25QH64A",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0x70, 0x18),
+		.name = "XM25QH128A",
+		.size = SZ_16M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	},
 };
 
 /* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
