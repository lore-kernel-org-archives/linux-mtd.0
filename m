Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9687C4167B
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 08:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/kTc77K/3MpyGrXhE0anYZd8jfUnjfBdZ8o3Me+MzM=; b=aZhwMScmMbQdKr
	UceaL5gBzoWGgwMo3W/QYd95mERqBVC2lDZSN910RGmxAYzUzrCwd4mp5pLz61ISaV3J4s9lExwBN
	QOZbHZtJ6gnVEb9+ZLOPEAMLv924uggKQZ7lrSaqVngUZIdpURp/0AND811Xsc1FOS3Hgr4NucSmL
	MKHVNQHxA3FlT2KVyK2228EE70VHox6YnVOEaedh8GPYJPlaNAocDduqSCFG6HqlWlwWBnGz2NyVM
	UhrWhDEsEVg5L7L0MTReiENpMqVOUMSjlPZMT8D4DLlGpUGUsupGYTGKrtbNCSiPomi/YguoQzr2a
	rY3sDfoVC5yPrKzBW71A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3SA-002RlC-2e;
	Fri, 15 Dec 2023 08:21:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3S6-002Rio-1t
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 08:21:47 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c41df5577so4388725e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2023 00:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702628505; x=1703233305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEWvOGCN/u1S0GBF+sW6ffPiHV6fPcYw3Pxlfl13c70=;
        b=UJkspRXVSARAdhnugW8Jy/TSYicUCEnw7skhg5LrRRBrPCA/stECHi+kJCxBb6JUKs
         dX1LgNaRWNPjJeoaTkuI1X2dT3WqYoHor/4oy8rveh9u1ATodSL/aduwRE3gBL9NKbxD
         A9Mn1CM7SzNpcbvOs3txEFH3tcgvJojn3DVTzywniIm7/l1dz65uYh72pzkAobWrtD7t
         gXFvIhCiigyO1nrDHgIWeztN9flT+/wOj4es2gl31+tmaX+Yp85Wkckeboa9zviNahPb
         biEdxPJW318ZTT0KLvEwRzhn8pobx7AduJeZFThCjICWty1PUpDoKtXk/WKc7hjekc7f
         ccpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702628505; x=1703233305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEWvOGCN/u1S0GBF+sW6ffPiHV6fPcYw3Pxlfl13c70=;
        b=UMumhGRZfdBOzfEHYY4c+1Gpa9eQdVe5/o70LVmnwWy9+6S8gjPxqMWLh+/snNbX36
         1MC9Xal6oav+EApjI5uZKc1jeCRHQ0obevl11z+BSX4u1w+4wZlQQa1d0KL8qc5xBING
         Y+31OQDbwym1jm1Ys5vEDR4/99vVf2+OR/kV7LuplgPUcEGD7nnTX4zwVfzLUKxd1mYY
         qfRfzNZJXFkgMP6bFKfROIF7/McaHDpYoS5U16sisskBrkl8bLPv7zhrgJ9mN1aQoZi2
         xjBOhSKqQJiLcPWBVakhV4NI9ucta1OS/3IE7mK8Be8G/8SNe8pa1lUqOrj4NV276nHX
         tC0g==
X-Gm-Message-State: AOJu0Yy/wP219GZtiaCPP9P1Dz3EaJIDCTF8rdzbnVQo4gN8+GdhWikU
	oQspNSdvauxUfsC8OYhwIUYt/g==
X-Google-Smtp-Source: AGHT+IGvO7zkyFnU8GsRJmvW+rPS2Q+LIghaAx6KbttBuhmMA07qt3UDlPud8epnRuHUWI8Gp3z4/g==
X-Received: by 2002:a1c:7218:0:b0:40b:5e59:f714 with SMTP id n24-20020a1c7218000000b0040b5e59f714mr2742618wmc.134.1702628505281;
        Fri, 15 Dec 2023 00:21:45 -0800 (PST)
Received: from 1.. ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id p1-20020a05600c1d8100b0040b47c69d08sm30365570wms.18.2023.12.15.00.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 00:21:44 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	jaimeliao@mxic.com.tw,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 2/4] mtd: spi-nor: mark the flash name as obsolete
Date: Fri, 15 Dec 2023 10:21:36 +0200
Message-Id: <20231215082138.16063-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215082138.16063-1-tudor.ambarus@linaro.org>
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=949; i=tudor.ambarus@linaro.org; h=from:subject; bh=IB4QfMo7QOIyKQXCF0nV7DFWobXewCSfAICOVpteVKQ=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlfAySVVu12IWkgPGS2uNZhNhqZQi2mTtOCZdp9 lPA+WdxHkmJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZXwMkgAKCRBLVU9HpY0U 6QRfCACQfEZgkzJZCB6bxYk+Nl/lieSKRnJ8+3ATk4izz80IDzr2Yp4EjAhhTGV/whZVhcXDLme Q5tkFn5g4y9u82uiX6pUCp8epAVuwNvOCgCcz975n0lFVEjZOroebxyRwuun9dvn8i3krcg6h4c vkx0fEf2RJYy/kVQyIsETwYFLreijtOqimzgdJKBYZaX7J+QiN9LdwCMKPgNjFjRdZ2Ypf0piOM npFhJwD7rqY8pCqVKmGyXtHdkO0bjSRl/35NKbNwJwMXI7Za4+v2PeBJx3k+kJJqGEVje4W5Mi8 D75HI+hO3ymNk3NMqNsG1dQvL4Q7NBeJyC4UbBiLd1cuBkI7
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_002146_621608_3D862A46 
X-CRM114-Status: GOOD (  12.46  )
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

The flash name is unreliable as we saw flash ID collisions. Mark the
name as obsolete.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 29ed67725b18..d36c0e072954 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -465,7 +465,7 @@ struct spi_nor_id {
  * struct flash_info - SPI NOR flash_info entry.
  * @id:   pointer to struct spi_nor_id or NULL, which means "no ID" (mostly
  *        older chips).
- * @name: the name of the flash.
+ * @name: (obsolete) the name of the flash. Do not set it for new additions.
  * @size:           the size of the flash in bytes.
  * @sector_size:    (optional) the size listed here is what works with
  *                  SPINOR_OP_SE, which isn't necessarily called a "sector" by
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
