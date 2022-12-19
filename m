Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235EBC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Dec 2022 01:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=069bEDnmgtkEHNOdbCEUJxQt5+Ze+qsdIexts0zZyZ4=; b=pt7bbDUtdzL64v
	Bd4+zU7l9kExaUHOe5abji8ykZERw7ug8XcC1N867uNKO1ajATC4Jk/y4HJTljpzTa67I2a8/PgmD
	mMjAjAvF1FMbLPMGb+8iAxlX85C6BdGkAxBd1znXXCFxotFp0yjf94jOYdcFXHDk2/M4w3hq9qqPQ
	FimdpiKdKyll25WRnoT/T74rnGaXD57JizRM3XjXwk88sIhT7X4PFifvD5ZuVX6PV1xDkkMF3nyx1
	/asfsLiEYxorve8pES04NefyAAhC1CyUSKudV7DqnKB+uABhmpTXXY3VQaOH2OGvfZdlTw/MBCFB2
	LqL84CcMdlyZnL687khw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p75O4-006TsE-6K; Mon, 19 Dec 2022 01:56:16 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p75Nw-006Tob-2x
	for linux-mtd@lists.infradead.org; Mon, 19 Dec 2022 01:56:11 +0000
Received: by mail-pl1-x62b.google.com with SMTP id s7so7643457plk.5
        for <linux-mtd@lists.infradead.org>; Sun, 18 Dec 2022 17:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DlRtV1xLfFBxQVoLDOEZenEiIWKAjx/w9ySmequE8wk=;
        b=Wp+rGqqu9X+YFD/L2Ikbk7s80Evo7gtlxCiiTKr9UYmBMlrMUTlsdp7+E3tymPbB5C
         hnfROPkGcfPOHVp+9AwNYZ3dKWcZLpYXLQTI8dBk0EmzbEPfPChIq4YgbaJ9ZxAmD/gN
         UMIxjon62bMHVjSB2SWOkhRk0cBYzUXUCMdPhppRTuwy8Z8lWOy/40YqNf0BgQVUJC7D
         tE1hJtgNMiRKvVVdCUD+PRJkie7o+XkQ/A+WvEkxLlN77Aiyj1nG5eNgBr1mZOWNTGI9
         /Q6dy+Sv6V7WjvDf4Jw67e2ShSzOkQKlxq90trC/Jf6r3sKYcZyCK6eHsqbQlf+FTUPc
         3UoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DlRtV1xLfFBxQVoLDOEZenEiIWKAjx/w9ySmequE8wk=;
        b=3XTo4WZTzDWDxawwf9wmfK83ZSdJ1WDHAFiVA345V5phGCbJ7Nbqbo+75XOmQv8te0
         npk0aL937AAlld3xyYnC8+bsoBbNwhW7/bk+qRHzBtbgLlSsnU5uSu3zgSCkntfkMXnw
         lgpqYCQo0/4nCGJvOvSl2UQJKEVLvWWgvE1sQqHjwv836Q3+VxPH5SjzZ1hru0bJke9M
         e9l/Hkr6OlGtUdoz9aPfERobifEoFghhkW9d/vZpqlor607rlIqJF9N0We//NNrU762g
         Yr/LvFwtIZi+gpyTOPHKm+b4bpmuLtPv1Jh5hMOIJFZMjnbF088E+YLcLfw+wElH2BL9
         11tQ==
X-Gm-Message-State: AFqh2koG9PUBLq+fT2MBhX9WWA3/kfvpvaW0BRl6HRoWz16tMQfOcMdo
	iEfbKJYJBk+1I12b80Giioz+/dBvL/A=
X-Google-Smtp-Source: AMrXdXupZ+1JEFNl0JSb1KBqq9fpn8mb0LXlZ1JqdGNslXgMEOE1dASsOLY7JUY4PbKL8S08D6cWnA==
X-Received: by 2002:a05:6a20:e18d:b0:ad:67fa:8e50 with SMTP id ks13-20020a056a20e18d00b000ad67fa8e50mr18333635pzb.57.1671414964711;
        Sun, 18 Dec 2022 17:56:04 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id h26-20020a63211a000000b00460ea630c1bsm5076291pgh.46.2022.12.18.17.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 17:56:04 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH] mtd: spi-nor: spansion: Add support for Infineon S25FS256T
