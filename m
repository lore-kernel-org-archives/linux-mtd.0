Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B8DC2D0E4
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 06:42:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 431CC221FD
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 06:42:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MlKDBKSA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uNtFFnCK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 431CC221FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CKxKz/qXRk/r3mEQ1/AiQzukTypNztAFdbMdXFFVzao=; b=MlKDBKSATMcPyZtGHs/Gx3EEOK
	QF434Ws+Uz7hNmmwQgDXuhgrdzsNR6UC/uKYRdGl6rXMc5Iagbudn6wvr5ZkioOLpCwwEps8U/jgT
	Z6ItbRCnvl7eEAXBucM+vrH8BkwpdEJlbr5+6lVKyOjhO2HXBSkJ9tKz+6qafbt4iZ/YdV4mGl4wj
	evA9OIpagrtxYK1EGN7yAdkyPaZn0HBTQfqZvjfo/Um6Jvew+YVMsU131hYKHFXsnEOFukse0Swsg
	PIrVB5bHNlqIhkDdHltNEEK7512KwezTmLs0PibtHttTwP37+BiLco+kt6IEoZ1uklB3dy821OzZy
	oNPDKFUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiXRV-0005Xc-OJ; Fri, 27 Nov 2020 06:41:17 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiXRO-0005VB-3j
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 06:41:11 +0000
Received: by mail-pg1-x542.google.com with SMTP id k11so3560501pgq.2
 for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2020 22:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AkL2OLYQMNe/8GDGye1FR703PN/tzqD/QzHa3qPt8Kg=;
 b=uNtFFnCKhjAecu5AApAtz5qKKjjkxxnRC4G+rf4LpA1yalv+IJPF0nqHGHO1gwjzL4
 89eVTiD0OflaAzUfSBVdznT6Oi7Ojn/UK+FQq/bxHXrrSmNENq3Eve8Ia+MtypHVbHyr
 7YtJD3hmnb1B7i3PWfQEMfP/r8VWEY4zlnZ8ARpBtR6UDCiFIz3ko7XmwOH845Ysph6e
 l0SDGHUMMKF4gxUhjDGqscRhFh/COx9PSBn/5flC6vPFQKxfxr6lEoO0rGfNV7bxfOKV
 N+CbJo+aL6WhnPpt29Zx/rvw380UnLxZ2NAMdH6isZ86zoZkpDZjn43Hko/1RCMZB3j1
 Q78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AkL2OLYQMNe/8GDGye1FR703PN/tzqD/QzHa3qPt8Kg=;
 b=SYZTLJDlHfUad/4E75h3svd0oLJvfOjjIdjpdz0dYQYJkzvNa1fAng8gwcjlBmzfZn
 XFdg6zHJXyLT8ZTznVuTwLTFXXyphLO6UXcLuCW7Srq8fi46BaeLyH2HCNqscAFsrltF
 81QNdtXbc/+8MTMBW++4OXuGIJXyWUk6sftgx0J/SdX3BUlfe0Ch583bye1iDesj1YQo
 YYTmHHvzdr5Ig78dAxnVWECLbw24v2Xu0UU3ViVFCw0r1Y7vzaR1pbdxLOYQ9/HlTH8l
 d84Ib4cPOJrsmVgnHpVr4GjLOmQD3nZkHrJXHoKojYtxmrdj5yMttZ/HvZdija99bK8E
 95/w==
X-Gm-Message-State: AOAM5337SVgfl17EjblpSsn60qfeIHt2m+Hlpp6oZ6aJVFAKioU9hzo/
 EF8cdeEC2JdOJTTRIi25T4GASvIrgzEW1Q==
X-Google-Smtp-Source: ABdhPJwCGKRzNqOQqPXNroJDllYCMhn6+PlbzGvf+VzwSCjdA3Sr4MLmcHfZgKD6JZ6C0rCQ2mvGEA==
X-Received: by 2002:a63:5418:: with SMTP id i24mr5382222pgb.165.1606459266498; 
 Thu, 26 Nov 2020 22:41:06 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id e2sm8315461pjv.10.2020.11.26.22.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 22:41:05 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: spi-nor: spansion: Add support for s25hl-t/s25hs-t
