Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFECC4332F
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Jan 2022 07:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRIGVSgauIY2au3qLvxTxMywf5tmfE/bwdSgVkh6i08=; b=DuFEu0hm0s/tNT
	fNisnc0t0K93VgiNtzBNdGVNEVUzii9E6dogycsWn8hkD/g43PkwvT0tlmQURturUFbBi2ecDzVkX
	QI4ZmoACLX+43CAmw1ayHU0z9ZbJ0pM6P4Q1+XEvMul+MemXMn98bMOSb1wcNBWLlHZm0FGMQwQX3
	psMV2b8nMZd0cb10idsV0rl52QqlO43ZIZJfkoYKiaQSDjSAFcwksGF7svL1x7QLYqzfhK2vojVz7
	inT4UJtvUhpSlOJOyuUY4m5tbl7G5JBX5aGG+OYVmNkQHTvnumO1SYtWnTiFK658FKRshsMFSJO7M
	Kdq5vQuABZhiFW+NTE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3Z3R-006iZj-8b; Sat, 01 Jan 2022 07:43:53 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3Z2y-006iUi-46
 for linux-mtd@lists.infradead.org; Sat, 01 Jan 2022 07:43:26 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2017hEsP103763;
 Sat, 1 Jan 2022 01:43:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641022994;
 bh=fGDfRVAjjhgDDv63T/ddhpIqXTX/Z73J6OSl6cnmvHk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=k/tJp3wQVfePDxxGqEukGSu1w8S1CJdqKRbhLAeG/Qd5irWP6o03SDhsnvPNGAHIH
 fBIB+lkO4jTI1XfM6v38Qsfie59vQohQjeaWCBl/vj6OaETRQ6k/+7g8c12dcp7h8O
 ZODRyyJIo2dNkFRk+jh/MPwS8uyy788NPCWBkjgA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2017hE1Q089512
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 1 Jan 2022 01:43:14 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 1
 Jan 2022 01:43:14 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 1 Jan 2022 01:43:14 -0600
Received: from LT5CD112GSQZ.ent.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2017gpwY033162;
 Sat, 1 Jan 2022 01:43:08 -0600
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Daniel Palmer <daniel@0x0f.com>, Alexander
 Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v3 03/17] mtd: spinand: Add enum spinand_protocol to indicate
 current SPI IO mode
Date: Sat, 1 Jan 2022 13:12:36 +0530
Message-ID: <20220101074250.14443-4-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220101074250.14443-1-a-nandan@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_234324_275240_4556AD7A 
X-CRM114-Status: GOOD (  13.15  )
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
becomes necessary for operating the flash and switching between modes.

Store the current SPI IO mode in the spinand struct using a
spinand_protocol enum. This would act as a flag, denoting that the
core should use the given SPI protocol all types of flash operations.

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/core.c |  2 ++
 include/linux/mtd/spinand.h | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 2c8685f1f2fa..7d8c2873ab29 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1155,6 +1155,7 @@ static void spinand_mtd_resume(struct mtd_info *mtd)
 	struct spinand_device *spinand = mtd_to_spinand(mtd);
 	int ret;
 
+	spinand->protocol = SPINAND_1S_1S_1S;
 	ret = spinand_reset_op(spinand);
 	if (ret)
 		return;
@@ -1181,6 +1182,7 @@ static int spinand_init(struct spinand_device *spinand)
 	if (!spinand->scratchbuf)
 		return -ENOMEM;
 
+	spinand->protocol = SPINAND_1S_1S_1S;
 	ret = spinand_detect(spinand);
 	if (ret)
 		goto err_free_bufs;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 69e06e741717..77927afcea0f 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -194,6 +194,18 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT_DTR(len, buf, 8))
 
+/**
+ * enum spinand_protocol - List of SPI protocols to denote the op protocol and
+ *			   SPI NAND flash IO modes.
+ */
+enum spinand_protocol {
+	SPINAND_1S_1S_1S,
+	SPINAND_2S_2S_2S,
+	SPINAND_4S_4S_4S,
+	SPINAND_8S_8S_8S,
+	SPINAND_8D_8D_8D,
+};
+
 /**
  * Standard SPI NAND flash commands
  */
@@ -461,6 +473,8 @@ struct spinand_dirmap {
  *		   this die. Only required if your chip exposes several dies
  * @cur_target: currently selected target/die
  * @eccinfo: on-die ECC information
+ * @protocol: SPI IO protocol in operation. Update on successful transition into
+ *	      a different SPI IO protocol.
  * @cfg_cache: config register cache. One entry per die
  * @databuf: bounce buffer for data
  * @oobbuf: bounce buffer for OOB data
@@ -492,6 +506,8 @@ struct spinand_device {
 
 	struct spinand_ecc_info eccinfo;
 
+	enum spinand_protocol protocol;
+
 	u8 *cfg_cache;
 	u8 *databuf;
 	u8 *oobbuf;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
