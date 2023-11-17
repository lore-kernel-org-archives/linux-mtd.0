Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CE8C5AE5B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfWN4RmNv/EBmg2Yhf2oRYk3E/0cPto1i9+Tosv92jM=; b=cSOZ6P9fBDtsnE
	nxgntcjFMrGHzH+lQwA7XGPdyO7WpmbQpv/NUCnpiDyff8SxQvCwj0v4LnnL4Hcsi7vGET8jKdhZ9
	y6ny9FWluSTC9V7dryR26KNSPQQfsuCBTE8fS7QDxW1mCr7eZAEDdyprWwdZfaVLYqiOv0x6jPZyN
	lKQYEC4uJhAir9Jdz7/7JNtCqCmvozOiUjvw1tl3O10CqjEf9+QyZ4MzNEcJC5Dr2eYf8SQFMl7In
	fJmbbj8mLjrKyAtgV07T4PnRgffeVCJxLjwUPOL9wuD3XwhxJ4wgWycIY9X4eTa2212fc6xVzEQr4
	OXhoKFGJ7lPMjRd/iMpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uNc-005xFm-08;
	Fri, 17 Nov 2023 08:39:12 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uNW-005xCz-1f
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 08:39:07 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-28023eadc70so1516891a91.2
        for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2023 00:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700210343; x=1700815143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGIOPjWsWXffU/sU+xJxvsbx/tJ6sjXRamjNWghiIh8=;
        b=meE3okR+nkssEpIvXWtn4xvlrGBymJDfaN+Jzm4lxdryM64GAVFTOehGwpU0rUd+yp
         SoGoiVoXZdKdYZr8lgacEeYZQHgbtCU0jWZNdzZerkC+KqUxUWTeMxd+M8V7AGmNd4tO
         AsRHQN2IUW7XoWCTBOh1Wdn+PF3OIXu4EeqKfeWjYHcO4I50OFM8ZKEVuUvbmFEMDtyR
         1GHDqmSURTgRwJQSqEV3/R3UKS1JwXDrPuW/xl437K1urMBi+r0aKcW6bQjlG0/qG/Wl
         4mc7yNATOS89EnqWWdaAT/sMJ7oeyhyIyfZZGNg+StXU4jlq6p0d7V1rOCJojYnXGSg0
         UQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700210343; x=1700815143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGIOPjWsWXffU/sU+xJxvsbx/tJ6sjXRamjNWghiIh8=;
        b=wPZZDy31CzFs1UZer61q6aVNs0bv9iR8l6jp+InSL+cpTXZ7PyAK9HbOIfwM/X0jyB
         ELsKF5hZl/qCLHZI5JoiCW1RLqSM9bQaFIdGRDHGBIZIJGc6hwkqjSY83tvL+sd+O7ki
         OiI4xZKlm6i2DOdGBZ8eLw2c1pUKEGVSoNgJ7LfX88/c6dGmuyecg4wakGY48LSd46Rd
         sC3D7Fy6Oidjjfkka/AIn98vTaUsD3PiuZuuO07oeIMy1pMsUDJFSIar1M7g4E4VdIZ2
         k25XfNZgvapqWC7nNJAbPzCFtQnDmVX6wk5POev25YQv806GXwPDQ6tSGQVQcSuGrohb
         8mrw==
X-Gm-Message-State: AOJu0YwVx+3EXoXv3VSxgpAPT8fxV6EtCcr+YG3Si0au3MHpMYZXLKkA
	GX/Ha0HJK4IcDLC8le8wsJ4=
X-Google-Smtp-Source: AGHT+IGWfZDF/IM/pvnjZJbkUan3C9UfnBfLIgeVHbF4euk4/NUyE4UcLKtVWqQPFp+CkA+J2kIIQA==
X-Received: by 2002:a17:90b:180a:b0:27d:3fa4:9d9a with SMTP id lw10-20020a17090b180a00b0027d3fa49d9amr15145770pjb.29.1700210343488;
        Fri, 17 Nov 2023 00:39:03 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id y12-20020a17090a86cc00b002839e756143sm232391pjv.29.2023.11.17.00.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 00:39:03 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id DB12180861;
	Fri, 17 Nov 2023 16:39:01 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v5 4/6] mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
Date: Fri, 17 Nov 2023 16:38:51 +0800
Message-Id: <20231117083853.33329-5-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_003906_607880_8B3DC717 
X-CRM114-Status: GOOD (  13.08  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

Parse BFPT in order to retrieve the byte order in 8D-8D-8D mode.

This info flag will be used as a basis to determine whether
there is byte swapping of data for SPI NOR flash in octal
DTR mode.

The controller driver will check whether byte swapping is supported
to determin whether the corresponding operation are supported, thus
avoiding the generation of unexpected data order.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++++
 drivers/mtd/spi-nor/sfdp.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index b3b11dfed789..2241207556bf 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -650,6 +650,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		return -EOPNOTSUPP;
 	}
 
+	/* Byte order in 8D-8D-8D mode */
+	if (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_BYTE_ORDER_SWAPPED)
+		nor->flags |= SNOR_F_DTR_SWAB16;
+
 	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
 }
 
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index 6eb99e1cdd61..eba760941d43 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -123,6 +123,7 @@ struct sfdp_bfpt {
 #define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */
 #define BFPT_DWORD18_CMD_EXT_RES		(0x2UL << 29) /* Reserved */
 #define BFPT_DWORD18_CMD_EXT_16B		(0x3UL << 29) /* 16-bit opcode */
+#define BFPT_DWORD18_BYTE_ORDER_SWAPPED		BIT(31) /* Byte order of 16-bit words in 8D-8D-8D mode */
 
 struct sfdp_parameter_header {
 	u8		id_lsb;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
