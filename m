Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897F3D75BA4
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 02:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sm2YF2ZOWRIwjs/dh+MjNddWJMAYJyO0w4jcju+rw2Y=; b=3tTSQZ8Qo22mZI
	8ncGqrwdXgYv+RvOsaWpb3WEovefXjpyPSvuBYxNdPC+DNu0KYK7wRd72NxRlJv8I2U9Ofvn4hazC
	bijETYFaeCY86F1rnF9aoZOyeh97x3g7JmoQtXm6Knm+KgYhwBoo5FASulVopOigbrVCAGg2cu0nv
	0RSot2ziUPwUgAI/2dcx2EX1RlwYeXel2CnzUPd2nb/g+uFCBV4c4MWzIrZOEBYaebQFBfRfs6qYw
	vwip/FQynuDPCzzFNWOBsWxcedA60AkMN0vHY/R6FPoVF0iqROYhNloDDClF3R0Sg4+3xX/G9W7sY
	QJ00cXVYNiN0tFj7ZzfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDwd3-0000000GZve-2zAF;
	Thu, 21 Nov 2024 02:09:09 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDwd1-0000000GZvB-2Le2
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 02:09:08 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2124ccf03edso3107295ad.2
        for <linux-mtd@lists.infradead.org>; Wed, 20 Nov 2024 18:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732154946; x=1732759746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4O7qOAdG7Dgz/dYuEL9fMRAYn/D7fU4D6K1iLRtQxLc=;
        b=lFJvZ9uaAYFq7QezbR4qqhzThsXPm5TtIhHKRZQXxElbVJX90ww8CQlh15VKtcSAv6
         TJCRbGYUiMaXp7ISG38zrUjYvtGdnZHBD27koKOY7TcFkkTDhlnn8l0plsHjU1NmxorN
         qhfAN1TFButEy/YdFWAFJAVf78Pq4lB+JsLKnxhGoBygrOWYpCgIEE02hk3Bhv82/D3S
         IVH+gvI7GyF7R42x4TKH2kaVSuinwsiFlrpo1b4ylxd0K2i33VnVfTxKnymhy92UMaSF
         WSCP0Ah1ZQ+irwdVViLEZWtBzso+dpxy9Om3o6V01/cFfE/wPcuEgagyPRKDigo+SdrP
         QIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732154946; x=1732759746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4O7qOAdG7Dgz/dYuEL9fMRAYn/D7fU4D6K1iLRtQxLc=;
        b=vUdZ3Hxb5F1SKXxolp0yV7/J+rUGi+wnpFpWYbdsyT5H1cwSCoVIJZWz9OW/nPXuCF
         l6+hm6E2EYTUBlvaR/jwQR+I/EtBMLvKGnSZuuSc57K+U7a6ibBDzCUUaa0Wpb2+DqWX
         vLll7T2EG366CjyqCh+k+7QZ+U+cnVPV6lG11/Nrzy3HRtk31D8liuho4MXpUzZkvdLq
         YWTeKEwbsR8FI3Gc6GerzR+k9Ic5yNgXuR4Vo/2brUdauqbp8ukYuhAoR2py/hN6ANi+
         t0GeJXElAzpeekWsZNU6pkKQ0xZ4JBYoeeDR9OOb8+ZuqyM0lvOOUaF8wnRgRHlerMkV
         pw7w==
X-Gm-Message-State: AOJu0YyYlIjIDuFUf9d3VfjuzRHn74g5BH9aD5SM/mIVsD5ZGadTQ09e
	faBoxWpoaWYZ+s1Y+MVtdozN8uokAfxybrXnl7dyyw15LIrpPEexugHhe2NF
X-Gm-Gg: ASbGnctzRB6ip3s8V0VLksqNMkMoQLC8qBAuru+ntKHJuo8dNUEFEp4QiVBUDSnAzkm
	+exgPQ61OvzPGakY12zSryBqdO9+K94QdoUFJkPZpuQxtZhyvYLDLMBRrcFjJBHS/Ak6hh9xh1n
	AWaIPofSALLY6DJLOgmyfxNXcuE6m+T3ZZPaF7Xr5bYcho7cPMdRp54KLN2NAYfecqnf9emkc4d
	DXb4uF1giSpNjMfCCLzMnVVb1VOrvvUR6M6+ZUf9ewNCXlUHTVL8CUcx0DD7eIrKx/nKzZMcWDL
	gZAxumDq4Xg0gmIqqs0qwBZZZiiSlKZLLZYu2w==
