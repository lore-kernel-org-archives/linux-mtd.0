Return-Path: <SRS0=76BL=HP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64806C433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 15:12:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB8B364DDA
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 15:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB8B364DDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=david-bauer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kp8dvqQ+r46Gg6IVgoaUpyceiFxINxBd0lIrElJ7+jg=; b=Gca03IE6wQu9sp0J5iulbSiCFu
	IfFt3FdDm+mWFuzxfVvT5GDS3lO1Im6/8VFQU4J2GeUZGIYOXpxQtpMSTm4BfmKnPF1+sUipbRUi1
	k72ACixdsLD0sS3lP2Fv2T7XbZ0UB9TyJ0nriIXlMzONunHMh18wme9BstTM+yvViGAVvNIk/f32S
	BmbECksmAN1oNIPUpi3gEd4Vlo5TOnUU7CwW1Vc9mmFoY7Nv+8dqJGhR+s2KKoFXsGDC8TspOFYnO
	o6Nm0vEDOIUut9hERItX8187Org2wbLyXVOqo9eGFDfFQUBJWv9M5KPn1BMjEOEL5+9I5CVpYK7u4
	PcGYXgFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAwZv-0005k4-Lw; Sat, 13 Feb 2021 15:11:23 +0000
Received: from mars.blocktrron.ovh ([51.254.112.43] helo=mail.blocktrron.ovh)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAwZo-0005jd-4Y
 for linux-mtd@lists.infradead.org; Sat, 13 Feb 2021 15:11:17 +0000
Received: from localhost.localdomain
 (p200300e53f29af006928c0ebeb8c6470.dip0.t-ipconnect.de
 [IPv6:2003:e5:3f29:af00:6928:c0eb:eb8c:6470])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.blocktrron.ovh (Postfix) with ESMTPSA id 51E6523386;
 Sat, 13 Feb 2021 16:11:12 +0100 (CET)
From: David Bauer <mail@david-bauer.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: add support for Winbond W25Q512JV
Date: Sat, 13 Feb 2021 16:10:47 +0100
Message-Id: <20210213151047.11700-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_101116_291697_C740A280 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 tudor.ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Winbond W25Q512JV is a 512mb SPI-NOR chip. It supports 4K
sectors as well as block protection and Dual-/Quad-read.

Tested on: Ubiquiti UniFi 6 LR

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/mtd/spi-nor/winbond.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index e5dfa786f190..49d0d7993368 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -95,6 +95,10 @@ static const struct flash_info winbond_parts[] = {
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "w25q512jv", INFO(0xef4020, 0, 64 * 1024, 1024,
+			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ |
+			    SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			    SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
 			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
 };
-- 
2.30.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
