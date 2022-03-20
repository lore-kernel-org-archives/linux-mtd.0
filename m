Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CE9C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Mar 2022 10:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmfYq7SqN6ot6EYeMuN25AYvr/RUzQYzP1T7Y/yuzYY=; b=iUMxVwdHCyjkdg
	1RwMDCWaaRDq2johrR8sKIeZGj1GrJvpWzFf15W8L9S11C0kNIigfb53hWcw29Z+IaJDe07mHpo00
	1D6+26GVObWUhtb7fmiE/2qD4pzWE8yIWiPsCv2aySWeQMhPuJJ9EgoBDY2kGers6VixCfUCFAoDk
	A7aEXV+YsiL8Eff34tXy/tSsqrxtaKD0VDQlNTgBmB0Kh7iZSmTHLLoKP8qc7KntiqJfm7rMkXUGj
	sHaE1ybvXRdTvoADWOzCGQHlXX8EAx35kzLe2BFoxTDur/uFcgvIuqTNJaFd7pDCHICeGDDFttEpw
	2CpSDy+RUOxdWZQvNKtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVsNn-0050rc-2G; Sun, 20 Mar 2022 10:01:55 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVsMt-0050Xa-9W
 for linux-mtd@lists.infradead.org; Sun, 20 Mar 2022 10:01:00 +0000
Received: by mail-pj1-x102a.google.com with SMTP id gb19so10831168pjb.1
 for <linux-mtd@lists.infradead.org>; Sun, 20 Mar 2022 03:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lTwx4YLysA2ZvSXaGhcB3X5ZKUi0dLU+JyUgnYrwMfs=;
 b=dKGppdpDoq5rZs1MXpORL3y14bsHd6xrmCAEsK9IVGDZ/BJ0jpZXHNAUaCUK+jtX7g
 YbsdfZFhJ7hBhyeZ8qfwQ68rj591nbnt7pqxJQQic3PEOwX6wGFtkxiX8Do1eg+FuHks
 HQ/o+9a1qhiQI4Jz5O2jhkotosPyEVPqZzw3hPpZRlZkWsEebGCH5S0BPJ5g5pn7nTWK
 Jep5htQyjvQuE2KMRoB8Si/X6tOuVtYvmF+MC9QVJZe53h4tneNG73Ukk5kDBSc9AoZP
 pHIeTt9MUd1jUH55vOPd7XaWk9j0XShfrP50FY+cYkN081OFq7MpksqM7bzBCCnBvDta
 oyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lTwx4YLysA2ZvSXaGhcB3X5ZKUi0dLU+JyUgnYrwMfs=;
 b=tIbxzriRwkUr75nxa1tuNrsLZqLrSiyR6KiCXNC1PLnMLLVlI8Mz/YZGHUt3Cs4s2Z
 uIfsosvTLJ3z4qyIAnAXSqVhQD0huS78hFL8IX8ILdYB+N/OiU5UPgSitn9BCenwHFlG
 BCsNWAGtqWZAp+p998U1hscSzVQNSW9O2dCX1BNnzXhvrj22LbCvUDCYAwoa+a5/lbGG
 OhFpBO7qTMzTmIRFBCF8OZQHZ6WXHAX4mmDFkfOvx3uOmekpRF4OzNEbRtIeocFL0fMn
 X1K/z31m286fcG5oh5SVQfCEK1ipK7wlqUZ3XQiWNPBmc+YZavAqBJ9wlDh4v0MxRN4C
 CMvA==
X-Gm-Message-State: AOAM531DGHDsFfib+1dWBfpiSdDwcFrdsL7NwRq4ZkmDK4f06odjghJb
 Z8Yz7kKnwDVjSznD4KcyMSlKTJWgW2zpKNM3
X-Google-Smtp-Source: ABdhPJx2A8BE9AU35FPb3qlCeRo9SMZJlicNYgmyllVs+GMbjQNgpcCYTiejVdh4/FJMhlPZ6Gboqw==
X-Received: by 2002:a17:902:b694:b0:153:1d9a:11a5 with SMTP id
 c20-20020a170902b69400b001531d9a11a5mr7727950pls.151.1647770457206; 
 Sun, 20 Mar 2022 03:00:57 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:7000:7978:d40d:86ff:591d])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056a00080b00b004f791d0115esm16597810pfk.171.2022.03.20.03.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 03:00:57 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/5] mtd: spinand: gigadevice: add support for GD5FxGM7xExxG
Date: Sun, 20 Mar 2022 18:00:01 +0800
Message-Id: <20220320100001.247905-6-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320100001.247905-1-gch981213@gmail.com>
References: <20220320100001.247905-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_030059_356158_F3116A20 
X-CRM114-Status: UNSURE (   9.46  )
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

Add support for:
 GD5F{1,2}GM7{U,R}ExxG
 GD5F4GM8{U,R}ExxG

These are new 27nm counterparts for the GD5FxGQ4 chips from GigaDevice
with 8b/512b on-die ECC capability.
These chips (and currently supported GD5FxGQ5 chips) have QIO DTR
instruction for reading page cache. It isn't added in this patch because
I don't have a DTR spi controller for testing.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/mtd/nand/spi/gigadevice.c | 60 +++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index fcd1c4e474a2..6b043e24855f 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -441,6 +441,66 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
 				     gd5fxgq5xexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F1GM7UExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x91),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_1gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq4uexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F1GM7RExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x81),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_1gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq4uexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F2GM7UExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x92),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_1gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq4uexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F2GM7RExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x82),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_1gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq4uexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F4GM8UExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x95),
+		     NAND_MEMORG(1, 2048, 128, 64, 4096, 80, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_1gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq4uexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F4GM8RExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x85),
+		     NAND_MEMORG(1, 2048, 128, 64, 4096, 80, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_1gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq4uexxg_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops gigadevice_spinand_manuf_ops = {
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
