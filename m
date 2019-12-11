Return-Path: <SRS0=irXt=2B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A89FC2D0C4
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 05:46:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58ED020836
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 05:46:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YtGmkg4e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="20huwndA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58ED020836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=w06cEOzBtpS/V3a9HJ/ZKYAhdkwdVqizpjGwYDEwFT8=; b=YtGmkg4eAXvVhsW8YAJ9w1JGUv
	L4jNiiCfQUq9qsz4tqtUAwCVcdNuLbqEFvBrKp9Y6E4hgTrJx7gX5HbQO1iIabdgkbPp+5WG7HpCt
	3+1CXhSAVjwt67uRn4TxHCmmv8gOUgXL3jyWN6NQLtjYBHMVfHfh/nekU9MkdE1tBrJ+JuHJG6BGp
	UR/lDl2QFAqpSjdu2WKxwUE/oHAk27rf9kQu8wOmuJkdz3GukmRdp4PiydacYDkdE72oPrP9jqeLb
	yZNKc3bsHYUevkgHLHoSnpkr511ShlsEcpGXJQnuur6HiSTpL8o5/FnzrtTd/d47ZafYhgGGypiiV
	goYTQ5jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieup2-0004tr-3t; Wed, 11 Dec 2019 05:46:04 +0000
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieuoy-0004t9-C1
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2019 05:46:02 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id xBB5jdVb019523;
 Wed, 11 Dec 2019 14:45:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com xBB5jdVb019523
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1576043142;
 bh=5tRNV+uzJuKYOSVUsYXTU2MrmaE0khMYlLEUoRe31qk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=20huwndAsZd8pNPrAO75GRTW41FmXK5L/af2R9egldxaSTeoLXA1cDLnahlzlucmS
 LpR62oEUtUEmPlwS7bLW6nCh6Kd5x+z5RZ3eJiLVWPoDH7vosMIqCa/dXw0GzCB0im
 mQLWnBL24Y54gTkjtbF0QPSDOaSsrO6ASRsTtr4/vvsHZh2DvJ20oadGNCQ81zSTeu
 5B708QnHg7ODZJdZ8by93NHJWvlf8bSXljveTq9ucgmDzNR0Q9TJRbHMerX4+IS0tM
 Rfcgi0/5AcyeVtlmgI+0xZaJhlcg09+FM0rlrE5Xq5cb1Hyo3rsVUvM124cpKrlXJj
 2Td98Q8XctjsA==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/2] mtd: rawnand: denali_dt: add reset controlling
