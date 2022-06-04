Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8FEC43334
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jun 2022 11:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=70omWhRtapZ9HiSjvXHZF6ZTwSbos0YTiskp4QmF5xM=; b=UmfeexQc/DfQw6
	68oCojj677aD3kUa5WpK5ag3slp/1ANI6l9gFqCxsZh2O27pntCh7Pq8E/j/d8o4eEzV2t6hbPNKg
	C5HGS4BEK+tAvLQfJj5XjIVYUocmFMvSsNEHn+jHrVksIF/4gwatAasCyDNboOLLkPkhHDecCiW1v
	6FUVom/eKHImIOTWD6B1NPFQu6ofk6TqhHVBdhMEORAOPFNQ+L2dfgfFjC848tv7vWs1S6gNla0UU
	aIeH7DhFZAXfnM1YQxvfZOwLiOR0iCr5oiOtwc+ysoffR5jQDnW//CI9dUnDH63oDIcAMYgrHLKyE
	sHVl+lm4Cen12lCB89Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxS0i-00BFiQ-Ic; Sat, 04 Jun 2022 11:32:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxS0f-00BFeW-FT
	for linux-mtd@lists.infradead.org; Sat, 04 Jun 2022 11:32:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id v4-20020a1cac04000000b00397001398c0so7558517wme.5
        for <linux-mtd@lists.infradead.org>; Sat, 04 Jun 2022 04:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tR+KLmOud8HT/pd+Me16gLGcHM1HDhk7MyzO7aY9pbM=;
        b=W4F0CIlJ8Lmvg7s3KUBlRYMcmGduzASkvLsMJKFgUUMoioRu0oMZ6mMzY/30gRvayn
         m9xsskPDr/Z+ATTHLYpR9w1X0JgGgVE604juKGQ1CM+rwwmO7Du2JP8RabfYSmK+6Spo
         o7bhGCN7JiHVJEgRCxbbFij4WtSounaIsbwgA/O/Mn7LmY8Y50neflXLs9C8/Ohs1WZx
         guGp7h/MQB3SO5q7XplS7n2/8zQty9LGRY/or0lCrkSaJCjPfy3NSuOPEoF9Pfh7CYVi
         WuFUadtZwMjUDru5gd/8l04KqkZdcS8b7zcbi0QGeYZTO52jPCdAAtLg/fe5V9kS9rge
         cPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tR+KLmOud8HT/pd+Me16gLGcHM1HDhk7MyzO7aY9pbM=;
        b=4o5n3uGDro/0ir80z26XoYWXXn9AwV77NPc+e808Hn+hBneFz6UIte+UzT1CW1hFqf
         TRfeZtmHCr2rMYI1r49sPhM8dLGN0UlKtUrhMnnnMHhC4d6jI6DRmlCvNikTW9LyBcuy
         rj8Sggp/PvRFqnxTBIhQyPq9zadqDRneyJ7lomTnxhAN2AcAzBQdKEjpKoQLvqfIXH7j
         s3m1d7HqmC3YNII8M9aLnZmMs+0ZNIVcSm2XEgBSH8iecac5/v5w8jj3ROnKiPnjPLMl
         pzf8wka2uMmw30urFySek2EdywPwn8Qi1w7mKIG9OtmEPcQI5xLeQrCs1o1b3eexE8i/
         5NHA==
X-Gm-Message-State: AOAM533qi7gZhFOKrR4EVvT0Ygr/aHyVN+K7+fgZyQyN5m1pa/mZQviH
	GyTz49MwdP87PumCsWbgJCc=
X-Google-Smtp-Source: ABdhPJxmssWbL/3gOaM940vzFKBOAmaYaiRPJ+v+51nZu9fbtZ6zHmySHl6fiVZ4zDGXGqiM4sEIwA==
X-Received: by 2002:a05:600c:190b:b0:394:96d3:5780 with SMTP id j11-20020a05600c190b00b0039496d35780mr42631097wmq.82.1654342310211;
        Sat, 04 Jun 2022 04:31:50 -0700 (PDT)
Received: from localhost (92.40.202.88.threembb.co.uk. [92.40.202.88])
        by smtp.gmail.com with ESMTPSA id e11-20020adffd0b000000b0020e6ce4dabdsm10221095wrr.103.2022.06.04.04.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 04:31:49 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spinand: Add support for ATO25D1GA
Date: Sat,  4 Jun 2022 12:32:50 +0100
Message-Id: <20220604113250.4745-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220604_043201_535627_95329683 
X-CRM114-Status: GOOD (  18.71  )
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

Add support for the ATO25D1GA SPI NAND flash.

Datasheet:
- https://atta.szlcsc.com/upload/public/pdf/source/20191212/C469320_04599D67B03B078044EB65FF5AEDDDE9.pdf

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
v2: Put core.o first in Makefile

 drivers/mtd/nand/spi/Makefile |  2 +-
 drivers/mtd/nand/spi/ato.c    | 86 +++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/spi/core.c   |  1 +
 include/linux/mtd/spinand.h   |  1 +
 4 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/ato.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 80dabe6ff0f3..b520fe634041 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-spinand-objs := core.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o xtx.o
+spinand-objs := core.o ato.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o xtx.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/ato.c b/drivers/mtd/nand/spi/ato.c
new file mode 100644
index 000000000000..82b377c06812
--- /dev/null
+++ b/drivers/mtd/nand/spi/ato.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Aidan MacDonald
+ *
+ * Author: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+
+#define SPINAND_MFR_ATO		0x9b
+
+
+static SPINAND_OP_VARIANTS(read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+
+static SPINAND_OP_VARIANTS(write_cache_variants,
+		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
+		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(update_cache_variants,
+		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
+		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+
+
+static int ato25d1ga_ooblayout_ecc(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	region->offset = (16 * section) + 8;
+	region->length = 8;
+	return 0;
+}
+
+static int ato25d1ga_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	if (section) {
+		region->offset = (16 * section);
+		region->length = 8;
+	} else {
+		/* first byte of section 0 is reserved for the BBM */
+		region->offset = 1;
+		region->length = 7;
+	}
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops ato25d1ga_ooblayout = {
+	.ecc = ato25d1ga_ooblayout_ecc,
+	.free = ato25d1ga_ooblayout_free,
+};
+
+
+static const struct spinand_info ato_spinand_table[] = {
+	SPINAND_INFO("ATO25D1GA",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x12),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&ato25d1ga_ooblayout, NULL)),
+};
+
+static const struct spinand_manufacturer_ops ato_spinand_manuf_ops = {
+};
+
+const struct spinand_manufacturer ato_spinand_manufacturer = {
+	.id = SPINAND_MFR_ATO,
+	.name = "ATO",
+	.chips = ato_spinand_table,
+	.nchips = ARRAY_SIZE(ato_spinand_table),
+	.ops = &ato_spinand_manuf_ops,
+};
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index d5b685d1605e..9d73910a7ae8 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -927,6 +927,7 @@ static const struct nand_ops spinand_ops = {
 };
 
 static const struct spinand_manufacturer *spinand_manufacturers[] = {
+	&ato_spinand_manufacturer,
 	&gigadevice_spinand_manufacturer,
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5584d3bb6556..6d3392a7edc6 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -260,6 +260,7 @@ struct spinand_manufacturer {
 };
 
 /* SPI NAND manufacturers */
+extern const struct spinand_manufacturer ato_spinand_manufacturer;
 extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
