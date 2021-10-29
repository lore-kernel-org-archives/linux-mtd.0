Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7663FC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:39:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DFC260EB2
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DFC260EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJlRw1do/F5A0Afq1PG9fyb4Nggd4UgYc3MErC6M9P4=; b=f7kldDJsigKJtr
	rHXBqIMuQ1mLdkrObMIuQucWreWqb/2bi5Bg/+axeT5LqYN0SRNNHPFaL8NHwyliJgO4EtP3oVZg3
	BMxkl6Y/KD3noHkL4nxpyb1UiS7fb0EAX6pLag79A1bka77yR2cy9ziPeiJuyjw5whW2AtCxnAwcC
	3YD0oQul1CSjdp9b8ilM5hDoZcMYJhUbj1SfnHKfJcP2unMvmFrFtnqGNmTlG0w/phd7iLTQgSVwG
	I8uFSMGW6bIzdrQndw9YZZpUuXo8WHLCVVnxSiBPTNbDFcrbGTh05gJ488Zu9ISvjlRLBMllPfmuT
	ol6gLU+ms8k4zbFR/UDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgVqT-00BcVb-9P; Fri, 29 Oct 2021 17:39:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVf3-00BZAg-2k; Fri, 29 Oct 2021 17:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528444; x=1667064444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=41oivS8KYWvrWmD2Cjvk5Iu1SvhxO4AZNDJiqciUMd0=;
 b=V8WSTBAY6LevSIAvHcjQ1yX8w0+xPMV9cd9ZwfCyXRdGMjzpNLLrKJun
 CXRIgFayOlrIt2rkPvUoMtjHpNlBoB61BZJQKM6WXnG1RA1Cs7J/Dvm2O
 82PscZMgY998ZPh6NjHxNMycPCTgUAMZzI9sEM17E+iI8R8NsRkln781S
 EnxF0+cNrxNNLZzGg+ABhrGPHHeVtsB33xXnhxZBF03yxafPtlD+KpqAl
 bbuEMxwxPNWMbff7PcqW4Q5H/ygX/40mEIVvQPlo/5Vk942VZzS92OdoC
 BZXYL76tapj//vdyrT8ffOxgmY5784E2qYtuonNKjX/2vRR4/JeuU2ECi Q==;
IronPort-SDR: g6VhlUI/LjM/ENxq1Q0nIfG1GatYew17VmDHk85kArnD0HJB6SDVuGWHTQ8B7jdd0nk9YFtHNx
 UuZFwXpkI9+jrwD3aY3OU3ukhXGxti6DZobJ/558B1F6Yc0aP+80OpQm/w7dyVa9FeKDqlG68B
 i3BIDArUvcx9zQhya+GdkXNw00CqsjJF53fNp5EMaC0C6ZCb3zBgR1RGr8S1Ik8MxcYwujfDW7
 JKl36jDzQ0ImuNYdY4OGtfN4Hw8SXJecpVyqtzE+mHAaHhyFRioVQ8/2i8ORpM5JCb3yj/qW2b
 rh5e+iHG/kn29yUb8H5cbwMM
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="142183485"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:27:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:27:15 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:27:10 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 07/25] mtd: spi-nor: sst: Use flash late_init() for locking
Date: Fri, 29 Oct 2021 20:26:15 +0300
Message-ID: <20211029172633.886453-8-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102725_194552_B2ACFAB8 
X-CRM114-Status: UNSURE (   9.32  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Locking is not described in JESD216 SFDP standard, place the
locking init in late_init().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/sst.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 980f4c09c91d..660aabde477a 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -46,13 +46,13 @@ static const struct spi_nor_locking_ops sst26vf_locking_ops = {
 	.is_locked = sst26vf_is_locked,
 };
 
-static void sst26vf_default_init(struct spi_nor *nor)
+static void sst26vf_late_init(struct spi_nor *nor)
 {
 	nor->params->locking_ops = &sst26vf_locking_ops;
 }
 
 static const struct spi_nor_fixups sst26vf_fixups = {
-	.default_init = sst26vf_default_init,
+	.late_init = sst26vf_late_init,
 };
 
 static const struct flash_info sst_parts[] = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
