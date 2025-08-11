Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595CDCA0EC1
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 07:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KbO6D70KTUKVn/Ni7SyQVLyhUshwwkOCb+mFL8xL7Mg=; b=jdleSvwgFNhChW
	dXdgzL9IiLEW95tZ62qJRgCEfNTcVQIWOOywB49ua7Z6p5QjOG4fxo6gI1zszRu7DaEoLymhWgT4b
	/JRZjaHL/s1VY8e3K/4jKZTvopC5ierrJexjUeay4T8piPFikmh9PeYtoW45w9zk8QhOQcyxfRVK5
	PijsU/5JD+Pcay3S1Qm8L3StgzuGcKfQmNbocql0OvWtmvYRqsTHTYqV0YC2YtmLCXpaPNvD0/oQ3
	KoLftdgoXU+KhHDmVhmIvkQBPEoY9h4g2LRoiq9tfxfYQXdZYuWDyBal1ulmlpmnnxTeqBSs3aEt0
	y652C9hRwKWaB0Wqlsdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNBG-00000006jrG-0tjh;
	Mon, 11 Aug 2025 07:42:54 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulN9K-00000006jgm-1ZoP
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 07:40:55 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b78d337dd9so2434395f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 00:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754898053; x=1755502853; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ePuwivgJ8JPPoQeHPtBDqnWEaCRKjfjwhGiq9Y/F6l0=;
        b=RFuv3OmPH5P9k3QEa0v4tfUqDozTtTzBXgwy+tHnZg3D4B8+dZrcR+21BxaLghs2cY
         iXMwHSjbuIEkEY0VwCU1qjMV0yIj5/vgoQb+oI77U2iFTQ0vq7NAeTvyOQuvJweGJnls
         /QDPnz0ky9KxHcOOECgdVJWkrYpLmpwbjxdPAlojUSszCT74ulZ3ZolDdOkjlMMXbGvS
         0F4yhT/CBR5g3QBys/kqfMVWEInLxFMBx3LkiFhnibFY6qz4EPHj5rvtXKSUy3Z5/6Rq
         oXGDlaJkxOWXj0BYpSUFqTFAmvyjKeCV4CI0lr1dcFGLDejKRjNTOJcGCauWT/Y0pYUz
         I3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754898053; x=1755502853;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePuwivgJ8JPPoQeHPtBDqnWEaCRKjfjwhGiq9Y/F6l0=;
        b=FbetfZUE6x+RWH1FoKv0BkudXhGefyhLc820Xiar0bt93wYpGLSNZqt/4oFMM/a9zm
         WA4cYteZvaVdSFd6C+QRdRXNUdJwmyeMKOyi4YkNOAE3yDOVfzNjPcxaZmANk5D6iWXW
         7Lr9Kycr7+dCw/m3jynd2k+atZXsiLwBWXsppXy9gEbpTJ+/dMj9YoCfzpgKeBzER5Ik
         aaCTn7RydbGtJwiyD1JB882YrR4bbfr9q5ExF4y79WOwreWdF3Hl3CzSVFLC28BXvqp6
         4qu5yH5o2uRxizpooiLjTw3wMeAmxTYqmedL9p1gTclRpew9ag8xFIMH20xY4/XUUIKa
         YzWg==
X-Gm-Message-State: AOJu0YzfWNyIlTOPHwaAlezc7qC/vctZITryv1dprs2loyn3X+BizMei
	CSgkKrSMA5q/tsGA+whNKzocN+mPy/6cZCb0ZDHyVsiYmoG9sfFM/h6M
X-Gm-Gg: ASbGnctVtUigUaV0alAuJKdwNGf1D+J4J7aKBJvNpc/Hrxd0bORx/b8fO/gMgSavj2d
	Le0JwacNiap+cQp0I1ovMxLwZ7sbyq1cIfV5NiUijjiWD4IKTwGN0Vp9AgFIXqeUu6t9djD04e3
	rI0bt7Ih22rH5X1knFeJeK2IBXlBlBs3iX8WXyg5sFgJRt1ECOoCJITzRRCmHk9GnDc14LNuhjl
	1iYYUIsfTFPjHnne408wmgWEgCGQ9sC18emPgt1z01mT7REupYZPwJFLaatDWLgLKLyO4nq7BW+
	M/1vkS3nQb0nFioH+IvwOKF5LQiYAq7fnNSJpSGdri/FFXVpU6kSf4j39NEtzcoATQC8fQpFcAf
	1YulUQAYR2BbBbywy/BhmqBqTWu1oGnLYU28gTg7WnAz1ajLZgIE=
X-Google-Smtp-Source: AGHT+IGHW6soSQokYYfZ1NuKLnkmHtvqgyJ6V1fhXaVhfGmx5+0IpuwlOprnqhm/EzfBt/uZyHcGtw==
X-Received: by 2002:adf:ef8d:0:b0:3b7:930a:bb0d with SMTP id ffacd0b85a97d-3b900b2d93fmr6903262f8f.20.1754898052701;
        Mon, 11 Aug 2025 00:40:52 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c3bf970sm39380181f8f.25.2025.08.11.00.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:40:52 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 11 Aug 2025 09:40:40 +0200
Subject: [PATCH v2] mtd: nand: qpic-common: remove a bunch of unused
 defines
MIME-Version: 1.0
Message-Id: <20250811-qpic_common-unused-defines-v2-1-cfc5aea03a93@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHeemWgC/42NUQ7CIBBEr9Lst2sKSrV+eQ/TGIS13cRCBUs0D
 XcXewI/38zkzQKRAlOEU7VAoMSRvSsgNxWYQbuekG1hkLVUdSMbfE5srsaPo3c4uzmSRUt3dhR
 RNJJUq29klYUimEIp3qv80hUeOL58+KxfSfzSv7RJoEDaCdOSrA97czz3o+bHtqyhyzl/AZ4UP
 H3EAAAA
X-Change-ID: 20250626-qpic_common-unused-defines-162e59abed5d
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_004054_419122_63C743A4 
X-CRM114-Status: GOOD (  10.37  )
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
Changes in v2:
  - rebase on v6.17-rc1
  - Link to v1: https://lore.kernel.org/r/20250626-qpic_common-unused-defines-v1-1-e31c9e2074c8@gmail.com
---
 include/linux/mtd/nand-qpic-common.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index 4e694b1aabbd389b5d663399e8d1451862debb6d..e8201d1b7cf9d0f0a5a0e07bd600362b3f0f1f67 100644
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
@@ -86,26 +82,20 @@
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
 #define	ECC_MODE_4BIT			0
 #define	ECC_MODE_8BIT			1
-#define	ECC_PARITY_SIZE_BYTES_BCH	8
 #define	ECC_PARITY_SIZE_BYTES_BCH_MASK	GENMASK(12, 8)
-#define	ECC_NUM_DATA_BYTES		16
 #define	ECC_NUM_DATA_BYTES_MASK		GENMASK(25, 16)
 #define	ECC_FORCE_CLK_OPEN		BIT(30)
 
@@ -120,7 +110,6 @@
 #define	SEQ_READ_START_VLD		BIT(4)
 
 /* NAND_EBI2_ECC_BUF_CFG bits */
-#define	NUM_STEPS			0
 #define	NUM_STEPS_MASK			GENMASK(9, 0)
 
 /* NAND_ERASED_CW_DETECT_CFG bits */
@@ -141,11 +130,8 @@
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
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250626-qpic_common-unused-defines-162e59abed5d

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