Date: Fri, 27 Nov 2020 15:40:43 +0900
Message-Id: <20201127064043.29541-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_014110_256851_C485E59B 
X-CRM114-Status: GOOD (  28.50  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 Bacem.Daassi@infineon.com, tkuw584924@gmail.com, miquel.raynal@bootlin.com,
 p.yadav@ti.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
The datasheet can be found in https://community.cypress.com/docs/DOC-15165

The following fixups are added to enable S25HL-T/S25HS-T.
  - Fix erase map populated by wrong SMPT values
  - Replace quad_enable() with volatile version
  - Change address mode to 4-byte before SMPT parsing
  - Look up configuration to get correct page_size
  - Fix num_mode_clocks for Fast Read 4B
  - Add Read/Write Any Register commands to support other fixups

Tested on Xilinx Zynq-7000 FPGA board.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v2:
  - Remove SPI_NOR_SKIP_SFDP flag and clean up related fixups
  - Check CFR3V[4] to determine page_size instead of force 512B
  - Depend on the patchset below to support non-uniform sector layout
    https://lore.kernel.org/linux-mtd/cover.1601612872.git.Takahiro.Kuwano@infineon.com/

 drivers/mtd/spi-nor/spansion.c | 300 +++++++++++++++++++++++++++++++++
 1 file changed, 300 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 8429b4af999a..d18daa49e3dd 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -8,6 +8,288 @@
 
 #include "core.h"
 
+#define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
+#define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
+#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
+#define SPINOR_REG_CYPRESS_CFR3V		0x00800004
+#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
+#define SPINOR_REG_CYPRESS_CFR3V_PGSZ		BIT(4)	/* Page size. */
+
+/**
+ * spansion_read_any_reg() - Read Any Register.
+ * @nor:	pointer to a 'struct spi_nor'
+ * @reg_addr:	register address
+ * @reg_dummy:	number of dummy cycles for register read
+ * @reg_val:	pointer to a buffer where the register value is copied into
+ *
+ * Some Spansion/Cypress devices can take dummy cycles that are not multiples of
+ * 8, while SPI MEM takes number of dummy 'bytes'. Since the Flash repeats
+ * outputting the same register contents as long as clock keeps toggling, we can
+ * restore the original register content by reading two bytes.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_read_any_reg(struct spi_nor *nor, u32 reg_addr,
+				 u8 reg_dummy, u8 *reg_val)
+{
+	u8 read_opcode, read_dummy, dummy_rem;
+	enum spi_nor_protocol read_proto;
+	size_t len;
+	ssize_t ret;
+
+	read_opcode = nor->read_opcode;
+	read_dummy = nor->read_dummy;
+	read_proto = nor->read_proto;
+
+	nor->read_opcode = SPINOR_OP_RD_ANY_REG;
+	nor->read_dummy = reg_dummy & ~7;
+	nor->read_proto = SNOR_PROTO_1_1_1;
+
+	dummy_rem = reg_dummy - nor->read_dummy;
+	len = dummy_rem ? 2 : 1;
+
+	ret = spi_nor_read_data(nor, reg_addr, len, nor->bouncebuf);
+
+	nor->read_opcode = read_opcode;
+	nor->read_dummy = read_dummy;
+	nor->read_proto = read_proto;
+
+	if (ret == len) {
+		if (dummy_rem)
+			*reg_val = (nor->bouncebuf[0] << dummy_rem) |
+				   (nor->bouncebuf[1] >> (8 - dummy_rem));
+		else
+			*reg_val = nor->bouncebuf[0];
+
+		return 0;
+	}
+
+	return ret < 0 ? ret : -EIO;
+}
+
+/**
+ * spansion_write_any_reg() - Write Any Register.
+ * @nor:	pointer to a 'struct spi_nor'
+ * @reg_addr:	register address
+ * @reg_val:	register value to be written
+ *
+ * Register write will be effective immediately after the operation so status
+ * polling is not needed.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr, u8 reg_val)
+{
+	u8 program_opcode;
+	enum spi_nor_protocol write_proto;
+	ssize_t ret;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	program_opcode = nor->program_opcode;
+	write_proto = nor->write_proto;
+
+	nor->program_opcode = SPINOR_OP_WR_ANY_REG;
+	nor->write_proto = SNOR_PROTO_1_1_1;
+
+	nor->bouncebuf[0] = reg_val;
+	ret = spi_nor_write_data(nor, reg_addr, 1, nor->bouncebuf);
+
+	nor->program_opcode = program_opcode;
+	nor->write_proto = write_proto;
+
+	return ret == 1 ? 0 : (ret < 0 ? ret : -EIO);
+}
+
+/**
+ * spansion_quad_enable_volatile() - enable Quad I/O mode in volatile register.
+ * @nor:		pointer to a 'struct spi_nor'
+ * @reg_addr_base:	base address of register (can be >0 in multi-die parts)
+ * @reg_dummy:		number of dummy cycles for register read
+ *
+ * It is recommended to update volatile registers in the field application due
+ * to a risk of the non-volatile registers corruption by power interrupt. This
+ * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
+ * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
+ * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
+ * also set during Flash power-up.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_quad_enable_volatile(struct spi_nor *nor, u32 reg_addr_base,
+					 u8 reg_dummy)
+{
+	u32 reg_addr = reg_addr_base + SPINOR_REG_CYPRESS_CFR1V;
+	u8 cfr1v, cfr1v_written;
+	int ret;
+
+	/* Check current Quad Enable bit value. */
+	ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);
+	if (ret)
+		return ret;
+	if (cfr1v & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
+		return 0;
+
+	/* Update the Quad Enable bit. */
+	cfr1v |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
+
+	ret = spansion_write_any_reg(nor, reg_addr, cfr1v);
+	if (ret)
+		return ret;
+
+	cfr1v_written = cfr1v;
+
+	/* Read back and check it. */
+	ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);
+	if (ret)
+		return ret;
+
+	if (cfr1v != cfr1v_written) {
+		dev_err(nor->dev, "CFR1: Read back test failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int s25hx_t_quad_enable(struct spi_nor *nor)
+{
+	return spansion_quad_enable_volatile(nor, 0, 0);
+}
+
+/**
+ * s25hx_t_fix_erase_map() - fix erase map populated by wrong SMPT entries.
+ * @nor:		pointer to a 'struct spi_nor'
+ *
+ * During SMPT parse, a Map ID is formed by CFR3[3], CFR1[6], and CFR1[2]. Then,
+ * erase map is populated from SMPT entries that corresponds to the Map ID. The
+ * table below shows all possible Map ID and SMPT support status. This function
+ * fixes the wrong configuration in Top and Split erase map.
+ *
+ *   CFR3[3] | CFR1[6] | CFR1[2] | Sector Map | Supported in SMPT?
+ *  --------------------------------------------------------------------------
+ *      0    |    0    |    0    | Bottom     | YES
+ *      0    |    0    |    1    | Top        | YES, but populated as Split
+ *      0    |    1    |    0    | Split      | NO
+ *      0    |    1    |    1    | Split      | YES, but populated as Top
+ *      1    |    0    |    0    | Uniform    | YES
+ *      1    |    0    |    1    | Uniform    | NO
+ *      1    |    1    |    0    | Uniform    | NO
+ *      1    |    1    |    1    | Uniform    | NO
+ *  --------------------------------------------------------------------------
+ */
+static void s25hx_t_fix_erase_map(struct spi_nor *nor)
+{
+	struct spi_nor_erase_region *region = nor->params->erase_map.regions;
+	u8 erase_type_256k, erase_type_4k, erase_type_r0;
+
+	/*
+	 * Uniform: Only one region is allocated. Unsupported Map IDs are rolled
+	 *          back to the Uniform.
+	 * Bottom:  Size of region 0 and 1 are same (128KB)
+	 */
+	if (region[0].offset & SNOR_LAST_REGION ||
+	    region[0].size == region[1].size)
+		return;
+
+	/* Erase Types are sorted in ascending order */
+	erase_type_256k = BIT(SNOR_ERASE_TYPE_MAX - 1);
+	erase_type_4k = BIT(SNOR_ERASE_TYPE_MAX - 2);
+
+	/* Examine Erase Type of Region 0 */
+	erase_type_r0 = region[0].offset & SNOR_ERASE_TYPE_MASK;
+	if (erase_type_r0 == erase_type_256k) {
+		/*
+		 * Erase Map is populated as Top and needs to be fixed to Split.
+		 * Re-allocate 5 regions then free existing 3 regions.
+		 */
+		region = devm_kcalloc(nor->dev, 5, sizeof(*region), GFP_KERNEL);
+		if (!region)
+			return;
+
+		region[0].size = SZ_64K;
+		region[1].size = SZ_256K - SZ_64K;
+		region[2].size = nor->params->size - SZ_512K;
+		region[3].size = SZ_256K - SZ_64K;
+		region[4].size = SZ_64K;
+
+		region[0].offset = 0;
+		region[1].offset = region[0].size;
+		region[2].offset = region[1].offset + region[1].size;
+		region[3].offset = region[2].offset + region[2].size;
+		region[4].offset = region[3].offset + region[3].size;
+
+		region[0].offset |= erase_type_4k;
+		region[1].offset |= erase_type_256k | SNOR_OVERLAID_REGION;
+		region[2].offset |= erase_type_256k;
+		region[3].offset |= erase_type_256k | SNOR_OVERLAID_REGION;
+		region[4].offset |= erase_type_4k | SNOR_LAST_REGION;
+
+		devm_kfree(nor->dev, nor->params->erase_map.regions);
+		nor->params->erase_map.regions = region;
+
+	} else if (erase_type_r0 == erase_type_4k) {
+		/*
+		 * Erase Map is populated as Split and needs to be fixed to Top.
+		 */
+		region[0].size = nor->params->size - SZ_256K;
+		region[1].size = SZ_128K;
+		region[2].size = SZ_128K;
+
+		region[0].offset = 0;
+		region[1].offset = region[0].size;
+		region[2].offset = region[1].offset + region[1].size;
+
+		region[0].offset |= erase_type_256k;
+		region[1].offset |= erase_type_256k | SNOR_OVERLAID_REGION;
+		region[2].offset |= erase_type_4k | SNOR_LAST_REGION;
+	}
+}
+
+static int
+s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
+			 const struct sfdp_parameter_header *bfpt_header,
+			 const struct sfdp_bfpt *bfpt,
+			 struct spi_nor_flash_parameter *params)
+{
+	u8 cfr3v;
+	int ret;
+
+	/* Address mode affects Read/Write Any Register operations */
+	ret = spi_nor_set_4byte_addr_mode(nor, true);
+	if (ret)
+		return ret;
+	nor->addr_width = 4;
+
+	/* The page_size is set to 512B by BFPT but it depends on CFR3V[4] */
+	ret = spansion_read_any_reg(nor, SPINOR_REG_CYPRESS_CFR3V, 0, &cfr3v);
+	if (ret)
+		return ret;
+
+	if (!(cfr3v & SPINOR_REG_CYPRESS_CFR3V_PGSZ))
+		params->page_size = 256;
+
+	/* Replace Quad Enable with non-volatile version */
+	params->quad_enable = s25hx_t_quad_enable;
+
+	return 0;
+}
+
+void s25hx_t_post_sfdp_fixups(struct spi_nor *nor)
+{
+	/* Fast Read 4B requires mode cycles */
+	nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
+
+	s25hx_t_fix_erase_map(nor);
+}
+
+static struct spi_nor_fixups s25hx_t_fixups = {
+	.post_bfpt = s25hx_t_post_bfpt_fixups,
+	.post_sfdp = s25hx_t_post_sfdp_fixups
+};
+
 static int
 s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
@@ -104,6 +386,24 @@ static const struct flash_info spansion_parts[] = {
 			     SPI_NOR_4B_OPCODES) },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
 			      SPI_NOR_NO_ERASE) },
+	{ "s25hl256t",  INFO6(0x342a19, 0x0f0390, 256 * 1024, 128,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs256t",  INFO6(0x342b19, 0x0f0390, 256 * 1024, 128,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
 };
 
 static void spansion_post_sfdp_fixups(struct spi_nor *nor)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
