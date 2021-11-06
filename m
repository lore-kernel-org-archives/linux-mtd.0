Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A237C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 10:30:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AFD0604AC
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 10:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AFD0604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NzzJtltb6Ya3gRpz7+RX8+esYpNUK1nuFkzIQEFdyHY=; b=PBudo7ADGPZ5IY
	n7HSP5wW/9wDYbeZnm8Wel7s1nASdCdEAigGyyzudx3lJOdYMgmhqFi9YlQ0XDBMrI1tAUD7rA6ju
	obMO0d14ENSF+K2aQszJ1VwaWLRx15VVpojGguQMPbkmfW/YAa/iBscUnF1BHyRcY1L5QQ7ztsJpJ
	APmrplk5ytba8ipX+XfUA/YInIAHM9NC3hLf6WCbTzh7Gan77ROSt7mYzY405eFNQl+HNUtHkIiE4
	wdM8kmVBw9r1CRJqyUSgNvDIxyqpJfDw9d7axczTKN963DYaYe7iIAjCBAGzvAVusbqeugBtTLOyW
	heUxKUrRffrQtJEcvJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjIwv-00CuWh-G0; Sat, 06 Nov 2021 10:29:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjIws-00CuW3-FH
 for linux-mtd@lists.infradead.org; Sat, 06 Nov 2021 10:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636194563; x=1667730563;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cwGC7vbpUfH2AgVPghTZzn/Q1IkkcS2d/zGTMW0bCag=;
 b=nnE1EQYXNoHm5HyxweOEIUaxxHDNEP/UbvkFsj5q0TUSKZJGQNlYaV7/
 4PLhhEDrlL2HoMNWBemZuG3YXdw6eBO8Sxiex8zPfPL8rnSK+IFzCR4EH
 BxjPQAdOjZvToUsBUXvjpCLgerTtZ5gGFA5gII9U1rTs6oloC9FODnZKs
 qgnzLUTOmC5SmJk7tqlWdEqCTMEpFbX3zWHg2dvkRKZf2hRRvvAutricT
 67MWYCgrak35B981f0RA8IuPtRuwdzQ85MuRbz4iKqlnhFAUP8uUAOBov
 Jm06QbVeqyrFp3J/TzgBcVKpJayadiQ20Kq0CGfK75l4eOyeEN54Tsp45 w==;
IronPort-SDR: aLSSWat978B1+KZ7ilecPIGV7yRGElIC8LJnW73Gu0CfBbBBMF0OCz0tFpIJ1yEqh87pexs2+8
 yh3gUIjYsOMXlAPSd7rIjwqqvTfxw4hx9hE6HopTiDFJ4O+eT1BJYMFcG3KlOOyQVP0SgAZOi+
 JGdTjcDjd+4yqe+P9pEUQbE7LbA9YAZcvRfRnbuA02NUNXwaE/3hUy3bgGJXI38wxGZaobWQx/
 pnm2VaH15XQu+4b8yHRZ0v8/x2b3P+KsUlU5B6sZMKP7yz1VNIq+ylMAb+Bv+8GW3D3oeYs2PG
 ok9nZ1wD70uQYUA6eJ4K3+QA
X-IronPort-AV: E=Sophos;i="5.87,214,1631602800"; d="scan'208";a="142414207"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2021 03:29:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 6 Nov 2021 03:29:18 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 6 Nov 2021 03:29:16 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: Constify part specific fixup hooks
Date: Sat, 6 Nov 2021 12:29:15 +0200
Message-ID: <20211106102915.153552-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_032922_544937_6F37B40B 
X-CRM114-Status: UNSURE (   8.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Respect flash_info structure declaration.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
Depends on:
https://lore.kernel.org/all/20211029172633.886453-19-tudor.ambarus@microchip.com/T/

 drivers/mtd/spi-nor/gigadevice.c | 2 +-
 drivers/mtd/spi-nor/issi.c       | 2 +-
 drivers/mtd/spi-nor/macronix.c   | 2 +-
 drivers/mtd/spi-nor/micron-st.c  | 2 +-
 drivers/mtd/spi-nor/spansion.c   | 4 ++--
 drivers/mtd/spi-nor/winbond.c    | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 90573c59ad8b..916115bcb92e 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -19,7 +19,7 @@ static void gd25q256_default_init(struct spi_nor *nor)
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
 }
 
-static struct spi_nor_fixups gd25q256_fixups = {
+static const struct spi_nor_fixups gd25q256_fixups = {
 	.default_init = gd25q256_default_init,
 };
 
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 3c5ce2c2c646..ca17997df3c5 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -25,7 +25,7 @@ is25lp256_post_bfpt_fixups(struct spi_nor *nor,
 	return 0;
 }
 
-static struct spi_nor_fixups is25lp256_fixups = {
+static const struct spi_nor_fixups is25lp256_fixups = {
 	.post_bfpt = is25lp256_post_bfpt_fixups,
 };
 
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index bd7b1d63783e..ffd702ec8f50 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -28,7 +28,7 @@ mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 	return 0;
 }
 
-static struct spi_nor_fixups mx25l25635_fixups = {
+static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 };
 
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index c982458d5e31..944d2c995f44 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -113,7 +113,7 @@ static void mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
 	nor->params->quad_enable = NULL;
 }
 
-static struct spi_nor_fixups mt35xu512aba_fixups = {
+static const struct spi_nor_fixups mt35xu512aba_fixups = {
 	.default_init = mt35xu512aba_default_init,
 	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
 };
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 463ddd0776ec..3f0b849a7a54 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -168,7 +168,7 @@ static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
 	return 0;
 }
 
-static struct spi_nor_fixups s28hs512t_fixups = {
+static const struct spi_nor_fixups s28hs512t_fixups = {
 	.default_init = s28hs512t_default_init,
 	.post_sfdp = s28hs512t_post_sfdp_fixup,
 	.post_bfpt = s28hs512t_post_bfpt_fixup,
@@ -190,7 +190,7 @@ s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
 	return 0;
 }
 
-static struct spi_nor_fixups s25fs_s_fixups = {
+static const struct spi_nor_fixups s25fs_s_fixups = {
 	.post_bfpt = s25fs_s_post_bfpt_fixups,
 };
 
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index fd65fa7a5d94..cb6f3a2c57e5 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -28,7 +28,7 @@ w25q256_post_bfpt_fixups(struct spi_nor *nor,
 	return 0;
 }
 
-static struct spi_nor_fixups w25q256_fixups = {
+static const struct spi_nor_fixups w25q256_fixups = {
 	.post_bfpt = w25q256_post_bfpt_fixups,
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
