Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD8AC00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7fpN2dGOsNEN79wy7iJSqabLeDI9B2of1H8ucNo9wGM=; b=hqg3DOrDL8MiLr
	KU/f9fr5VgxSQ+bZBnGIWoc232FJppPkZnlCzaLNcYgDAjwa7+O6RzhHDFSIi1ugAFoAiUvnjCi5n
	ToJurIWi2wszITQfKPk3dQt8JofWs8upa2Cci/fBj1FFeMT1m6U5oZ8DUgNIMXKAw10HX/ook5YEf
	BIa+FQkNyXaJNW6krnagkpxg+XTE16z56t8DlvJWB5nK6BWosyD6THaNFyYxpkwZxJum7KZYHFPdF
	MKKdGn2MteTzT7XLkmEbf/uPVne9Sxft1JlYzQO6cMmgPj6PkTjdU+kO+RUsI9We+hHtOhi0m8mH9
	FHL+PekBHONxEy/g3p4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLo7Q-00CihS-A7; Wed, 10 Aug 2022 15:59:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLo7L-00CicI-NL
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 15:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660147175; x=1691683175;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qGSqf35XcKkooQewaZSj1rVgY1ZWI9IFjscyzYtzbsI=;
  b=dkwPDp+qTfRWLw3c1aVkThruEAg2qFFrwDOc2Njwr9y2WBTvsiJSIWOU
   r1W05bRkwSD/oesBtwz8nZQogrooeQOwMbcHFeBtIwVOKqEIqyZh9bJ/3
   +GzL7lDiDCtxZtmXsymsmmqI7Cyoq5sbhp3oABU/fR2TVpVAK1FiK0R/T
   29YHtPDvnXhUgwiJlAiKBmSSI2pKQGQ/k0cfuV0oPJy1WQ3+DNgRS60lp
   ZRbUgGDiYwwnDG442qzCql5Cycy0hsuxbTZnuIjpr8Moemlz5XfPszImX
   T/VhfQ/+B29785B479iHxi9Ye02KlI0evVKKZFat1JI6XKK/5KbQ8ZhCI
   w==;
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; 
   d="scan'208";a="108449604"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 08:59:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 10 Aug 2022 08:59:27 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 10 Aug 2022 08:59:25 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <sudip.mukherjee@sifive.com>, <pratyush@kernel.org>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, Tudor Ambarus <tudor.ambarus@gmail.com>
Subject: [PATCH] mtd: spi-nor: core: Update documentation for info->fixup_flags
Date: Wed, 10 Aug 2022 18:59:24 +0300
Message-ID: <20220810155924.1366072-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_085935_946105_ECA250C8 
X-CRM114-Status: GOOD (  13.98  )
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

From: Tudor Ambarus <tudor.ambarus@gmail.com>

fixup_flags should be used when the flash defines the mandatory BFPT
table, but doesn't define an optional SFDP table from which a
particular flash parameters is discovered.

Reported-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@gmail.com>
---
 drivers/mtd/spi-nor/core.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 3f841ec36e56..b87d61a105f7 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -466,10 +466,10 @@ struct spi_nor_fixups {
  *
  * @fixup_flags:    flags that indicate support that can be discovered via SFDP
  *                  ideally, but can not be discovered for this particular flash
- *                  because the SFDP table that indicates this support is not
- *                  defined by the flash. In case the table for this support is
- *                  defined but has wrong values, one should instead use a
- *                  post_sfdp() hook to set the SNOR_F equivalent flag.
+ *                  because the optional SFDP table that indicates this support
+ *                  is not defined by the flash. In case the table for this
+ *                  support is defined but has wrong values, one should instead
+ *                  use a post_sfdp() hook to set the SNOR_F equivalent flag.
  *
  *   SPI_NOR_4B_OPCODES:      use dedicated 4byte address op codes to support
  *                            memory size above 128Mib.
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
