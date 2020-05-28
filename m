Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD1BC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:01:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AE132063A
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:01:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l4LCLa0r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AE132063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CqT6qhmZRcHdfhjm4nJl2A6jTDcJSz5QaXccokD5n6s=; b=l4LCLa0rVqIw51R2VSwGtS7Hk9
	/Yve1VtFopONP3Zcm9CEv/IpalPMjWO981mz1L+hjxHGxrIXMh5iGhWyqNrsKJsl55360u6CURlT6
	+toy6gMXMqjYgJZPJROaahNI9+ltg9jRaBMGZRG/awlWpmk1jinL7lpsVnOtAyMtIy+ZsoHOaUzAo
	znfxpafTdMTNcWDlNyzl3lxr6njSSIuCUPN51012h48clGHdAR0QGHpkwPXOb36JrYC9NPjrQi9DU
	DCJzPtetBttvZqpaKzF91+tj2LKqpxHy5P14CrNnGHldmQkaknKYckNQCe39S1ohzjJ3zXuBGvIWk
	M+xSSErA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDTV-0003Mp-Pj; Thu, 28 May 2020 08:01:13 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeDRb-0007nE-RE
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 07:59:17 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id 04S7wMHg030973;
 Thu, 28 May 2020 15:58:28 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, tudor.ambarus@microchip.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com,
 matthias.bgg@gmail.com
Subject: [PATCH v3 07/14] mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
Date: Thu, 28 May 2020 15:58:09 +0800
Message-Id: <1590652696-8844-8-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1590652696-8844-1-git-send-email-masonccyang@mxic.com.tw>
References: <1590652696-8844-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG4.macronix.com 04S7wMHg030973
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_005916_145995_682F452B 
X-CRM114-Status: GOOD (  16.67  )
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
Cc: juliensu@mxic.com.tw, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mason Yang <masonccyang@mxic.com.tw>, p.yadav@ti.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

JESD251, xSPI profile 1.0 table supports octal DTR mode.
Extract information like the fast read opcode, dummy cycles for various
frequencies, the number of dummy cycles needed for a Read Status
Register command, the number of address bytes needed for a Read
Status Register command, read volatile register command and write
volatile register command.

According to BFPT 20th DWORD of octal maximum speed, driver get it's
specific dummy cycles from profile 1.0 table and then could update
it to device by their fixup hooks.

Since driver get octal DTR read opcode and then set read settings,
expose spi_nor_set_read_settings() in core.h.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.c |   2 +-
 drivers/mtd/spi-nor/core.h |  16 +++++++
 drivers/mtd/spi-nor/sfdp.c | 106 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 388e695..642e3c0 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2355,7 +2355,7 @@ static int spi_nor_check(struct spi_nor *nor)
 	return 0;
 }
 