X-Google-Smtp-Source: AGHT+IHkTImSUaKK5AV7RscfVU1pSuDcfttIIpxRL9N8i7Mv2dvR4K6+4lzzU42S+Vg0vgat/W5GrQ==
X-Received: by 2002:a17:902:d50d:b0:212:48c8:f456 with SMTP id d9443c01a7336-2126a42ef4bmr76477835ad.36.1732154946533;
        Wed, 20 Nov 2024 18:09:06 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-40-130.msd.spmode.ne.jp. [49.98.40.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212878a5d2dsm2388615ad.77.2024.11.20.18.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:09:06 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	kr.kim@skyhighmemory.com,
	zhi.feng@skyhighmemory.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 2/3] mtd: spinand: Introduce a way to avoid raw access
Date: Thu, 21 Nov 2024 11:08:42 +0900
Message-Id: <9944499e3c4bac22495952e1c342a0ce9ca58bfc.1732152768.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732152768.git.Takahiro.Kuwano@infineon.com>
References: <cover.1732152768.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_180907_600714_1D2CF68E 
X-CRM114-Status: GOOD (  17.45  )
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

SkyHigh spinand device has ECC enable bit in configuration register but
it must be always enabled. If ECC is disabled, read and write ops
results in undetermined state. For such devices, a way to avoid raw
access is needed.

Introduce SPINAND_NO_RAW_ACCESS flag to advertise the device does not
support raw access. In such devices, the on-die ECC engine ops returns
error to I/O request in raw mode.

Checking and marking BBM need to be cared as special case, by adding
fallback mechanism that tries read/write OOB with ECC enabled.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/nand/spi/core.c | 22 ++++++++++++++++++++--
 include/linux/mtd/spinand.h |  1 +
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 47c369f2925d..2ff3c32d46d3 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -294,6 +294,9 @@ static int spinand_ondie_ecc_prepare_io_req(struct nand_device *nand,
 	struct spinand_device *spinand = nand_to_spinand(nand);
 	bool enable = (req->mode != MTD_OPS_RAW);
 
+	if (!enable && spinand->flags & SPINAND_NO_RAW_ACCESS)
+		return -EOPNOTSUPP;
+
 	memset(spinand->oobbuf, 0xff, nanddev_per_page_oobsize(nand));
 
 	/* Only enable or disable the engine */
@@ -901,9 +904,17 @@ static bool spinand_isbad(struct nand_device *nand, const struct nand_pos *pos)
 		.oobbuf.in = marker,
 		.mode = MTD_OPS_RAW,
 	};
+	int ret;
 
 	spinand_select_target(spinand, pos->target);
-	spinand_read_page(spinand, &req);
+
+	ret = spinand_read_page(spinand, &req);
+	if (ret == -EOPNOTSUPP) {
+		/* Retry with ECC in case raw access is not supported */
+		req.mode = MTD_OPS_PLACE_OOB;
+		spinand_read_page(spinand, &req);
+	}
+
 	if (marker[0] != 0xff || marker[1] != 0xff)
 		return true;
 
@@ -942,7 +953,14 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
 	if (ret)
 		return ret;
 
-	return spinand_write_page(spinand, &req);
+	ret = spinand_write_page(spinand, &req);
+	if (ret == -EOPNOTSUPP) {
+		/* Retry with ECC in case raw access is not supported */
+		req.mode = MTD_OPS_PLACE_OOB;
+		ret = spinand_write_page(spinand, &req);
+	}
+
+	return ret;
 }
 
 static int spinand_mtd_block_markbad(struct mtd_info *mtd, loff_t offs)
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 702e5fb13dae..5cf11005b41a 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -314,6 +314,7 @@ struct spinand_ecc_info {
 #define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
 #define SPINAND_HAS_PROG_PLANE_SELECT_BIT		BIT(2)
 #define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)
+#define SPINAND_NO_RAW_ACCESS				BIT(4)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
