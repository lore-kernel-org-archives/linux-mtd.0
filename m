Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FC1D41C2C
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 09:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tq0pxZqQHt1XaGHXC0Vg9kfRZ2FnaOOXE0CVAqicNXk=; b=lJxvvAFLGofonE
	FLX/KSWoUMQgUZ6BJy1CB6+vU8dyRW1ShLUIivi3UXqQAastyELFD9jGlKgKQ54l02MdwOZETHW2T
	Ki+znAXVC7oDItRBu1M5g0w2GPkb0I4xkS8NlsXUT+7BFqMRLnQE/X9WlyGN47fXQOHv7ulhW+odl
	62CjGlL/W/kMMbfUPp1TSKfa4GNr2+reQUymHTYAOXas3956XdDXzahLOxAJmU99IvY3wOieReWYv
	ONNf7opGkpSd6rzgjQ0uAOuAB9UN/6lmdiz6BbliVAe3jS/FJ4zfKrnR9L+wa7PN7GjRk4qWZOZk0
	pT2XsqEQXGf/CgzI2Lkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA9C-00000006LRi-32de;
	Wed, 13 Nov 2024 09:58:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA0V-00000006IaX-3ynB
	for linux-mtd@bombadil.infradead.org;
	Wed, 13 Nov 2024 09:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=260i8Kmy1qIGGfd2CxjTGXG+BKpSWuDOsQ7KscW8IdI=; b=EKWij1g5r0A/WD+NGV5HjEhe1j
	ztW5cHYWvm4DEyGIRWPBCSuKakZcIG4I/PU86UuuyxbZOYQwFPxxLlk8r7NZVhZ31IEx8ylqSKIv6
	m5RMzUzLjOyiO+ZViV60WRglpkEbsj5NyjTWdDSGx9MVAUlalELSHXEVZljhZ83jP4/ELuSWpEF6O
	6/kluyc9u3FK+J0rdlta0p19My06xSb7/X3lCR6r4LPZzXLpXFElagnwtbO7D9Er3rST9dRMI1kLy
	OnVfnfynX8ukC7v4YGwW+bqgDb1hLa+Q3is0GxY9XV1MOr4x47AMUZNoJe1ni/uT1NaatvoS/Vs+r
	FcOGDaqw==;
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA0S-0000000DE63-1Dfj
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 09:49:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id D46D2C000E;
	Wed, 13 Nov 2024 09:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731491384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=260i8Kmy1qIGGfd2CxjTGXG+BKpSWuDOsQ7KscW8IdI=;
	b=IMq96P9In6IIpdHVT6qJIa3yVx92sCrs2ivv9hdzVcY3aaZbT369sgXTGVN/d/OZR0e7/K
	ZA47g3QqlSDTjktZoJrkHNf7/hmc3rYHhqZ89LXL1W/qBChmNhq+8PmCuN8aCPDelDUM7J
	3lHb7TPnGjimMm2QvHyEtsiPRHaCnDhbYs+QVmtNNRr/7Zm6yBdS5Ij1e8K6bf8qlbAj8U
	6dd8GFtihedzk66zZX+7ykVRIjwCVjHm90427ZX0jFK/BPjgOeAHCajN7n1uhzwDDKRuxO
	wyp6wCe63JLZQ5mgtCrpWU8d0vaCLKZoX5VPa8SMn2K3h6sk9rKLm6eauaVygQ==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 4/7] mtd: rawnand: davinci: Always depends on TI_AEMIF
Date: Wed, 13 Nov 2024 10:49:35 +0100
Message-ID: <20241113094938.44817-5-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113094938.44817-1-bastien.curutchet@bootlin.com>
References: <20241113094938.44817-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_094948_597697_D6787C4E 
X-CRM114-Status: GOOD (  12.45  )
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

DAVINCI_NAND depends on TI_AEMIF only when ARCH_KEYSTONE is selected
while the NAND controller is also always a part of the AEMIF controller
on DaVinci SoCs.

Set a dependency on TI_AEMIF regardless of the selected architecture.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411020140.3wsKJOSB-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202411020957.X1T8T9ZR-lkp@intel.com/

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/mtd/nand/raw/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index d0aaccf72d78..bb61434347bd 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -279,8 +279,8 @@ config MTD_NAND_SH_FLCTL
 
 config MTD_NAND_DAVINCI
 	tristate "DaVinci/Keystone NAND controller"
-	depends on ARCH_DAVINCI || (ARCH_KEYSTONE && TI_AEMIF) || COMPILE_TEST
-	depends on HAS_IOMEM
+	depends on COMPILE_TEST || ARCH_DAVINCI || ARCH_KEYSTONE
+	depends on HAS_IOMEM && TI_AEMIF
 	help
 	  Enable the driver for NAND flash chips on Texas Instruments
 	  DaVinci/Keystone processors.
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
