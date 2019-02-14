Return-Path: <SRS0=oU9n=QV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AE4C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 20:57:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F2982080A
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 20:57:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sav2zjt6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRi988vy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F2982080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yUreMZ+Uda9e5JmmpHENsOvWWNl3u8qmvxinYnhRc2E=; b=sav2zjt6VQ42RW
	4Z9s8C9Q3B7dNnzUjLoVmveTV3q/MrtybgyHPc1+8K8iJwgCDIQpZm73hitElJGG7qRj/r48U34ZX
	LxBQTn9UF0Yf7+KXnQlyddRcYqxOFZfNm4e5v+DrSFNq3OMSTJ60dA+PPpEjq71fNw3uBT1A/1/3M
	2Apvxs/0dOzuLcDaPvvmYIuqfgDc45eksvFFlhH7jBWb0huXURReh55a9ZWkpagrMs/xD7ltdetgt
	c/8c7HN8x4qmPwyF4FQXIRNSctTc3qUUjtAKT0LhxGmmaBdc0Ygxguw7Fpw8vmgQSXVRRWAS8dkaJ
	9JhxsVhpXQDJYBgekCWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guO4t-00029T-2t; Thu, 14 Feb 2019 20:57:51 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guO4g-00028U-6u
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2019 20:57:39 +0000
Received: by mail-wr1-x444.google.com with SMTP id t18so8073697wrx.2
 for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2019 12:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvvtHtkxY7gDjS3zaDEI2ZkA7ToO966jWFaiZg0ledQ=;
 b=kRi988vysu5i0JcUW2xzI1lTBQ7S+Nl+EQ5vNXOKMjHu1546NTpw/WDtv82l7x6If0
 elGe4B5mlOKoZbrBGg3qNGxrI6Zwd3AAgwgz+T8w6Y6yUf1pur56TFBXihPKwMcdPbjp
 DpazaKMKWK7fcLQNigdaVyr9WymWgcsS4P7v2h65wOzkaE+6xSFIpwrb3u0NPpTwxKc4
 cWsZ1ZUyZPPPhRK6PXK/lCtlN/Gd+8H24jCJTMb0qQXvv/k85it7T825O6Kfy7Nvu1YZ
 5L7zKhpGCLDcmYteyJdTTAvqDjdL67QuimAERGe7haAqfEs8sXyb2XMUvS9EBfyfsv/6
 PX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvvtHtkxY7gDjS3zaDEI2ZkA7ToO966jWFaiZg0ledQ=;
 b=LmJ04Y4XgiidYAWLulim+lqEII0C+bTfu7VPwsYHdjyJBT7UnDQVnzfi5wzvMbAWA6
 Dk1zqE2xGRreCtxgViG/t9YsO2uqyprTllLgR/RivQApp9+y2Eo2cN/3tiSbOiTnHIDF
 OOvdYuH04g19CA0qazdRRWR8lZbjS+UrTOTjswPMREXqRCiCsgVRrDPn3HKYGr5IYLnz
 DpHe2ZGMLKBevRs4agSkGTj3vlOS/sAWn82JtaaIP3H3e1zFepLQKHPNVKDAPdSSf4u5
 yGts4Eb+p0iGH2iq6Xu+nbdurmfmuszkSftFwJbypRxnkGu7lsfQcsUsRPt3tAJKuOIc
 SKIg==
X-Gm-Message-State: AHQUAuZru7bm8wD/PvWxCTxB0/+kJqKZ/gyJT1gXHue0lx+RAf5m5HrX
 558vl46+ZKNdFBfrwTvCdjU=
X-Google-Smtp-Source: AHgI3IYbLirdqADytkiTJBrlSNsz82YeozoD0oZBfs3T1MhoB9ONvw/JvQwLpQ96KCYEvwcR7SoRjw==
X-Received: by 2002:adf:ed0f:: with SMTP id a15mr4268567wro.249.1550177856110; 
 Thu, 14 Feb 2019 12:57:36 -0800 (PST)
Received: from localhost.localdomain (93-143-192-123.adsl.net.t-com.hr.
 [93.143.192.123])
 by smtp.gmail.com with ESMTPSA id d24sm8952870wrb.47.2019.02.14.12.57.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 14 Feb 2019 12:57:35 -0800 (PST)
From: Robert Marko <robimarko@gmail.com>
To: marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 bbrezillon@kernel.org, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: Add Winbond w25q16jv support
Date: Thu, 14 Feb 2019 21:57:23 +0100
Message-Id: <20190214205723.9011-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_125738_293945_4172196F 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Robert Marko <robimarko@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Datasheet: https://www.winbond.com/resource-files/w25q16jv%20spi%20revg%2003222018%20plus.pdf

Testing done on Mikrotik Routerboard RB450Gx4 board under 4.19.19 kernel.

Test board does not support Dual or Quad modes.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6e13bbd1aaa5..0e958f48db1b 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1975,6 +1975,11 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
+	{
+		"w25q16jv", INFO(0xef7015, 0, 64 * 1024,  32,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
 	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "w25q20cl", INFO(0xef4012, 0, 64 * 1024,  4, SECT_4K) },
 	{ "w25q20bw", INFO(0xef5012, 0, 64 * 1024,  4, SECT_4K) },
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
