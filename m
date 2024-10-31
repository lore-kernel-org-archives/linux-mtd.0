Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A25DE68948
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2024 02:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJluQkyGCXvmrGn311rW+crJuYc1fa/GUIEkJI66AG0=; b=dNlLHUIiF5C3eD
	tyndcCmKBnfL+8mgTs070qqv4hLzeTf2TgWBn0xy6vVG0mP7dyEXc+KLfwuseB16xijAEYXc1rrTJ
	4MlvlKmFR3fqRU56A5b8Td8JUoNG7ge/JAcTY+83UEZrOzGH07xxecpV0rLC7BEJIfZcGggyok6IG
	zBqfbkVpnoQa6p19X8q3VMmbK+YRIDF9gS36bejCFfB18589gkcznrwbEQ5m12jdHpPx1I3/uzDKA
	ZTO4S8wLOJEvlxmtRr/ySxUkOQZEoASP7pzTNCW7fdTREp/63kkB/CFaXCmMWkmZVWNTNSMvUtqfF
	nmj6jFzwZmdQt0drRvWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6KpC-00000002LLr-2Jdm;
	Thu, 31 Oct 2024 02:22:14 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Kp9-00000002LLI-2hNc
	for linux-mtd@lists.infradead.org;
	Thu, 31 Oct 2024 02:22:12 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7181eb9ad46so206495a34.1
        for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2024 19:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730341330; x=1730946130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qg3nOR6O9nmMHW2fqlRk6H7RI+wvXmFOTg0C/waWQbs=;
        b=T9CSAK4dcE5JDLGI3tCj4LTYUP4O2XKfSjdVEq1dVSCBvW28A7S5bt7zSXP11QWbUX
         v2tf6pALraCGBsjkqR6wI4dqFdZuky8x0H2YroPMVEca6mqf8C3XcGMyH31mIJC3xef2
         mFZf4RA31RcIKqpJF85pVAoLrFT9rtRewUVB9Zc7f90/YJdphhJgdPeN9/KuS+wx7Fqn
         YDa3LLDyKUDTeWuJlDFzTA1pCJWmMxvt+K/JQ8HbIG8/dzOV4PB57TvigTkoZdabTELv
         CT3kSDm44anjIWAcFKQlWt5E8ZSchxoBQtGN+t6AVldzV72CuqihyY3INlngtGQqtGDM
         6RSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730341330; x=1730946130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qg3nOR6O9nmMHW2fqlRk6H7RI+wvXmFOTg0C/waWQbs=;
        b=YvVTocw13BpeCDYiQobEGeMW0mN21TXfqX0QxdMAF+YBgGfExixdqDd0Ok5P19JhTN
         ePldKi4rl2QIwYUsIvGmpdY4RdIOg6GWpwgkZDFcP5VnjHX6BIZmzs4uC+zC3miKw+XT
         Rrlt7u6w1/R3pFr5qixfe2JjEpoi/73kSiBpOYa/JzaGPKCyj0tK9IVtfHz6Cqh8rbad
         7cXZB623MH5ONzmVLLBntaNH6Lo5DBDBGk1qS1kln++BRq0wt1qbEwRrx6fv7dsVjs1E
         oJsGRxxno5Z5dRS+MUMt27zl2Qr6U8hZAGQ2ieAl3pMBs/4pN9mfUGFviA0BsbmGDl5b
         TuJw==
X-Gm-Message-State: AOJu0YwES7ksRGXnPcPbYqYo2FacuaAZw3Zbxww9nwtv/vlqh9seQN5M
	8IaWe6qoqHZieiUDhcy1mQvioeT5hFP+j+hfybaKgpCoxS4mZhDC7t+n4w==
X-Google-Smtp-Source: AGHT+IFS+7L/9JKD9iAqfi3Z0JR+AJN0KFlgRvSG2FE7LwcHM/ifds+9sg/t/B4vu0Zwjv44dWmL5A==
X-Received: by 2002:a05:6830:6383:b0:710:fa7e:e002 with SMTP id 46e09a7af769-71867f195d0mr20403551a34.5.1730341330525;
        Wed, 30 Oct 2024 19:22:10 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee45a0f4e3sm269731a12.87.2024.10.30.19.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 19:22:10 -0700 (PDT)
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
Subject: [PATCH 1/2] mtd: spinand: Introduce a way to avoid raw access
Date: Thu, 31 Oct 2024 11:21:54 +0900
Message-Id: <81c9caf04c94cba1a5ae4ba79dd09e0789583fcd.1730340421.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730340421.git.Takahiro.Kuwano@infineon.com>
References: <cover.1730340421.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_192211_710571_EB03B146 
X-CRM114-Status: GOOD (  13.66  )
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
support raw access. Read and write page in raw mode for the device
returns error.

Checking and marking BBM need to be performed with ECC enabled to read
and write the BBM correctly.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/nand/spi/core.c | 12 ++++++++++++
 include/linux/mtd/spinand.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 4d76f9f71a0e..de04f6e7ce1e 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -608,6 +608,9 @@ static int spinand_read_page(struct spinand_device *spinand,
 	u8 status;
 	int ret;
 
+	if (req->mode == MTD_OPS_RAW && spinand->flags & SPINAND_NO_RAW_ACCESS)
+		return -ENOTSUPP;
+
 	ret = nand_ecc_prepare_io_req(nand, (struct nand_page_io_req *)req);
 	if (ret)
 		return ret;
@@ -639,6 +642,9 @@ static int spinand_write_page(struct spinand_device *spinand,
 	u8 status;
 	int ret;
 
+	if (req->mode == MTD_OPS_RAW && spinand->flags & SPINAND_NO_RAW_ACCESS)
+		return -ENOTSUPP;
+
 	ret = nand_ecc_prepare_io_req(nand, (struct nand_page_io_req *)req);
 	if (ret)
 		return ret;
@@ -902,6 +908,9 @@ static bool spinand_isbad(struct nand_device *nand, const struct nand_pos *pos)
 		.mode = MTD_OPS_RAW,
 	};
 
+	if (spinand->flags & SPINAND_NO_RAW_ACCESS)
+		req.mode = MTD_OPS_PLACE_OOB;
+
 	spinand_select_target(spinand, pos->target);
 	spinand_read_page(spinand, &req);
 	if (marker[0] != 0xff || marker[1] != 0xff)
@@ -938,6 +947,9 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
 	};
 	int ret;
 
+	if (spinand->flags & SPINAND_NO_RAW_ACCESS)
+		req.mode = MTD_OPS_PLACE_OOB;
+
 	ret = spinand_select_target(spinand, pos->target);
 	if (ret)
 		return ret;
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
