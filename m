Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E029C282CE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 22:06:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A83BA21880
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 22:06:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GiQijHoI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A83BA21880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allycomm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6mtBFRlrisxHTVUW38ohcAVYYr9ZR2ktkWJUhHq5iw=; b=GiQijHoII6IFcE
	+5qcdFxzTV7nRRJwN7K1+x+6pz7q7EoqBM1Yk/JRBpJl415wSd/UcxHkjjCsgiX1n7yXfgPMvAK0d
	ihCibSO4j9SyIrGL9jZ4GX75q6GvCDMMrMNYgVEn9L7T/oiKk/nURCQpxLE81SYHHivBTUeTgnEgd
	nE9ilnWGoC1raBgWL03ZMhSQVDYsdejFeGNzT4MtQuZnuKU0dZjjLlBjkPe2PHJgf5ZwRVLXZErco
	2SssjBYRfAouYk4v2LbdXNVpUCsu+VnZEWwZCs+JzHcNFzqcocv0JI2Ml9j8GA4J4K0Q4TjnTVyKo
	9fN35FmQtp8G917IJiuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTZNL-0004Zo-Qo; Wed, 22 May 2019 22:06:19 +0000
Received: from mx.allycomm.com ([138.68.30.55])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTZNH-0004TV-Bl
 for linux-mtd@lists.infradead.org; Wed, 22 May 2019 22:06:18 +0000
Received: from allycomm.com (unknown [IPv6:2601:647:5401:2210::49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.allycomm.com (Postfix) with ESMTPSA id AEED53CB16;
 Wed, 22 May 2019 15:06:11 -0700 (PDT)
From: Jeff Kletsky <lede@allycomm.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v4 2/3] mtd: spinand: Add support for two-byte device IDs
Date: Wed, 22 May 2019 15:05:54 -0700
Message-Id: <20190522220555.11626-3-lede@allycomm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522220555.11626-1-lede@allycomm.com>
References: <20190522220555.11626-1-lede@allycomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_150616_142765_30CDAC8C 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: linux-mtd@lists.infradead.org, Jeff Kletsky <git-commits@allycomm.com>,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Jeff Kletsky <git-commits@allycomm.com>

The GigaDevice GD5F1GQ4UFxxG SPI NAND utilizes two-byte device IDs.

http://www.gigadevice.com/datasheet/gd5f1gq4xfxxg/

Signed-off-by: Jeff Kletsky <git-commits@allycomm.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/spi/core.c | 2 +-
 include/linux/mtd/spinand.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 4c15bb58c623..556bfdb34455 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -845,7 +845,7 @@ spinand_select_op_variant(struct spinand_device *spinand,
  */
 int spinand_match_and_init(struct spinand_device *spinand,
 			   const struct spinand_info *table,
-			   unsigned int table_size, u8 devid)
+			   unsigned int table_size, u16 devid)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	unsigned int i;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 8aa39ac41e8e..fbc0423bb4ae 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -290,7 +290,7 @@ struct spinand_ecc_info {
  */
 struct spinand_info {
 	const char *model;
-	u8 devid;
+	u16 devid;
 	u32 flags;
 	struct nand_memory_organization memorg;
 	struct nand_ecc_req eccreq;
@@ -452,7 +452,7 @@ static inline void spinand_set_of_node(struct spinand_device *spinand,
 
 int spinand_match_and_init(struct spinand_device *dev,
 			   const struct spinand_info *table,
-			   unsigned int table_size, u8 devid);
+			   unsigned int table_size, u16 devid);
 
 int spinand_upd_cfg(struct spinand_device *spinand, u8 mask, u8 val);
 int spinand_select_target(struct spinand_device *spinand, unsigned int target);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
