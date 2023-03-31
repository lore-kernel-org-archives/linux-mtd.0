Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7358C6FD18
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 07:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBfZuAXfiTjGB3mDdDaumpMNMYalWzQgk0QQrvEKU2Q=; b=Gd5+Omp0pmOh+P
	TV+YRfY1QNMi5PCc3xCjcopCGgHESQRCnDfFpeykxkEZnpvatrhuo7Qar9g8vaIT67hg66AFwBw4d
	F+2KpvrPl2f6jIrs26kqBT4YNzPbtACaPMOF+GZVLjN6nJVpRqwFk1vpXNQ0wfNGjTeHI7D/TC6f8
	vHn8NWYESE2RUHGCTa01ogTZqQ3IfZ+cPCj//SCDHNKOn1+ls7svGYBRbiJBuzpw7FBttsbJvMWpT
	BPhvc59Bn7VB3V7ozKwJP3iSVcqFtGXCgoIfeKEjjRqXyjDufjmDCCRRCMCJuUeSOmntTI1CCE52R
	n43IG31KcpXUHqmwt9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9TC-006DBY-0o;
	Fri, 31 Mar 2023 07:46:46 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9Sp-006Cvi-3A
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 07:46:28 +0000
Received: by mail-lj1-x22d.google.com with SMTP id b6so2088188ljr.1
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 00:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680248780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcXZcEx2eHoNQSwUs7M5JpMhYFB2VWPVVcMYUPnoHZs=;
        b=fAQTJA4yiXJKR22sZnpyJp55Cbmo39ruuDQt/ifHXraID6hjnHAWydLebCsDFGp0RQ
         XmzY81Cl+sTaKK+5kJXrVHl8Qe3NRiN+edOAkaZQZGOznBNI0GTBdpx8RdojbAN/EABY
         hIuKD7OuCXnZ3DZjDWzAzEJzc376rWz7r/Z//97JO7vWme7+lV4+5V5/J5LDTOSzWyhL
         8SQ7fb1Yp3rqIBNwW0XVvS0HuNQii4wdAZIownfUCmcOABFlZ9g4B5LRQxpi+sq/EzXO
         92o25th8GGuW2k8416veMKdg2wFl70PUCf7xv26RLrPyDg4sxWkoiEvoQ2dPAQg3Ogwe
         8KFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680248780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcXZcEx2eHoNQSwUs7M5JpMhYFB2VWPVVcMYUPnoHZs=;
        b=ec7fy2Ib85+XmPHLsdf0CXWnDh0BUNTwidnbnmg86VCzBDAgXZQvKlbLtlIiKkRJBX
         jFd/TbOT0af8Z+rLovtpAvXlpMlYgW+VSgog/L5cX9tS1w1KuMUWzs5uYy6b0clMAAam
         ZIJy1bp5xWybJ8oKOnU7BeVWXzMKaxl6ku+UmQH8Lx96UdOHCKEkyvBTJcWM1sAwRLR5
         0FueI0wBM3b2nsBGJL8Y85T9xl28URrd7Y1SaG4cr+auT+EJuP9fYhn7Z14yiFTEhGsY
         fmXZ5kRX5dEKvF6m1u6hSyve7LV0kZDQOqL83J+DGefmxIwKGSJOmt9wGvlPaJ694KGw
         BMYQ==
X-Gm-Message-State: AAQBX9f/3wpjjfcoyz+4g1QxbQrat4lGDYNHNnH4twsWqk9SGiM8tTeb
	QtL082tMfvR54tgMEEC+EsjJCw==
X-Google-Smtp-Source: AKy350YcfCQ/0BL7AU0CYA2k/XkYYE7mIAgMrX3aB/4nmGiGkNyK2nacuzwEX+L2RB8CFF+VZ6MPFw==
X-Received: by 2002:a2e:87c4:0:b0:2a6:1bd3:4f72 with SMTP id v4-20020a2e87c4000000b002a61bd34f72mr1301996ljj.0.1680248779942;
        Fri, 31 Mar 2023 00:46:19 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020a2e8794000000b0029573844d03sm241201lji.109.2023.03.31.00.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 00:46:19 -0700 (PDT)
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
Subject: [PATCH v5 09/10] mtd: spi-nor: core: Introduce spi_nor_set_4byte_addr_mode()
Date: Fri, 31 Mar 2023 07:46:05 +0000
Message-Id: <20230331074606.3559258-10-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
References: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_004624_047135_A6BF3E7C 
X-CRM114-Status: GOOD (  16.94  )
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

Make the method public, as it will be used as a last resort to enable
4byte address mode when we can't determine the address mode at runtime.
Update the addr_nbytes and current address mode while exiting the 4byte
address mode too, as it may be used in the future by manufacturer
drivers. No functional change. spi_nor_restore didn't update the address
mode nbytes, but updating them now doesn't harm as the method is called
in the driver's remove and shutdown paths.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 35 ++++++++++++++++++++++++++++++-----
 drivers/mtd/spi-nor/core.h |  1 +
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4f0d90d3dad5..c67369815fde 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3133,9 +3133,35 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
 	return nor->params->quad_enable(nor);
 }
 
-static int spi_nor_init(struct spi_nor *nor)
+/**
+ * spi_nor_set_4byte_addr_mode() - Set address mode.
+ * @nor:                pointer to a 'struct spi_nor'.
+ * @enable:             enable/disable 4 byte address mode.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
+	int ret;
+
+	ret = params->set_4byte_addr_mode(nor, enable);
+	if (ret && ret != -ENOTSUPP)
+		return ret;
+
+	if (enable) {
+		params->addr_nbytes = 4;
+		params->addr_mode_nbytes = 4;
+	} else {
+		params->addr_nbytes = 3;
+		params->addr_mode_nbytes = 3;
+	}
+
+	return 0;
+}
+
+static int spi_nor_init(struct spi_nor *nor)
+{
 	int err;
 
 	err = spi_nor_octal_dtr_enable(nor, true);
@@ -3177,10 +3203,9 @@ static int spi_nor_init(struct spi_nor *nor)
 		 */
 		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
-		err = params->set_4byte_addr_mode(nor, true);
-		if (err && err != -ENOTSUPP)
+		err = spi_nor_set_4byte_addr_mode(nor, true);
+		if (err)
 			return err;
-		params->addr_mode_nbytes = 4;
 	}
 
 	return 0;
@@ -3299,7 +3324,7 @@ static void spi_nor_restore(struct spi_nor *nor)
 	/* restore the addressing mode */
 	if (nor->addr_nbytes == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
 	    nor->flags & SNOR_F_BROKEN_RESET) {
-		ret = nor->params->set_4byte_addr_mode(nor, false);
+		ret = spi_nor_set_4byte_addr_mode(nor, false);
 		if (ret)
 			/*
 			 * Do not stop the execution in the hope that the flash
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 8953ddeb8625..ea9033cb0a01 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -651,6 +651,7 @@ int spi_nor_set_4byte_addr_mode_en4b_ex4b(struct spi_nor *nor, bool enable);
 int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor,
 					       bool enable);
 int spi_nor_set_4byte_addr_mode_brwr(struct spi_nor *nor, bool enable);
+int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
 int spi_nor_wait_till_ready(struct spi_nor *nor);
 int spi_nor_global_block_unlock(struct spi_nor *nor);
 int spi_nor_prep_and_lock(struct spi_nor *nor);
-- 
2.40.0.348.gf938b09366-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
