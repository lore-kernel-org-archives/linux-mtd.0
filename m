Return-Path: <SRS0=Ekuj=AE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579A8C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jun 2020 18:34:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B0FC2080C
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jun 2020 18:34:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HQOG5R8D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jceexs3a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B0FC2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vi5XuOj4l3ZyghhbM4VrZrUXbh4MMVqFmDgKDimVGjE=; b=HQOG5R8DOBPP+IJCLFsN2y1wU
	6yX/+Tb0qXk4CAS9QSsVazK07VqJWHlzhdemrK55U9+UlK1VfMj1Pa/uJ54SAqoEK5FPAVxfsJAGp
	du453aRfAvnPCTIliA3CCfRUG8Z5p+P7+4L53WoT4MYA17svqwdLkf+EZtEzz+3B6r/6ansTG0WvU
	QayoG+AvzGJTgyW+DW9AeTv7EnJhW2AzkW3x6gEZZ6PhzAghfiWCtVg8+blwmW001+iZPyDK+ETiI
	LrmJJ4ltCSlUL9Q8+eWYHL1MMd9nA2J2Xd+6SecOsQzr0vm69/30dO23DnUdBNlctWyM7fnv3BT/9
	fvPgTb4zA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnnjb-0002cW-JJ; Tue, 23 Jun 2020 18:33:27 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnnhV-00014A-Eh; Tue, 23 Jun 2020 18:31:18 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05NIVCtE060509;
 Tue, 23 Jun 2020 13:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1592937072;
 bh=ml6UABZPTKMVO8rvQcP9J9UDZOxVzyeAspCCloqX+qE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=jceexs3ayxcC7ozOSW0dtrvMJsM+6TJkUlB39oYs8t0zVvv7tE+iT8apUEmwWymAF
 1dZL2l7I/lOo1jLrPwikke24bnW+NxZzIEWhIbkUwJENCx49JdGxIrW2LQfiq3nlgu
 Dm8/r8noZitDuEXIU/tvoWNAVGkQbGAxzI7gsr+s=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05NIVCkG039553
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 23 Jun 2020 13:31:12 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 23
 Jun 2020 13:31:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 23 Jun 2020 13:31:12 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05NIUVJL000942;
 Tue, 23 Jun 2020 13:31:07 -0500
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
Subject: [PATCH v10 07/17] mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
Date: Wed, 24 Jun 2020 00:00:20 +0530
Message-ID: <20200623183030.26591-8-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200623183030.26591-1-p.yadav@ti.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sekhar Nori <nsekhar@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This table is indication that the flash is xSPI compliant and hence
supports octal DTR mode. Extract information like the fast read opcode,
dummy cycles, the number of dummy cycles needed for a Read Status
Register command, and the number of address bytes needed for a Read
Status Register command.

We don't know what speed the controller is running at. Find the fast
read dummy cycles for the fastest frequency the flash can run at to be
sure we are never short of dummy cycles. If nothing is available,
default to 20. Flashes that use a different value should update it in
their fixup hooks.

