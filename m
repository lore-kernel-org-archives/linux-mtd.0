Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4008ECF34AC
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 19:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a4nBZOviq50nQCccZ7hpKWZqYFx8g0m+Iw4FL3JRQKg=; b=r6luNesF7O/TRt
	J6mMh9jDLUVUadEsF2ZMxd3St7aOwkv8KfubPd5YRXdN0MKdthKt+YOyQu09eqXFAmB3Az2Ey7dgQ
	Fu3tF3G0aFjm5BHDUl8p+wBx7A6tddXrMChe+3hWY1c8fbEgPqVt7OWRD6n84ibKosY45FhqwLpF2
	wUGPF5VuKsl6JuYn/+UHk7QTlnh7ZqXIr8o/l8mk7tTkcVXWjE5ALrJVf98Ck0aKTrs2DrzAiW6QR
	YdtSUI3Mp0fwj+Z/eMp4WvyQ6gAnaEdYGZDwqIpwczp/VShwDfb2EhpNg/ZCJJxW/XPQSUIPowKv/
	xlX7B6xBuzGNObV5n7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLnwP-000000054lz-48JF;
	Wed, 19 Nov 2025 19:34:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLnwM-000000054jX-3OkA
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 19:34:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F413D4E417A9;
	Wed, 19 Nov 2025 19:34:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B738660699;
	Wed, 19 Nov 2025 19:34:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43F2A102F2165;
	Wed, 19 Nov 2025 20:33:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763580842; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=L+b15rNijrloVZKbtZ9F1GGYw86d4sq/42MKZh2Rtzw=;
	b=ZBpzjazDRABbSZddoCmy9i0GULuM/VjNltQEc12jIQULvIHkcDB5wCme2WIM4XwG77e40p
	IkUtfMAWAx4+n7BE7RE/+KFhbNkK9wgSWg8p9qeT7Xhk/5h2Sf30VPBvs/ZJVBxoBBBgyO
	DSE2YFetJfr3fjorKJE4yBVN1pKcKYbSMdBnj+TIL666RM3a/UZjOvoB5rbZCqdXBjAP/a
	JFZ21bWSQhhQWcCt6S2X5D0CsB84Ojfz/0rOhej7GpY3wYgqGM51G89AK3HeO7JSvGECu2
	CEU6XXtv62xWLDrOkgLObNRnYM1ZJ3jIvNdV4bnyAPn/14c/UO2v9r4cZwhd4w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	kernel test robot <lkp@intel.com>,
	Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH] mtd: nand: realtek-ecc: Fix Kconfig dependencies
Date: Wed, 19 Nov 2025 20:33:57 +0100
Message-ID: <20251119193357.127469-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_113406_979962_2EC8FF8B 
X-CRM114-Status: GOOD (  10.66  )
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

The driver uses DMA but does not mark it as a prerequisite in
Kconfig. As it is also defined with COMPILE_TEST, autobuilders complain
about certain symbols not being available when linking on architectures
without DMA support (?) like sh.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511071114.8WeW2GZK-lkp@intel.com
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 4a17271076bc..1e57c8de8578 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -63,7 +63,7 @@ config MTD_NAND_ECC_MEDIATEK
 
 config MTD_NAND_ECC_REALTEK
         tristate "Realtek RTL93xx hardware ECC engine"
-        depends on HAS_IOMEM
+        depends on HAS_IOMEM && HAS_DMA
         depends on MACH_REALTEK_RTL || COMPILE_TEST
         select MTD_NAND_ECC
         help
-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
