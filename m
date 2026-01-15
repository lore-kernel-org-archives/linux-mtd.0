Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1069ED44C48
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 14:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l16Q5Bj9SeRQ2iutVHCPi/p2gtuuKMBGUCIjJi/DkA4=; b=N1nU3S/Blo2b7y
	j/5EawPKJ8ZBo3NChTRtTFBqC0iXBIGON1qCXx4B+6ZzTFyXHiyyMKOxxpdSU5RYw1tvmpruvTYGv
	aHJ2AH5Z1LWcHB2Ql3WKmcXNjGU0dPvykvle5/aFdSQIeUjzKZG6+V+j9ZAqcUyYd0SU7kXkHC1xq
	WiCVZdleALvuDnDU7muPIPWq93p7wBnVqdMR2iKgR/ASGsXtNA5WCEBgNH2yqzLVxuLXLg79cvN//
	k5V6FBu6t2rx/MHX5yIWlWoOzKhQYp6Da+RgbCUhc+hYawchMhUT7sxpGLlRG3QdbRVzmRrXN04Ks
	2uDsiFA7IwpipVzecE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOIx-0000000CTw7-3xBn;
	Thu, 15 Jan 2026 14:26:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOIu-0000000CTvQ-3Hxl
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 14:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03D70442D1;
	Thu, 15 Jan 2026 14:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6C7C116D0;
	Thu, 15 Jan 2026 14:26:26 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v7] mtd: rawnand: sunxi: Convert to common field_{get,prep}() helpers
Date: Thu, 15 Jan 2026 15:26:22 +0100
Message-ID: <c5e1377b7a9b5cd6f08296ada5520e19951fe002.1768487070.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_062628_841325_22A3F640 
X-CRM114-Status: UNSURE (   7.07  )
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

Drop the driver-specific field_get() and field_prep() macros, in favor
of the globally available variants from <linux/bitfield.h>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
v7:
  - Add Acked-by,

v6:
  - New.
---
 drivers/mtd/nand/raw/sunxi_nand.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9dcdc93734cbff39..e66adfcca7cd63fb 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -29,12 +29,6 @@
 #include <linux/iopoll.h>
 #include <linux/reset.h>
 
-/* non compile-time field get/prep */
-#undef field_get
-#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
-#undef field_prep
-#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
-
 #define NFC_REG_CTL		0x0000
 #define NFC_REG_ST		0x0004
 #define NFC_REG_INT		0x0008
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
