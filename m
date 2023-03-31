Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B845C77B62
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 09:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZR4M2rVhGVoYoyZXBzB7SISiN07zA1Xf9s7rW0JIgA=; b=W6oWmSFTY7F9lr
	Z1eZeUuRvbdv3tzZubbL/M8zRyDMYxQa1EskM59WQOrEUP11x+b8mnOj5sKDfbYyopslq6h9X6XeY
	gjqyJtq+dqoHB9mfc1jyg04YU5rIugV72g0CNvO5gRDz/8MHLD1hLKaEQ6HhhTPZ+KBLLfHxd1D3A
	eSaEDbFQkTg9ob5mqO2qaTutxs4Ph6FBTMA7rDNT/hk6VkLJyVot8G0SO1iERszk6FtJWy4+xAXtn
	brXyaml0jINdgq3Fr60Oqhbw3oIjzy5Dc3OawBMLLYFuyJZg1sL6FKeoutWAB1gO65IFK68eZOMbT
	qKhroDWF0JwE0dMgGl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piAdA-006YSd-39;
	Fri, 31 Mar 2023 09:01:09 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9Sl-006Cs9-1v
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 07:46:21 +0000
Received: by mail-lf1-x132.google.com with SMTP id c29so27810956lfv.3
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680248773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vyY0YqKS1SLB05+MmKNy/QrEH8YuBL5xLp1nkmp3M0=;
        b=CCefbeXgqsEJBMHGQDT4yv5/UyPJoy/+zWC5qH5dvQGDNUsF6mMtXAz5wZiYkN5BQo
         MCWdl/GhEBk2ItYSonQc2Lp35kV9kAmogwuqZWYfVrC4OoF8+pPeiRPCV/qOutLflMyf
         CNj8daBkbeQObZrLDrEs/zYlfw3FrCvzJr0R33a7+Z7BiKilj4X3mYeHFKgm5mO71JIu
         ZGcOH32VIh3zW55zqkyMrsIn0kh8hmdg/6WE0kJZkQcCmowkFsdNJ4dVJX3yOKPs7If/
         wwpMlF9cge5OO+O6Daj2pHBWtsOaY+WRMzo8KOGlx8Vqo9cmgrznLeIlFdifPpdzpBYK
         r0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680248773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vyY0YqKS1SLB05+MmKNy/QrEH8YuBL5xLp1nkmp3M0=;
        b=oGoIVU1UZl4WV2w/nBps98LmrziXoshAvdmFny6pVwWBolqqXf4tnyMuDR8QqDcLqw
         d5lG2aKLShOxm9YZ7AxZeA/2Kn9WRPBw1tbKbV7knxEf7Jj8O2kdOXAl7NK1KQmDmVl7
         3ZbNsQ9NrQrz/AU5XLTsUP8ctSqpvWIBxwOEi7BzWle6OfrQ0Bd87/dSjL9S7S08FuWN
         iCggp9hS0Qokpn2W13QwFIfn69hqQz3bTmxQtBucbTIf0IP0p4dwb2TjDnP5ep9RdjeD
         K3gNQiY4/EG9XBKjg1K6gMl6Dfg7qo3p04hRQSPcTKuVPIZHDxP3glSLt3rKOSMBQ4k9
         IvqQ==
X-Gm-Message-State: AAQBX9f5nAJc7jDJilWTB70IR0kXZdwZEvbBE9UfEfaKL3hwezNtfowe
	V+gHVSdfXRJorppbfnHFazV+9w==
X-Google-Smtp-Source: AKy350b4xxIBOgaXMB9NOFPWS1tARj7J6oK3qK1H7J7KhoMM8z2ZImNHVkPe7Cq0Z6so7UmQvFwV+A==
X-Received: by 2002:ac2:5699:0:b0:4e8:3bac:4e32 with SMTP id 25-20020ac25699000000b004e83bac4e32mr6767504lfr.53.1680248773602;
        Fri, 31 Mar 2023 00:46:13 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020a2e8794000000b0029573844d03sm241201lji.109.2023.03.31.00.46.12
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
Subject: [PATCH v5 01/10] mtd: spi-nor: core: Move generic method to core - micron_st_nor_set_4byte_addr_mode
Date: Fri, 31 Mar 2023 07:45:57 +0000
Message-Id: <20230331074606.3559258-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
References: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_004619_661031_C5B841D1 
X-CRM114-Status: GOOD (  11.90  )
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
index 9e6a0730cdb8..d104c81f22c5 100644
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
index de31e430f77e..d5cb42245820 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -648,6 +648,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 int spi_nor_write_enable(struct spi_nor *nor);
 int spi_nor_write_disable(struct spi_nor *nor);
 int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
+int micron_st_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
 int spi_nor_wait_till_ready(struct spi_nor *nor);
 int spi_nor_global_block_unlock(struct spi_nor *nor);
 int spi_nor_prep_and_lock(struct spi_nor *nor);
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
2.40.0.348.gf938b09366-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
