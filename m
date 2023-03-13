Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2095C61DA4
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Mar 2023 10:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uq99SI+YbOIR8gTemVY6skNcyi5DZFPiybJN4ZROxAU=; b=YcNRCRdDGgBwe+
	yk7zbAhb4GZFR/7GheKMbz2yi4Qhv67iM3jt+3gmTl8DYKLdSAMt/E7aSvm2UiQF6sJUY2/+3AyUY
	GXqKuVdMrneRJSR89gGpmWQQhZ0KCmBs42ZnxWVM0WVpFTZiK0ZPD+1nd/AnNoba/83Nci5DgrBcM
	q483Ee87LTpQvZM22Hy/4g9zEiq6sNqzALVwzrq6UrZ6wQpT69xKEYBNGna+G/IEk1Lu1gEPXhK1L
	gjY7gLznSzhLA1AaUdS7mQoxNsiqRDm3W9sgZPCzHReVAZcaIMytYj6x4IkIrTyFlXRoxxXhsRADO
	YPJUyIaGd9tLXyr0eHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbf0P-0055pS-DF; Mon, 13 Mar 2023 10:02:13 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbf0I-0055mE-O7
	for linux-mtd@lists.infradead.org; Mon, 13 Mar 2023 10:02:10 +0000
Received: by mail-pg1-x52c.google.com with SMTP id z10so6537568pgr.8
        for <linux-mtd@lists.infradead.org>; Mon, 13 Mar 2023 03:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678701720;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXANLhq6tckZDSNAl3pWRue83VDgkmFiya0dDV01Ibo=;
        b=XRni4sVh7rqm2rybFgmG9ehCEYEnMYqE+BXMDbp2mU7pVa0dEYRg0sT/XGlT4eRPZb
         GnXLT6aBaZtcLL8nbyR0/ivuhI1sipTsDJx2NuFE5gs2WsMaoE0SxFb0Nx9dvZeuq6jp
         XvyWWzNkYg+E2tE9qEVfXSCGnr8f3WoFDy4yFMcMRQEihgNqCQ68yM8365ucU6nmHPY5
         NVEc3bO7JRz2hNWqEPomJT2YYcNFSXHkSxMgsbgHrxh2z7o8gcKQxPbhxrF70CM35qVn
         l3eP6jG4TrHZjPNdnKAQpwCXpT4kjyXgLjRYDAr0TqynYUe1P8sJJZ4ONDhpD1ZCIETK
         QgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678701720;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXANLhq6tckZDSNAl3pWRue83VDgkmFiya0dDV01Ibo=;
        b=sWUOIB63Lc2KfVoaZgk7C0pLDO+AQKRmEGzqkvdqQYxyfl3q3irUQrEx4FAWm4Mkhn
         pf9epPUAxePoCY0eGnIU2xjq9/rcKmCJv6fDIeUWfPEAEfx3lkaPqIs5WUbrHbkSi0IM
         j9uWru7m6svMoHF+iztW5VS3WWPwrK/WEcr0Osw+9hGCZqiJ41smmS1AfMR7ZTQPQMet
         B9gp80z5WIydfqG2waJnt6NKH5rN+IJf4MD/mLiX1tVBK9ZjQ0j3iAepMe260obRM2/+
         y7AlPAxwt8WouBqBdJQDwX5xBpDtCTRK5BRHkqpnDvMNOQYYjF+/VyT/hcOrobFTsRg7
         dpsw==
X-Gm-Message-State: AO0yUKWEBFMjpjMzDlT/RRItiDVNIJXIQiulcNU5iPHGIw/fRDU1p1rP
	0LVGZOoMC2UC/kvmWmTMz9I=
X-Google-Smtp-Source: AK7set9JU6LMjZ8hjZh9RFDjRA+WSzb36HL8/YMo6u4+aIvEPBbT8dTFzipt8L+GY1OTCK1iQMinGA==
X-Received: by 2002:aa7:951b:0:b0:623:4d92:82af with SMTP id b27-20020aa7951b000000b006234d9282afmr3955447pfp.31.1678701719972;
        Mon, 13 Mar 2023 03:01:59 -0700 (PDT)
Received: from nvidia.nvidia.com (nat-hk.nvidia.com. [203.18.50.4])
        by smtp.gmail.com with ESMTPSA id h3-20020a62b403000000b0062505afff9fsm963294pfn.126.2023.03.13.03.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 03:01:59 -0700 (PDT)
From: Luke He <sixuerain@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: sixuerain@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: Add support for XMC XM25QH256C / XM25QU256C / XM25QH512C / XM25QU512C site: https://www.xmcwh.com/site/product#
Date: Mon, 13 Mar 2023 18:01:53 +0800
Message-Id: <20230313100153.15441-1-sixuerain@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_030206_806649_21C45F02 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Signed-off-by: Luke He <sixuerain@gmail.com>
---
 drivers/mtd/spi-nor/xmc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index 051411e86339..6db01b80237f 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -16,6 +16,18 @@ static const struct flash_info xmc_nor_parts[] = {
 	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
+	{ "XM25QH256C", INFO(0x204019, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "XM25QU256C", INFO(0x204119, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			     SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "XM25QH512C", INFO(0x204020, 0, 64 * 1024, 1024)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			     SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "XM25QU512C", INFO(0x204120, 0, 64 * 1024, 1024)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			     SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) }
 };
 
 const struct spi_nor_manufacturer spi_nor_xmc = {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
