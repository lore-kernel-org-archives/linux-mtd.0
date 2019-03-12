Return-Path: <SRS0=+O2D=RP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22F7C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 10:46:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D3F82075C
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 10:46:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XHv3w42n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D3F82075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=9ms23i7dGb1OCFpG9ixtViWlagoAs9q2QGu9pHmXSr0=; b=XHv
	3w42nlkBwKb8RuE1ceGwhpj33cB/F+NkhqjyAfYDBipdJ+Kj3fHtjcGkHxgG622Qmg8LUsQFet59B
	9ir8EEka/D5ZAViPo/I5stZfYzHmhsGHNSHELTGKe4ssPbkSHPta2Yo660GPkY965DtN5WPS/sTdn
	YJycdALUp9887UJ2gfVJS7WDqAzC8j2sCnlZJJRb8cMqEkQMZ0Njg6gP6i0SM0M3RgVlbl+sjUKl1
	FPvSweoE///huagZoExC1cBbfJGGt1lzwdKlcMgx4Or1uKuR/39WrH6okOZeQjntxFzAMEdBMl6/O
	48o41duh93sGMLJNUicN+5C21CDPbDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3ev7-0001vk-Gk; Tue, 12 Mar 2019 10:46:05 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3ev3-0001vL-TP
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2019 10:46:03 +0000
Received: from ramsan ([84.194.111.163]) by albert.telenet-ops.be with bizsmtp
 id mylq1z00r3XaVaC06ylqhP; Tue, 12 Mar 2019 11:45:51 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1h3eus-00024A-RP; Tue, 12 Mar 2019 11:45:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1h3eus-0005vF-Oq; Tue, 12 Mar 2019 11:45:50 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] mtd: spi-nor: Print all JEDEC ID bytes on error
Date: Tue, 12 Mar 2019 11:45:49 +0100
Message-Id: <20190312104549.22721-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_034602_112564_15231B09 
X-CRM114-Status: GOOD (  10.01  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If identification of an SPI NOR FLASH fails, the JEDEC ID is printed,
which is stored in the first 3 bytes of the ID read from the FLASH.
However, the extended JEDEC ID, which is stored in the remaining bytes,
also matters, as it is used for identification of some FLASH types.

Print all (currently 6) ID bytes read to ease failure analysis and
debugging.

Suggested-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mtd/spi-nor/spi-nor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index fae147452aff3499..028b21abee0da5dc 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2071,8 +2071,8 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 				return &spi_nor_ids[tmp];
 		}
 	}
-	dev_err(nor->dev, "unrecognized JEDEC id bytes: %02x, %02x, %02x\n",
-		id[0], id[1], id[2]);
+	dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
+		SPI_NOR_MAX_ID_LEN, id);
 	return ERR_PTR(-ENODEV);
 }
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
