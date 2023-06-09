Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B55C7EE25
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 08:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8cI2yd612cEmvCOv+SJ7ZZB8eUMVuUNBsiOM5x6gOAU=; b=Fw1xDjXFG/CHeH
	QpVCwaUb0cx/C2qCLkfaMegqKM+CWp4VwPvl+60WgXDr1cCJP+NjDE+a5ksRrGp5BKXnD/bsAKJAd
	hJ3Ny6BVo6CR2bGJi1hAAwLBpGMnbwIbDDdGDZrjXjWGZGzAShqB+qNzu1YjYbGPp+091CHdvUT1r
	q0IbXrwKDRBSGb/38u64P5hkGHKKJigqHARBWfY0nPyCWlhia0v7/D38ry66bnV6g9lhOhoNSxUmR
	HKadCpmi+M+nnp5Q96l3jGdZPi0hArr5z9hTpaswuTsrSgugYtnqFZNYUkdOoJB/Z1xYcHEgL4xun
	JvGUINPJ8YjU8KjNbLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7XH9-00CBrK-1f;
	Fri, 09 Jun 2023 08:15:15 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7XH7-00CBqf-0X
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jun 2023 08:15:14 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-33e75ca0a8bso6577365ab.0
        for <linux-mtd@lists.infradead.org>; Fri, 09 Jun 2023 01:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686298510; x=1688890510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YOrn6Al5PXAJQkF0JWCj/Pw93GAX6cbO8K/oF0yDgU4=;
        b=GeReh14ZdGWIXkStZKsYvyN9rez4jipYCfxZShRvsU40vM2y1p2Xus/Mz3AwkF/G1L
         nc+ptvH7vPLXzHLU1w/GS5XUgUggQYWIo7AZlZIsgZdbfsd4tsqvNKWR5aiIr5mj0dtV
         4vweXMypB9nw3PolmFAnbWFa4BZdXC+esj0itcMnrrCHBgdwlCKc9PDJ1hjzkQKImMBg
         Ldy4unjnq2PVYafJU2+VA4J2SX4Y7Ymwgme1U2RQGFi9WeLeDm8gr+u8WWA8nRrZWBSK
         OF+o5y0O/jUgrBZX7ri2Wfzo3+CWW0lC7BI+HmMsQauek30940fzjXQKeClJ8+IgP65u
         Il2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686298510; x=1688890510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOrn6Al5PXAJQkF0JWCj/Pw93GAX6cbO8K/oF0yDgU4=;
        b=fxg+hPB4a03MtaNu36nOcsTr0O9Meoktm6n6fuuE1JIH36T3yFb33eLRtJRCLWRAk5
         dQUkKf8cklKgtT/ihFm8QysDBC+d5jxbiOgOzsw8De3xyb1BIfKSayOuQpnmgX+nUNCB
         +uNrF+etC26jKAYBTEjHrSS+JwgUsKRLspi0G9RRARKapba8LRWo008Ojw/HBzQT9r4L
         qZ3mzj1DelUsQxghR6Ejyl9DOo//gjS15e53CUx6FTPBezbQ9fv1gB0C31K2/20uqjMx
         yxqFqKcWcwXF5IsG26E9mRvl1+5BX4b+Ods6FWsTFmzewuQYmb+vC2r986czx5zBj9BS
         upRQ==
X-Gm-Message-State: AC+VfDyngNhhltjSXkr2rNWkBx+Hpmve9/UrwTU5ChN9y3zYTo2AVjLb
	Hq4/y4sAHvFnaesBApp2tBcyegiPZdY=
X-Google-Smtp-Source: ACHHUZ6fpnM72u55QusC+cjbUQk+KbX2zs4QfNz9fOqJZQilTX/RXygMdjWFUCkMD+2/veAj1Ky02A==
X-Received: by 2002:a92:dc87:0:b0:33c:1c4:7fe with SMTP id c7-20020a92dc87000000b0033c01c407femr975851iln.3.1686298509752;
        Fri, 09 Jun 2023 01:15:09 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id x17-20020aa793b1000000b00640dbf177b8sm2201469pff.37.2023.06.09.01.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 01:15:09 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH] mtd: spi-nor: spansion: CLPEF as an alternative to CLSR
