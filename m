Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C84EE57D5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 06:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MaDlm1oZwt9+N/FM/OzI5lEiC2GhEwiWDXxBaNrfHck=; b=l7225ckdpkO3YF
	+ke6so1DNspvbhj8Emw8/GeI1b12uxkq500jNZzH78R7LDwmtmHjg5Rw0vWmJunvq96oqMOmyKT8Y
	rjj4aUYO4VJfAIVbPjBBBzXI+yD3rG4Iu7EF7Ie6mCdFYfO99Uwb6/kov7hz4FQRCOuU0jbDYmNOT
	SmqtWXckpzCMzmvzqdOcwtFiAb/vjhHReThucMYz4fDckpwDfxufzQdklBo/DYgPs5xqZCU324hCs
	RMye5lFYPiT7M5q4Yh+avsISUaJPYDNfDH0KSKgiW8WgA6g6m3/INm424h1NZV678h+T6dxDmhN9r
	0RoH312x3P6N8mtgz3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVD8-00DBKN-0m;
	Fri, 08 Sep 2023 06:43:22 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVD3-00DBHa-2J
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 06:43:19 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-68a440a8a20so1634729b3a.3
        for <linux-mtd@lists.infradead.org>; Thu, 07 Sep 2023 23:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694155393; x=1694760193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItrCPx39u1/xI38sWQM2nBZglN8/qhe6e+Zp89R6dwc=;
        b=IaXWm47ZkHfRJpdz2le7TCMklgU4hacknfBKRZL9/FaHdTsni1x5sgm1qlXrytICjn
         ySjCALJO8s8Rl1pgRrmejJck/ds4GrmqgzCcRpk+Tx49iuU9rNHbolYT8A4By36miWx7
         YusY7XbsVZGdqJCcdEjXbRIEC3c1E+0iVbw0Y1JCOpgaXObNaoFUsX+chCbDuiMNZPYE
         887VmwpuT22KLzx2IUjQsOpGpXqPyzqTUnSD8O6vJchguY225zjODL6xVKwvOIgmpaAS
         xgxRWvfsCK3jmBSyDtr9P/bl2v+J1qIAnM4aCoWAexYabAAcfQN1lvq9zdbM8t/LfIDq
         teRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694155393; x=1694760193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItrCPx39u1/xI38sWQM2nBZglN8/qhe6e+Zp89R6dwc=;
        b=gMZQ30F5auMVguEfVoYF3eZwRmDUIK4ahjSzWSdWVtC0l1likRwzxtd2Vy53gDVGBa
         hSFea5SyWl78Ry1mm7BENs/a6WvPLt6pa160w6kYiMal/zCe67fnQPC1+0D3jCNfAoFT
         UgzAcUOEzqXL4cR2e3o0hmv+eOn/8o80wm6wD/EAf5KCYLUhmUxUVVnCQI5zavfU/uUJ
         MhN2mTG4f9uwYWkLwz+oTuxfC8aKOyMNjlSqi80oW++KPa4ifr7SCKgkVUBQKKNzqpFq
         GaEJvWkAHnU0xTAQ4wsj1cg0CYDKiLSnXnoGGwcAE/qTqPb6WRaQz3gZPoZl05rtyWqA
         DRGQ==
X-Gm-Message-State: AOJu0YxukybIK1e1CRhwFiIxVz/4HB6B1HdrsWS5a2JZpbxpy2uGEbkg
	kJBBS4wcwTZFMKjK+sikBz08KUwgPOE=
X-Google-Smtp-Source: AGHT+IFFbuhloBS/ZraftE4bm8W7CGDb13O3hc+5CQc2+ij4k+X/JvnJOaJ9U0i8qQTi72T+zqY+wQ==
X-Received: by 2002:a05:6a20:2584:b0:14c:d494:77c5 with SMTP id k4-20020a056a20258400b0014cd49477c5mr2155871pzd.13.1694155393205;
        Thu, 07 Sep 2023 23:43:13 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id w24-20020aa78598000000b0064378c52398sm681847pfn.25.2023.09.07.23.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 23:43:12 -0700 (PDT)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 6039880E29;
	Fri,  8 Sep 2023 14:45:09 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v4 6/6] mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
Date: Fri,  8 Sep 2023 14:43:04 +0800
Message-Id: <20230908064304.27757-7-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_234317_757976_870DC6CD 
X-CRM114-Status: GOOD (  11.97  )
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
