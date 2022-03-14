Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F966C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Mar 2022 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LQAi9KSH+Ktzlr0nop7Ty4WYHUl4ZTkAdelWaGs7gbQ=; b=y/TKwsDLupZKJK
	PbdOdBKUaTzQ9+wfDNqrFdfC5vKBDxBjG/OcGujapDFUoxdfIhq3lTsdL283VkOC4GcXnZhDO8UBI
	vYBRMGZT2aS+NYCCWmdTytf250c42RGJkwvUK+aeOFywy6WstUJvxtA1wxGB+Y2UQxFdoxyukwuk4
	bHxeY0iDxKHm+0Q+HX0xB2p7CtmaAA10mzmGn/FHqylPtM614jPKGb6+ZGopd6pVof4z3esIEvcOu
	WxrkJTr+8cADtfJP7vuxXSn+bSJ2cgSV+owJC5kRmOdBG0gOzqM5gMIl7bEJhMwnfqPFjOHLDcbet
	MnZP9SPznspY0rrz1JEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTmXx-005oGY-Qu; Mon, 14 Mar 2022 15:23:45 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTmXv-005oEL-0k
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2022 15:23:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5779A60009;
 Mon, 14 Mar 2022 15:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647271418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=b40S0QMNSHQYmPIxpBnZpF8zPLXRoJVYY2yR/V0VRTI=;
 b=e0vWrp8NmHAuU4xF0mAXLIu3/otdEaExwSW7iYHyVMEgZdJMkDxXJUhAlIFlIMBpc1eItq
 LYp/0+qxG578zD5C0pH3P9qPgDdABGAb1C+jqtEGL2K9JSWiO0/ieSnFI8jt2tEVoEgc9N
 5h7fiLybFWmWM+TtDm0AcL+u+SzrJIzmC/DHOfzd4GgVwKwFkyIWO0d2wro9UKgMexOorH
 0spA9JR2vJ9qhpOTVrWXYex125Gv6kX84jnVSRX7d4B8O1K4R8FcULxfaGqUGGZyWTZZmH
 YT2AGuhkGp83fbQ3wAUNC+xi/dNZlhOz85sje7bfGa4C/2kST3TkwRYjWkWgMQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] mtd: nand: ecc: mxic: Fix compile test issue
Date: Mon, 14 Mar 2022 16:23:36 +0100
Message-Id: <20220314152336.75447-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_082343_277247_E57C5442 
X-CRM114-Status: UNSURE (   9.07  )
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

Avoid random build errors with architectures which do not select
HAS_IOMEM by depending on it in Kconfig.

This fixes the following warning:

/home/mraynal/0day/gcc-11.2.0-nolibc/s390-linux/bin/s390-linux-ld:
drivers/mtd/nand/ecc-mxic.o: in function `mxic_ecc_probe':
ecc-mxic.c:(.text+0x2244): undefined reference to `devm_platform_ioremap_resource'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 8431292ff49d..9b249826ef93 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -48,6 +48,7 @@ config MTD_NAND_ECC_SW_BCH
 
 config MTD_NAND_ECC_MXIC
 	bool "Macronix external hardware ECC engine"
+	depends on HAS_IOMEM
 	select MTD_NAND_ECC
 	help
 	  This enables support for the hardware ECC engine from Macronix.
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
