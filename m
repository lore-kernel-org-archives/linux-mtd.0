Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E05BC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jan 2022 12:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z3jo3OvTwL+EQfo4s/wMDC6e9EE9BzAT4Up7Mx/WyPc=; b=SQplDzfh+GbS3P
	XZnONxXw2FIhW4cfhTPU77Sv171vUNKJ5AQTAjPRTU3d/uT9fUhTtvguW3WIk77sfJH2sq/NJLZOu
	TY4JvZ/6lS0rdoI67MMdoLbl8ACdDvVnHA9z3MTij4fNdyIB08a2NMQF41NT8okJ6RzxxIp8I/nu4
	75px8klv6KEDKoTZvbvuxNLFRwYuwFF7ka4NhslF4gp4PNgzhtNs2VaHAuDKZsf0ez54XuqdWPR9D
	bLSXQlQh73AADO7Q2xNw83UamEEYA0fdfoQJklHdiRsyJpLBZimkckif258GXnVYATROPo6ZOM2p0
	Vjbt8gCjt3PSGHYtOkMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9ni3-001U6w-Lh; Tue, 18 Jan 2022 12:35:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9ni0-001U6T-VM
 for linux-mtd@lists.infradead.org; Tue, 18 Jan 2022 12:35:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBCC3613EA;
 Tue, 18 Jan 2022 12:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572DCC00446;
 Tue, 18 Jan 2022 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642509331;
 bh=VG2Z/EYZoovWfQJb9a0Asmj3TQLSNNxBCPcZ49i1f9I=;
 h=From:To:Cc:Subject:Date:From;
 b=uj8Sh6rkyoGZOzGYQsnt4Ma+SZk0BAxUHjY1hd61+mAez8Xa56vT2pDWo5jv0dArs
 +VRLBO2KFHlRcX41FzGFYxMXzXbrxgCfZ8UNRmqF9coPLZegDTeBB2C6MStRQK1wiv
 juhsOFIUWSyI3oxMk3rb+/k2wRaYEpUh0H1EVwMAjfyyWXKPYGRIH4Y6eheEZn9hcg
 aNfDAgFgM2GFCwaH9Qkzx62r6jX7ANfLnArreK6iocVZn6ufc0QKkBC1eDlX6pRMPl
 vnGtiiwsy4ueMgEr4MfevvrKDEM4FnNmUZnv41Q6Be7RYsNVyYLUyjqvKYcZ1Usq5H
 QcnG+8CMHDV3A==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	krzysztof.kozlowski@canonical.com
Cc: vigneshr@ti.com, nm@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH] mtd: rawnand: omap2: Prevent invalid configuration and build
 error
Date: Tue, 18 Jan 2022 14:35:25 +0200
Message-Id: <20220118123525.8020-1-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_043533_090610_1DD9E1E0 
X-CRM114-Status: GOOD (  11.11  )
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

We need to select MEMORY as well otherwise OMAP_GPMC will not be built.
For simplicity let's select MEMORY and OMAP_GPMC unconditionally as
this driver depends on OMAP_GPMC driver and uses symbols from there.

Fixes: dbcb124acebd ("mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/mtd/nand/raw/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 20408b7db540..d986ab4e4c35 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -42,7 +42,8 @@ config MTD_NAND_OMAP2
 	tristate "OMAP2, OMAP3, OMAP4 and Keystone NAND controller"
 	depends on ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
 	depends on HAS_IOMEM
-	select OMAP_GPMC if ARCH_K3
+	select MEMORY
+	select OMAP_GPMC
 	help
 	  Support for NAND flash on Texas Instruments OMAP2, OMAP3, OMAP4
 	  and Keystone platforms.
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
