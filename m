Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D365C74A5B
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 06:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCDAzyVse590iZVwKfjFZgWPBaGb0ZanYlH02xYPuRk=; b=YrfPWsAuabXOPO
	6ba/5WVv/z9BoCIQBZe0nJaOSh+ViuDZV1jX+3+9fJPz0bF03ckIAwtDGSB+bQBdCuW7pCJ2KBqXs
	di7gZDr0P6x3974Tkdiwm9tSf89zRvXlm/wzWoOo0zhUuA87KTF0/L5P7bK/iX/G03QK+zu8vSj+8
	b5AJCZs/tmFoTAORQTrv9pcswkbxVTR2eFrCw6bnUjPysG0K7jUFgNC9lvOgdg862z+8kKmmfuvY1
	X1/1TFCHSvXcCELNYMXo4XEISxRWM4WUkxMzNsI8CLk2wcMojCnAl6jehqDO4LVOhHiKWB0Wm6vp9
	ZIUPb2pNUdwZ4KSNs8Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9M-00Etmd-11;
	Wed, 22 Mar 2023 06:40:44 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9I-00Etjs-1W
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 06:40:41 +0000
Received: by mail-lf1-x12f.google.com with SMTP id br6so22041739lfb.11
        for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2023 23:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679467238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlGRV4Vhjc5QjOFgeSLcd0kZILFPjn08+TF/cmBPkFY=;
        b=uCKZa9QeBxerqrIsMoSQJ6uqAnomCynjZFwSl6qEn4TFlAEjxOPbHVrJB7E0BkwkTx
         SXiuYJCPdb89tZrSpddToqvKlV7M9biNNoTmfIIfiysX6PDTK6RgMj8IR821PiCndIeh
         V/MKInlsxlM3klGQKHXOBuH78FiYRdDxdaBgLTh/JjXDhug7nNmIh4UabesZkBtEQNXF
         oFZrCJteY8SDzfZQWVMeOUQ51rfeLvY3FDRe8QBZPsKL9JyvIwABfa0x0eCkVA+D/eSL
         K3XBdNI3USnjqXe5SRvKWHTEU6c3uJviMNSALz23RONNIjw9XZzrgmc+o+X4xm27vf2O
         1l7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679467238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FlGRV4Vhjc5QjOFgeSLcd0kZILFPjn08+TF/cmBPkFY=;
        b=ae+GkH2j3FNMnXlWn3+CFj/QDLNx0JJXqnby23O8ctotal9qfrXgx815si3PsQf5U9
         7aiAx1/tbz/KIsm0pCfgdO0S9GLffoauL/qlPXwT9rQv5uVcuqL8YY1wTcinYEEElTT0
         045bM4/4i+yt1kw8YIR1ymcrdrewBMd4UFHs+fdCfgnGZRjq8XsNAxvnTRKKH6s8yjpP
         krfxAT+4nSLIkJDnnxXevcjBlMsLoMMbttWjQILkbkjuWOZIdDGFs3KlCO/oS+K7ROlI
         qnCKgfTDzglgjhU1Km/bnZC70qLGybGBT5vQofU+vnggNnCsfqBEQV6fT7P70UcvbsK2
         OaQg==
X-Gm-Message-State: AAQBX9cjDwAnneq/OWWzoAarCZRsng8o9RNEehTAfDIHgNoBBdyAcJh5
	4PI8Q/ZJBWyBlyTvHQ+4EKiqaw==
X-Google-Smtp-Source: AK7set/gJMXStUd+2nNEyzeYJ/hzFyEM8ObZQirw/aRa36i7qRDdFoYiAf7/P5XnmOpjKyZIf1YtLw==
X-Received: by 2002:ac2:48aa:0:b0:4d5:c96f:f7c7 with SMTP id u10-20020ac248aa000000b004d5c96ff7c7mr1606305lfg.23.1679467238091;
        Tue, 21 Mar 2023 23:40:38 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020ac242d4000000b004dafde0e7b7sm2462255lfl.279.2023.03.21.23.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 23:40:37 -0700 (PDT)
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
Subject: [PATCH v4 01/11] mtd: spi-nor: core: Move generic method to core - micron_st_nor_set_4byte_addr_mode
Date: Wed, 22 Mar 2023 06:40:23 +0000
Message-Id: <20230322064033.2370483-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
References: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_234040_506627_3E94BAF8 
X-CRM114-Status: GOOD (  12.66  )
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

This method is described in JESD216 BFPT[SFDP_DWORD(16)], BIT(30) and
BIT(22). Move the method to core.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c      | 24 ++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.h      |  1 +
 drivers/mtd/spi-nor/micron-st.c | 24 ------------------------
 3 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0a78045ca1d9..8d246b1b439a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -538,6 +538,30 @@ int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 	return ret;
 }
 
+/**
+ * micron_st_nor_set_4byte_addr_mode() - Set 4-byte address mode for ST and
+ * Micron flashes.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
+ *		address mode.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int micron_st_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+{
+	int ret;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_set_4byte_addr_mode(nor, enable);
+	if (ret)
+		return ret;
+
+	return spi_nor_write_disable(nor);
+}
+
 /**
  * spansion_set_4byte_addr_mode() - Set 4-byte address mode for Spansion
  * flashes.
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 25423225c29d..aa44474c042a 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -635,6 +635,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 int spi_nor_write_enable(struct spi_nor *nor);
 int spi_nor_write_disable(struct spi_nor *nor);
 int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
+int micron_st_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
 int spi_nor_wait_till_ready(struct spi_nor *nor);
 int spi_nor_global_block_unlock(struct spi_nor *nor);
 int spi_nor_lock_and_prep(struct spi_nor *nor);
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 7bb86df52f0b..3bbf65234ebd 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -301,30 +301,6 @@ static const struct flash_info st_nor_parts[] = {
 	{ "m25px80",    INFO(0x207114,  0, 64 * 1024, 16) },
 };
 
-/**
- * micron_st_nor_set_4byte_addr_mode() - Set 4-byte address mode for ST and
- * Micron flashes.
- * @nor:	pointer to 'struct spi_nor'.
- * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
- *		address mode.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int micron_st_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
-{
-	int ret;
-
-	ret = spi_nor_write_enable(nor);
-	if (ret)
-		return ret;
-
-	ret = spi_nor_set_4byte_addr_mode(nor, enable);
-	if (ret)
-		return ret;
-
-	return spi_nor_write_disable(nor);
-}
-
 /**
  * micron_st_nor_read_fsr() - Read the Flag Status Register.
  * @nor:	pointer to 'struct spi_nor'
-- 
2.40.0.rc1.284.g88254d51c5-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
