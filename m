Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F16C2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 06:40:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 245E42071E
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 06:40:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qS7YCs8z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 245E42071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=g1MNt6RZu/c2C29I39o+k0cDjlMexF+jLlDPmNkcTp4=; b=qS7YCs8ztFmJttD8MNWWrBIfnp
	rIgjzJKppefbYxU4553pw+5Jn7iAWgOYnPMm9b753/2lN+HE7+uhRZzm38motqa+YxDG/68WyIMDP
	vLoPYl3AyTHf1qdx/qu6k3+eIaYVki0wPKJVsX17VWP3ZLRJrUd3aIZkdRgq0puBMCiwbCJUbc2n+
	oe0TKky4NPeK2jvR+DVeSd9Ezq+x7wsV0ICfINoMC/SLwEqFKnl+gDX7WWCDGFBOXxGKSNcYjMUji
	q9RT3xG+7KgafZjILlp4u+FfVXVk7wSbijdTXLHKa/7b+CpmV2GjpRUsjkIjfIC+ldLI7V5CN+rf9
	tmPJ/wDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQmaL-0005Iq-Lb; Tue, 21 Apr 2020 06:40:45 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQmZt-0004gz-1x
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 06:40:20 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id 03L6dnMY045498;
 Tue, 21 Apr 2020 14:39:51 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, tudor.ambarus@microchip.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com
Subject: [PATCH v2 2/5] mtd: spi-nor: sfdp: Add support for xSPI profile 1.0
 table
Date: Tue, 21 Apr 2020 14:39:44 +0800
Message-Id: <1587451187-6889-3-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>
References: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com 03L6dnMY045498
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_234017_373065_8C41F5EB 
X-CRM114-Status: GOOD (  15.58  )
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
Cc: juliensu@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

xSPI(eXpanded Serial Peripheral Interface) is for Non Volatile Memory
 Devices supports Octal DTR mode.

Extract information like:
Read Fast command, the number of dummy cycles and address bytes
for Read Status Register command.

Read/Write volatile Register command for Configuration(CFG) Register 2.

