Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B10C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:25:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45B632078B
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:25:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mhd/MOJQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cNF/lXeq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45B632078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sk6Bly92E9G4cXtSKvAPlw4/Jfa08R0nNjELoNvdncs=; b=Mhd/MOJQxBnFHh
	1JjfsL+HeUYU4f1s9pTNG0pil34r3oHrhb5nv1ARqdiKKQzW9uz/QqF9zys1ZFQUUoIs3ULCLUQa3
	Zdlkxg7rp1RcA094fdRLq50TevGE8NDybRM7boWmc0QWb+hBAvao9sRSXSmRU77ky9hp4JxS6LBP5
	mX3mVSV5I+NBcaO2oTmqfTNzhHKqthEJlukJVT6ZYyIBIpKG9PcLSmYc0/iz+TQCJ8C4hHh2LUsVO
	nNJ6zNHQg7Tt8vCU0+LnqK0Q3k59jdpj5l+EmKrMHqfGfrlP4qpxCyqPPh+oFuIi1qhHife9oqEV4
	asGWYOLam1A9FX/fxYfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd9Lr-0007YI-Or; Mon, 25 May 2020 09:24:55 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd9E9-0007EW-Pi; Mon, 25 May 2020 09:17:00 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04P9GqTc105362;
 Mon, 25 May 2020 04:16:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590398212;
 bh=c7C3r3QF/TMH/epmeuxUZDNfTYW7xsLdZE5YulWo4ZQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=cNF/lXeq34ay/S7wLZJv8rzbuUT39HDcOhoYJdlLF8FisRCdw+oP+kyUoN9rxZ73g
 9X/5ytiSBZ2QRhxEYxnAshYu7QMDcyVZhkfpqAxyCmZ58jOdR+obYoUIthz/QnU0U0
 Mb3cp4R1QxMWYr7im7Ep5Zh57SgKX1bEWSJMC2sQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04P9Gqxl098695
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 25 May 2020 04:16:52 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 25
 May 2020 04:16:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 25 May 2020 04:16:51 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04P9FjAB034800;
 Mon, 25 May 2020 04:16:46 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v9 11/19] mtd: spi-nor: core: do 2 byte reads for SR and FSR
 in DTR mode
Date: Mon, 25 May 2020 14:45:36 +0530
Message-ID: <20200525091544.17270-12-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200525091544.17270-1-p.yadav@ti.com>
References: <20200525091544.17270-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_021657_984152_D1F9FE16 
X-CRM114-Status: GOOD (  11.80  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sekhar Nori <nsekhar@ti.com>,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some controllers, like the cadence qspi controller, have trouble reading
only 1 byte in DTR mode. So, do 2 byte reads for SR and FSR commands in
DTR mode, and then discard the second byte.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2ad248140b6c..5cb7e391cd29 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -350,7 +350,7 @@ int spi_nor_write_disable(struct spi_nor *nor)
  * spi_nor_read_sr() - Read the Status Register.
  * @nor:	pointer to 'struct spi_nor'.
  * @sr:		pointer to a DMA-able buffer where the value of the
- *              Status Register will be written.
+ *              Status Register will be written. Should be at least 2 bytes.
  *
  * Return: 0 on success, -errno otherwise.
  */
@@ -371,6 +371,11 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
 			op.addr.nbytes = addr_bytes;
 			op.addr.val = 0;
 			op.dummy.nbytes = dummy;
+			/*
+			 * We don't want to read only one byte in DTR mode. So,
+			 * read 2 and then discard the second byte.
+			 */
+			op.data.nbytes = 2;
 		}
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
@@ -394,7 +399,8 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
  * spi_nor_read_fsr() - Read the Flag Status Register.
  * @nor:	pointer to 'struct spi_nor'
  * @fsr:	pointer to a DMA-able buffer where the value of the
- *              Flag Status Register will be written.
+ *              Flag Status Register will be written. Should be at least 2
+ *              bytes.
  *
  * Return: 0 on success, -errno otherwise.
  */
@@ -415,6 +421,11 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
 			op.addr.nbytes = addr_bytes;
 			op.addr.val = 0;
 			op.dummy.nbytes = dummy;
+			/*
+			 * We don't want to read only one byte in DTR mode. So,
+			 * read 2 and then discard the second byte.
+			 */
+			op.data.nbytes = 2;
 		}
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