Date: Fri,  9 Jun 2023 17:14:59 +0900
Message-Id: <20230609081459.885-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_011513_229857_F4186374 
X-CRM114-Status: GOOD (  15.22  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Infineon S28Hx (SEMPER Octal) and S25FS256T (SEMPER Nano) support Clear
Program and Erase Failure Flags (CLPEF, 82h) instead of CLSR(30h).
Introduce a new mfr_flag and rework spansion_nor_clear_sr() to add a way
to clear status in these devices. S25Hx (SEMPER QSPI) supports CLSR but
it may be disabled by CFR3x[2] while CLPEF is always available.
Therefore, the mfr_flag is also applied to S25Hx for safety.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 37 ++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 15f9a80c10b9..f2f4bc060f5e 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -10,8 +10,10 @@
 
 /* flash_info mfr_flag. Used to clear sticky prorietary SR bits. */
 #define USE_CLSR	BIT(0)
+#define USE_CLPEF	BIT(1)
 
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
+#define SPINOR_OP_CLPEF		0x82	/* Clear program/erase failure flags */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
 #define SPINOR_REG_CYPRESS_VREG			0x00800000
@@ -63,23 +65,35 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
+#define SPANSION_CLPEF_OP						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLPEF, 0),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
 /**
  * spansion_nor_clear_sr() - Clear the Status Register.
  * @nor:	pointer to 'struct spi_nor'.
  */
 static void spansion_nor_clear_sr(struct spi_nor *nor)
 {
+	u8 use_clpef = nor->info->mfr_flags & USE_CLPEF;
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op = SPANSION_CLSR_OP;
+		struct spi_mem_op op;
+
+		if (use_clpef)
+			op = (struct spi_mem_op)SPANSION_CLPEF_OP;
+		else
+			op = (struct spi_mem_op)SPANSION_CLSR_OP;
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
-						       NULL, 0);
+		ret = spi_nor_controller_ops_write_reg(nor,
+			use_clpef ? SPINOR_OP_CLPEF : SPINOR_OP_CLSR, NULL, 0);
 	}
 
 	if (ret)
@@ -792,47 +806,54 @@ static const struct flash_info spansion_nor_parts[] = {
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "s25fs256t",  INFO6(0x342b19, 0x0f0890, 0, 0)
 		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25fs256t_fixups },
 	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
 		PARSE_SFDP
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
 	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
 		PARSE_SFDP
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
 	{ "s25hl02gt",  INFO6(0x342a1c, 0x0f0090, 0, 0)
 		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
 		FLAGS(NO_CHIP_ERASE)
 		.fixups = &s25hx_t_fixups },
 	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
 		PARSE_SFDP
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
 	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
 		PARSE_SFDP
-		MFR_FLAGS(USE_CLSR)
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s25hx_t_fixups },
 	{ "s25hs02gt",  INFO6(0x342b1c, 0x0f0090, 0, 0)
 		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
 		FLAGS(NO_CHIP_ERASE)
 		.fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
 	{ "s28hl512t",   INFO(0x345a1a,      0, 256 * 1024, 256)
 		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
 	{ "s28hl01gt",   INFO(0x345a1b,      0, 256 * 1024, 512)
 		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
 		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
 	{ "s28hs01gt",   INFO(0x345b1b,      0, 256 * 1024, 512)
 		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
 };
@@ -885,7 +906,7 @@ static void spansion_nor_late_init(struct spi_nor *nor)
 		nor->mtd.erasesize = nor->info->sector_size;
 	}
 
-	if (nor->info->mfr_flags & USE_CLSR)
+	if (nor->info->mfr_flags & (USE_CLSR|USE_CLPEF))
 		nor->params->ready = spansion_nor_sr_ready_and_clear;
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
