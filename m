Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEF8C4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XefEavq9Oy40EMqmfQWOZN2i+NXRgHKE2eA/NuAR/JY=; b=AH158ROYKhdmk8
	g0SoQX0Dlh7lkUGDm5FdcnpwSRG0U3wZuN+0SoqNOZBnl8xeu6Be2Qyb3rl7rPlxmsZ9jACQGn55A
	1O6Lm8WgKgk7IpTJT6YDTOhomHlxjIL2xj0TnD5RL/mf49l5BLGIGUtlgdKky+FVSRkdeJlEcfRr7
	1142lza75H0uKVLfkuk8jGKKXnimuRgtBN5oQLrArsXIKSS7jOxUyzLBLOZYUNtQvO0FHHN6oUHL0
	toNAsgPSKGHiX4W0rATCUc4foakDQlmi6/RBhCZlamq997459QmcxS0tMIvDaxsh6ymfotJg0eDSo
	9DHI8/U1YqnFEZl1Lysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rae6B-0000000Gr7R-28S5;
	Thu, 15 Feb 2024 15:56:31 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rae68-0000000Gr6p-0X07
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 15:56:29 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-55ee686b5d5so1333950a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 15 Feb 2024 07:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708012586; x=1708617386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P3efqq8WzukHk5Sl+dCI9Lvs6JaD9H4bIKOafllX5Nk=;
        b=Nv2IqqzvJefeQYd6TDHNR6YZlGuylvZorNQrI8ebohdAR4Zx3+SMOVhNz3N3/5KvDO
         jxTiTmHNz2VSC4cJ0NGO8MFBtOdmPI+VMcJbgjFFIhd4mCiMTxeb3LhjqB3AfVpHUeU+
         IHS54wuiTOZd0uzv8xq8E+BEdSfIt3GFb275+J0kjExpXgLxJ3ugCpOUbZ3rOuk+bF66
         bByx7tkd/k/XKNo1XUwzg0awwW/X4PKPdtzw9mLnG2wt6KO4A6VL1vMuUvCtaLziagKW
         5FuC+jDOffUbg1tPgHgG20vzmW3dJd5zPC/MnyPgYzGY/6+x60ZOU0K4m/joglCsnK4m
         s3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708012586; x=1708617386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P3efqq8WzukHk5Sl+dCI9Lvs6JaD9H4bIKOafllX5Nk=;
        b=YEUiM47VOXJZELfkeVPazRdZ4uVXeXF+psnpwQXBxBQpv4cIPmlI7Vnt0yeoTUiILk
         m9yEfBWa6/Bsp039XLT5MGbu6Q7alpZGE1SyTIa2Zgz5VAIOtffRIOXbkkdPwy8OShJ7
         X8EwvnzNX4mp/FMCW2IB+qG01PR5Fkkohn2xouZ1QMGVANqewG7eA4DYjQfIPiePNk0A
         qdH2B5YIqJu5/7dYreQVXc3mzfsf1L3n1kp54gIDYQECd564y3ZEtUL1RJDq82fk/+lM
         1vsX9ZPJjD5tYmel/l5asVwtl0lywNxmFI/KW58a5CjZmH52WjJi1ac1aWA3fsd6+YNh
         AN9Q==
X-Gm-Message-State: AOJu0YyzjUxMl9F6TIrW5ufbbPr3hg8Q7R9/dg0nI1zQv2iT6TgtTxc5
	Ormi9wTdIRJYWc6+mm8vFMYvmcq60SwkQ2P9el9YdrYdMKyp0SpnAxwRDrlFG3i3cOg=
X-Google-Smtp-Source: AGHT+IGLkGNVMXPmFy25TsYH8L53x7LIKsFCqlDW5KkvWirOmSJusjJ3oBd9VYVhuyKJJxvuXcLKuQ==
X-Received: by 2002:a17:906:4115:b0:a3d:4984:8d73 with SMTP id j21-20020a170906411500b00a3d49848d73mr1677553ejk.18.1708012585761;
        Thu, 15 Feb 2024 07:56:25 -0800 (PST)
Received: from v2202209183747202483.. ([2a03:4000:54:fac:a8fb:beff:fe0f:de18])
        by smtp.gmail.com with ESMTPSA id n20-20020a170906119400b00a3d38953d03sm683574eja.85.2024.02.15.07.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 07:56:25 -0800 (PST)
From: Sebastian Falbesoner <sebastian.falbesoner@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	Sebastian Falbesoner <s.falbesoner@schrack-seconet.com>
Subject: [PATCH] mtd: spi-nor: macronix: Add support for mx66l2g45g
Date: Thu, 15 Feb 2024 16:55:20 +0100
Message-Id: <20240215155520.68159-1-sebastian.falbesoner@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_075628_190251_5C95F8F7 
X-CRM114-Status: GOOD (  11.08  )
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

From: Sebastian Falbesoner <s.falbesoner@schrack-seconet.com>

For reference, see the corresponding entry in u-boot,
introduced in commit baef13ec9d592a27b5d3bf03967bfd2bebd65157:

[ in drivers/mtd/spi/spi-nor-ids.c:274 ]
----
{ INFO("mx66l2g45g",  0xc2201c, 0, 64 * 1024, 4096,
  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
----

Signed-off-by: Sebastian Falbesoner <s.falbesoner@schrack-seconet.com>
---
 drivers/mtd/spi-nor/macronix.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index ea6be95e75a5..1a8f8b654dda 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -90,6 +90,12 @@ static const struct flash_info macronix_nor_parts[] = {
 		.name = "mx66l1g45g",
 		.size = SZ_128M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x1c),
+		.name = "mx66l2g45g",
+		.size = SZ_256M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0xc2, 0x23, 0x14),
 		.name = "mx25v8035f",
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
