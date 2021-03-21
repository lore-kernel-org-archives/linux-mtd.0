Return-Path: <SRS0=NFR/=IT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0501DC433C1
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Mar 2021 23:54:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AD1461941
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Mar 2021 23:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AD1461941
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gZi9/IlFlokNLcglLOppZU760kcVSP56Lg2XNjTUtjM=; b=cSZX4xUb1UlH1IvBSzMC0meHO
	CU26+rKQ8Y0oSeCJceFifhCtNKC46Rh1/ooW3CKIOF69uKUEGiR+JYOjHYpWdLgnIO/+hjnZgo5Mh
	IQzRNq9fSsR+EFPv0ngdggWrriqypFoqYPHy4UvVVpiWxx1AusoEa58cq8bjSNVTrC3Q5Za5QqelK
	MZ5n5c2WnUHyZUZ+P7U549qXqsZL+aUkZpqnIluMRqVeDW0bl964FF/9mh5OqeisobucjvxhF3xlg
	qNf0eTFUCmkmKqaQajBRGx96BOWuUllvDaSFf7pKhUc/2qXRQorwV5W6Nsuua+g1wCI5nkvEQDMkj
	cJ5zLd4TA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lO7sw-00AZC8-DH; Sun, 21 Mar 2021 23:53:32 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lO7rO-00AZ67-0F
 for linux-mtd@lists.infradead.org; Sun, 21 Mar 2021 23:52:30 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DBBC922253;
 Mon, 22 Mar 2021 00:51:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616370709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7pVgZhYEGnaY7ZyodtaxdbrPf8RrPat3Gjq9g+Zbg9g=;
 b=On6P/TW4uuPZWXKyBGd6I6RdKokSF2yYPaP/OannPEgOS4y+CAaBsGCXJOFTzldTRCqjrn
 UVjAXyW2BI3NTt7kDXavoknFRQVHdY0mEXsL9KewJw9tZNHu9/j4aluR5mIH0uMjSEub6p
 sl5VRv5U5SFIBwDY00dCKVeJTJtbZIM=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>
Subject: [PATCH v5 3/3] mtd: spi-nor: winbond: add OTP support to w25q32fw/jw
Date: Mon, 22 Mar 2021 00:51:40 +0100
Message-Id: <20210321235140.8308-4-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210321235140.8308-1-michael@walle.cc>
References: <20210321235140.8308-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210321_235159_714215_6A86CD32 
X-CRM114-Status: GOOD (  13.20  )
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

With all the helper functions in place, add OTP support for the Winbond
W25Q32JW and W25Q32FW.

Both were tested on a LS1028A SoC with a NXP FSPI controller.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/winbond.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 20b2c6f19d6f..9a81c67a60c6 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -54,14 +54,18 @@ static const struct flash_info winbond_parts[] = {
 	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64,
 			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+			   OTP_INFO(256, 3, 0x1000, 0x1000)
+	},
+
 	{ "w25q32jv", INFO(0xef7016, 0, 64 * 1024,  64,
 			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
 	{ "w25q32jwm", INFO(0xef8016, 0, 64 * 1024,  64,
 			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+			    OTP_INFO(256, 3, 0x1000, 0x1000) },
 	{ "w25q64jwm", INFO(0xef8017, 0, 64 * 1024, 128,
 			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
@@ -132,9 +136,18 @@ static int winbond_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 	return spi_nor_write_disable(nor);
 }
 
+static const struct spi_nor_otp_ops winbond_otp_ops = {
+	.read = spi_nor_otp_read_secr,
+	.write = spi_nor_otp_write_secr,
+	.lock = spi_nor_otp_lock_sr2,
+	.is_locked = spi_nor_otp_is_locked_sr2,
+};
+
 static void winbond_default_init(struct spi_nor *nor)
 {
 	nor->params->set_4byte_addr_mode = winbond_set_4byte_addr_mode;
+	if (nor->params->otp.org->n_regions)
+		nor->params->otp.ops = &winbond_otp_ops;
 }
 
 static const struct spi_nor_fixups winbond_fixups = {
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
