Return-Path: <SRS0=5Vwq=RS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15C9C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 17:20:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3BF121019
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 17:20:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rxit+WqL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="LgouO23n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3BF121019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=iO59GHbn2DvEiKNAqWdQn7wyTqlN6bkwnj/07vbMsmE=; b=Rxi
	t+WqLB+TV/r6ZB2VnoCBZuRds2yzPZwIiHtIv4tGeHyZdIHqjsSc199AFnhuL5UNf9irY1XBVjDQN
	8ZKeyd2odGFyr90xOWsFD0gGjPMtyRflQbi25S183SYDqPEPtJEWsJ06qR/LH/rPQK55bGUe+UAm4
	9IgVAvXGOACp/NlLoAbmw/i6Bv3AEMtgKuzSG2se15pzp1i3QwR1xrHSKxPr8KYH34Hu57G2eJkiI
	5tUFdqxeJ6ORwoCGHugRe5qSPJXlMcaTCU7OE4mrtq8rDbVjdtGB4KIYwBtEsTFCRO4e0GtwRfCf/
	gcDDtCIQYUGTz2jURfBXSAnMMFQcpBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4qVJ-0004w0-Dk; Fri, 15 Mar 2019 17:20:21 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4qUg-00033U-9c; Fri, 15 Mar 2019 17:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ND+XrZBR4qOjYj5GKv0Q2tW7zwE5uFytjyeNgD8uyW8=; b=LgouO23nx3m3
 r0yXCw99nEx+z1iWjKBoFqty+9eeTA9c+gjs2dlrHRq+MI32OeptmNvyXQI3NRfnzpqDI28h6yu5y
 yFh5g/bW80fNbI6FTKQNVA5qbgZwjl4cmHwpux4FyYZmvXq3UnxccKy0WxvquYwluAJ0unKsT06Ea
 bhkdQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1h4qUb-0002fG-82; Fri, 15 Mar 2019 17:19:37 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id AFE6C1126E81; Fri, 15 Mar 2019 17:19:36 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Ludovic Barre <ludovic.barre@st.com>
Subject: Applied "spi: spi-mem: stm32-qspi: avoid memory corruption at low
 frequency" to the spi tree
In-Reply-To: <1552050741-27739-2-git-send-email-ludovic.Barre@st.com>
X-Patchwork-Hint: ignore
Message-Id: <20190315171936.AFE6C1126E81@debutante.sirena.org.uk>
Date: Fri, 15 Mar 2019 17:19:36 +0000 (GMT)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_101942_476989_E137BE30 
X-CRM114-Status: GOOD (  12.06  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch

   spi: spi-mem: stm32-qspi: avoid memory corruption at low frequency

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 5356c2c70e385198e1a753ee364323f2fc01f759 Mon Sep 17 00:00:00 2001
From: Ludovic Barre <ludovic.barre@st.com>
Date: Fri, 8 Mar 2019 14:12:20 +0100
Subject: [PATCH] spi: spi-mem: stm32-qspi: avoid memory corruption at low
 frequency

This patch solves a memory corruption seen at 8 MHz.
To avoid such issue, timeout counter is disabled.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-stm32-qspi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 3b2a9a6b990d..7354f9d68dba 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -76,7 +76,6 @@
 #define QSPI_PSMAR		0x28
 #define QSPI_PIR		0x2c
 #define QSPI_LPTR		0x30
-#define LPTR_DFT_TIMEOUT	0x10
 
 #define STM32_QSPI_MAX_MMAP_SZ	SZ_256M
 #define STM32_QSPI_MAX_NORCHIP	2
@@ -372,8 +371,7 @@ static int stm32_qspi_setup(struct spi_device *spi)
 	flash->presc = presc;
 
 	mutex_lock(&qspi->lock);
-	writel_relaxed(LPTR_DFT_TIMEOUT, qspi->io_base + QSPI_LPTR);
-	cr = FIELD_PREP(CR_FTHRES_MASK, 3) | CR_TCEN | CR_SSHIFT | CR_EN;
+	cr = FIELD_PREP(CR_FTHRES_MASK, 3) | CR_SSHIFT | CR_EN;
 	writel_relaxed(cr, qspi->io_base + QSPI_CR);
 
 	/* set dcr fsize to max address */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
