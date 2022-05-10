Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43802C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 14:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuQwculmvLbT0/mTe+OlbKw9DiTeGrN0XZxDHKm06oI=; b=z2cUBcdj3n1Z8c
	K5WDLqjIbU++MKUo+hjtxsqkCz3ob08UKLvQ6MeC9ADETHWVyogvLYh7Oj1hT3GastHIvMzXrmei/
	F/4Ms9wyIEaRsiwv+xCGBKvK24xTF7sxMA64uR8yQ/3bhMSHnSbyrQ44JbzEbR+8aFGv5o9bz/mGo
	xeubpn6sTxe2FUpbDxPzpDHTDaT1inlpAyzG1iJTXIZ/8AHQPrWlB/d/WiHsBTU65uCOHQrK6Gmt7
	xboDHHrBjjAi7sLlwyGO+Pg78uYpCIsbAW3hCqFNS0jyiOBUF+wUrX1FW0jZNDfShsDD8enzUFsDx
	iMP0Nhc76oj6CPyLOxkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noQRv-002O4s-Mq; Tue, 10 May 2022 14:02:51 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noQRn-002O1V-Oq
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 14:02:47 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 12D552224D;
 Tue, 10 May 2022 16:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652191358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNpsQrS7bRHbkVhDDh7veJc42zC8dW1iNbM2RveywWU=;
 b=vjM2lIFstx/0lCKopKyQAx10ui00/X/78QfkIkAKIb1weg+It1Ublv4YwmPQ1dGgteRJAr
 FxUR4WJ8unAZRa2tDF1ogwYRHLRG9z/MhrDBYpFTEwxH2rUUQSohB7mJQBAbBXn8Eker9h
 bwcGHYueM0byx/2oUnYvn/E4yL8L1ig=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>
Subject: [PATCH 1/2] mtd: spi-nor: introduce SNOR_ID3()
Date: Tue, 10 May 2022 16:02:31 +0200
Message-Id: <20220510140232.3519184-2-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220510140232.3519184-1-michael@walle.cc>
References: <20220510140232.3519184-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_070244_695443_25DDF848 
X-CRM114-Status: GOOD (  14.45  )
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

Up until now, flashes were defined by specifying the JEDEC ID, the
sector size and the number of sectors. This can be read by parsing the
SFDP, we don't have to specify it. Thus provide a new macro SNOR_ID3()
which just takes the JEDEC ID and implicitly set .parse_sfdp = true. All
new flashes which have SFDP should use this macro.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c | 7 +++++--
 drivers/mtd/spi-nor/core.h | 9 +++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 402b37cdbcea..29329ed0a934 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2104,8 +2104,11 @@ static int spi_nor_select_pp(struct spi_nor *nor,
  * spi_nor_select_uniform_erase() - select optimum uniform erase type
  * @map:		the erase map of the SPI NOR
  * @wanted_size:	the erase type size to search for. Contains the value of
- *			info->sector_size or of the "small sector" size in case
- *			CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is defined.
+ *			info->sector_size, the "small sector" size in case
+ *			CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is defined or 0 if
+ *			there is no information about the sector size. The
+ *			latter is the case if the flash parameters are parsed
+ *			solely by SFDP.
  *
  * Once the optimum uniform sector erase command is found, disable all the
  * other.
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 61886868cd02..fab3038c4f4a 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -563,6 +563,15 @@ struct flash_info {
 			.n_regions = (_n_regions),			\
 		},
 
+#define SNOR_ID3(_jedec_id)						\
+		.id = {							\
+			((_jedec_id) >> 16) & 0xff,			\
+			((_jedec_id) >> 8) & 0xff,			\
+			(_jedec_id) & 0xff,				\
+			},						\
+		.id_len = 3,						\
+		.parse_sfdp = true,					\
+
 #define PARSE_SFDP							\
 	.parse_sfdp = true,						\
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
