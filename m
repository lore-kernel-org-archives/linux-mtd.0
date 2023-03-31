Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DCBC76196
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 19:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YYqsSaIY2NQ3IXVWGdrD70526WMcpCxcxrV93Is8UPA=; b=ttz8n4CMR6B4/A
	Lk4L8PHbeHpSBmGJybNpaX+maQ9C5WrfTS+wRNUY5Hxmr3I5FVt77gatFn0jp+csKGs5Vf9llb4Yj
	HWhjdMWsD0xq0m+nlvIZNXMQqwgsG8DFP3ARFQtBTWnCPOZ6yn1Fyg6otubTOmhbcqMk47DABDmPI
	URsc66pxq5YX2BNhBXchd4BVUr1K1eA7VZCe9x4J9CEuhRWfmra107QEkzlDLEQIZIC9JHE9KAB5h
	fTFGkrFEP9O2CJs3KeKTahVKnfZXw9t7NLzXEqt0rSacsg7XyBPRZToIMicIfkoOMMPfXMdWbcIT/
	LmmEGGA84nOOWXJorIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piKim-008fDR-2C;
	Fri, 31 Mar 2023 19:47:36 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piKij-008fC8-1j
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 19:47:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 11661240002;
	Fri, 31 Mar 2023 19:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680292048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+fozcWeucwg/ya6uQ10TibJVsJ4FKTJGbpBrd0KdI1A=;
	b=p3SwMTZgknN3ENC3M0ajQwtIfaY7Bk5WaSVYt5SuhcQsjbL6RPi5xjxWT+WQi6NXxkS/E+
	LTYUXlc8f3BPDEtifvc3rF+88pkqryGVq8pUQ7bhvqFvFOBQRg4DWa5C+8F/HRGhRrj4+K
	0GW8yk4J+ENf8vYYdcC5zaFX0bh4SGJN4ZKeYciVZU1MXTLU00jwIINcFoo0ZeS0yKS/6X
	UrrL3oYQfz7BrXqcr2Y/JFvpVKlRmJyKyjdxCqSiERiqIVbdW9lDb9ZgR8JGs8nwO80qRb
	EcPB/C/yHGkf2wBfHwMVv5f+B8nj4+juRFypnOxo16dZ3IGj7PLBZE2cpAdDCw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: spi-nor: Fix a trivial typo
Date: Fri, 31 Mar 2023 21:47:26 +0200
Message-Id: <20230331194726.840208-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_124733_706635_4BB6E6F4 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

Fix a trivial typo in one of the core's comments.

Fixes: 620df2497415 ("mtd: spi-nor: Introduce spi_nor_get_flash_info()")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f436395ca489..860a17658cc2 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3320,7 +3320,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 			 * JEDEC knows better, so overwrite platform ID. We
 			 * can't trust partitions any longer, but we'll let
 			 * mtd apply them anyway, since some partitions may be
-			 * marked read-only, and we don't want to lose that
+			 * marked read-only, and we don't want to loose that
 			 * information, even if it's not 100% accurate.
 			 */
 			dev_warn(nor->dev, "found %s, expected %s\n",
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
