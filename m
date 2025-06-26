Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B0DC7EE30
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Jun 2025 17:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pWBZYQn6q8bvrLwATo1rj2q65R/asMRBM0H7XIBm7L0=; b=rIrolLCsrf3Fqt
	KhkIxxb8Mw1YukaVSuQKuWGpShADWaJsLX1dM8bSs4EXk9DfhKnZgBoNbygKeotDwgCaNZok2wMMK
	ODjds6/oO0hfokboNQ1BUKfw4BYoxWWRzWmzC1qVr0ceZOFzimETU0tHkWUV8lTll4eFZBpt9Ww8b
	ijoQB8mGxrqnFcj0OYlwX5xsJS0n4iVMc9sycthzFMffsfOIRHevtdcsP3o3bW+r7nZhyR/gRhTaP
	qyRYgjM+n0l62Dc5QqKOjNRkInn2SWf2eJZPSqRTmYzI+4OnLOc1GMl0p4JeTOHSfdga0F+P5mGSi
	NAKrjKOB0b0XcqsoM1fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUqKT-0000000CMh6-3njJ;
	Thu, 26 Jun 2025 17:24:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUou7-0000000CBo4-3ZBP
	for linux-mtd@lists.infradead.org;
	Thu, 26 Jun 2025 15:52:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso9871975e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2025 08:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750953166; x=1751557966; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h4rSgnjxP4Jl4YQedEUkUMwPTvSymxpcZHbvWUX0jis=;
        b=E0Lze20n+YBEl8UJtyQPmEd6W9geTv3cWbifBAxbtU2XGeS0+8FOzdLwsMjNQcj61S
         z+pLzpNzBJ3eBSggfKri9hcKeiO3JUM/qm2gI+biNxEOFccdpsDnR4vTYOH80dUaPajj
         Xf03lrwi63uQKeIYhN0jnSx1I8BqoXcSMcVKMEq/2liZfj/3D869MVL95Js3qWqmv2td
         pK5h9EqOunJiOImnTEIaiAL9jY6m03ztH4pKlLv1/uNGpCLT0wpdBxRwXAAa2tYf+R/R
         Hr1O4bvUPCFhRKPV7eAPbj1lQeoK5erkXMgtOVmGnoghiAKkl3KVnbCbOgoq13jwP8Si
         tnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750953166; x=1751557966;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4rSgnjxP4Jl4YQedEUkUMwPTvSymxpcZHbvWUX0jis=;
        b=wy4/Ir1wjKZdAUaNyL2Tceutr329THym4faxKzxaH1iaQaKdmCRFbZkTVTes85zKE7
         HsaQ/crh6L9/gdFJ0oYVIHejS/FSAVmIVcCdRM5iN4BNRSu82MHjZs1RAAXZSg5gUJ5v
         /AI6aDehtekTq30ZKTnRAOWYs9z0er7Q52DRMYCMaw/a+AptdvySYTWPDpIoWjNd9wqN
         lnY0qMCf1piEMtaQUlALaWZT5Tq19g2oDGyjVSDuUDAwL1yZ3Pr/2CEjmhHqJJiOrW9h
         K712RbUK/6omEx+LmxEaQouE0F4fcOzujEJp8yyp7mfu+OkRMwVq5xuGBlfuCSmaBauP
         fkVw==
X-Gm-Message-State: AOJu0YzG4mNAqO83/XxUYUs+AhsUoHUTENUS2PLNm9SaA+F4l/nYPoqN
	48YMZSbjOxQen9Xaq4xht2LasACohQGPR/p6FSQHhuoCA04Gu253fsY00VF2SDK9
X-Gm-Gg: ASbGncsUctc37LEc3dxAWYgUFeplUSBhxOGEhX8J5mUidhR6DvCvEzh/MjSfdz7IBlB
	oV5eKIDN/MOc3VkFcgbW25Pb0nBvX39F0+Chfqm/DepjtwHTmnux4Nbyth/2jB9n2Tz7H2HZscW
	N1xevo9HthnFJUtPZSB+fr3sL+XQAM7OIHwFYXmddFvMYbxeZIRW/3bPoIsmC1ZtRqEHzTRq+l6
	mbkyIccL22ORfqSC79dfQ/UeNNoXRZKKbFU3QonfzXO7fP4dbZy1LTlpLyF0FZgUMTe19yUKC5N
	BchoAZ1aBSgM1OmSa0hD9rvaiQts00cPM2le+8Cgpt2F1isknU4Fa/FP5HPj4PvyUQhXwVhd9+W
	0+aK2bFtJ4Qb+Uik=
X-Google-Smtp-Source: AGHT+IGLokT5hrdJinbTDygdkXq8yB9JdsTfPO7+U2W6y/CtQlSeZCVBi7dKVX1Pux15zvWBbBQHgw==
X-Received: by 2002:a05:600c:c0c9:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-4538267ab48mr67938645e9.10.1750953165678;
        Thu, 26 Jun 2025 08:52:45 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453823ad247sm56241735e9.26.2025.06.26.08.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:52:45 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 26 Jun 2025 17:52:39 +0200
