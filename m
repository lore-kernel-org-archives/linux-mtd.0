Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6095EC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I4ldq47Q7c6C4O/HA33iGJpJd5RDvcGDjvIZMWPZRPo=; b=jp+X19MH1aTNFS
	5+Ar66VdJ3M3iunUVEJ6ebh/ioBr7IIQOhL6925Se+AIE8t9auPcM3k8ZlUdNCRhaJXmomGKM3lkO
	ldpdIuCKqc8+KEPpXxXFJtZ8NQo4FatLFlyxY3dUIdrGG1s10pU6hsztsXsd9TqNESZJGiyo5TiHP
	nJ2Wf9QvxouH46gpJTjshUuRKjS9WOD1VJvgkjEvKqHuVrihhWx9CbCrvMbU6OjNr0GqbpaX9Y70u
	xIsg6bWwVuO4vBcgmvCAKlhSf8enHhvobHcWz1LggN/ogt67EjtBhHDibQR6mKe+mPhgUlevxETls
	izBQ8XMGKr5toma/6+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myDUl-00AQDV-De; Fri, 17 Dec 2021 13:41:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myDUi-00AQC2-AX
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 13:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639748516; x=1671284516;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xX5ZSrbiNjNxR+hTc05BTwezwHcOHWTy1Olt7ni3p1k=;
 b=MU6uPB9khZk+Ztxj6Qd7mwGWwITvPQhLCJsSVpTHTzuAMV2IyWHvkHR8
 6addaN0TiuzXJH5D0TM7TFemzoQADFm28H/9LzJQYIOC8sJd57+18wBsE
 Kv2vDrMafM2x3ymYmIVFwnpDXGh19J6tyli6P0n2ipzBZKXskZL36galF
 cjz03MkYfV3AWmAIutm9T9+guung2bF7uXkswC87AwB46AhGbBMT9cSY2
 dmyO8jjxDDwe8kP0YfeBEc3VFI7vWe4CG2/FS/CLoQbe5UOQflRgsqHdu
 6b6AHdSaj2NBT4j9GBtPpcG/b/CO9geqGjEZM8iZCiOY0LGeO2+O9x5O8 g==;
IronPort-SDR: O3DxDBNcXs8k9FMnGdLwSmpmYKVE74bN/nFdVG+qcBI3wF+SMnoV3GEysKljIWMIjC41rDf+yB
 Utk3rMF1BtVFY96ghE/9txZatBpUGkvD166vsIqLXQg2XvBvouCuCLOJcCTJEqJGDYKSu6gsaJ
 R24O7PqUf1CwT31CI9IF3bsd1tpAwmZnDT97nZbYLydUuob/CU7QNKENJhRPS22uj5Yf598+AZ
 LycKsfVszi9nwsVY4sF4cojIPtu2EuDFh/LI99QpzfEwP+Y7k1l2lwHFB5rVOxQYF6quLwBg1s
 1nGz23sMOLw7HO4DHKzSuvY6
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="147590593"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 06:41:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 06:41:53 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 17 Dec 2021 06:41:51 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 1/2] mtd: spi-nor: core: Introduce SPI_NOR_SOFT_RESET
 flash_info fixup_flag
Date: Fri, 17 Dec 2021 15:41:49 +0200
Message-ID: <20211217134150.497731-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_054156_423370_F0D7D72A 
X-CRM114-Status: GOOD (  10.63  )
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

The Soft Reset and Rescue Sequence Support is defined in BFPT_DWORD(16)
starting with JESD216A. The first version of SFDP, JESD216 (April 2011),
defines just the first 9 BFPT DWORDS, thus it does not contain information
about the Software Reset and Rescue Support. Since this support can not
be discovered by parsing the first SFDP version, introduce a flash_info
fixup_flag that will be used either by flashes that define
JESD216 (April 2011) or by flashes that do not define SFDP at all.
In case a flash defines BFPT_DWORD(16) but with wrong values, one should
instead use a post_bfpt() hook and set SNOR_F_SOFT_RESET.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
v2: collect R-b

 drivers/mtd/spi-nor/core.c | 3 +++
 drivers/mtd/spi-nor/core.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2e21d5ac0e2d..32d80fdaa2a2 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2699,6 +2699,9 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
 
 	if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+
+	if (fixup_flags & SPI_NOR_SOFT_RESET)
+		nor->flags |= SNOR_F_SOFT_RESET;
 }
 
 /**
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 2afb610853a9..70c6bb7f5f04 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -373,6 +373,8 @@ struct spi_nor_fixups {
  *                            memory size above 128Mib.
  *   SPI_NOR_IO_MODE_EN_VOLATILE: flash enables the best available I/O mode
  *                            via a volatile bit.
+ *   SPI_NOR_SOFT_RESET:      flash supports software reset enable, reset
+ *                            sequence.
  * @mfr_flags:      manufacturer private flags. Used in the manufacturer fixup
  *                  hooks to differentiate support between flashes of the same
  *                  manufacturer.
@@ -416,6 +418,7 @@ struct flash_info {
 	u8 fixup_flags;
 #define SPI_NOR_4B_OPCODES		BIT(0)
 #define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(1)
+#define SPI_NOR_SOFT_RESET		BIT(2)
 
 	u8 mfr_flags;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
