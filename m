Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6913CCFA15
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 07:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEozgSmVbQPXuUfTR0vnelC/1uLhwT4fwniNuzwngnE=; b=3FecGgKryQ1Bn1
	E9qqbRtIBiTuToNYWIgYn7j8I55uLlKY6AhvYC3Z5fo1MnnBurB08DnRSNRqiiUP/mB3TByH6/bRK
	xS1y2IUsgEqHjGFUHq0e7WxgqTb/3/y4dmMncDumXUzpAjHVrbYyR7330TG1wBt+31hoMJ4DX2t5K
	8JEG+zK59S49uJPU1mQbtwoXcbhN7hiWLutJ/bhYdlJGIHWHfNzYpZVWVF1BOVJfZDDAexzTnwLL0
	9C4RJv1UPdG8Vstci+QS8gwlELd8h50ghf1CRlcDI8hMJyPo4dtBCHOi7nJ2nnbeCz434vtKzcPUA
	w38AfXt0VgJHzQletPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYGJ-0000000DEBt-298E;
	Wed, 05 Nov 2025 07:48:59 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYGG-0000000DEBF-1pkq
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 07:48:57 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-33b9dc8d517so5774728a91.0
        for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2025 23:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762328935; x=1762933735; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHv4nBRWTZt8vdLPnNPAb7DtW2NOOoy9mz9SlCozYmE=;
        b=g5GCIOzShMEMAzzlpEHjxOZs1cjgCE6fB56V6BYaQbaLO4+UeB4weIX8c+S+xtzmMT
         pGDYd50GkVDh7dtf5FY2NFH82EAgUACwRQe6niukXcV5QskHrBbVdeAI150wHjKuNOuj
         biGEpBJbru33E83j1ltHIPOYYb/kDzOdMbayJBdU5xA05SiaFrtxTq7zxbsndO8W1Xy0
         /y09KJSmAxmm9rCFagijI14ed2/ivCOyCuENjM2LUUxc+X3CwImZ8xOEYj+Y7tnUkPG+
         CCVqNSp98ZKBtVu6HSxpN4qyoJH2M/vS+o6/ul+o5eKLR/ux9tkEHlsyp8kLoN5AwkZq
         yNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762328935; x=1762933735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHv4nBRWTZt8vdLPnNPAb7DtW2NOOoy9mz9SlCozYmE=;
        b=imihdgjUtRNozDWouainG2+CtK4EY3KTFNKQy27Yr1g0tDWgxV9Gum9ijq+OZ//9x1
         l5tjXgkHqZsebSb36E4/jMdox4IZ844JifszVBsBNwId3GocWO3mfufJ8LqO+nDgbiQl
         PGmYfzsOEOIUyhHugIQJkmNROZpmHnEHBkHjqa6EwCsfgryN1ZaRnRCxlXv4CZDhEljR
         Rq8/2r4a2Ltlt7B2hM1N0XtnUctu31QBNSsfrkXU7QgkDyZInEjnSxxgBrc32vhhxK/d
         fvnsGf+siyQzk8LGxQQ+rfPHcz1xNhyvLi5McdHquii1wKo7TvCnHndlJadcIrViqNpx
         dOzA==
X-Gm-Message-State: AOJu0Yxb7BPzhz5Dm+Ht/PePwYuL5Q8PzECQ1dNpCQMw/e2vO6GJ3RTT
	FVMlhhU94/JcglkSCeMhaHkmgCgd3uohZaOjjjiHfcaS0epLYtX+cd7m
X-Gm-Gg: ASbGncvoAFFnstdVuhIWNIH1C4r6Jbvf2w165bQSw2PFDgjfANDMhAajP+3s3m+Sk5P
	8GEAkUrOSBIVFVYY8UlCAKBXXhR2M8kczR4LbhuFiZ0V7DTGqzxRA4yOZES88FAyymTaTScMJxS
	n/bg4xurcjTEuxpcZ9OQieWtvzHjHpBR3I44mtlnhNkqj6phPDGVry0ewSnsqRwyBduQ8CrHx5J
	3NZwDK+Xdq5S2PaI9su/8aSQJlqQjYxV/exHAeQfao7ckzjCCgLFWo0ugnhHgmJcCQKg72q6dA8
	ugyzu3A6YlfjZOmM3mL4dwEgNA7RiBB2wjA8BfmiWGG7PqJiGDA1Y2ExKF6Ws8fwc/Bde8rhyUt
	0ZVC8x4us1VCk2odXWqBz+yGZ8OMjVLWX6YAJ4EANFZwRLPMDQuOZmDkdcqC++7C6Mk9ZhGI2Nc
	IbFXd7hL5yWfWIT3vf6lFrXULXspv8URft+QbAxRygLq1F17Pc6y0oj7veUkw/fIBLMfqF
