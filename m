Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC981C07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:07:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A81CA611C0
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A81CA611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zp+kAqvFSIPFrOKc7uUnhpRjNMFqIGVdBvolicymzIQ=; b=Bf7ci6lOPUDb59
	D/pU6gph9is/OIGhlYBRf72Q0mi3AZLNuU3vvQhYyCo3owCUoErF5JXFRQwDiHdRo2OEHKf8JaIPA
	Q6j3Ax0piNj+J3idcUOVWY2Qvuv39AE4WDFnaMAG/8hb0dJSRS/Z7+K0J+Xtg3bsM7DnHyKS05bNx
	HjDvK3VoSDQbVBmjlPmEySYiB/EWm76Jf+nHLyz3YF1I1vr2XZahyVytDcbNR/ubIWSCnkjiSWWzQ
	GaPmL5PtGyjjrt+30MZEH9ZM8ixFaYfma0rKEGAueqqoX33VwyOtCcKVZx4pp7sokodNSDTeNOzjM
	GLY8P0AxBY8j/RIqqnkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3I7H-00ASMC-Mt; Tue, 13 Jul 2021 13:06:27 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3I6r-00ASEu-9z
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 13:06:04 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16DD5sT0010356;
 Tue, 13 Jul 2021 08:05:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626181554;
 bh=bvwRGkTgaRouJsbI7TnwpzPPO9mZ++9PZ3NrR5V4NMM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=X3pj8Evrk4NbnJBOPXFVmUuKbr61oAOtGUoHjMj7xgT5g6wDcmwR8lzFcBWPPHGC+
 Q9zGcvTLe2xxKsTC929ftJbrKrk8lF8hvpYybHucl0G2Z64lF1Q6oPQGaSBm51tk2h
 UxEN6N22OevJeF4FVKJFE2/Fifde8K/JQKr/0V+A=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16DD5sNr085828
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Jul 2021 08:05:54 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Jul 2021 08:05:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Jul 2021 08:05:54 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16DD5daC109825;
 Tue, 13 Jul 2021 08:05:50 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Apurva Nandan <a-nandan@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 02/13] mtd: spinand: Add enum spinand_proto to indicate
 current SPI IO mode
Date: Tue, 13 Jul 2021 13:05:27 +0000
Message-ID: <20210713130538.646-3-a-nandan@ti.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20210713130538.646-1-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_060601_477065_AD9B5C65 
X-CRM114-Status: GOOD (  13.00  )
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

Unlike Dual and Quad SPI modes flashes, Octal DTR SPI NAND flashes
require all instructions to be made in 8D-8D-8D protocol when the
flash is in Octal DTR mode. Hence, storing the current SPI IO mode
becomes necessary for correctly generating non-array access operations.

Store the current SPI IO mode in the spinand struct using a reg_proto
enum. This would act as a flag, denoting that the core should use
the given SPI protocol for non-page access operations.

Also provide basic macros for extracting buswidth and dtr mode
information from the spinand_proto enum.

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/core.c |  2 ++
 include/linux/mtd/spinand.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 446ba8d43fbc..a4f25649e293 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1153,6 +1153,7 @@ static void spinand_mtd_resume(struct mtd_info *mtd)
 	struct spinand_device *spinand = mtd_to_spinand(mtd);
 	int ret;
 
+	spinand->reg_proto = SPINAND_SINGLE_STR;
 	ret = spinand_reset_op(spinand);
 	if (ret)
 		return;
@@ -1179,6 +1180,7 @@ static int spinand_init(struct spinand_device *spinand)
 	if (!spinand->scratchbuf)
 		return -ENOMEM;
 
+	spinand->reg_proto = SPINAND_SINGLE_STR;
 	ret = spinand_detect(spinand);
 	if (ret)
 		goto err_free_bufs;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 6988956b8492..f6093cd98d7b 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -140,6 +140,31 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(len, buf, 4))
 
+#define SPINAND_PROTO_BUSWIDTH_MASK	GENMASK(6, 0)
+#define SPINAND_PROTO_DTR_BIT		BIT(7)
+
+#define SPINAND_PROTO_STR(__buswidth)	\
+	((u8)(((__buswidth) - 1) & SPINAND_PROTO_BUSWIDTH_MASK))
+#define SPINAND_PROTO_DTR(__buswidth)	\
+	(SPINAND_PROTO_DTR_BIT | SPINAND_PROTO_STR(__buswidth))
+
+#define SPINAND_PROTO_BUSWIDTH(__proto)	\
+	((u8)(((__proto) & SPINAND_PROTO_BUSWIDTH_MASK) + 1))
+#define SPINAND_PROTO_IS_DTR(__proto)	(!!((__proto) & SPINAND_PROTO_DTR_BIT))
+
+/**
+ * enum spinand_proto - List allowable SPI protocol variants for read reg,
+ *			write reg, blk erase, write enable/disable, page read
+ *			and program exec operations.
+ */
+enum spinand_proto {
+	SPINAND_SINGLE_STR = SPINAND_PROTO_STR(1),
+	SPINAND_DUAL_STR = SPINAND_PROTO_STR(2),
+	SPINAND_QUAD_STR = SPINAND_PROTO_STR(4),
+	SPINAND_OCTAL_STR = SPINAND_PROTO_STR(8),
+	SPINAND_OCTAL_DTR = SPINAND_PROTO_DTR(8),
+};
+
 /**
  * Standard SPI NAND flash commands
  */
@@ -407,6 +432,9 @@ struct spinand_dirmap {
  *		   this die. Only required if your chip exposes several dies
  * @cur_target: currently selected target/die
  * @eccinfo: on-die ECC information
+ * @reg_proto: select a variant of SPI IO protocol (single, quad, octal or
+ *	       octal DTR) for read_reg/write_reg/erase operations. Update on
+ *	       successful transition into a different SPI IO protocol.
  * @cfg_cache: config register cache. One entry per die
  * @databuf: bounce buffer for data
  * @oobbuf: bounce buffer for OOB data
@@ -438,6 +466,8 @@ struct spinand_device {
 
 	struct spinand_ecc_info eccinfo;
 
+	enum spinand_proto reg_proto;
+
 	u8 *cfg_cache;
 	u8 *databuf;
 	u8 *oobbuf;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
