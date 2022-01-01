Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC23C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Jan 2022 07:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+nNR+ePBAklYa9pttuORHLtwmvH58civCwNKSxa/CcA=; b=Odbb3ryOzMfcPU
	SiGoD+F1Pkur7MxuTjgIJSYHtcGwLOlvckCY7CuKPtCj9WsVUpn/ZEtxN//r6giehXDL9OqYZqr1Z
	7mreB3AexK2ZT/OuzzqqGQeFQFO87ZWmEJco770OjjK5r3TmxsWcgT8mOmuenCX92WtTgwvdTDiV7
	xy2M4JKZQvMt9GjZD0J8kg5SLz/au6FoqdD4g42FL8+5uVG7thmxXme4b4LXh43wcHE/DIzRB8j+9
	stDC8hdDyYYGGIDEbepmwsQJ3U4BBY90GkwQtNBhrPiq28jTfuGN8pW5RIRBRjWT786dgCN8d/UG+
	fePOt2z7+1wBFnYpe37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3Z3x-006iib-CR; Sat, 01 Jan 2022 07:44:25 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3Z39-006iWC-5d
 for linux-mtd@lists.infradead.org; Sat, 01 Jan 2022 07:43:36 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2017hQ88034590;
 Sat, 1 Jan 2022 01:43:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641023006;
 bh=M/hFvcCbNKAmlrRAliBKWD7s8bUkf78uts3ifMYQRhc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=iuudt2MTu69BOKUjtRh53ltYS2Le+1QMPYNMrtCd1Yu0ejhsX/yklfqHj8n2HY0dq
 FjP2Iawj7FBlhBKGGn0TjJjuhzwDGaDEubXFBwXfXK39RJF662/xvF8AQQiu7sS/Hc
 mOoYbJjTHAnymTk2cn3Q+B+gKCk8jMPwtMXzcRVk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2017hPqf081333
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 1 Jan 2022 01:43:25 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 1
 Jan 2022 01:43:25 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 1 Jan 2022 01:43:25 -0600
Received: from LT5CD112GSQZ.ent.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2017gpwa033162;
 Sat, 1 Jan 2022 01:43:20 -0600
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
Subject: [PATCH v3 05/17] mtd: spinand: Define ctrl_ops for non-page
 read/write op templates
Date: Sat, 1 Jan 2022 13:12:38 +0530
Message-ID: <20220101074250.14443-6-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220101074250.14443-1-a-nandan@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_234335_386427_AADED6D9 
X-CRM114-Status: GOOD (  12.15  )
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

'ctrl_ops' are op templates for non-page read/write operations,
which are: reset, get_feature, set_feature, write_enable, block_erase,
page_read and program_execute ops. The 'ctrl_ops' struct contains in it
op templates for each of this op, as well as enum spinand_protocol
denoting protocol of all these ops.

We require these new op templates because of deviation in standard
SPINAND ops by manufacturers and also due to changes when there is a
change in SPI protocol/mode. This prevents the core from live-patching
and vendor-specific adjustments in ops.

Define 'ctrl_ops', add macros to initialize it and add it in
spinand_device.

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 include/linux/mtd/spinand.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 439d8ce40e1d..e5df6220ec1e 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -356,6 +356,35 @@ struct spinand_op_variants {
 			sizeof(struct spi_mem_op),			\
 	}
 
+struct spinand_ctrl_ops {
+	const struct {
+		struct spi_mem_op reset;
+		struct spi_mem_op get_feature;
+		struct spi_mem_op set_feature;
+		struct spi_mem_op write_enable;
+		struct spi_mem_op block_erase;
+		struct spi_mem_op page_read;
+		struct spi_mem_op program_execute;
+	} ops;
+	const enum spinand_protocol protocol;
+};
+
+#define SPINAND_CTRL_OPS(__protocol, __reset, __get_feature, __set_feature,	\
+			 __write_enable, __block_erase, __page_read,		\
+			 __program_execute)					\
+	{									\
+		.ops = {							\
+			.reset = __reset,					\
+			.get_feature = __get_feature,				\
+			.set_feature = __set_feature,				\
+			.write_enable = __write_enable,				\
+			.block_erase = __block_erase,				\
+			.page_read = __page_read,				\
+			.program_execute = __program_execute,			\
+		},								\
+		.protocol = __protocol,						\
+	}
+
 /**
  * spinand_ecc_info - description of the on-die ECC implemented by a SPI NAND
  *		      chip
@@ -468,6 +497,8 @@ struct spinand_dirmap {
  * @data_ops.read_cache: read cache op template
  * @data_ops.write_cache: write cache op template
  * @data_ops.update_cache: update cache op template
+ * @ctrl_ops: various SPI mem op templates for handling the flash device, i.e.
+ *	      non page-read/write ops.
  * @select_target: select a specific target/die. Usually called before sending
  *		   a command addressing a page or an eraseblock embedded in
  *		   this die. Only required if your chip exposes several dies
@@ -498,6 +529,8 @@ struct spinand_device {
 		const struct spi_mem_op *update_cache;
 	} data_ops;
 
+	const struct spinand_ctrl_ops *ctrl_ops;
+
 	struct spinand_dirmap *dirmaps;
 
 	int (*select_target)(struct spinand_device *spinand,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
