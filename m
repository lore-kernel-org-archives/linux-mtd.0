Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6ED4D6ACDA
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Dec 2025 09:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K7LjuGYziUW2wF3vDwT3PTWu/stotogwkY9uJfoF/1Y=; b=IhBQX6tMhE43JT
	sBzCTZ2OSGdeUnzZnc6PsD+TRrwhQJunyF3unENapryv4Wx8qmxCpX4zP8k8EPfjLzxeOsTjz1At7
	+azVyz0QiBYLcVbWUCTQ0uUfXq9n9DfTfLmmdmfs2uzllNzxRxYW8PZfy8VA/o/cL6NQPbD2DfDHP
	TO8da+Y6GMLPEqGBW1cCeHstIgh9OISa9c6UqRf0lCedDzPdtl2UqHgOE9Gl55b+SncIJq8O3KrqK
	eeI5IhoUAuEuwq9Nmmpe4Fw9z37gpYPY0TxKaQS4ZmReGpqvJdnlcvdxqOITtRT+Y9rZImq4a0R3n
	+Je/qk6Gvb64YbyGn6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAio-00000008BXk-3J32;
	Thu, 18 Dec 2025 09:54:58 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAil-00000008BXA-42fY
	for linux-mtd@lists.infradead.org;
	Thu, 18 Dec 2025 09:54:57 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-b7636c96b9aso65592466b.2
        for <linux-mtd@lists.infradead.org>; Thu, 18 Dec 2025 01:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766051693; x=1766656493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SR/xryPXXbVpbDL/B8z5F9137s+Gr2/RQYwlR/ZtfOA=;
        b=dmY58VrxVyyvE3R45QgnqTl6zDyqt73GtvGqOGz0jSH9ZKxeUGAy02lNGMwecH1U73
         RRXVNMK3bbICwfSUVDFYFIchfKHdZ56+RsZXFK/PkqrdEn6Txet1FGMafpAJBjLCDIYx
         LfVEtvereMOm4Ylg/O3LwNmJJcZeHANE0yo97DU/fBsxOSgFPlbFQ1mMjjCdtOb90KmP
         vHgbwfNDJDfSpWt16aLJ8jXsW88nxbKn8Gp+X9cJdAWllQ2ZDcS2/B8/bkwgPVsYfLWP
         snRBpzCa4NRJ8odwlXK0bd4nk5OChdxaG1Ynv6BFvycjdp/+i59cuC2TOvNC6bX1yxK1
         CM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766051693; x=1766656493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SR/xryPXXbVpbDL/B8z5F9137s+Gr2/RQYwlR/ZtfOA=;
        b=dflVpVb1bHr/s8U3wOo/adycU1x6ob5WwmJ0XJFzOiCKeGuGxdKrD1PpURZx7btWvn
         U8eaxTa4a58w/NTbttXER/ZTquysYNrozSLXFy7EKaFxRCLc4HNyT3knLgW7npbxr1CF
         1tFqZZaLTURmG8nr2RxQBjNVyGY19wkr+dZFCCxtrfUwBn1ucQsBnnONaH8+o/OiCpY4
         mf+k14djJD8yuHbgSF9LKQv1hG2GSkxIgfb0BQoi3VQfJ4PH6Q4ijkxtfFYs0OVmTNd0
         s2sRv/X51yzsDtZdvsdC3PUK9a2+jjq4IDOyd3G+T8mbgJ43ZQ8MW89C4ki+oDtipYq1
         /GLg==
X-Forwarded-Encrypted: i=1; AJvYcCUEZzh2gUk0TGhAPTYv6QxcEPsDWb2QeXeyyZqzwHRAo9599ErI9mdev61LTJr40ETHLJXPXIkYWng=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/2Qd0JlqvN0gUUOsAVf22tE0neLDx3Y44cgxDgP1KcxYzvdE0
	MyJe9Kh8ssYnqX5n6Hz5h0tdTVF2uoKSEPxe10Pb7qfYwcBvqVSh4Ymg
X-Gm-Gg: AY/fxX4D6jnTkKWGqHez8QuY4PH/92jZlsZkPZxzr9xlDNtloyLjGvBJnKPWoRrUlPV
	CeaXql7Suyd4XMnm/n2s9cXPeo2Ui1X/Tmljz9jU29zOLddaS6OtB+mzX5ghd6v9ducakarwl09
	FTWejqJTsIbvQeZWNUFPEJkmN8SXXeLcHN35eaEOLFABcmdLRKFMobQR+hCEvwuqs4iJlOuHyoU
	kVtnnGoDKTb/CGNZQ2T91pgiiO9AOH/xfkPkd4baY8o+23/nvU20pDMIIxc0b6q+gsKT/Ie9Vl1
	dDeaXTQoGsJSjZ5Qy8LU7Av/Yl3AOCdghbS/izbRVSCe+YCAN4nRDL4DlpHtUCTe+rAbceBvrE9
	xc6PMg0RIgTN9H5E4QaLLB9PbOFmFAHa8XJhXrKcH+5IPO3VqiEBbIUAvYyS8g8Og4TLJztUz5D
	bYtke02LnDjQw6B0ERtgERPkHDOAjF6xyzIyluHnjezWT1p1t2GX/EkHyp3mshuO7ZUCU=
X-Google-Smtp-Source: AGHT+IHJWFzi9rfA25mG7ZABOwC9qLaO9j0uA4MYVvcHvjDeHkSizP4GXleyowIvS457rqQVGHI2KA==
X-Received: by 2002:a17:906:8a56:b0:b80:2315:b4ca with SMTP id a640c23a62f3a-b802315b6e4mr112734266b.46.1766051693241;
        Thu, 18 Dec 2025 01:54:53 -0800 (PST)
Received: from localhost (dslb-002-205-018-238.002.205.pools.vodafone-ip.de. [2.205.18.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80234acdf5sm175045066b.58.2025.12.18.01.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 01:54:52 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <p.yadav@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: update spi_nor_fixups::post_sfdp() documentation
Date: Thu, 18 Dec 2025 10:54:30 +0100
Message-ID: <20251218095430.30103-1-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_015456_007936_2DD76380 
X-CRM114-Status: GOOD (  13.10  )
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

After commit 5273cc6df984 ("mtd: spi-nor: core: Call
spi_nor_post_sfdp_fixups() only when SFDP is defined")
spi_nor_post_sfdp_fixups() isn't called anymore if no SFDP is detected.

Update the documentation accordingly.

Fixes: 5273cc6df984 ("mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups() only when SFDP is defined")
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/spi-nor/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 16b382d4f04f..e838c40a2589 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -413,7 +413,7 @@ struct spi_nor_flash_parameter {
  *                   number of dummy cycles in read register ops.
  * @smpt_map_id: called after map ID in SMPT table has been determined for the
  *               case the map ID is wrong and needs to be fixed.
- * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
+ * @post_sfdp: called after SFDP has been parsed (is not called for SPI NORs
  *             that do not support RDSFDP). Typically used to tweak various
  *             parameters that could not be extracted by other means (i.e.
  *             when information provided by the SFDP/flash_info tables are
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
