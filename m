Return-Path: <SRS0=VmK4=VX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5D9C76190
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 21:09:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90F3D22BE8
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 21:09:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NF7/t2gV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90F3D22BE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=advem.lv
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=unUElUymDcK8kaRO5M2mgcDo2LF5WFUfiIWZ3e3Wvw8=; b=NF7/t2gVQ/9G0y
	g1yU3cQfNq/L+lBt+Q/5Ro3AU59pLdIVRMGrDeXQyfd4FNymPAnVlB8seEzJys6D6fWVpYkDLgOzn
	x8zyG1sGNypUJV7y0SaI+VDEjI+fxSTDywF5GuDQ4gKcxQt1i7DqljijkOkTFS8XRwFlwUgIvX2ZG
	5CPNu7fU1VwZBzIa/BKHifZTTyd08kF9ZyLoqo2GJXxUIdPfX/tj5bwA+Apu0vZ/+tyPnjS0YdMUv
	kN5INsOprCACUGfR73u/28E8ymihTy9icpbb8NZgSJPrU8p1K6axZMgaJc80Wz4NG9Rn2qAD/z66K
	rjElD9ROZWQUWH5u0CFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hr7Sd-0008FE-S1; Fri, 26 Jul 2019 21:09:08 +0000
Received: from [213.175.92.62] (helo=mail.pbx.lv)
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hr7SO-00087m-De
 for linux-mtd@lists.infradead.org; Fri, 26 Jul 2019 21:08:55 +0000
Received: from localhost.localdomain (balticom-200-108.balticom.lv
 [83.99.200.108])
 by mail.pbx.lv (MailSystem) with ESMTPSA id ABEF11A60A4;
 Sat, 27 Jul 2019 00:08:51 +0300 (EEST)
From: Roman Yeryomin <roman@advem.lv>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: spi-nor: add support for GD25Q512
Date: Sat, 27 Jul 2019 00:08:46 +0300
Message-Id: <20190726210846.2021-1-roman@advem.lv>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_140853_854062_7B4A306D 
X-CRM114-Status: UNSURE (   7.03  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

GD25Q512 is 64MiB spi nor flash from GigaDevice.

Signed-off-by: Roman Yeryomin <roman@advem.lv>
---
 drivers/mtd/spi-nor/spi-nor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d598efb57f20..cf7ef9849795 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1802,6 +1802,12 @@ static const struct flash_info spi_nor_ids[] = {
 			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 			.quad_enable = macronix_quad_enable,
 	},
+	{
+		"gd25q512", INFO(0xc84020, 0, 64 * 1024, 1024,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+			.quad_enable = spansion_read_cr_quad_enable,
+	},
 
 	/* Intel/Numonyx -- xxxs33b */
 	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