-static void
+void
 spi_nor_set_read_settings(struct spi_nor_read_command *read,
 			  u8 num_mode_clocks,
 			  u8 num_wait_states,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index f644ed1..837f5e9 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -193,6 +193,12 @@ struct spi_nor_locking_ops {
  * @size:		the flash memory density in bytes.
  * @page_size:		the page size of the SPI NOR flash memory.
  * @octal_max_speed:	maximum operation speed of device in octal mode.
+ * @rdsr_dummy:		dummy cycles needed for Read Status Register command.
+ * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
+ *			command.
+ * @rd_reg_cmd:		read volatile register command for xSPI device.
+ * @wr_reg_cmd:		write volatile register command for xSPI device.
+ * @dummy_cycles:	dummy cycles used for various frequencies.
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
  * @reads:		read capabilities ordered by priority: the higher index
@@ -216,6 +222,11 @@ struct spi_nor_flash_parameter {
 	u64				size;
 	u32				page_size;
 	u16				octal_max_speed;
+	u8				rdsr_dummy;
+	u8				rdsr_addr_nbytes;
+	u8				rd_reg_cmd;
+	u8				wr_reg_cmd;
+	u8				dummy_cycles;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
@@ -426,6 +437,11 @@ ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
 
 int spi_nor_hwcaps_read2cmd(u32 hwcaps);
 u8 spi_nor_convert_3to4_read(u8 opcode);
+void spi_nor_set_read_settings(struct spi_nor_read_command *read,
+			       u8 num_mode_clocks,
+			       u8 num_wait_states,
+			       u8 opcode,
+			       enum spi_nor_protocol proto);
 void spi_nor_set_pp_settings(struct spi_nor_pp_command *pp, u8 opcode,
 			     enum spi_nor_protocol proto);
 
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index d7ef47a..550422b 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -20,6 +20,7 @@
 #define SFDP_BFPT_ID		0xff00	/* Basic Flash Parameter Table */
 #define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
 #define SFDP_4BAIT_ID		0xff84  /* 4-byte Address Instruction Table */
+#define SFDP_PROFILE1_ID	0xff05	/* xSPI Profile 1.0 table. */
 
 #define SFDP_SIGNATURE		0x50444653U
 #define SFDP_JESD216_MAJOR	1
@@ -27,6 +28,27 @@
 #define SFDP_JESD216A_MINOR	5
 #define SFDP_JESD216B_MINOR	6
 
+/* xSPI Profile 1.0 table (from JESD216D.01). */
+#define XSPI_PF1_DWORD1_RD_CMD                  GENMASK(15, 8)
+#define XSPI_PF1_DWORD1_RDSR_ADDR_BYTES         BIT(29)
+#define XSPI_PF1_DWORD1_RDSR_DUMMY_CYCLES       BIT(28)
+#define XSPI_PF1_DWORD2_RD_REG_CMD              GENMASK(31, 24)
+#define XSPI_PF1_DWORD2_WR_REG_CMD              GENMASK(15, 8)
+#define XSPI_PF1_DUMMY_CYCLES_DEFAULT		20
+#define XSPI_DWORD(x)   ((x) - 1)
+#define XSPI_DWORD_MAX  5
+
+struct sfdp_xspi {
+	u32 dwords[XSPI_DWORD_MAX];
+};
+
+struct xspi_dummy_cycles {
+	u16 speed_hz;	/* Speed MHz */
+	u8 dwords;	/* Dwords index */
+	u32 mask;	/* Mask */
+	u8 shift;	/* Bit shift */
+};
+
 /* Basic Flash Parameter Table 20th DWORD, Max operation speed of device */
 struct octal_max_speed {
 	u8 idx; /* Bits value */
@@ -1146,6 +1168,86 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 }
 
 /**
+ * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
+ * @nor:		pointer to a 'struct spi_nor'
+ * @param_header:	xspi profile 1 parameter table header
+ * @params:		pointer to the 'struct spi_nor_flash_parameter' to be.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_parse_profile1(struct spi_nor *nor,
+				  const struct sfdp_parameter_header *header,
+				  struct spi_nor_flash_parameter *params)
+{
+	struct sfdp_xspi pfile1;
+	u8 opcode;
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
+	opcode = FIELD_GET(XSPI_PF1_DWORD1_RD_CMD,
+			   pfile1.dwords[XSPI_DWORD(1)]);
+
+	if (pfile1.dwords[XSPI_DWORD(1)] & XSPI_PF1_DWORD1_RDSR_ADDR_BYTES)
+		params->rdsr_addr_nbytes = 4;
+	else
+		params->rdsr_addr_nbytes = 0;
+
+	if (pfile1.dwords[XSPI_DWORD(1)] & XSPI_PF1_DWORD1_RDSR_DUMMY_CYCLES)
+		params->rdsr_dummy = 8;
+	else
+		params->rdsr_dummy = 4;
+
+	params->rd_reg_cmd = FIELD_GET(XSPI_PF1_DWORD2_RD_REG_CMD,
+				       pfile1.dwords[XSPI_DWORD(2)]);
+	params->wr_reg_cmd = FIELD_GET(XSPI_PF1_DWORD2_WR_REG_CMD,
+				       pfile1.dwords[XSPI_DWORD(2)]);
+
+	/* according to BFPT 20th DOWRD to get devices dummy cycles */
+	for (i = 0; i < ARRAY_SIZE(dummy); i++) {
+		if (params->octal_max_speed == dummy[i].speed_hz) {
+			params->dummy_cycles = (dummy[i].mask &
+				pfile1.dwords[XSPI_DWORD(dummy[i].dwords)]) >>
+				dummy[i].shift;
+			break;
+		}
+	}
+	if (i == ARRAY_SIZE(dummy))
+		params->dummy_cycles = XSPI_PF1_DUMMY_CYCLES_DEFAULT;
+
+	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
+				  0, params->dummy_cycles,
+				  opcode, SNOR_PROTO_8_8_8_DTR);
+out:
+	return ret;
+}
+
+/**
  * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
  * @nor:		pointer to a 'struct spi_nor'
  * @params:		pointer to the 'struct spi_nor_flash_parameter' to be
@@ -1246,6 +1348,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
 			err = spi_nor_parse_4bait(nor, param_header, params);
 			break;
 
+		case SFDP_PROFILE1_ID:
+			err = spi_nor_parse_profile1(nor, param_header, params);
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
