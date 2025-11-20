Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949D3CFA446
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 21:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sAKJntU+o8clD8bFkHPdYCGFdgOPLCaw2dMIpSUkekQ=; b=U5xD3DKh6txUBp
	++ObninYReGjkEz8fBY6G0FgCrY/HM/GjKRgMq/VqSCTyxZmuEpCsqqHJ1R9SCpyrJ4K8miTQHknZ
	zduyMJXi+0vU3mgLQdHBZKe3CjjHDkKZGdTlc1CAAzzUV0apVtzAFGAHKEWmGxFBCuxsZofAdtWBU
	IshIlSntfFoS3U94q1FEORVguRAhO23Rvj6jWXjBL40BLfwvJ06mGtGZIvUK0LBEY7LYVpfAn032+
	l9+oVYHe8J//qyTnsv7kr1Segw/lfN3MJF/yuiFelh5E33iCma2FPylF1SuKUQkDbQ0xtWgPeOo6U
	cFQXCdj1prBZ40IerDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCM0-00000007TI7-2ixZ;
	Thu, 20 Nov 2025 21:38:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCLw-00000007TGB-2PFC;
	Thu, 20 Nov 2025 21:38:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDF9741777;
	Thu, 20 Nov 2025 21:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9663FC4CEF1;
	Thu, 20 Nov 2025 21:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763674687;
	bh=1BDDDcVfQtzBnr9L2D6gF5aeR5iOya1diUp8Au6Msz8=;
	h=From:Subject:Date:To:Cc:From;
	b=TEKNWEBve0Af7iv+D+r2cjg8t39cHgEp/e4h8iGuhn6PEXxAxKOAqVOLUeQuFgs/R
	 AABGkFDCupa5inaB0D3LjwtLEL6FCqq0d9dCL3RoqHyy/yyZATGDY/r6EK74QqnuPs
	 W16eY18FLTHtVgnxk+4cjBydylYhlgJ8SkbuC413ejZqKlWyimMiJ1Wy7szLd+l1wi
	 +we/M9dEHvAwn8lOY7SMajQHtCtR2774deExwCvLx+mpdl/dbsuCv5YsZg1v+p7GaE
	 goah48ru70strcOzI3F1GL48XLUarBBWWLjz5h62cs6XOVS7+PnFJj0SiYTtOE+VFJ
	 Wa7P/jSsVYrWQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v2 0/3] at91: Remove of_platform_default_populate() calls
Date: Thu, 20 Nov 2025 15:37:49 -0600
Message-Id: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC2KH2kC/x3MQQqAIBBA0avIrBN0oMCuEi00x5qNikYE4t2Tl
 m/xf4NKhanCKhoUerhyigM4CTguG0+S7IcBFc5ao5L2NlrmkhxJVMEdZOzitYMR5EKB33+27b1
 /PW8rqFwAAAA=
X-Change-ID: 20251120-at91-probe-20fbce9a6d1b
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_133809_391728_A6E208B8 
X-CRM114-Status: UNSURE (   8.70  )
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

This is another attempt at removing of_platform_default_populate() calls 
on at91 platforms. The last attempts were in 2018[1] and 2023[2]. The 
problems reported are PM and NAND failures. Both of these depend on SRAM 
pool which doesn't have any fw_devlink tracking. Also, the PM code is 
not a driver, so fw_devlink wouldn't help. For the NAND driver, we can 
simply defer probe. For the PM init, we can move it to the .late_init 
hook.

Rob

[1] https://lore.kernel.org/all/20180712192222.32481-1-robh@kernel.org/
[2] https://lore.kernel.org/all/3908fa6f-dc33-4aac-c21f-4a676a3a6b23@microchip.com/

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (1):
      ARM: at91: Move PM init functions to .init_late hook

Rob Herring (Arm) (2):
      mtd: nand: atmel: Defer probe if SRAM is missing
      ARM: at91: remove unnecessary of_platform_default_populate calls

 arch/arm/mach-at91/at91rm9200.c              | 12 +-----------
 arch/arm/mach-at91/at91sam9.c                | 12 +-----------
 arch/arm/mach-at91/sam9x60.c                 | 12 +-----------
 arch/arm/mach-at91/sam9x7.c                  | 12 +-----------
 arch/arm/mach-at91/sama5.c                   | 21 +++------------------
 arch/arm/mach-at91/sama7.c                   | 11 +----------
 drivers/mtd/nand/raw/atmel/nand-controller.c |  2 +-
 7 files changed, 9 insertions(+), 73 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251120-at91-probe-20fbce9a6d1b

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
