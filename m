Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99342C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Feb 2022 19:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u/KLbcmmnN4mHM9XcHJ28Mo3MO0aIlN5veTJsLMS1uo=; b=aUgcYzpHaNwm9N
	HRTbGyuSbNWhWWxJSJ+80mDJXGY13sHQnNShCY26ec96ErDP7tbBlsbw4MH3Gdc71wlgLyAuq32Bn
	nDAd99leMqHudeqq79Gq4uNy8yo312hdYIII32xx6Yz8okgTosiEtKwl88iy3bI7gv1Dwo7PrQCWG
	7tcctn4ryXL6YQrh0w0VJGi9ZC1jP+DkZ8RDJm0OpMbt19sQ1WbWTqnHu2cWP4ApHJ04LcOW/uAX0
	Ein0CQVuRoFHXV7eATuiJZCbKpQqu7l3ws+iEFVgT9L/0Kzm6ju+70T0a+TACuaxgq5DSCN3S37CV
	cwsOiNbPFREMnxk2SdEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLVWe-00042C-Ke; Sat, 19 Feb 2022 19:36:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLVWb-00041g-UL
 for linux-mtd@lists.infradead.org; Sat, 19 Feb 2022 19:36:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A0664CE0ABC;
 Sat, 19 Feb 2022 19:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F872C004E1;
 Sat, 19 Feb 2022 19:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645299366;
 bh=MWwZOSqZ7f5adLPO0YY0SGSCohCq0Qr7LrSuLEInp3I=;
 h=From:To:Cc:Subject:Date:From;
 b=AfqFfwvXBmS4O0Jyhy7BQnDlLe5CEIQDqmKwmf4SIhucNcomOhg/BjP2eURijq+Yy
 LmEskNE2fLTKm9Td3OV7vbAvmnk8shLrEvtkX69UzU/wst/b456GvU47MCJvp3Is3z
 r4Ex/Mvl10NhT8xncZrkjz6k68ihUI4CSylawKijGtf8sHHxj6pXY36cW1hN5z0bXk
 ZLbGYUKsJRQmzxnKO8BMaLxCpIZpem4JDPgRuNl5YPr3cJKdCFbgy036bSllMyUNAs
 ItGTti4v+i6eeRee4nG6h6dlyEpqS9ol+U4aqzLJ+zLJOJP4IgVVRdiqxzE7mtESp/
 NAtHZTEGp/M5w==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	krzysztof.kozlowski@canonical.com
Cc: vigneshr@ti.com, nm@ti.com, linux@roeck-us.net,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>
Subject: [PATCH] mtd: rawnand: omap2: Actually prevent invalid configuration
 and build error
Date: Sat, 19 Feb 2022 21:36:00 +0200
Message-Id: <20220219193600.24892-1-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_113610_186239_94DAF552 
X-CRM114-Status: GOOD (  11.58  )
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

The root of the problem is that we are selecting symbols that have
dependencies. This can cause random configurations that can fail.
The cleanest solution is to avoid using select.

This driver uses interfaces from the OMAP_GPMC driver so we have to
depend on it instead.

Fixes: 4cd335dae3cf ("mtd: rawnand: omap2: Prevent invalid configuration and build error")
Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/mtd/nand/raw/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 36e697456ec4..9b078e78f3fa 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -42,8 +42,7 @@ config MTD_NAND_OMAP2
 	tristate "OMAP2, OMAP3, OMAP4 and Keystone NAND controller"
 	depends on ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
 	depends on HAS_IOMEM
-	select MEMORY
-	select OMAP_GPMC
+	depends on OMAP_GPMC
 	help
 	  Support for NAND flash on Texas Instruments OMAP2, OMAP3, OMAP4
 	  and Keystone platforms.
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
