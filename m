Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD6BC3DA49
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 03:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpcmWaV3giZ60yXsmN/9ot4M2/nSGG+L4UnQr+jiIIw=; b=mw/l6hSMptur2a
	mQxstiwa8lSW+v5PNzr5xbI0xT/t/Es8m2/8tpO1Jby1ZypQdbLR/VRoKz1n4u97RyIAdoNqAlCF2
	SDgvWCFakzIUAe+He1HbjAUH7S4U2YsZMPuKMyqUkXwW321avgqAQ9WV4i4Dfk1yl+LtZkK8WtLYC
	JAclzbKFeUtR0OrghJNGIqUDESmNxTDlfjQF3D9RdZtCemSfn7s7Uh/2rWeTRV/ICiCiDELnzTozf
	tagWcDyVDcgL24S/huF0MDGmjNHYKFZ+J13ZDOhMjHYw7fC0UM3ChkYh5KaocZlLBizDPlhN/p/9E
	OKBo3WVB+E4/m0HfowHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUI7W-0000000FeWu-3zS3;
	Thu, 18 Jul 2024 03:47:54 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUI7Q-0000000FeQy-2TYo
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 03:47:50 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-70b09cb7776so245166b3a.1
        for <linux-mtd@lists.infradead.org>; Wed, 17 Jul 2024 20:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721274467; x=1721879267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zK8A6fJKM9NFmReipLfzB3Jrm/Kc3i4yYA6+cJCoL4w=;
        b=EXLbnSQVSCyC+rcb2d6tzXnmdGx3BJqUSFf+F4PK6eWCsOo75J2/ynYETPs9GKhxUq
         1P+MWOAyFN/CB0Wvuk3NWu8JC+rLGJQDW+Wt5NL/Ig8K7Q34d3eDektJE613wY02HZCz
         SwFcDv6Vagvrh/MT/pAxj7vNOdFPROF3uufx5HJZ1PIyxKs3nx0Sdl5ER3NCha0sBh8Q
         TjpfKafvtWiIllkBcT2ff1vxtFvhJ9cVsTRYdv12qLHTqjDzzVrn0u5zgnV2hk+7b/52
         9a4zWHPlNB5du5tj5k82+RrfKrg5wMRfutAupH5+hdbxvoR7HNKTZslSF7JJ6XJBjz8T
         pVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721274467; x=1721879267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zK8A6fJKM9NFmReipLfzB3Jrm/Kc3i4yYA6+cJCoL4w=;
        b=MSBRXIA9b4DgnppcAFkbVAY5VUPcO93xHVmOtAiqUYAj8ndUp0YRRqva416ng/uSd9
         bs79ARpsMBjZ2tzjslf0IDwXDNlKATn9Z42Ep8yXaY4yQb0pTzuyDlGjG+h/GYoSFyF6
         JecF9nbCfMKsX11j7zt5/uh9d9Dmf9ltqv7VpGiDvFELxAeOIPvdoMLAMcRzj9Mpqjjl
         A91A5+2w/7c7z9DSWSqNVIp2U4l3C0Q8gTE1c3qfSsne2Ec1XEnVi6bCdjM0/GBQpvRQ
         SZjf1boCtv4X4C5jmXanhvsxG5++K8/vIEfWRmLtUkFxt0F+sOszrXX5CKDm9kYSgg9U
         AIfw==
X-Gm-Message-State: AOJu0Yz+Yp+JUq97JWYmA5eAB7Yevr4C+w6KdM8vMBhrSIGkql/4tqZK
	hUQPz1mM6PspKh+YXtdxTtXLSvV8jjXgqT/YCLxSpW4lC5q/+0W0
X-Google-Smtp-Source: AGHT+IHcTZWJKp3I6YvIAQebjFHORQTS8t4I/7NrZuEmULEE/tJlq9btyx9tt8pVYcgcxlGPtM4xQg==
X-Received: by 2002:a05:6a20:db0c:b0:1be:c2f7:275 with SMTP id adf61e73a8af0-1c3fdd5afffmr3572006637.50.1721274467440;
        Wed, 17 Jul 2024 20:47:47 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc62e57d6csm1770455ad.43.2024.07.17.20.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:47:47 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 53C0F800D3;
	Thu, 18 Jul 2024 11:56:58 +0800 (CST)
From: AlvinZhou <alvinzhou.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: chengminglin@mxic.com.tw,
	leoyu@mxic.com.tw,
	AlvinZhou <alvinzhou@mxic.com.tw>,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v9 4/6] mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
Date: Thu, 18 Jul 2024 11:46:12 +0800
Message-Id: <20240718034614.484018-5-alvinzhou.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_204748_734669_8CF2E368 
X-CRM114-Status: GOOD (  13.62  )
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

From: AlvinZhou <alvinzhou@mxic.com.tw>

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Parse BFPT in order to retrieve the byte order in 8D-8D-8D mode.

This info flag will be used as a basis to determine whether
there is byte swapping of data for SPI NOR flash in octal
DTR mode.

The controller driver will check whether byte swapping is supported
to determin whether the corresponding operation are supported, thus
avoiding the generation of unexpected data order.

Merge Tudor's patch and add modifications for suiting newer version
of Linux kernel.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
Signed-off-by: AlvinZhou <alvinzhou@mxic.com.tw>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++++
 drivers/mtd/spi-nor/sfdp.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 5b1117265bd2..21727f9a4ac6 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -671,6 +671,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		return -EOPNOTSUPP;
 	}
 
+	/* Byte order in 8D-8D-8D mode */
+	if (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_BYTE_ORDER_SWAPPED)
+		nor->flags |= SNOR_F_SWAP16;
+
 	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
 }
 
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index da0fe5aa9bb0..d90cbd7331f7 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -130,6 +130,7 @@ struct sfdp_bfpt {
 #define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */
 #define BFPT_DWORD18_CMD_EXT_RES		(0x2UL << 29) /* Reserved */
 #define BFPT_DWORD18_CMD_EXT_16B		(0x3UL << 29) /* 16-bit opcode */
+#define BFPT_DWORD18_BYTE_ORDER_SWAPPED		BIT(31)	/* Byte sawp of 16-bit in 8D-8D-8D mode */
 
 struct sfdp_parameter_header {
 	u8		id_lsb;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
