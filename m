Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91843C6FD18
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uz4eREfnutITiK4lnJ7hDITmW0MqMZaGxSET7r0oy5Q=; b=WjvmOvf9RkxSPg
	J1/qTDt2u1LCUAMh+XCpSOuVBNCFhBmc/0JBmA+OlF7IQvxLFYy77zlheKFpvcbTarptcRYvmqNSZ
	qjUrmHmaIr9tcNJqdfGxZShxCEwBl5Hbff29TaDzXTzjq/AAVivv2nqx/MoGV6+WMJWgVXqOhJCTo
	X/jziArjyA9kM9+2kB4AM51KzEhmuISmh+CCM0DwwjEcbickUwQtUHOlYjKsYW82G3aOfPzFmlDMs
	g335PCaFW6dShwGgQYCFwQOudWwLhPMjQjWxL/XBywg7CpUY3BC5ZHZGKDxgzJTestLSl+QboMabk
	XCF6mZhSygucJBwgZAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piAdD-006YUB-03;
	Fri, 31 Mar 2023 09:01:11 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9Sl-006CsV-1w
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 07:46:21 +0000
Received: by mail-lj1-x231.google.com with SMTP id by14so2958011ljb.12
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680248774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoM5IcMFOlwAkgefBXvzdq63SNxS3h5z+T8L5WUCxbQ=;
        b=eWwksvi7bY0KdPMtgyCCYi0QRvj0uj6OuIt3slYMOQ37g7a/+rwy0JTpyRCPut3O7i
         SjIr6xxbm50xmmAD5NdfS/WekYRwiYefyFA9xlN3metimi6tSDOq3T+xWfQSBU/ZIxTE
         aucrn9tGeig0rFmBF5V16+e1c2V2Olmr5H6ALfbpx8uqtPYTNcs5AKFjC2SzKRevteif
         VS7GaJJ1L3M4vPL6ItjcMQvG4/Gfo8oUU3U0JwTU0ody6ka/GPQGcJeQzzjjHRpiJSjf
         5FbvW98MO3kTyraSi6XDnKDoM4PCI9SXZuQm5C6uXEOfzvr9623bf9HxA8LcuMkKi77P
         +vxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680248774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoM5IcMFOlwAkgefBXvzdq63SNxS3h5z+T8L5WUCxbQ=;
        b=oYGA1BFlOUm15alChrkSI+o7qf6WHUls9ibO5u5Y0zyoaE+jfuvH6n/ZLyc82qflhJ
         VBEh867xL2eFNo5J1MYrxEJh/WoV/iKNHmFBTHKZzmYNuhyjZdPms/S4aUwHM2uqRdfF
         oD4NSTbvsYrSNz4WpwYYMwcMWP2sCLPq27nHo0I1yA6wMeDc0AWmmpxu40qjiGBJ5MaP
         XyBoPYUTGYHbiQc9s8b4k+m7Y6r3mlb5d+Yo7/a82BabroawvYeOPCfUPHvaGG2/WkBq
         brgVNjAHSgbBO0GH2HqLA1sJy7sg0oFGXCTaSSpFop+yD6KkBX7aOxcFwC2kLfb/f+pi
         kcZQ==
X-Gm-Message-State: AAQBX9e662uaIx0am2bDKVTsFFLxPPRU1bxb7FPQXHIyudBngukzSc4T
	W6xOlpKVt7SQDkANcyT5sOKORA==
X-Google-Smtp-Source: AKy350ZvvmiQEQeJV0rJBPeHTPNfWqhIEkTZVdJomaf/QsxtJ4WB3dJCEvZpAAsVlcpNlFq6ICZ1gg==
X-Received: by 2002:a2e:918a:0:b0:298:ac88:8d51 with SMTP id f10-20020a2e918a000000b00298ac888d51mr8205985ljg.42.1680248774455;
        Fri, 31 Mar 2023 00:46:14 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020a2e8794000000b0029573844d03sm241201lji.109.2023.03.31.00.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 00:46:13 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro.Kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 02/10] mtd: spi-nor: core: Update name and description of micron_st_nor_set_4byte_addr_mode
Date: Fri, 31 Mar 2023 07:45:58 +0000
Message-Id: <20230331074606.3559258-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
References: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_004619_721280_7DB93E34 
X-CRM114-Status: GOOD (  10.22  )
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

Rename method to spi_nor_set_4byte_addr_mode_wren_en4b_ex4b and extend
its description. This method is described in JESD216 BFPT[SFDP_DWORD(16)],
BIT(30) and BIT(22).

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c      | 7 ++++---
 drivers/mtd/spi-nor/core.h      | 3 ++-
 drivers/mtd/spi-nor/micron-st.c | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d104c81f22c5..07be81afdc33 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -539,15 +539,16 @@ int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 }
 
 /**
- * micron_st_nor_set_4byte_addr_mode() - Set 4-byte address mode for ST and
- * Micron flashes.
+ * spi_nor_set_4byte_addr_mode_wren_en4b_ex4b() - Set 4-byte address mode using
+ * SPINOR_OP_WREN followed by SPINOR_OP_EN4B or SPINOR_OP_EX4B. Typically used
+ * by ST and Micron flashes.
  * @nor:	pointer to 'struct spi_nor'.
  * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
  *		address mode.
  *
  * Return: 0 on success, -errno otherwise.
  */
-int micron_st_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index d5cb42245820..d8e3fd60d6ee 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -648,7 +648,8 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 int spi_nor_write_enable(struct spi_nor *nor);
 int spi_nor_write_disable(struct spi_nor *nor);
 int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
-int micron_st_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
+int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor,
+					       bool enable);
 int spi_nor_wait_till_ready(struct spi_nor *nor);
 int spi_nor_global_block_unlock(struct spi_nor *nor);
 int spi_nor_prep_and_lock(struct spi_nor *nor);
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 3bbf65234ebd..a75f0f4e1c38 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -425,7 +425,7 @@ static void micron_st_nor_default_init(struct spi_nor *nor)
 	nor->flags |= SNOR_F_HAS_LOCK;
 	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
 	nor->params->quad_enable = NULL;
-	nor->params->set_4byte_addr_mode = micron_st_nor_set_4byte_addr_mode;
+	nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_wren_en4b_ex4b;
 }
 
 static void micron_st_nor_late_init(struct spi_nor *nor)
-- 
2.40.0.348.gf938b09366-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
