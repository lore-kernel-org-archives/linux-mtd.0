Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BD1C25B46
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 21:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vq5pAro6IsR7XJprYCWuGXu5azRK0suiR5NT7Yi0C2s=; b=MQXuKSPHy1OnoR
	jyVODSuKqaq6oQZ5taG+RuQsLIyIU+gDBjAby/iPdYmw28enD4SFCcHSHpVl2NxPqLZnRdplx0oux
	Fd+8HIh/EiCBQthvPJvwIZpsMIcoezBxTe+yjB5ODQ5WhBEidBhHdQA+Hf9NLOwxTopYJA2ehUDyz
	HlUJtbsuzwzs7zvoYR6/Nq99JjjPUvrAYjGyNA+JY83Givpm4zgQaVaMjlUDL7P60M2IdgnqdqwMs
	AcBnMp/sRjd/AGywmzM1gY9ED3Ed2tee5j6fd1RcHoPPch9p4Zqr9H5uZKKaiYWsk7CvNKJwi4Dmt
	ugfj3l/7HG00hmZO5k+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv2d6-008K8v-2l;
	Mon, 23 Oct 2023 21:38:32 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv2d4-008K8S-0V
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 21:38:31 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6ba8eb7e581so1013705b3a.0
        for <linux-mtd@lists.infradead.org>; Mon, 23 Oct 2023 14:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698097108; x=1698701908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGTaIiLcMupEsei29bcrL/cJFNG/0pnU4S8BshoAY4I=;
        b=gPw2+C9HqNDrhd6PytcQjZrRyP+7lv3s3Qipdi5WHZSYePibBUWLVTYI0Yy2GBppn/
         lD8wkz4u83ZHmqXRP5aJ6G+fLx9xUB6t4qWRnb79l8WySKBdNd0S7KWiuE235Qi5VeTo
         +8xfCEUNV1QO8OBCMD1j5h5e6U9BQXKfbn7mpQv6F6H2ESGu1NknB/nWTNBe+qeB40+V
         KjUAlsvK3OA1ju3ou9ppfMLIDSCatvrzyzb2hlN8PcE1SOJhwGnKgJPQHmDKgo8e66rB
         uW+jAi6CTEPght9qm7mLtu5slrz9U26uDxjZybW4I5OcVBXaAXgMRx3TEybBn6xAYAoK
         VSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698097108; x=1698701908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGTaIiLcMupEsei29bcrL/cJFNG/0pnU4S8BshoAY4I=;
        b=IeQqMzS4xBc9Qaw/AmSzXG3Gl4DFbEt3aAU+LKOXXIaM3M8aF2YsIPpfwI7zn6P1+e
         W7pEMHK+YzwBccWcRMEc1JENoO6ALU+FTZx5LK9HQMhpY7zFTPG2A080oI4fuvQOUic8
         D3kfaFM6aDiCaDIkXv1zyNR2/Rx+leqiYpxtDEQpHlbnD+GSYK+k9LAJGuu2IusWZ68f
         qyRZpgH7WpPHR/ZiVqUyBPqJvcqnGdtWGq7a8a/eSpS3j7KthzpNTYzIq1EIr49zGmv7
         tBl3U1GJL4zX8DF/9zoJ2qkzDs/E9xNS//DO7ZitoG4v/ICBZEjeXI44plAFHe1FbU6b
         M0rg==
X-Gm-Message-State: AOJu0YwDqzNSqsZbK1texMPb0C/Ij6f3vVDVrztF8B0QqyOeqPMp+Ryb
	T8ZqcZR+1B12qGcpyWcdtS4=
X-Google-Smtp-Source: AGHT+IFcGZJAxqYnF2Rh3jBUsD3gnX0Afhni7L1Fa3HV1rfNCJUxf4KpiP9RbDdC5GW/kIp+Ufnukw==
X-Received: by 2002:a05:6a00:1c86:b0:6bc:ff89:a2fc with SMTP id y6-20020a056a001c8600b006bcff89a2fcmr11291151pfw.2.1698097107690;
        Mon, 23 Oct 2023 14:38:27 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:45b2:415b:9cbc:fca3])
        by smtp.gmail.com with ESMTPSA id x12-20020aa79a4c000000b006bf536bcd23sm4609799pfj.161.2023.10.23.14.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:38:27 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: michael@walle.cc
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
Date: Mon, 23 Oct 2023 18:38:00 -0300
Message-Id: <20231023213800.2599704-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_143830_196776_DF99E070 
X-CRM114-Status: UNSURE (   9.89  )
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

From: Fabio Estevam <festevam@denx.de>

Add support for the MT25QU01G 128MB Micron Serial NOR Flash Memory
model.
    
Datasheet:
https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_01g_bbb_0.pdf

Tested on a i.MX8MP based board:

 # dmesg | grep spi-nor
[    1.854474] spi-nor spi0.0: mt25qu01g (131072 Kbytes)

 # cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 08000000 00001000 "30bb0000.spi"

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/mtd/spi-nor/micron-st.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 8920547c12bf..da2f8992bbc0 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -429,6 +429,13 @@ static const struct flash_info st_nor_parts[] = {
 			 SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x21, 0x10, 0x44, 0x00),
+		.name = "mt25qu01g",
+		.size = SZ_128M,
+		.flags = NO_CHIP_ERASE,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.mfr_flags = USE_FSR,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x21),
 		.name = "n25q00a",
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
