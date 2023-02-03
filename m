Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691E9C636CC
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 04:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CcsxPING36qLNd+taEMoZdB24ZQJztLjgcOpp24zZgk=; b=2/6s0OstQcHigc
	1dRH+WyQnbBJUF1il5bj1Oz6XBYhdHPfAgckMFSZylS/p9SLv8UUeztT4EZomYPB9B/+qM5UtYoYU
	3+4d8P77ppMbirEeLHQgQItmi37AOxn7fssi4iyoZeETXPZRtmmCGn22DpI5vTZgZxcm2vsams1e9
	RcQwhTVDhmofJi8ZMjdicrk0a6hDscb8AipUoUt2JOAouXYZsKxgRaMouAktv/znn3deFHD6SRYnc
	Jek3kUdbKyFGc6tWvnFnnlFsiqhfosimFBKjhSRFlqhj/idZAKdImeYi8VT3NA1g+vzaHlAT9jGiJ
	0RIrzVoWUphVVFhbRu3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNo1j-000OXd-7t; Fri, 03 Feb 2023 04:50:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNo1g-000OX4-F3
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 04:50:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id e6so4113062plg.12
        for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2023 20:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YKYBlW88I9+Tmtqxmmi45Sxyv62MwuaYeM+ZqyFPDNQ=;
        b=MWGceN/JhWb7LLY/faTei+vzqdiVXhfRXQTgQ+XAYKZxR6r1y1gBQTOE/5mt+97Dr0
         YSY94WjpCklltjtNHaJ/XsMuKrHwIMonvu18zBL9k5gOFpcpQ7U3Ch+nI6pOsy9ulPcs
         b/VOkXg88tPGDYe+RG7KeysPfNyfUEuAvbCg/pUFnERQY1QW4bDptaR/E00FCNU4O+Cz
         Gh+iENcCxKdzwoFlA9Qnytu1aWWR5ff4yx0ogzGVeyb/6tKbXRpdDqWfW5DWPr58Hk+c
         338XzvPDsO7vOwCM//aYcWk1qd7N4v5+wz7kD0cQc65XTNzY35eNH0NEJXb4+dkhL3oj
         tkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKYBlW88I9+Tmtqxmmi45Sxyv62MwuaYeM+ZqyFPDNQ=;
        b=WwxQjjc9PJuhJKxzkGV1bq8MTcIJrq4+ZvuhdLARGGg5uy0mBKJ95FQRs+jmBI9tKB
         Kpnu0R6MyN/Dxg2XYIpCiNmrzyMVWaXeNozbnXrVOpphAy0U+jL9b3u8eDFZ4SOm2QUS
         ECNN/tCkU7/jdtpF+CUP5Q2B/8a4nWg+B07Id62lYj015T9Yhh82UQgwHx6eUSvMLktu
         fUhPmg1NDmUKVEt4YCmZSlv/zzScV9T6oK7I4ArrTMOA8QjtOqxEl4/GxMKEmwlnKM3z
         4IhI1rbzJUv2QYxlU10tq3HaphafZTxHB8YBDptxqmVYeaM7vHq9I3D4+xTt1PqQzR7s
         FqUg==
X-Gm-Message-State: AO0yUKWbvf0jhPXh/RDOjTdIJgmrXoBQHh6Nx9IuL9nArwQV+t6Ruycz
	KsJg8dGXoDwQ1sEUPTsTg5mhhblFAG0=
X-Google-Smtp-Source: AK7set/8Mio+hXLNsA9r6GCZbTroM64mEuUMpWpRIKjo2IBSJVi56AzGW/Ug6Ehx1FHo8ntM8wbfvA==
X-Received: by 2002:a17:902:da82:b0:192:b927:39d1 with SMTP id j2-20020a170902da8200b00192b92739d1mr10984258plx.3.1675399814054;
        Thu, 02 Feb 2023 20:50:14 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id h2-20020a056a00230200b005898fcb7c1bsm579046pfh.177.2023.02.02.20.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 20:50:13 -0800 (PST)
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
Subject: [PATCH v2] mtd: spi-nor: spansion: Add support for Infineon S25FS256T
Date: Fri,  3 Feb 2023 13:48:53 +0900
Message-Id: <20230203044853.23513-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_205016_552277_96F15AA1 
X-CRM114-Status: GOOD (  16.77  )
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
  - OP_READ_FAST_4B(0Ch) is not supported
  - Supports mixture of 128KB and 64KB sectors by OTP configuration
    (this patch supports uniform 128KB only due to complexity of
     non-uniform layout)

Tested on Xilinx Zynq-7000 FPGA board.

Link: https://www.infineon.com/dgdlac/Infineon-S25FS256T_256Mb_SEMPER_Nano_Flash_Quad_SPI_1.8V-DataSheet-v12_00-EN.pdf?fileId=8ac78c8c80027ecd0180740c5a46707a
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v2:
  - s/EOPNOTSUPP/ENODEV
  - Drop READ_FAST support
  - Amend comment in late_init()
  - sector size and page size as 0 in sizeINFO6()

---
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
6291456 bytes (6.0MB) copied, 2.025928 seconds, 3.0MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
09ed7922931fe10795adc0ba3aff4efd2127be02  qspi_test
09ed7922931fe10795adc0ba3aff4efd2127be02  qspi_read
---
 drivers/mtd/spi-nor/spansion.c | 60 ++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 12a256c0ef4c..a499ce393454 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -29,6 +29,7 @@
 	 SPINOR_REG_CYPRESS_CFR5_OPI)
 #define SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS	SPINOR_REG_CYPRESS_CFR5_BIT6
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
+#define SPINOR_REG_CYPRESS_ARCFN		0x00000006
 
 /* Cypress SPI NOR flash operations. */
 #define CYPRESS_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
@@ -218,6 +219,62 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
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
+		return -ENODEV;
+
+	return cypress_nor_set_page_size(nor);
+}
+
+static void s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
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
+	/*
+	 * Programming is supported only in 16-byte ECC data unit granularity.
+	 * Byte-programming, bit-walking, or multiple program operations to the
+	 * same ECC data unit without an erase are not allowed. See chapter
+	 * 5.3.1 and 5.6 in the datasheet.
+	 */
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
@@ -446,6 +503,9 @@ static const struct flash_info spansion_nor_parts[] = {
 	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "s25fs256t",  INFO6(0x342b19, 0x0f0890, 0, 0)
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
