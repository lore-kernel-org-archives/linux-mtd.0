Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DD6C7618D
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 06:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sr9uiQQdZOtGzKJQYM9A6URG4YbcgaHj91yzGxvW+dM=; b=tDtsryTbKBtG/E
	IxZHx6dSVQwbjRNhVRYN/TuW0SLLQ+Z3Orhf9qAR2anwV/QfQ4HIHpe5fuwAIEGMHsYa9ER5clE3n
	Zuk8fRyKZwJbvBKCrfDCaSyl5Wr/+XF19us6Y5DaQBx5r/7k1duSRzT7VggZkUH0QbMogwOGPxEnC
	kj2wDCQxl5LNnwe+pYZAeod+BGTV3UnbiMgctQ0B6T7bysRPURBKllMAzY3VeSjqeJP+gfVpUBJ1X
	FQbpQFQsC/TOeDH8jITdw0TVnZ7BcbzgNWV4CdyPFN3ZS1F6A0ErJ5duiv6oJgkgSz1NV2r94RZX9
	UVyEqv2jYu2v4uFRQucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIxx-006T1I-0M;
	Thu, 06 Apr 2023 06:19:25 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIxv-006Syz-0R
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 06:19:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id q2so536483pll.7
        for <linux-mtd@lists.infradead.org>; Wed, 05 Apr 2023 23:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680761960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sty9Vva/GZquwXe+pkd6Nxrz8bwsIEDg04w2eW4GIY4=;
        b=PzZpfsU05I+yIXdyZ7fWa7xta9KGc9oRQ4jahd9ohMKKTIxrAVuyJ+ECtFOo3vY1AQ
         e3TQ+lyqEr9pk0e78nenNwDaq3HTgkxI04HFSoBzWYEOleTk/lZDsIQhTevS7Berac6M
         Gm+tUDuKncGHZhJfMFa/YD1XTrI2MuXaw7rvDxYVvnmnRxMFW3TPcK+N/MMNrjNDP8o1
         2ide2uHM62MDMf9Wa1XxWCg0Oh4MbTN/YYI+SHyZH9a8ruZfnxWG690RZg82Os15UmIn
         j+ObSdTTP6GRoTd/KFj1SKP/J+DEQ3vPUDakq6pj8jW27V1XKH4XQZH8muA/HEtduaio
         NPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680761960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sty9Vva/GZquwXe+pkd6Nxrz8bwsIEDg04w2eW4GIY4=;
        b=mn5rQe3ilYYP0zuhlznd0x3scoaZXgzgFV/ZFuEEaCFiwOvmNHfj4kYUEEymuvJF2x
         sVtJnrCxp+tfkJ80R6fyI9IenrhrKbY9giPNrFtyTxFhJscwSlWpwsN8VXVJJE6oW/Fp
         qVQy1CTZb0XBVaH+9ykg0xR8szCSeYSwmc/R9yvdg5B3akRALneNhuLj8dJHxN9OHJp3
         zSERNFGwMXoB9AJbPcRe7XwFlns2Q5rqr0jeHA4pYZRD2zVoFcB+nVCSLJilSITyqkRh
         x7ecp22m+iUMMdLk5qyQTkrh41RUORZpstXum+NKUXuOdA4neqO8kyv7Es0S/MXIMqoV
         /o3w==
X-Gm-Message-State: AAQBX9dEgPGGDG7fzM6LwtcXadybI1YZ1M3QJLk3Ce6Pr/BQ02HNIisx
	XUyv6iDFh5dYbdF8RRjJHAjXeUMbKOTDIA==
X-Google-Smtp-Source: AKy350a5PmVYGieRzdbmwQIwu59hYwSdWrCJncTeD+IL3ETanYlqqZwNSr9YSJ0iVkF4Yhz+Rd9xVA==
X-Received: by 2002:a05:6a20:c101:b0:de:5082:c9ec with SMTP id bh1-20020a056a20c10100b000de5082c9ecmr2101260pzb.2.1680761960242;
        Wed, 05 Apr 2023 23:19:20 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-38-119.msd.spmode.ne.jp. [49.98.38.119])
        by smtp.gmail.com with ESMTPSA id 18-20020aa79152000000b0062dbafd2980sm450542pfi.65.2023.04.05.23.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:19:19 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com
Subject: [PATCH v3 1/8] mtd: spi-nor: spansion: Rename method to cypress_nor_get_page_size
Date: Thu,  6 Apr 2023 15:18:52 +0900
Message-Id: <1dda9f6c85468e1af10b60d8be365efaf9c4f297.1680749577.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_231923_173297_59D28DB6 
X-CRM114-Status: GOOD (  11.51  )
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

From: Tudor Ambarus <tudor.ambarus@linaro.org>

The method queries SPINOR_REG_CYPRESS_CFR3V to determine the page size.
Rename the method accordingly, s/set/get.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index ffeede78700d..c937f0ac61de 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -302,8 +302,7 @@ static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
 }
 
 /**
- * cypress_nor_set_page_size() - Set page size which corresponds to the flash
- *                               configuration.
+ * cypress_nor_get_page_size() - Get flash page size configuration.
  * @nor:	pointer to a 'struct spi_nor'
  *
  * The BFPT table advertises a 512B or 256B page size depending on part but the
@@ -312,7 +311,7 @@ static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int cypress_nor_set_page_size(struct spi_nor *nor)
+static int cypress_nor_get_page_size(struct spi_nor *nor)
 {
 	struct spi_mem_op op =
 		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
@@ -368,7 +367,7 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 	if (nor->bouncebuf[0])
 		return -ENODEV;
 
-	return cypress_nor_set_page_size(nor);
+	return cypress_nor_get_page_size(nor);
 }
 
 static void s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
@@ -407,7 +406,7 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 	/* Replace Quad Enable with volatile version */
 	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
 
-	return cypress_nor_set_page_size(nor);
+	return cypress_nor_get_page_size(nor);
 }
 
 static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
@@ -502,7 +501,7 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 	if (ret)
 		return ret;
 
-	return cypress_nor_set_page_size(nor);
+	return cypress_nor_get_page_size(nor);
 }
 
 static void s28hx_t_late_init(struct spi_nor *nor)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
