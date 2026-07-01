Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C88DC43602
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 02:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mlUClnjPUw2LG21Gbfk8OmKrP9Ruwbb2ricbU3psIys=; b=m6qDw6P35GhJr6
	N8GYM3Uqczrb7ibgHmw4l0yrgIGL/4G6EEC6H18rS+mTH5rLfwVwOYBq6bb8hngNc3gi5oZkTv01a
	Tv7OVIsTEzWKPKpxx7bM1bNfEJ3XCOY3ray+cfE8meLaxCkqUjqqlo4UesEZN6QpmsWs3fqOyGRRM
	P3Mg0/N9Ylc8xWnZCpFmTF0X750+rsIWpufyO3vxrGQaiaTKARwt6rcDUO2DrAdFTYRw7DlodtUEv
	6MUvK3QCi4iG8iAccZ/BVS6pG5z4YFm2DjMsv4kIhY1Lh1EgrVb7SI6JuLIq5aO75c0WlxhV0zE3a
	KqgLdGoo3XqDfqXNkmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekwp-00000000XYu-0cPI;
	Wed, 01 Jul 2026 02:45:11 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekwk-00000000XXi-1blK
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 02:45:07 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84783bce476so165451b3a.0
        for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2026 19:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782873905; x=1783478705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+OPd1GHODOckXDuq1kdFib8UHAUD5MfQDAIu/WdnbLI=;
        b=mIhnQi0kpiynJIkhzu3FfRRaiMZ6v7EQ+jb8ur3m+fjkMmiUs3hIOu3p0mE/hcpKUv
         JzR+ffAOrMgQ8ADj85aigITaifbgzJHEtPoecC+1sVvsj+ku3A8syzW/rHdBb9kEXpZK
         ObN69jgNUHaOnV2loUyHxWtdUhm2VV8jYsB9KgJh0yzniB8SN+jJ5A7dcFdvQvYTsRID
         9uHEy+F4IwrrVCEVa/r1JsOo1RENZRkzqfibPrOqe26mcI1mtpHjkBFUv/EqBx5/b6iC
         +YmnU/euj+rsAXNvPqnucjFOte2eRYaHn37/mQHJWfPXupDobE1bXh75IWk3IBddNdYn
         BY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782873905; x=1783478705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OPd1GHODOckXDuq1kdFib8UHAUD5MfQDAIu/WdnbLI=;
        b=RvCSyA/2CKDZCmI9IxAWaMUH3z52mmr73h5tA2jmdW+bH3oZg8VDTk+5mVancGx87M
         orJRL86r8mt2a9tFxxvg+wDxmAz5t5ZHmWObh2MozGyL86RrZhBx1AiKYyFovgoYbN7I
         ggRz+E/iIKinOmdYmc7/k5iU74P2sS6Os1qaMCe9t05FShP2KeE1/VLTkdbKoHxy7G8e
         vE0GYzv6a0UTl8kd8JGkShU2XU13d4ZRcqcgRHABvYG5c7ANQ4oIFrCXiz6d0Thzpv0C
         bSOJBFYrKm3lGJcI7QU7F3NMVIsGYsCwM8GnrNLC6O/0veaJS4WDHWjlkuIK4VXARsmt
         weZw==
X-Forwarded-Encrypted: i=1; AHgh+RozjcSEhfJjsVHmYqX9aToRNA4rhW7YKTYOJu6dduvpB1ESLvpvi6zPzXXwW/GLQ+K4HgJZLAkXk4A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNTkgIGieSNg3yCfEo/KMWVrQfGuRI7gsTdpAjKCeK0ZBHPqJ/
	j1FZ3P7FFqRByivzH0WZv2K4OOEDs80s2TPSfPt2AdFIQRLmtLPLgytc
X-Gm-Gg: AfdE7clS8tAjthYrxk6oSXYslZlhVVHOZ+yR8zb78jlJqIKxrmshdeySSrYf4EGx252
	GSlpaKYYv68unYj1uhGBZyQRIQCZylILpLPi7yRYxLBhxkkH9z5MjJsx4z1l3bUtNL/OvNGpFvl
	Z9xFj5OxHRgXbEKKAcdJSzrD8W4Bcddo8qtAOqcamlyqZ1c9Axp0TNS4weIXqcKY/3O2FR+EylV
	iw1MBdiyRhuVzQPRK9o+jhejHagNcYkoOi2yJkg4HO8BjadRb8GTCUqI27JUZRGG4a0rHgU4vEe
	AI0CRiI0s0YjYLjlcVe7djryxiaSFbDSL3oDDgJ/YTZC13hamSV2pJqdbFYOtws4RFJUjbsF9t/
	Ijpq+c7366HKW3T7DTc2ZPDeAt264ucKRPKa29+YLDZ8StnLI2Ccsb2SYhVRCbhMC+cVF27rLkj
	BEVFup8gmdvkkAUC0KdinJaEaYM0Ojf14HWVw=
X-Received: by 2002:a05:6a00:4089:b0:845:dde9:ab62 with SMTP id d2e1a72fcca58-847addb1bd5mr2956528b3a.19.1782873905310;
        Tue, 30 Jun 2026 19:45:05 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fff9744sm3145620b3a.14.2026.06.30.19.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:45:04 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 96B64416A065;
	Wed,  1 Jul 2026 10:45:02 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: stable@vger.kernel.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 6.12.y 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad Input Page Program
Date: Wed,  1 Jul 2026 10:42:03 +0800
Message-Id: <20260701024204.2730472-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_194506_463898_58828E55 
X-CRM114-Status: GOOD (  11.98  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

commit 798aafeffb369c5eb36e406b18970ef27baa820d upstream.

Although certain Macronix NOR flash support the Quad Input Page Program
feature, the corresponding information in the 4-byte Address Instruction
Table of these flash is not properly filled. As a result, this feature
cannot be enabled as expected.

To address this issue, a post_sfdp fixups implementation is required to
correct the missing information.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
Link: https://lore.kernel.org/r/20250211063028.382169-2-linchengming884@gmail.com
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/macronix.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index ea6be95e75a5..678ebaa220ca 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -28,8 +28,26 @@ mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 	return 0;
 }
 
+static int
+macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
+{
+	/* PP_1_1_4_4B is supported but missing in 4BAIT. */
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
+				SPINOR_OP_PP_1_1_4_4B, SNOR_PROTO_1_1_4);
+
+	return 0;
+}
+
 static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
+	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
+};
+
+static const struct spi_nor_fixups macronix_qpp4b_fixups = {
+	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
 };
 
 static const struct flash_info macronix_nor_parts[] = {
@@ -85,11 +103,13 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_64M,
 		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x20, 0x1b),
 		.name = "mx66l1g45g",
 		.size = SZ_128M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x23, 0x14),
 		.name = "mx25v8035f",
@@ -137,18 +157,21 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
 		.name = "mx66u51235f",
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x3c),
 		.name = "mx66u2g45g",
 		.size = SZ_256M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x26, 0x18),
 		.name = "mx25l12855e",
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
