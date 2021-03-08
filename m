Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77874C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 10:34:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFD516512F
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 10:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFD516512F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fw510LDOqkkGG0nGF6ZNrDVkq5RYJXdprHbIbOQxaCU=; b=SpCLJCObQA7jH/oyHl6/u/Ujz
	xBaGVEXZuxI+ZqXDVq+rvCD5QiLue6WTlz9hqghZe2gCa/2YCLzL3MU5dWCbudXoPwE5BVwm13FsT
	DHrc8fWqIJk/A4YQmX8SNiKuWXVBE7j2Survzk0wnkIRYlXfiLUe/P0u16ZM083relYeEJWsPCdyM
	PTg7kEX0zQeE/+4FC5tpFKSCQxsfFxYwmR941V/A4mUGsVHWh7qjN2Q/wLqKq+Ct7GhOpd5W0ZZXd
	J/p2lF2uuraG2uLb15giQCEskfgPdhJuc6rxncYxhy5CnIXUpMhrCFFooByPO8MpOm/QFdc/UYZ6j
	t/z/VnoGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJDCJ-00GT77-4q; Mon, 08 Mar 2021 10:33:11 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJDCE-00GT5q-NV
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 10:33:09 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8E7BB22246;
 Mon,  8 Mar 2021 11:32:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615199577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9gyo4BvG6XOQykpGdNZhdjd3m8Y3HJS4LY7Hpuzvpg=;
 b=pB0ynwrK84Kg9PbXGin7O+5ydNSfT86ohwpwTpyfvDZtJuVwtAWBo/FwxZBxFGttbynFTY
 ff9wm6fkYcaUxlSm8eLtveot3l8sWxcADT6O7RGrhhBp07R4PWi9owtOEgFkbMTsNa2JsF
 F+jYTM7w4t9aNYQ8Ow4eMVw+1n0ry6U=
From: Michael Walle <michael@walle.cc>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
Cc: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 2/2] mtd: spi-nor: use 4 bit BP for large Macronix flash
Date: Mon,  8 Mar 2021 11:32:38 +0100
Message-Id: <20210308103238.7175-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303094833.139221-1-mail@david-bauer.net>
References: <20210303094833.139221-1-mail@david-bauer.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_103307_345351_5EDC28EE 
X-CRM114-Status: GOOD (  18.48  )
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

Hi David,

Thanks for your patch.

> Macronix SPI-NOR chips with 128 or more 64k blocks have 4 block
> protection bits in their status register. Add the corresponding
> flag in order to clear these bits when unloking the flash.
> 
> Otherwise, the flash might not be writable depending on the state the
> bootloader left the flash in.
> 
> Fixes commit 62593cf40b23 ("mtd: spi-nor: refactor block protection functions")

Macronix didn't support locking before your patch 1/2, right?
Therefore, this patch will just adding features.

Please limit this patch to devices which you are able to test and
mention in the commit log on what SPI controller it was tested on.

-michael

> 
> Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/mtd/spi-nor/macronix.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 2d39dd32a64e..4f9fa8b8d57f 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -50,8 +50,8 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
-	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
+	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K | SPI_NOR_4BIT_BP) },
+	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, SPI_NOR_4BIT_BP) },
 	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
@@ -60,36 +60,41 @@ static const struct flash_info macronix_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 	{ "mx25u12835f", INFO(0xc22538, 0, 64 * 1024, 256,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4BIT_BP) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      SPI_NOR_4BIT_BP)
 		.fixups = &mx25l25635_fixups },
 	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512,
-			      SECT_4K | SPI_NOR_4B_OPCODES) },
+			      SECT_4K | SPI_NOR_4B_OPCODES |
+			      SPI_NOR_4BIT_BP) },
 	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
+			      SPI_NOR_4BIT_BP) },
 	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
+	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, SPI_NOR_4BIT_BP) },
 	{ "mx25l51245g", INFO(0xc2201a, 0, 64 * 1024, 1024,
 			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_4B_OPCODES | SPI_NOR_4BIT_BP) },
 	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024,
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_4B_OPCODES | SPI_NOR_4BIT_BP) },
 	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
+			      SPI_NOR_4BIT_BP) },
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4BIT_BP) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048,
-			      SPI_NOR_QUAD_READ) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4BIT_BP) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
+			      SPI_NOR_4BIT_BP) },
 };
 
 static void macronix_default_init(struct spi_nor *nor)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
