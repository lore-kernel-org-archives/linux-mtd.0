Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227A4C0219B
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 08:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPsEeAp53qZAwYrTYQfOjJRnSZ2X122Ibkp96EiY1Dk=; b=2+8Ep39x8YcbsV
	lagmTa3yIPhEyC/aZdLLUHKhfGmxAoacS4pdO6SCw2+wo0bSiYe51mQ/L29K1plSPpamU7kAdS0ST
	sclLo777y0mT2ZYVqGO/6WuUp2sWr6xp2yV+glbKWobMYx6gMe6j0CyOnIYHqAvzWJimesYru87sT
	BVYFIh5GYkYmXU8m2F6xNRcg6I+Apu5FpPtt71J2TQ02Qz7CcfcKI7ADhshtKURTmCnM3CC1cKZwo
	dzVjbF7+x4WBaLTr4EkwoXT4KGa7pbvHUTmgI6KQrcZJPDf4fTQ3sEpRZ5KF0JT9g9dVjOztwDEPn
	pZssZMNDjr6vgGCfwl+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJda-00000008nPS-0NFP;
	Fri, 07 Feb 2025 08:22:58 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJdX-00000008nOY-3J4K
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 08:22:56 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21f2cfd821eso32566395ad.3
        for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2025 00:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738916575; x=1739521375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/E9wvz8/vddvY3iiHd9apEkjBGgx41rPnXOMKqGyg0=;
        b=BN5XxCZgOubbNC1Uuhf3rMHA6i8+KboTH855g6mQrBwCkPmq8FK09asmg5ne/dbwaM
         XqDQnCrGaxx2lkn1AxwsPiVHU2h5lM1wMbGaa1+iaZ5oHiNVNITLEYLBjGAVoTPDSOF2
         jfMWhPFnfSlFgxRESunXPgQ2YYQKvSDAe/EtZAPyjCpWeADA3pCWbRuPxoI4NOIZ40TO
         bCNZteKduizDSrJBOBKBzGFWlkkYrbsSy96xlhP9BPhqppaNRsNV9MWj9LLuPUlf55ZO
         QtaSmCrQsVV1RlH0ulxCt7v9MCq49mnDqCj4aRXmoVBoZyDiwmug+J5tjAbUi170G79J
         qOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738916575; x=1739521375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/E9wvz8/vddvY3iiHd9apEkjBGgx41rPnXOMKqGyg0=;
        b=IpLm2JjWbmCOipnyBYyVmmQocqA2nVOq67SdO1M0/OdvGJ95JYwVnCGsMtbPSf4s4+
         FVvm7HVKSSaa3pQxJ05kMV6944tSvNMpXVNkO6DwcdLOUn2JFYxpyX3Wq/TLgBMo3GuY
         4xX9UrIMBaXP65Fi+7x//dXX2VZw9RmFRQcZj+TyTBIhd3yBNT+ovcq1OTG2GbwIzolX
         Vi4ON/FOjLTgt6Qw8fJ8aM59IhqKBsk0/XtsCCIaSDvcAyoXPoASCSkMMVhISQhX+7hA
         uI2kgRz/MXw6sTKeuk+WI2ufeE/cm97EZprGxpfOfEhpX+/vNE3+p2sbmhjkWRUpwyHX
         JgbA==
X-Forwarded-Encrypted: i=1; AJvYcCVUl73qFSFZmbVPPrqome8fQrhuQrjVj7EiO0wat6UukIx99YkXlWrDf4Z4TBJgwFMv4Vh8ao7mgos=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Na3pcsJ/lxci06xLD8/NOdjPDl6Clmq+lYHi1/9+k8TItjQ8
	8P4j/4M6DkhYZk2b8TjJPO+/Iov+y6LHh570ZYVwP1kf7RAVp01L
X-Gm-Gg: ASbGncufsWp4JJoGvy3XtRQw3XXraIQ4tlSWxV+I8kbcgz7YQtw3pbgBiFzST/pSUqa
	+oaaoKTES5Tr204m5FvDxNmT+PDL3Srl8fC73I6eAXGCrYnsYm5qZvO7QYqY296+lf8YC21MVmf
	J5C8kpL8pQ+kzUwoQiff4MeDkAaVRR4LC/TXkMGVXoR2uNwcoATPApYGx5Fi3I9QoiACKeZmZaO
	hdmpfxOfkRAMLo+1eoU6rb4YF5KRJDoUjVygTJ32KfDoBIYBzJebaYxjlHw1a8Q3n3b0BOP6+0B
	xF+wpNwbDmKUsMwuVfhS7DIgZyHzsUAA2AvrSjw=
X-Google-Smtp-Source: AGHT+IEuiQOl0O5y5F2rid9jIYT+/Bs5UbyEGc1FgRz4zT7d8tiNKjaPQtF28kM++aczoT1+6O2YDA==
X-Received: by 2002:a05:6a21:9184:b0:1dc:e8d:c8f0 with SMTP id adf61e73a8af0-1ee03b3e6a8mr4963912637.29.1738916574931;
        Fri, 07 Feb 2025 00:22:54 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048a9d1aesm2475473b3a.3.2025.02.07.00.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:22:54 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 160A38085A;
	Fri,  7 Feb 2025 16:33:30 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad Input Page Program
Date: Fri,  7 Feb 2025 16:18:45 +0800
Message-Id: <20250207081846.362919-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250207081846.362919-1-linchengming884@gmail.com>
References: <20250207081846.362919-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_002255_827278_73B34127 
X-CRM114-Status: GOOD (  11.35  )
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

Although certain Macronix NOR flash support the Quad Input Page Program
feature, the corresponding information in the 4-byte Address Instruction
Table of these flash is not properly filled. As a result, this feature
cannot be enabled as expected.

To address this issue, a post_sfdp fixups implementation is required to
correct the missing information.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 830da21eea08..ada17999ccbb 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -45,8 +45,26 @@ mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
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
+			SPINOR_OP_PP_1_1_4_4B, SNOR_PROTO_1_1_4);
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
@@ -102,11 +120,13 @@ static const struct flash_info macronix_nor_parts[] = {
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
@@ -154,18 +174,21 @@ static const struct flash_info macronix_nor_parts[] = {
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
