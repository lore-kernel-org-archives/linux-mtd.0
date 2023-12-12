Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4643AC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 15:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=alzxKLVajb0pWcJJIg4iSny9Y222X7G3YHXPhB66wV8=; b=rkoBNmHJWM1vkI
	o1sAqbIi/eUWPRq+PcYpwnqhFgcWMwsAGjE5pm2OJ/Irutj/o/t1Lod3jNCxxn2QtfrAFF5oHj+Gy
	LoZQqQVTQ1Wm6FyA9Oh495vrSBGCuD13mHnMiC1+9bcAfzInz5PN5HFnIkJ83EfeAlDUK4DBVPtzd
	MuPwm3IW3ore+yhAb+RO+nFa5GvbmjYZRG6w2f7A91APuIy87idDoRCjZYB8e64XMzc43JXGLL755
	aEZQTMCnc176J+gvZrFwodJdvrGB0KTtoiuDTxfM9nqUjLhd4UtNRAlilfqlv8NCSvpdHCfEQS3BF
	ovlWRhiXfGflVaZkDXIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD4hp-00C4qN-2b;
	Tue, 12 Dec 2023 15:29:57 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD4hn-00C4ok-28
	for linux-mtd@lists.infradead.org;
	Tue, 12 Dec 2023 15:29:56 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ce32821a53so3176582b3a.0
        for <linux-mtd@lists.infradead.org>; Tue, 12 Dec 2023 07:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702394990; x=1702999790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NTTs7UFgIFdC32zUgrZIYBXmEnEJk4EjoMXcKLYvVsc=;
        b=bsPOv2+Qvs0FKsB99OWhwjfzYK/jXCU6uAVu4OgV/wgx1mELYloztIMJ5Xx41xhTtF
         LMrArTDDrBZkWZNmlGVf5HBFBt+gjJs53NmLGhQbIW3+zf6VhAdX/bfoFsFW1T7oGfp9
         f6B1FR4f+/pkCFO+dDwIUm7NyHte9gOV982zjQ3a4uBXMeGr+uuwxsd5N6vlCIrgm7JZ
         34PybP3z9aYhI+xfvEaygwpcr8kx/bkrZtZbq1XFC5Yv/X7ub1nxyuJWer2k6qCCTf1s
         zA8f3l1FxZ0Q0o6GR7UKk8dlUbYLJ6UD2ErVZsykTH/vvsTmb9dfeszeY5/+F8KcAOZb
         xfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702394990; x=1702999790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTTs7UFgIFdC32zUgrZIYBXmEnEJk4EjoMXcKLYvVsc=;
        b=HlYKwI7R+OogfOagKnn43Uas6Ant6fP+S+S+6XGp0JQ4jb3WNPKgNleaeKz9TsR/U5
         dKbd/XbFnhk7/Vf4uKnhv3GNn6HHy55yJy7/DnLG+ZK+vBt/3Ip6oddXJZHG4HhPHKO0
         hkrfxpWAhZUH8TdOsdllMDhFBOX6pkFxxUOqjEbzkQ/7lZKduHuSVJf74x57xtz2RMTZ
         7GiUtqJZXIJms+PFX7Ce3+pGCE8GahFRoI3vHdGdb9nL8c5/UeZwoOSXs9arVJv0AjBE
         7pcypGCHvk5qsOc9W2e7EMpZTTs75dx2eFiTmxpTg1zO6l0erfK8issCpq0ISGI55p1j
         EYiA==
X-Gm-Message-State: AOJu0YwG9MDMpUyXFfZY6C3+tWKVllEOMIAbBGR7O0+t19Vs1TYa7vuU
	JzpqHvO5klxjuFOGcUU/dufZqHEfhgjqXQ==
X-Google-Smtp-Source: AGHT+IHVbXpLJtsRBgxnk9PLYUcdZmdMYclnGWm9Zoz59leDQ2rvNUhsE64/3Z4fTOd7kPCLkjeuFw==
X-Received: by 2002:aa7:888b:0:b0:6ce:2731:c234 with SMTP id z11-20020aa7888b000000b006ce2731c234mr3279257pfe.35.1702394990448;
        Tue, 12 Dec 2023 07:29:50 -0800 (PST)
Received: from localhost.localdomain ([182.234.152.214])
        by smtp.gmail.com with ESMTPSA id gx4-20020a056a001e0400b006cd82bddd9dsm8201584pfb.157.2023.12.12.07.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 07:29:50 -0800 (PST)
From: Zhi-Jun You <hujy652@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH] mtd: spinand: winbond: add support for W25N04KV
Date: Tue, 12 Dec 2023 15:29:44 +0000
Message-Id: <20231212152944.4458-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_072955_720842_DB43FA4A 
X-CRM114-Status: UNSURE (   9.67  )
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

Add support for W25N04KV.

W25N04KV has 8-bit on-die ECC.

Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/mtd/nand/spi/winbond.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 1a473021cca5..ba7c813b9542 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -15,6 +15,8 @@
 
 #define WINBOND_CFG_BUF_READ		BIT(3)
 
+#define W25N04KV_STATUS_ECC_5_8_BITFLIPS	(3 << 4)
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -118,6 +120,7 @@ static int w25n02kv_ecc_get_status(struct spinand_device *spinand,
 		return -EBADMSG;
 
 	case STATUS_ECC_HAS_BITFLIPS:
+	case W25N04KV_STATUS_ECC_5_8_BITFLIPS:
 		/*
 		 * Let's try to retrieve the real maximum number of bitflips
 		 * in order to avoid forcing the wear-leveling layer to move
@@ -214,6 +217,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, w25n02kv_ecc_get_status)),
+	SPINAND_INFO("W25N04KV",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x23),
+		     NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 2, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
 };
 
 static int winbond_spinand_init(struct spinand_device *spinand)
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
