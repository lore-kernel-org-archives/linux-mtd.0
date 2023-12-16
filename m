Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E907C4167B
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Dec 2023 04:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ocyjx6oI6HE63bFWeR4gEu8WvrIUyQ1tBbnY6yExkvc=; b=yo9O0J3aujiHfO
	MHiFCP+0MF+6WgQAcWZKH9q6TKZBOKz5W9UXSsivcyPuZLSM/elCLswnFWvvLDIGq/rnotJMyoteh
	fUmd5JxDbXT/Wl+ZGoBoBo9pOdSdZBGaOjse7EGtYtrBwdn+ZAgYdqGxp1GN0SqIKh6HVgSmR2HXE
	P+Dmf9VbAx4N9hP7Jswa+vGBDFyBjH5+Zzod5agNqah+HtT+8s07lEGZ3xLdEwlBM/3F50BgFkT21
	VWNXCYuJ1tMQwtJjDAoySC6H57fz1qrc90nbxaEYR2QVU9XlJQJmMZVITr7qTmcMsne6mw/kCDmc4
	pll/yrKDjYerQD1EHHHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEMUq-005OxL-2t;
	Sat, 16 Dec 2023 04:41:52 +0000
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rEMUl-005Ox1-0D;
	Sat, 16 Dec 2023 04:41:47 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	kernel test robot <lkp@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] mtd: rawnand: fix Excess struct member description kernel-doc warnings
Date: Fri, 15 Dec 2023 20:41:46 -0800
Message-ID: <20231216044146.18645-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Delete 2 lines to prevent warnings from scripts/kernel-doc:

s3c2410.c:117: warning: Excess struct member 'mtd' description in 's3c2410_nand_mtd'
s3c2410.c:168: warning: Excess struct member 'freq_transition' description in 's3c2410_nand_info'


Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312150611.EZBAQYqf-lkp@intel.com/
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/mtd/nand/raw/s3c2410.c |    2 --
 1 file changed, 2 deletions(-)

diff -- a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -105,7 +105,6 @@ struct s3c2410_nand_info;
 
 /**
  * struct s3c2410_nand_mtd - driver MTD structure
- * @mtd: The MTD instance to pass to the MTD layer.
  * @chip: The NAND chip information.
  * @set: The platform information supplied for this set of NAND chips.
  * @info: Link back to the hardware information.
@@ -145,7 +144,6 @@ enum s3c_nand_clk_state {
  * @clk_rate: The clock rate from @clk.
  * @clk_state: The current clock state.
  * @cpu_type: The exact type of this controller.
- * @freq_transition: CPUFreq notifier block
  */
 struct s3c2410_nand_info {
 	/* mtd info */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