Date: Wed, 11 Dec 2019 14:45:38 +0900
Message-Id: <20191211054538.8283-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211054538.8283-1-yamada.masahiro@socionext.com>
References: <20191211054538.8283-1-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_214600_642979_5F70DD43 
X-CRM114-Status: GOOD (  18.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

According to the Denali NAND Flash Memory Controller User's Guide,
this IP has two reset signals.

  rst_n:     reset most of FFs in the controller core
  reg_rst_n: reset all FFs in the register interface, and in the
             initialization sequencer

This commit supports controlling those reset signals.

It is possible to control them separately from the IP point of view
although they might be often tied up together in actual SoC integration.

The IP spec says, asserting only the reg_rst_n without asserting rst_n
will cause unpredictable behavior in the controller. So, the driver
deasserts ->rst_reg and ->rst in this order.

Another thing that should be kept in mind is the automated initialization
sequence (a.k.a. 'bootstrap' process) is kicked off when reg_rst_n is
deasserted.

When the reset is deasserted, the controller issues a RESET command
to the chip select 0, and attempts to read out the chip ID, and further
more, ONFI parameters if it is an ONFI-compliant device. Then, the
controller sets up the relevant registers based on the detected
device parameters.

This process might be useful for tiny boot firmware, but is redundant
for Linux Kernel because nand_scan_ident() probes devices and sets up
parameters accordingly. Rather, this hardware feature is annoying
because it ends up with misdetection due to bugs.

So, commit 0615e7ad5d52 ("mtd: nand: denali: remove Toshiba and Hynix
specific fixup code") changed the driver to not rely on it.

However, there is no way to prevent it from running. The IP provides
the 'bootstrap_inhibit_init' port to suppress this sequence, but it is
usually out of software control, and dependent on SoC implementation.
As for the Socionext UniPhier platform, LD4 always enables it. For the
later SoCs, the bootstrap sequence runs depending on the boot mode.

I added usleep_range() to make the driver wait until the sequence
finishes. Otherwise, the driver would fail to detect the chip due
to the race between the driver and hardware-controlled sequence.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---

Changes in v2:
 - Split into two patches

 drivers/mtd/nand/raw/denali_dt.c | 40 +++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 8b779a899dcf..9a294c3f6ec8 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
@@ -14,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 
 #include "denali.h"
 
@@ -22,6 +24,8 @@ struct denali_dt {
 	struct clk *clk;	/* core clock */
 	struct clk *clk_x;	/* bus interface clock */
 	struct clk *clk_ecc;	/* ECC circuit clock */
+	struct reset_control *rst;	/* core reset */
+	struct reset_control *rst_reg;	/* register reset */
 };
 
 struct denali_dt_data {
@@ -151,6 +155,14 @@ static int denali_dt_probe(struct platform_device *pdev)
 	if (IS_ERR(dt->clk_ecc))
 		return PTR_ERR(dt->clk_ecc);
 
+	dt->rst = devm_reset_control_get_optional_shared(dev, "nand");
+	if (IS_ERR(dt->rst))
+		return PTR_ERR(dt->rst);
+
+	dt->rst_reg = devm_reset_control_get_optional_shared(dev, "reg");
+	if (IS_ERR(dt->rst_reg))
+		return PTR_ERR(dt->rst_reg);
+
 	ret = clk_prepare_enable(dt->clk);
 	if (ret)
 		return ret;
@@ -166,10 +178,30 @@ static int denali_dt_probe(struct platform_device *pdev)
 	denali->clk_rate = clk_get_rate(dt->clk);
 	denali->clk_x_rate = clk_get_rate(dt->clk_x);
 
-	ret = denali_init(denali);
+	/*
+	 * Deassert the register reset, and the core reset in this order.
+	 * Deasserting the core reset while the register reset is asserted
+	 * will cause unpredictable behavior in the controller.
+	 */
+	ret = reset_control_deassert(dt->rst_reg);
 	if (ret)
 		goto out_disable_clk_ecc;
 
+	ret = reset_control_deassert(dt->rst);
+	if (ret)
+		goto out_assert_rst_reg;
+
+	/*
+	 * When the reset is deasserted, the initialization sequence is kicked
+	 * (bootstrap process). The driver must wait until it finished.
+	 * Otherwise, it will result in unpredictable behavior.
+	 */
+	usleep_range(200, 1000);
+
+	ret = denali_init(denali);
+	if (ret)
+		goto out_assert_rst;
+
 	for_each_child_of_node(dev->of_node, np) {
 		ret = denali_dt_chip_init(denali, np);
 		if (ret) {
@@ -184,6 +216,10 @@ static int denali_dt_probe(struct platform_device *pdev)
 
 out_remove_denali:
 	denali_remove(denali);
+out_assert_rst:
+	reset_control_assert(dt->rst);
+out_assert_rst_reg:
+	reset_control_assert(dt->rst_reg);
 out_disable_clk_ecc:
 	clk_disable_unprepare(dt->clk_ecc);
 out_disable_clk_x:
@@ -199,6 +235,8 @@ static int denali_dt_remove(struct platform_device *pdev)
 	struct denali_dt *dt = platform_get_drvdata(pdev);
 
 	denali_remove(&dt->controller);
+	reset_control_assert(dt->rst);
+	reset_control_assert(dt->rst_reg);
 	clk_disable_unprepare(dt->clk_ecc);
 	clk_disable_unprepare(dt->clk_x);
 	clk_disable_unprepare(dt->clk);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
