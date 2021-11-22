Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFE4C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 10:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lK8REq45XZXxA2+z9Bw8t3cbThHbzpxHwLg7+GDS7ac=; b=fEkmmQIkCAlT42
	TXsaayS1CIWz3gOrQu3jhr/lioL+tMg7lKpmia0Eu6PwIlPPcg5w0NNp0HepYgkaI62UGFkbaqTyZ
	V0Ik34A/wVTXVqW+Mv+AoQbafw4AsbAfLV7/JDy6bpwsa6L5T9Q62hxXh8+6lQfmOiSEAjxsdjBky
	pGtRdj0iF/KVGWSVi0FIrXG4SfS37QbURWq11y/J/DJ9q4pzUPIJzFq9jPYMYUvo9NmXmBOr06n1b
	q1HPT83RSeOmduKgYy7p/ygTZOn+hnGfqt1l8eJyKZCfVdjjZFyTsloG0kIJVIfpEjAn/E45FJs0B
	BF6Je/A7QTmBsZc6INBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp6Hs-00FmRh-R3; Mon, 22 Nov 2021 10:11:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp5y6-00Fgme-Q0; Mon, 22 Nov 2021 09:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637574634; x=1669110634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qdMJr8j4g0u9lkfN35QMPTqHEDCtvw7cAtIjOEXki7k=;
 b=h3aWLHfhdz4k3JsTxQkow/QLTXTLSZ8wQQrBqMQMtWpmHd4JQ4vXVp6O
 cqoz4UYgbPkDJADwV4raWHjt9UaK6N0/H/fdVqEyjF/mUjCBS/9kv50KN
 y8+sYVDlAEq7+Tu7ZOPupwI0cel0NcKRPFOyD9GZSRiee/XfmGtt/yY68
 prfzXWYh04fC3LXXeopa6CD9DJlf4CNOeujfnelP6DZsW+SyI7ZaK8Ion
 KhdjPNnWfZFc1q1jQOAzeQveABCtq5ifB8nu4L4F54ATsVT4SeBIVcq3U
 Rkq5OGX2u+3R9v/7Genf9CLToiNCFi7ioPCeDxBDQ+SG9i7qqPLGG9+mu w==;
IronPort-SDR: j6icdcbjTIgcZYP64xzIReQSog8phHADiEiNWlgxCCHILkbFvPeX6jam6BsXdQBQqGkgztDlVl
 VmWfofOYlt/dhdx4KC2DcFtRvTrZa3/ECAI8+RnVtrlCRm96gCxVvNFRUl5/PCqJDPLdMshsq2
 +j4pylkxZJkzq+sWlWfjyLSUxVfr1Ojzx8aDhI/N/wAV5avhbsUs6/yeor6+6tqQccoqm1/ISU
 +on5qz3AZ3qGlhgxNKndc5SUV5jileAbcQDFgKXvwdpvyOYOVydaGlvIkMcL792/zbzvosDfq7
 COp5pn6TAzHDyN8VtO5Fy3Fi
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="152761177"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Nov 2021 02:50:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 02:50:32 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 02:50:27 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v4 01/13] mtd: spi-nor: core: Don't use mtd_info in the NOR's
 probe sequence of calls
Date: Mon, 22 Nov 2021 11:50:08 +0200
Message-ID: <20211122095020.393346-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122095020.393346-1-tudor.ambarus@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_015034_901018_3E628CA2 
X-CRM114-Status: GOOD (  12.52  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use NOR parameters in the probe's sequence of calls, thus
nor->params->size instead of nor->mtd.size and let the mtd_info
fields be used by the mtd calls (mtd->_erase, mtd->_read, mtd->_write).
mtd_info fields should not be used during probe because we haven't
registered mtd yet.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v4: new patch

 drivers/mtd/spi-nor/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 88dd0908d172..5b9c827d411c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2115,7 +2115,7 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
 	 */
 	op->addr.nbytes = 4;
 	if (!spi_mem_supports_op(nor->spimem, op)) {
-		if (nor->mtd.size > SZ_16M)
+		if (nor->params->size > SZ_16M)
 			return -EOPNOTSUPP;
 
 		/* If flash size <= 16MB, 3 address bytes are sufficient */
@@ -3011,7 +3011,7 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
 		nor->addr_width = 3;
 	}
 
-	if (nor->addr_width == 3 && nor->mtd.size > 0x1000000) {
+	if (nor->addr_width == 3 && nor->params->size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
 		nor->addr_width = 4;
 	}
@@ -3245,7 +3245,7 @@ static int spi_nor_create_read_dirmap(struct spi_nor *nor)
 				      SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
 				      SPI_MEM_OP_DATA_IN(0, NULL, 0)),
 		.offset = 0,
-		.length = nor->mtd.size,
+		.length = nor->params->size,
 	};
 	struct spi_mem_op *op = &info.op_tmpl;
 
@@ -3276,7 +3276,7 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 				      SPI_MEM_OP_NO_DUMMY,
 				      SPI_MEM_OP_DATA_OUT(0, NULL, 0)),
 		.offset = 0,
-		.length = nor->mtd.size,
+		.length = nor->params->size,
 	};
 	struct spi_mem_op *op = &info.op_tmpl;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
