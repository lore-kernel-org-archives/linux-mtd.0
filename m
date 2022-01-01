Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31AFC433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Jan 2022 07:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhHVGlaT7nc/j0cdZEan2ry8F66qU/bZGr/06OOr3vI=; b=yi5hhiAz0fOch9
	cUVhvVeMf9DokbczT+yRL8GtsrGM0OoF10/GYPvLxEH7/598E3zBVPRnldm1U9fHBJdvTsM+swkVy
	ZL/tbZ9Gbhp4h5vkrw4IY4+DFD6odMntTDwUK9HBg1BEVbesay6yxpCw6hySU+qZC4Xrm5OGB1bPs
	jlONbJkSTEM8HG6NfPrSBKYrH3BAcKUCzNfLvXtt7IklPBDby0fy2tXjAHhGdMs8gbhY+l+ZrZQ3Q
	SD6a33Jj+LFcL3iKY7tpJHBP5iDYuMO92foB/GO2BmWqpf19vg0C9uc44D5yOl/Vmzj1hMnZN6DA+
	/rcLw548rEz8bTki6lsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3Z5e-006jJW-Co; Sat, 01 Jan 2022 07:46:10 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3Z3O-006iYG-8o
 for linux-mtd@lists.infradead.org; Sat, 01 Jan 2022 07:43:51 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2017hge4103842;
 Sat, 1 Jan 2022 01:43:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641023022;
 bh=yquxRsarefuNtCOPsgOAT135Zpzm75e70KgN2foyKJ8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=uFjn8N7mXovyl4B4jBnvWU5LJkgawvRjmPo+cbl8H0fPztTPF6GETgUdj3w73cc0+
 NJGSBeTjiVRufIDDnuERD8GL94QOxX8qP/Rm/eLaosT/EDHCSc6MzpFe7i3IoIlQSc
 YzBd3sEgG7wuG9iGQk2iGlg8f/3Yx1I+WF1CHj1E=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2017hg4b039496
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 1 Jan 2022 01:43:42 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 1
 Jan 2022 01:43:42 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 1 Jan 2022 01:43:42 -0600
Received: from LT5CD112GSQZ.ent.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2017gpwd033162;
 Sat, 1 Jan 2022 01:43:37 -0600
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
Subject: [PATCH v3 08/17] mtd: spinand: Add support for manufacturer-based
 ctrl_ops variations
Date: Sat, 1 Jan 2022 13:12:41 +0530
Message-ID: <20220101074250.14443-9-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220101074250.14443-1-a-nandan@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_234350_414529_20984882 
X-CRM114-Status: GOOD (  15.18  )
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

Add ctrl_ops_variants, which can be used by the manufacturers' codes
to define their SPI control operation variants. Add a macro to easily
define ctrl_ops_varinats. This can be used to list out all the
supported ctrl ops with their respective protocols by the vendors.

Add spinand_select_ctrl_ops_variant() helper function to search for
a supported ctrl_ops variant with the required SPI protocol in a given
list of variants.

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/core.c | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h | 17 +++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 30e90527ee3c..9688fdfc174e 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1031,6 +1031,42 @@ spinand_select_data_op_variant(struct spinand_device *spinand,
 	return NULL;
 }
 
+static const struct spinand_ctrl_ops *
+spinand_select_ctrl_ops_variant(struct spinand_device *spinand,
+				const struct spinand_ctrl_ops_variants *variants,
+				const enum spinand_protocol protocol)
+{
+	unsigned int i;
+
+	for (i = 0; i < variants->nvariants; i++) {
+		const struct spinand_ctrl_ops *ctrl_ops =
+			&variants->ctrl_ops_list[i];
+
+		if (ctrl_ops->protocol != protocol)
+			continue;
+
+		if (!spi_mem_supports_op(spinand->spimem,
+					 &ctrl_ops->ops.reset) ||
+		    !spi_mem_supports_op(spinand->spimem,
+					 &ctrl_ops->ops.get_feature) ||
+		    !spi_mem_supports_op(spinand->spimem,
+					 &ctrl_ops->ops.set_feature) ||
+		    !spi_mem_supports_op(spinand->spimem,
+					 &ctrl_ops->ops.write_enable) ||
+		    !spi_mem_supports_op(spinand->spimem,
+					 &ctrl_ops->ops.block_erase) ||
+		    !spi_mem_supports_op(spinand->spimem,
+					 &ctrl_ops->ops.page_read) ||
+		    !spi_mem_supports_op(spinand->spimem,
+					 &ctrl_ops->ops.program_execute))
+			continue;
+
+		return ctrl_ops;
+	}
+
+	return NULL;
+}
+
 /**
  * spinand_match_and_init() - Try to find a match between a device ID and an
  *			      entry in a spinand_info table
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index e5df6220ec1e..5dae0649f2fb 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -385,6 +385,18 @@ struct spinand_ctrl_ops {
 		.protocol = __protocol,						\
 	}
 
+struct spinand_ctrl_ops_variants {
+	const struct spinand_ctrl_ops *ctrl_ops_list;
+	unsigned int nvariants;
+};
+
+#define SPINAND_CTRL_OPS_VARIANTS(name, ...)					\
+	const struct spinand_ctrl_ops_variants name = {				\
+		.ctrl_ops_list = (struct spinand_ctrl_ops[]){ __VA_ARGS__ },	\
+		.nvariants = sizeof((struct spinand_ctrl_ops[]){ __VA_ARGS__ })/\
+			     sizeof(struct spinand_ctrl_ops),			\
+	}
+
 /**
  * spinand_ecc_info - description of the on-die ECC implemented by a SPI NAND
  *		      chip
@@ -442,6 +454,8 @@ struct spinand_info {
 		const struct spinand_op_variants *write_cache;
 		const struct spinand_op_variants *update_cache;
 	} data_ops_variants;
+
+	const struct spinand_ctrl_ops_variants *ctrl_ops_variants;
 	int (*select_target)(struct spinand_device *spinand,
 			     unsigned int target);
 };
@@ -460,6 +474,9 @@ struct spinand_info {
 		.update_cache = __update,				\
 	}
 
+#define SPINAND_INFO_CTRL_OPS_VARIANTS(__ctrl_ops_variants)		\
+	.ctrl_ops_variants = __ctrl_ops_variants
+
 #define SPINAND_ECCINFO(__ooblayout, __get_status)			\
 	.eccinfo = {							\
 		.ooblayout = __ooblayout,				\
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
