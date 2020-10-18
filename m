Return-Path: <SRS0=OH0o=DZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E031EC433E7
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 21:32:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96D1922267
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 21:32:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BPCydHNa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96D1922267
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9+R4MkkUxt95oFPeJrRHWSl0EKRZj+cUBgf2wOvzf6U=; b=BPCydHNau2Y5S0Vl8BLhL8QLCl
	+Zu1XqKTQ0Mj20U9CvZ+IoO3XaVA2nWMgs5wAoSFV/oyFjtIiUWXtwlMRgxEMkHz/OU89zuEdDaWa
	WJYuJYRWjeqKInptO8G43D4LEy3o/yTMvUUarlQ4yfO2jNAanj5BSgxrRTXUow0blCg02Je/v+zSY
	n7KefeazdeXQPIs8magDz8uyi/2CYt9eqc9B1uKPymrxRD18VmINjrNiz3/Qu2HVrlKTrRKoaOqBX
	YDpOP8F7Ki12beoTJyu0Nz/mpe7ORFBzPwr3KENFpsFsxi0GL9mlg8YxmPKY1SIwI8FlEw7IvV1N3
	t2FxRlXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUGH5-0005Te-Sv; Sun, 18 Oct 2020 21:31:31 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUGH3-0005SX-0F
 for linux-mtd@lists.infradead.org; Sun, 18 Oct 2020 21:31:29 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id CAAD21816C713;
 Sun, 18 Oct 2020 23:31:18 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id e0k_lvnIVV77; Sun, 18 Oct 2020 23:31:18 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id kLkPh2HFQ1iH; Sun, 18 Oct 2020 23:31:18 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [RFC][PATCH 1/3] spi-nor: Add SPI_NOR_NO_WIP
Date: Sun, 18 Oct 2020 23:31:01 +0200
Message-Id: <20201018213103.28798-1-richard@nod.at>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_173129_170764_7EF40E94 
X-CRM114-Status: GOOD (  13.31  )
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
Cc: Richard Weinberger <richard@nod.at>, tudor.ambarus@microchip.com,
 vigneshr@ti.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some flashes have their WIP bit hardwired to 0.
They are always ready and there there is no need query the status
register after a write command.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/spi-nor/core.c | 6 +++++-
 drivers/mtd/spi-nor/core.h | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0369d98b2d12..eb01a0798087 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -546,8 +546,12 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
  */
 static int spi_nor_sr_ready(struct spi_nor *nor)
 {
-	int ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	int ret;
+
+	if (nor->flags & SPI_NOR_NO_WIP)
+		return 1;
 
+	ret = spi_nor_read_sr(nor, nor->bouncebuf);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 6f2f6b27173f..621202fda5d0 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -311,6 +311,8 @@ struct flash_info {
 					 * BP3 is bit 6 of status register.
 					 * Must be used with SPI_NOR_4BIT_BP.
 					 */
+#define SPI_NOR_NO_WIP		BIT(19) /* Flash is always reads, WIP status bit
+					   has no meaning. */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
-- 
2.26.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