The dummy cycless used for various frequencies.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.h |  14 ++++++
 drivers/mtd/spi-nor/sfdp.c | 106 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 119 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 6f2f6b2..2ea11fa 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -208,6 +208,12 @@ struct spi_nor_locking_ops {
  *                      e.g. different opcodes, specific address calculation,
  *                      page size, etc.
  * @locking_ops:	SPI NOR locking methods.
+ * @dtr_read_cmd:	xSPI Octal DTR Read Fast command.
+ * @rdsr_addr_nbytes:	xSPI Octal address bytes for read status register.
+ * @rdsr_dummy_cycles:	xSPI Octal dummy cycles for read status register.
+ * @rd_reg_cmd:		xSPI Octal read volatile register command.
+ * @wr_reg_cmd:		xSPI Octal write volatile register command.
+ * @dummy_cycles:	xSPI Octal dummy cycles used for various frequencies.
  */
 struct spi_nor_flash_parameter {
 	u64				size;
@@ -225,6 +231,14 @@ struct spi_nor_flash_parameter {
 	int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);
 
 	const struct spi_nor_locking_ops *locking_ops;
+
+	/* xSPI profile 1.0 parameter for Octal 8S-8S-8S/8D-8D-8D */
+	u8 dtr_read_cmd;
+	u8 rdsr_addr_nbytes;
+	u8 rdsr_dummy_cycles;
+	u8 rd_reg_cmd;
+	u8 wr_reg_cmd;
+	u8 dummy_cycles;
 };
 
 /**
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index f6038d3..26814a1 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -7,6 +7,7 @@
 #include <linux/slab.h>
 #include <linux/sort.h>
 #include <linux/mtd/spi-nor.h>
+#include <linux/bitfield.h>
 
 #include "core.h"
 
@@ -19,6 +20,7 @@
 #define SFDP_BFPT_ID		0xff00	/* Basic Flash Parameter Table */
 #define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
 #define SFDP_4BAIT_ID		0xff84  /* 4-byte Address Instruction Table */
+#define SFDP_XSPI_PF1_ID	0xff05	/* xSPI Profile 1.0 table. */
 
 #define SFDP_SIGNATURE		0x50444653U
 #define SFDP_JESD216_MAJOR	1
@@ -26,6 +28,28 @@
 #define SFDP_JESD216A_MINOR	5
 #define SFDP_JESD216B_MINOR	6
 
+/* xSPI Profile 1.0 table (from JESD216D.01). */
+#define XSPI_PF1_DWORD1_RD_CMD			GENMASK(15, 8)
+#define XSPI_PF1_DWORD1_RDSR_ADDR_BYTES		BIT(29)
+#define XSPI_PF1_DWORD1_RDSR_DUMMY_CYCLES	BIT(28)
+
+#define XSPI_PF1_DWORD2_RD_REG_CMD		GENMASK(31, 24)
+#define XSPI_PF1_DWORD2_WR_REG_CMD		GENMASK(15, 8)
+
+#define XSPI_DWORD(x)	((x) - 1)
+#define XSPI_DWORD_MAX	5
+
+struct sfdp_xspi {
+	u32	dwords[XSPI_DWORD_MAX];
+};
+
+struct xspi_dummy_cycles {
+	u16 speed_hz;	/* Speed MHz */
+	u8 dwords;	/* Dwords index */
+	u32 mask;	/* Mask */
+	u8 shift;	/* Bit shift */
+};
+
 struct sfdp_header {
 	u32		signature; /* Ox50444653U <=> "SFDP" */
 	u8		minor;
@@ -1081,6 +1105,83 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 }
 
 /**
+ * spi_nor_parse_xspi_pf1() - parse the xSPI Profile 1.0 table
+ * @nor:		pointer to a 'struct spi_nor'
+ * @param_header:	pointer to the 'struct sfdp_parameter_header' describing
+ *			the 4-Byte Address Instruction Table length and version.
+ * @params:		pointer to the 'struct spi_nor_flash_parameter' to be.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_parse_xspi_pf1(struct spi_nor *nor,
+				  const struct sfdp_parameter_header *header,
+				  struct spi_nor_flash_parameter *params)
+{
+	struct sfdp_xspi pfile1;
+	u32 i, addr;
+	size_t len;
+	int ret;
+	static const struct xspi_dummy_cycles dummy[] = {
+		/* {MHz, Dwords index, Mask, Bit shift} */
+		{ 200, 4, GENMASK(11, 7),   7},
+		{ 166, 5, GENMASK(31, 27), 27},
+		{ 133, 5, GENMASK(21, 17), 17},
+		{ 100, 5, GENMASK(11, 7),   7},
+	};
+
+	if (header->major != SFDP_JESD216_MAJOR ||
+	    header->length < XSPI_DWORD_MAX)
+		return -EINVAL;
+
+	len = min_t(size_t, sizeof(pfile1),
+		    header->length * sizeof(u32));
+
+	memset(&pfile1, 0, sizeof(pfile1));
+
+	addr = SFDP_PARAM_HEADER_PTP(header);
+	ret = spi_nor_read_sfdp(nor, addr, len, &pfile1);
+	if (ret)
+		goto out;
+
+	/* Fix endianness of the xSPI 1.0 DWORDs. */
+	le32_to_cpu_array(pfile1.dwords, XSPI_DWORD_MAX);
+
+	/* Get 8D-8D-8D fast read opcode and dummy cycles. */
+	params->dtr_read_cmd = FIELD_GET(XSPI_PF1_DWORD1_RD_CMD,
+					 pfile1.dwords[XSPI_DWORD(1)]);
+
+	if (pfile1.dwords[XSPI_DWORD(1)] & XSPI_PF1_DWORD1_RDSR_ADDR_BYTES)
+		params->rdsr_addr_nbytes = 4;
+	else
+		params->rdsr_addr_nbytes = 0;
+
+	if (pfile1.dwords[XSPI_DWORD(1)] & XSPI_PF1_DWORD1_RDSR_DUMMY_CYCLES)
+		params->rdsr_dummy_cycles = 8;
+	else
+		params->rdsr_dummy_cycles = 4;
+
+	params->rd_reg_cmd = FIELD_GET(XSPI_PF1_DWORD2_RD_REG_CMD,
+				       pfile1.dwords[XSPI_DWORD(2)]);
+	params->wr_reg_cmd = FIELD_GET(XSPI_PF1_DWORD2_WR_REG_CMD,
+				       pfile1.dwords[XSPI_DWORD(2)]);
+
+	for (i = 0; i < ARRAY_SIZE(dummy); i++) {
+		if (params->octal_max_speed == dummy[i].speed_hz) {
+			params->dummy_cycles =
+				(dummy[i].mask &
+				 pfile1.dwords[XSPI_DWORD(dummy[i].dwords)]) >>
+				 dummy[i].shift;
+			break;
+		}
+	}
+	if (i == ARRAY_SIZE(dummy))
+		params->dummy_cycles = 20;
+
+out:
+	return ret;
+}
+
+/**
  * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
  * @nor:		pointer to a 'struct spi_nor'
  * @params:		pointer to the 'struct spi_nor_flash_parameter' to be
@@ -1171,7 +1272,6 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
 	/* Parse optional parameter tables. */
 	for (i = 0; i < header.nph; i++) {
 		param_header = &param_headers[i];
-
 		switch (SFDP_PARAM_HEADER_ID(param_header)) {
 		case SFDP_SECTOR_MAP_ID:
 			err = spi_nor_parse_smpt(nor, param_header, params);
@@ -1181,6 +1281,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
 			err = spi_nor_parse_4bait(nor, param_header, params);
 			break;
 
+		case SFDP_XSPI_PF1_ID:
+			err = spi_nor_parse_xspi_pf1(nor, param_header, params);
+			break;
+
 		default:
 			break;
 		}
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