X-Google-Smtp-Source: AGHT+IElVyESUBfM59SFNCufOWVW00WwLiAjs5x1QKfHQ/x0q29nn57QGeqQMEk8D/eNZfrpYehqaQ==
X-Received: by 2002:a17:902:f550:b0:295:b7a3:323c with SMTP id d9443c01a7336-2962ae4c35bmr40142525ad.28.1762328935617;
        Tue, 04 Nov 2025 23:48:55 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a5d74csm52174625ad.76.2025.11.04.23.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:48:55 -0800 (PST)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Date: Wed, 05 Nov 2025 16:47:59 +0900
Subject: [PATCH v2 2/3] mtd: spi-nor: sfdp: introduce smpt_map_id fixup
 hook
MIME-Version: 1.0
Message-Id: <20251105-s25fs-s-smpt-fixup-v2-2-c0fbd0f05ce7@infineon.com>
References: <20251105-s25fs-s-smpt-fixup-v2-0-c0fbd0f05ce7@infineon.com>
In-Reply-To: <20251105-s25fs-s-smpt-fixup-v2-0-c0fbd0f05ce7@infineon.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, tkuw584924@gmail.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762328922; l=3412;
 i=Takahiro.Kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=nVurDGisbQbassAJC1QWOPaOxEMZSWrlBausbDp0Gps=;
 b=U/A5PCXLDj1/YLoagxPCbAHte+oH8HOQeW3C0Momim8VXyrbo2zUdVGd+/RdqiiuwT3BlTbr7
 g9pgun+A6Q/D/DDJ2xjxAUfiOjfvHmCvpLX9ou/6JrDO9tMABhcQEjB
X-Developer-Key: i=Takahiro.Kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_234856_508184_9109D0DC 
X-CRM114-Status: GOOD (  17.88  )
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

Certain chips have inconsistent Sector Map Parameter Table (SMPT) data,
which leads to the wrong map ID being identified, causing failures to
detect the correct sector map.

To fix this, introduce smpt_map_id() into the struct spi_nor_fixups.
This function will be called after the initial SMPT-based detection,
allowing chip-specific logic to correct the map ID.

Infineon S25FS512S needs this fixup as it has inconsistency between map
ID definition and configuration register value actually obtained.

Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org> # S25FS512S
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.h |  3 +++
 drivers/mtd/spi-nor/sfdp.c | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 5ad46d95d09cc9d527f71579a71eed210e726f68..16b382d4f04f207aa26190ed8bdf2d19885f7315 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -411,6 +411,8 @@ struct spi_nor_flash_parameter {
  * @post_bfpt: called after the BFPT table has been parsed
  * @smpt_read_dummy: called during SMPT table is being parsed. Used to fix the
  *                   number of dummy cycles in read register ops.
+ * @smpt_map_id: called after map ID in SMPT table has been determined for the
+ *               case the map ID is wrong and needs to be fixed.
  * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
  *             that do not support RDSFDP). Typically used to tweak various
  *             parameters that could not be extracted by other means (i.e.
@@ -429,6 +431,7 @@ struct spi_nor_fixups {
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt);
 	void (*smpt_read_dummy)(const struct spi_nor *nor, u8 *read_dummy);
+	void (*smpt_map_id)(const struct spi_nor *nor, u8 *map_id);
 	int (*post_sfdp)(struct spi_nor *nor);
 	int (*late_init)(struct spi_nor *nor);
 };
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 9a47dcaca06ae2ad85ac8503658083b1d56d8b96..a8324c2da0acf2953a4a62e2a9f7ed31fcd8b4f2 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -730,6 +730,16 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_nor *nor, const u32 settings)
 	return read_dummy;
 }
 
+static void spi_nor_smpt_map_id_fixups(const struct spi_nor *nor, u8 *map_id)
+{
+	if (nor->manufacturer && nor->manufacturer->fixups &&
+	    nor->manufacturer->fixups->smpt_map_id)
+		nor->manufacturer->fixups->smpt_map_id(nor, map_id);
+
+	if (nor->info->fixups && nor->info->fixups->smpt_map_id)
+		nor->info->fixups->smpt_map_id(nor, map_id);
+}
+
 /**
  * spi_nor_get_map_in_use() - get the configuration map in use
  * @nor:	pointer to a 'struct spi_nor'
@@ -783,6 +793,8 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 		map_id = map_id << 1 | !!(*buf & read_data_mask);
 	}
 
+	spi_nor_smpt_map_id_fixups(nor, &map_id);
+
 	/*
 	 * If command descriptors are provided, they always precede map
 	 * descriptors in the table. There is no need to start the iteration

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
