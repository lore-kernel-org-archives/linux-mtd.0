Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A18FEE57EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2bH7nE8BXiYqcBVZ3DSDIawGTW/nvFjecL+pPpeIJ8=; b=v1Ep2eCd7pq6uN
	9KVMDIJrlo8byw+o6WZZEw0v57zVBOk9o/M9vMi3y/c13eZTYv3r5QpylJAs0FdQhWxmaXWZjcjQ7
	6UBAp2RLzrfonQBJNO4YieDWvnQ8kgP2OPCZvIASlWrLLJgViwR/MC6XpmafJLi+OsEZy8OdVKHiD
	TKIS/5I3Ien/MtCRswgGrl7r0OV6dySnPfrN5p4KV73/SGsh+/dsdzOOoRrtIPsd8aIKAdfKJN6s6
	WL9hPPEEiQWJ46zrNIptHNxJTr1CRwEAda3PEtQXOXPQh/S11Fcph7mbdI27d9FWzdo2IbKcK8Hei
	P4Rc45VllUFUgyZq1UEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYI-00DTVc-1W;
	Fri, 08 Sep 2023 10:17:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYY2-00DTDp-1P
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8CEE61499;
	Fri,  8 Sep 2023 10:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC93C43397;
	Fri,  8 Sep 2023 10:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168229;
	bh=Oyq3JU+jD6JnYKUuJ4JBwmfio4ODb3qr1zJ7EbxtHwc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rpsmNMcP4ySwZSfX81zAS+FKqk8XwpFfxfeHwmI9xvrKYLIzt2xfBiOZzFfTEBrpG
	 YAhIlmO4EfBu0P/fJdaRDi+y8f8oJniZFWmr2raFgEuphUveUfzFoVPvhWGmk9bMAm
	 +mo+Dxg6V7tnhjeWb+482DCavFmJsi9hFpw9TkB3/cpG+rdfkR2hnLjNMlF+rCURL8
	 Jrb6wsZGr2c4CGKgpZryRzHdxfWYfYRnJwlgmE3tLe5HsVpRJG5nb3eM50uMMhP0Wg
	 fJ+8FRJSyGZeBV81IQ5jBE3pHeVDYqgAn65Gkei9cH97Yp0gNRMjoIdFFHi50rlw+N
	 Fr1P+wpliosiA==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:37 +0200
Subject: [PATCH v3 19/41] mtd: spi-nor: esmt: convert flash_info to new
 format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-19-e60548861b10@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_031710_547238_9B120663 
X-CRM114-Status: GOOD (  11.71  )
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
 drivers/mtd/spi-nor/esmt.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
index 12779bec5f99..089fcd1aa794 100644
--- a/drivers/mtd/spi-nor/esmt.c
+++ b/drivers/mtd/spi-nor/esmt.c
@@ -9,15 +9,25 @@
 #include "core.h"
 
 static const struct flash_info esmt_nor_parts[] = {
-	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "f25l32qa-2s", INFO(0x8c4116, 0, 64 * 1024, 64)
-		FLAGS(SPI_NOR_HAS_LOCK)
-		NO_SFDP_FLAGS(SECT_4K) },
-	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK)
-		NO_SFDP_FLAGS(SECT_4K) },
+	{
+		.id = SNOR_ID(0x8c, 0x20, 0x16),
+		.name = "f25l32pa",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0x8c, 0x41, 0x16),
+		.name = "f25l32qa-2s",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0x8c, 0x41, 0x17),
+		.name = "f25l64qa",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK,
+		.no_sfdp_flags = SECT_4K,
+	}
 };
 
 const struct spi_nor_manufacturer spi_nor_esmt = {

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
