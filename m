Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F41BC7619A
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Apr 2023 06:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RbDz+11ORYYYMnRL/TvNCrMRAV7jKOXInr1SoAo0Jr8=; b=U+l4ZM56HmV+zG
	cpaoBrnp+T6aZUBTf8nwaMhidrUnhTRI1k6v5ixU+tFZG7tJRG+g2eJfQ6tZ4qOm3UZsE5U4HR4by
	bo7p0jwjkk5XgyQgu4tlvUwer4FK30JzGnlIKlCJaeji8eu5tODsAztODHDlIeih1RPNAVDgtbne+
	HarDmqOxluChnliktzp8IBI4JhnEaOp+K8tiC6nCwvw9GfxfaNCyip4KYyaolCJ6VzzEHrsXRCg/H
	vQjJfK+T170Xmzw04sxESBrMOPJV4FsWgqTi2QXil3Y0MJLvyHYS+zVoSOW3oyzFkPFw2MGuSBLb3
	cd8wWUcFJNyczr2FIHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjwGa-003SYN-0N;
	Wed, 05 Apr 2023 06:05:08 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjwGW-003SWb-2W
	for linux-mtd@lists.infradead.org;
	Wed, 05 Apr 2023 06:05:06 +0000
Received: by mail-ed1-x530.google.com with SMTP id b20so138370532edd.1
        for <linux-mtd@lists.infradead.org>; Tue, 04 Apr 2023 23:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680674701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pZDZslHVpv1fPe3PRpzIKh87QrMyXSFVpUqfqLpLtPI=;
        b=a3hXxtU4sjiC345bUT2l7WpqL7hxAiqdYQWOr5eeC+IPIB3/0Z8sRPTziEux2pEqDB
         WEwld584/jXlqJr1VtU3FGCuOvh2EReIAAK/tDEb+QCsszs/jR+mKgMUgisvkqRI8qv0
         3EvbQ59ccBO8sVBKEcG2C4Gfw3qX44+4+lLLK43x6vZJVtyPQy+4BSbni/0b2wOCDfOX
         XSIN872xhioKJhJ6OHSOoUSOmML5heEvccusDOdxIIv7s6+vTZ4QOTcYVV5eIyAVVF0Y
         O9wTrm4903CqJ0/Ypmf+1h1X6mP3Td5zOqPr2AbSImlxjjAERhFjXQtWaZ5QwtnMjGpj
         DDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680674701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZDZslHVpv1fPe3PRpzIKh87QrMyXSFVpUqfqLpLtPI=;
        b=074+tbqm9GQYxApg00zFjM+19gt+lJfLzC0YPcFTbaDwN5jDm2lysAs7qs3oi0Gtdw
         4Dz/51keHDY779jVGYnhUiOszGMi9KGGI4YpMCLUeg7fp/38qpZ68EXOwKlyN/y0ryN1
         zwwM/WX/8GAzrtO9xQ2L89lua6aKAMH/SOi9gpFUnwyB5xbLMqi1q7Iv2zmd/tJuUHd3
         C7XuLWIGX4TNzi2DXsjBhBGmMJeRTgA0pWxs2m0uNvzNU3Q5/GIDsgj7dt15Yj4leHYc
         k2p1C+3mA3MSdCBrKlX450hoPwYzdeomRr1t0OtP6krKPssDuZj4y+8T+tLg7LtIaAAB
         sYXg==
X-Gm-Message-State: AAQBX9f12d2Uofw3X05seGI6bOprYb9RoBS/apzbF5m4ZPKFBeESSMEv
	Tk0yPNrinOwtHf1bDgPY2ok7sQ==
X-Google-Smtp-Source: AKy350Z/6OPzC6zUd5cxsjf+rmcPMrZ0ktlDp1eHyn49rndyx3WLIAc4n3NUanpTRUM4D071KEsBbg==
X-Received: by 2002:a17:906:e104:b0:930:a74:52bb with SMTP id gj4-20020a170906e10400b009300a7452bbmr1316323ejb.14.1680674700983;
        Tue, 04 Apr 2023 23:05:00 -0700 (PDT)
Received: from 1.. ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id hp17-20020a1709073e1100b008cecb8f374asm6929290ejc.0.2023.04.04.23.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 23:05:00 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	Takahiro.Kuwano@infineon.com,
	pratyush@kernel.org,
	michael@walle.cc
Cc: bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] mtd: spi-nor: spansion: Rename method to cypress_nor_get_page_size
Date: Wed,  5 Apr 2023 09:04:56 +0300
Message-Id: <20230405060456.48986-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2125; i=tudor.ambarus@linaro.org; h=from:subject; bh=YI1QpFTHgUfWn38+qHO/PLUJ/J7BtLp4MGr/WWSYC1c=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkLQ+I8CGoy169rMX7/F99qe4tH027tR9WuAGvl eZFkMRwwcCJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZC0PiAAKCRBLVU9HpY0U 6YPPCACGYPwWIIlNHPlo2F0iger3QoJ3idbWHFMO/8WbzdxV+dVk9lKMvUjUi7gWHFc2bdh53NE d6Ti6HYukRBZSfNX9ih9MfZ+c1lHQYwUjG0Pk2gKE1hymrRF2RplhkS/xvpJSWcZ+OKFdVCKLxN XPhq3iSoVKXXfURRq5ylqWC0DJoBfn9qNEDW42CT3/1uBTX2SswqY5xnM76i2O7U6to7d1W9Gpi xuagMv6mw7+wPISpQICJ17w+P2R+ptugGq6UhbEYDa9NRrCqsXpXO+D1ktznhRB4a8x33agvp5a HAYfVpnczM9l2QLJH6bl23HkPGN7t5dDhrh0tO8Le8NYiXyc
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_230504_863474_7EC0A249 
X-CRM114-Status: GOOD (  11.20  )
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