Subject: [PATCH] mtd: nand: qpic-common: remove a bunch of unused defines
MIME-Version: 1.0
Message-Id: <20250626-qpic_common-unused-defines-v1-1-e31c9e2074c8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMZsXWgC/x3MQQrCMBBG4auUWTvQBhLQq4hIzfyts+ikZmgRS
 u9ucPnx4B3kqAqnW3dQxa6uxRqGS0f5PdoMVmmm0IfYp5D4s2p+5rIsxXizzSEsmNTgPKSAeB1
 fkCjUBmtt4fuf3x/n+QNujyDHbAAAAA==
X-Change-ID: 20250626-qpic_common-unused-defines-162e59abed5d
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_085247_969930_6AC8A462 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

A bunch of definitions in the 'nand-qpic-common.h' header became
unused after the conversion of the 'qcom_nandc' and 'spi-qpic-snand'
drivers to use the FIELD_PREP() macro, so remove those.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 include/linux/mtd/nand-qpic-common.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index e8462deda6dbf61f99bbcb39e7cb12cdf66898fd..aa9c5195dc5dde943f4ab23be32d7f900cf959c0 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -71,14 +71,10 @@
 
 /* NAND_DEVn_CFG0 bits */
 #define	DISABLE_STATUS_AFTER_WRITE	BIT(4)
-#define	CW_PER_PAGE			6
 #define	CW_PER_PAGE_MASK		GENMASK(8, 6)
-#define	UD_SIZE_BYTES			9
 #define	UD_SIZE_BYTES_MASK		GENMASK(18, 9)
 #define	ECC_PARITY_SIZE_BYTES_RS	GENMASK(22, 19)
-#define	SPARE_SIZE_BYTES		23
 #define	SPARE_SIZE_BYTES_MASK		GENMASK(26, 23)
-#define	NUM_ADDR_CYCLES			27
 #define	NUM_ADDR_CYCLES_MASK		GENMASK(29, 27)
 #define	STATUS_BFR_READ			BIT(30)
 #define	SET_RD_MODE_AFTER_STATUS	BIT(31)
@@ -86,24 +82,18 @@
 /* NAND_DEVn_CFG0 bits */
 #define	DEV0_CFG1_ECC_DISABLE		BIT(0)
 #define	WIDE_FLASH			BIT(1)
-#define	NAND_RECOVERY_CYCLES		2
 #define	NAND_RECOVERY_CYCLES_MASK	GENMASK(4, 2)
 #define	CS_ACTIVE_BSY			BIT(5)
-#define	BAD_BLOCK_BYTE_NUM		6
 #define	BAD_BLOCK_BYTE_NUM_MASK		GENMASK(15, 6)
 #define	BAD_BLOCK_IN_SPARE_AREA		BIT(16)
-#define	WR_RD_BSY_GAP			17
 #define	WR_RD_BSY_GAP_MASK		GENMASK(22, 17)
 #define	ENABLE_BCH_ECC			BIT(27)
 
 /* NAND_DEV0_ECC_CFG bits */
 #define	ECC_CFG_ECC_DISABLE		BIT(0)
 #define	ECC_SW_RESET			BIT(1)
-#define	ECC_MODE			4
 #define	ECC_MODE_MASK			GENMASK(5, 4)
-#define	ECC_PARITY_SIZE_BYTES_BCH	8
 #define	ECC_PARITY_SIZE_BYTES_BCH_MASK	GENMASK(12, 8)
-#define	ECC_NUM_DATA_BYTES		16
 #define	ECC_NUM_DATA_BYTES_MASK		GENMASK(25, 16)
 #define	ECC_FORCE_CLK_OPEN		BIT(30)
 
@@ -118,7 +108,6 @@
 #define	SEQ_READ_START_VLD		BIT(4)
 
 /* NAND_EBI2_ECC_BUF_CFG bits */
-#define	NUM_STEPS			0
 #define	NUM_STEPS_MASK			GENMASK(9, 0)
 
 /* NAND_ERASED_CW_DETECT_CFG bits */
@@ -139,11 +128,8 @@
 #define	ERASED_CW			(CODEWORD_ALL_ERASED | CODEWORD_ERASED)
 
 /* NAND_READ_LOCATION_n bits */
-#define READ_LOCATION_OFFSET		0
 #define READ_LOCATION_OFFSET_MASK	GENMASK(9, 0)
-#define READ_LOCATION_SIZE		16
 #define READ_LOCATION_SIZE_MASK		GENMASK(25, 16)
-#define READ_LOCATION_LAST		31
 #define READ_LOCATION_LAST_MASK		BIT(31)
 
 /* Version Mask */

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250626-qpic_common-unused-defines-162e59abed5d

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
