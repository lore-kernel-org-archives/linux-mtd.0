Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABEFC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:47:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C15C60462
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C15C60462
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pbk0+pFH0TKfzttBiP0lNzV2hU52lhUX5br+7ovYxro=; b=0q3jbualNbO0Qi
	DHLKzsb0Q77t4upZHYbeyv+RyUCZJXW3cv+I43+g4+AdXBUNK2TJEHF66dy62/S54b5JbOfu0N15+
	j0hQkdW8aoFd1PcexH/uRBTwPcjWNiK16XpcYvTgDcfqq2GW+2WK18MzcVrYyVR4cgFT2CQeBPKoN
	3UWqTcAjnG2zeAQpULFCX+E3civGReLB7QJ4jNAvGcR9zNENe2IudsngwMSxewUObEg+CgpR+v5fz
	BaO9d8fNjYWZg2ep9brC75G+Paefb6cy90smDlxIl4WiqGopia7Y0RNfk1OdbmCPNqz+5AA6gcVLW
	9Iwi7MkYEmWPLxzPfTGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma2CT-00AdUJ-SD; Mon, 11 Oct 2021 20:47:09 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma2C6-00AdQm-20
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 20:46:47 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19BKkbx6120461;
 Mon, 11 Oct 2021 15:46:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633985197;
 bh=Xs0Y2QJh7ZkmtdvZp9Ye38YnqCIgeiTXXKjusd+pz1s=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=lqakOCvuQbU6OPltcqNu8j+F/1m4SYtPY4lLXk5PoTl7PaAmG6OxGsBrucq6N2laM
 K2btrN5FyYnW0dJHQpmQW5rCAVnZyCMJlY4mlfianMEkD7HcZtizR26sSdYtUJyCnr
 hvmD0K9t7N5+8+y7lsmTI3namhZAGn7BZ5ClKMCg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19BKkbpB055156
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Oct 2021 15:46:37 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Oct 2021 15:46:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Oct 2021 15:46:37 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19BKkKEg069811;
 Mon, 11 Oct 2021 15:46:32 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v2 02/14] mtd: spinand: Add enum spinand_proto to indicate
 current SPI IO mode
Date: Tue, 12 Oct 2021 02:16:07 +0530
Message-ID: <20211011204619.81893-3-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011204619.81893-1-a-nandan@ti.com>
References: <20211011204619.81893-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_134646_206470_A30681E5 
X-CRM114-Status: GOOD (  12.72  )
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
index 2c8685f1f2fa..d82a3e6d9bb5 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1155,6 +1155,7 @@ static void spinand_mtd_resume(struct mtd_info *mtd)
 	struct spinand_device *spinand = mtd_to_spinand(mtd);
 	int ret;
 
+	spinand->reg_proto = SPINAND_SINGLE_STR;
 	ret = spinand_reset_op(spinand);
 	if (ret)
 		return;
@@ -1181,6 +1182,7 @@ static int spinand_init(struct spinand_device *spinand)
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
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
