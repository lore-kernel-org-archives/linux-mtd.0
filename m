Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA73AD12664
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2024 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tq0pxZqQHt1XaGHXC0Vg9kfRZ2FnaOOXE0CVAqicNXk=; b=JWpfM3x7lyK42h
	psOPs0fAypMpPZnD5i0MXhmNgChkQ93BMJbXPshyjANTyaIv5KkGIucseor2WWhsrjcpz8mMaC2cK
	HfJwbH0lKdpdHVb98temOhA6e5yPx2YxdZN+JJsk1gCLcrV3d+yZwoR/npoVgEzoCRjEV76bvJQF4
	aG5rWDA8rxSCT+1XVAbB4+0rm+yTF4bvDDPiaWVbDDjZtaC7BwJUCXZkinUgzURge3vpbMT0q2B+I
	+h8Gqp+anTngvU+eXe9DpMsHJu7VUFFHkC85682X1QDMHcLL70W462AUlBXsGgc77Vz3L+0cH8wPo
	gC9yj/zKpeYwOqRCIfRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bot-00000002MaE-27j8;
	Wed, 06 Nov 2024 08:55:19 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8boq-00000002MYF-1aXp
	for linux-mtd@lists.infradead.org;
	Wed, 06 Nov 2024 08:55:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 43EF81C0002;
	Wed,  6 Nov 2024 08:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730883314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=260i8Kmy1qIGGfd2CxjTGXG+BKpSWuDOsQ7KscW8IdI=;
	b=RVDddowheMh2Y67227SddCz/E09oO7H6Uo62/Qz482isvIR8bpHboW4ogqNv0HRNzNx+HQ
	RROWE8ReS8ZJySauLtKzS+nbf/jphrpqUt1iA0YwlOK/2pme7oYlSRl6axRD0HcH0Bit1Y
	9X0vSqiNbAiQ4h9ffLnx4Z6mYjU89P1/nYQ9iYAaH72pZpyEyXD1+3Oh7HaIB8lwQY1uug
	TU0twGZmgzdfDHhHxiRBLdOVqcBkwxbhgDCjc9z7WItkeWMCtTj25QKJyVyDoomx3nJoRv
	3mSKKrEja8YKpU62+oPD3S0VUHfM+ULHIeJkhu4mlINbj8l+HUqYD73nIQqltg==
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
Subject: [PATCH v2 3/6] mtd: rawnand: davinci: Always depends on TI_AEMIF
Date: Wed,  6 Nov 2024 09:55:04 +0100
Message-ID: <20241106085507.76425-4-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106085507.76425-1-bastien.curutchet@bootlin.com>
References: <20241106085507.76425-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_005516_582626_8322DB82 
X-CRM114-Status: GOOD (  12.89  )
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