Date: Mon, 19 Dec 2022 10:55:09 +0900
Message-Id: <20221219015509.15075-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_175609_859044_05CFFC38 
X-CRM114-Status: GOOD (  15.35  )
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

Infineon S25FS256T is 256Mbit Quad SPI NOR flash. The key features and
differences comparing to other Spansion/Cypress flash familes are:
  - 4-byte address mode by factory default
  - Quad mode is enabled by factory default
  - Supports mixture of 128KB and 64KB sectors by OTP configuration
    (this patch supports uniform 128KB only due to complexity of
     non-uniform layout)

Tested on Xilinx Zynq-7000 FPGA board.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Datasheet:
https://www.infineon.com/dgdlac/Infineon-S25FS256T_256Mb_SEMPER_Nano_Flash_Quad_SPI_1.8V-DataSheet-v12_00-EN.pdf?fileId=8ac78c8c80027ecd0180740c5a46707a

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25fs256t
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
342b190f0890
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion
zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080101ff00000114000100ff84000102500100ffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffe7ffe2ffffffff0f48eb086bffff
ffffeeffffffffff00ffffff00ff11d810d800ff00ff321cfeff71e9ffe1
ec031c607a757a75f766805c00d65dfff938c0a100000000000000000000
0000ffffffff710600fedcdcffff
zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
13ecce2f195c4c71648e90d4a7e4a0df  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> test_qspi.sh
random: crng init done
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 2.787435 seconds, 2.2MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
2c6e12c0a2346cab755ef72cdf2a72f827241d35  qspi_test
2c6e12c0a2346cab755ef72cdf2a72f827241d35  qspi_read
---
 drivers/mtd/spi-nor/spansion.c | 64 ++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b621cdfd506f..7d1d2c27ad71 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -24,6 +24,7 @@
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN	0x3
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
+#define SPINOR_REG_CYPRESS_ARCFN		0x00000006
 
 /* Cypress SPI NOR flash operations. */
 #define CYPRESS_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
@@ -213,6 +214,66 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
 	return 0;
 }
 
+static int
+s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
+			  const struct sfdp_parameter_header *bfpt_header,
+			  const struct sfdp_bfpt *bfpt)
+{
+	struct spi_mem_op op;
+	int ret;
+
+	/* 4-byte address mode is enabled by default */
+	nor->params->addr_mode_nbytes = 4;
+
+	/* Read Architecture Configuration Register (ARCFN) */
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
+					  SPINOR_REG_CYPRESS_ARCFN,
+					  nor->bouncebuf);
+	op.dummy.nbytes = 1;
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	/* ARCFN value must be 0 if uniform sector is selected  */
+	if (nor->bouncebuf[0])
+		return -EOPNOTSUPP;
+
+	return cypress_nor_set_page_size(nor);
+}
+
+static void s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	/*
+	 * READ_FAST is omitted in 4BAIT parse since OP_READ_FAST_4B(0Ch) is not
+	 * supported. Enable OP_READ_FAST(0Bh) that can work in 4-byte address
+	 * mode.
+	 */
+	params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
+	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST], 0, 8,
+				  SPINOR_OP_READ_FAST, SNOR_PROTO_1_1_1);
+
+	/* PP_1_1_4_4B is supported but missing in SFDP. */
+	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
+				SPINOR_OP_PP_1_1_4_4B,
+				SNOR_PROTO_1_1_4);
+}
+
+static void s25fs256t_late_init(struct spi_nor *nor)
+{
+	/* The writesize should be ECC data unit size */
+	nor->params->writesize = 16;
+}
+
+static struct spi_nor_fixups s25fs256t_fixups = {
+	.post_bfpt = s25fs256t_post_bfpt_fixup,
+	.post_sfdp = s25fs256t_post_sfdp_fixup,
+	.late_init = s25fs256t_late_init,
+};
+
 static int
 s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 			const struct sfdp_parameter_header *bfpt_header,
@@ -441,6 +502,9 @@ static const struct flash_info spansion_nor_parts[] = {
 	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "s25fs256t",  INFO6(0x342b19, 0x0f0890, 128 * 1024, 256)
+		PARSE_SFDP
+		.fixups = &s25fs256t_fixups },
 	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