Since we want to set read settings, expose spi_nor_set_read_settings()
in core.h.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c |  2 +-
 drivers/mtd/spi-nor/core.h | 10 ++++
 drivers/mtd/spi-nor/sfdp.c | 98 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 22a3832b83a6..7d24e63fcca8 100644
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
index de1e3917889f..7e6df8322da0 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -192,6 +192,9 @@ struct spi_nor_locking_ops {
  *
  * @size:		the flash memory density in bytes.
  * @page_size:		the page size of the SPI NOR flash memory.
+ * @rdsr_dummy:		dummy cycles needed for Read Status Register command.
+ * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
+ *			command.
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
  * @reads:		read capabilities ordered by priority: the higher index
@@ -214,6 +217,8 @@ struct spi_nor_locking_ops {
 struct spi_nor_flash_parameter {
 	u64				size;
 	u32				page_size;
+	u8				rdsr_dummy;
+	u8				rdsr_addr_nbytes;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
@@ -424,6 +429,11 @@ ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
 
 int spi_nor_hwcaps_read2cmd(u32 hwcaps);
 u8 spi_nor_convert_3to4_read(u8 opcode);
+void spi_nor_set_read_settings(struct spi_nor_read_command *read,
+			      u8 num_mode_clocks,
+			      u8 num_wait_states,
+			      u8 opcode,
+			      enum spi_nor_protocol proto);
 void spi_nor_set_pp_settings(struct spi_nor_pp_command *pp, u8 opcode,
 			     enum spi_nor_protocol proto);
 
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 3f709de5ea67..d5a24e61813c 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -4,12 +4,15 @@
  * Copyright (C) 2014, Freescale Semiconductor, Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
 #include <linux/mtd/spi-nor.h>
 
 #include "core.h"
 
+#define ROUND_UP_TO(x, y)	(((x) + (y) - 1) / (y) * (y))
+
 #define SFDP_PARAM_HEADER_ID(p)	(((p)->id_msb << 8) | (p)->id_lsb)
 #define SFDP_PARAM_HEADER_PTP(p) \
 	(((p)->parameter_table_pointer[2] << 16) | \
@@ -19,6 +22,7 @@
 #define SFDP_BFPT_ID		0xff00	/* Basic Flash Parameter Table */
 #define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
 #define SFDP_4BAIT_ID		0xff84  /* 4-byte Address Instruction Table */
+#define SFDP_PROFILE1_ID	0xff05	/* xSPI Profile 1.0 table. */
 
 #define SFDP_SIGNATURE		0x50444653U
 
@@ -66,6 +70,16 @@ struct sfdp_bfpt_erase {
 	u32			shift;
 };
 
+/* xSPI Profile 1.0 table (from JESD216D.01). */
+#define PROFILE1_DWORD1_RD_FAST_CMD		GENMASK(15, 8)
+#define PROFILE1_DWORD1_RDSR_DUMMY		BIT(28)
+#define PROFILE1_DWORD1_RDSR_ADDR_BYTES		BIT(29)
+#define PROFILE1_DWORD4_DUMMY_200MHZ		GENMASK(11, 7)
+#define PROFILE1_DWORD5_DUMMY_166MHZ		GENMASK(31, 27)
+#define PROFILE1_DWORD5_DUMMY_133MHZ		GENMASK(21, 17)
+#define PROFILE1_DWORD5_DUMMY_100MHZ		GENMASK(11, 7)
+#define PROFILE1_DUMMY_DEFAULT			20
+
 #define SMPT_CMD_ADDRESS_LEN_MASK		GENMASK(23, 22)
 #define SMPT_CMD_ADDRESS_LEN_0			(0x0UL << 22)
 #define SMPT_CMD_ADDRESS_LEN_3			(0x1UL << 22)
@@ -1106,6 +1120,86 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 	return ret;
 }
 
+/**
+ * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
+ * @nor:		pointer to a 'struct spi_nor'
+ * @param_header:	pointer to the 'struct sfdp_parameter_header' describing
+ *			the 4-Byte Address Instruction Table length and version.
+ * @params:		pointer to the 'struct spi_nor_flash_parameter' to be.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_parse_profile1(struct spi_nor *nor,
+				  const struct sfdp_parameter_header *profile1_header,
+				  struct spi_nor_flash_parameter *params)
+{
+	u32 *table, opcode, addr;
+	size_t len;
+	int ret, i;
+	u8 dummy;
+
+	len = profile1_header->length * sizeof(*table);
+	table = kmalloc(len, GFP_KERNEL);
+	if (!table)
+		return -ENOMEM;
+
+	addr = SFDP_PARAM_HEADER_PTP(profile1_header);
+	ret = spi_nor_read_sfdp(nor, addr, len, table);
+	if (ret)
+		goto out;
+
+	/* Fix endianness of the table DWORDs. */
+	for (i = 0; i < profile1_header->length; i++)
+		table[i] = le32_to_cpu(table[i]);
+
+	/* Get 8D-8D-8D fast read opcode and dummy cycles. */
+	opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, table[0]);
+
+	/*
+	 * We don't know what speed the controller is running at. Find the
+	 * dummy cycles for the fastest frequency the flash can run at to be
+	 * sure we are never short of dummy cycles. A value of 0 means the
+	 * frequency is not supported.
+	 *
+	 * Default to PROFILE1_DUMMY_DEFAULT if we don't find anything, and let
+	 * flashes set the correct value if needed in their fixup hooks.
+	 */
+	dummy = FIELD_GET(PROFILE1_DWORD4_DUMMY_200MHZ, table[3]);
+	if (!dummy)
+		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ, table[4]);
+	if (!dummy)
+		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_133MHZ, table[4]);
+	if (!dummy)
+		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_100MHZ, table[4]);
+	if (!dummy)
+		dummy = PROFILE1_DUMMY_DEFAULT;
+
+	/* Round up to an even value to avoid tripping controllers up. */
+	dummy = ROUND_UP_TO(dummy, 2);
+
+	/* Update the fast read settings. */
+	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
+				  0, dummy, opcode,
+				  SNOR_PROTO_8_8_8_DTR);
+
+	/*
+	 * Set the Read Status Register dummy cycles and dummy address bytes.
+	 */
+	if (table[0] & PROFILE1_DWORD1_RDSR_DUMMY)
+		params->rdsr_dummy = 8;
+	else
+		params->rdsr_dummy = 4;
+
+	if (table[0] & PROFILE1_DWORD1_RDSR_ADDR_BYTES)
+		params->rdsr_addr_nbytes = 4;
+	else
+		params->rdsr_addr_nbytes = 0;
+
+out:
+	kfree(table);
+	return ret;
+}
+
 /**
  * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
  * @nor:		pointer to a 'struct spi_nor'
@@ -1207,6 +1301,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
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
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
