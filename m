Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFBCC0044D
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 18:35:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 619B320736
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 18:35:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="neTBCQJz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 619B320736
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=VLzOvzPeFMCce6sT2S0Ggc8LblBuouPY8nzViedygI4=; b=neT
	BCQJznVqwKb5OxuMNdmtX1pZC6WeyqpQnwfrop9VOF8ifoMlNbrWaqAgjmw4+RJdS7pYNhSO0AOan
	RYYz8bgOjnrwFZ9LzmSRJNvIewR+RCBV2TvNuXBqVGTND3RsZrEDOx6DxNcar68asimfks7qv4MOV
	uxup0vTAq86Acq/1/8u/2hHZ1ObsKL4x2jquzIVq9k7srR+yb0XF0FPQgf7gUXiD9zAPojRU3wX/8
	SmYnEMNq4Li5VIxNaU/nCjCdAXC13Wuc0ckvYkLb13x+PYvfTxiGh3vA3PPbBmSzYAmvQZwsU1YIp
	xQ3LyD3h/8NBrHZgAgduwHjwgXAlSbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC6Cg-0001lb-PC; Wed, 11 Mar 2020 18:35:38 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC6Cb-0001km-T4
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 18:35:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3869D1FB;
 Wed, 11 Mar 2020 11:35:33 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B02773F6CF;
 Wed, 11 Mar 2020 11:35:32 -0700 (PDT)
Date: Wed, 11 Mar 2020 18:35:31 +0000
From: Mark Brown <broonie@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Applied "spi: Stop selecting MTD_SPI_NOR for SPI_HISI_SFC_V3XX" to
 the spi tree
In-Reply-To: <1583948115-239907-1-git-send-email-john.garry@huawei.com>
Message-Id: <applied-1583948115-239907-1-git-send-email-john.garry@huawei.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_113533_990822_1F50EDD6 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: sfr@canb.auug.org.au, chenxiang66@hisilicon.com,
 Mark Brown <broonie@kernel.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tudor.Ambarus@microchip.com, joe@perches.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch

   spi: Stop selecting MTD_SPI_NOR for SPI_HISI_SFC_V3XX

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

From caef2df1137adcea48b0902f310f4639b846e3a1 Mon Sep 17 00:00:00 2001
From: John Garry <john.garry@huawei.com>
Date: Thu, 12 Mar 2020 01:35:15 +0800
Subject: [PATCH] spi: Stop selecting MTD_SPI_NOR for SPI_HISI_SFC_V3XX

By selecting MTD_SPI_NOR for SPI_HISI_SFC_V3XX, we may introduce unmet
dependencies:

WARNING: unmet direct dependencies detected for MTD_SPI_NOR
  Depends on [m]: MTD [=m] && SPI_MASTER [=y]
  Selected by [y]:
  - SPI_HISI_SFC_V3XX [=y] && SPI [=y] && SPI_MASTER [=y] && (ARM64 && ACPI [=y] || COMPILE_TEST [=y]) && HAS_IOMEM [=y]

Since MTD_SPI_NOR is only selected by SPI_HISI_SFC_V3XX for practical
reasons - slave devices use the spi-nor driver, enabled by MTD_SPI_NOR -
just drop it.

Signed-off-by: John Garry <john.garry@huawei.com>

Link: https://lore.kernel.org/r/1583948115-239907-1-git-send-email-john.garry@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 8ad267cb15cd..ad79454d8584 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -299,7 +299,6 @@ config SPI_HISI_SFC_V3XX
 	tristate "HiSilicon SPI-NOR Flash Controller for Hi16XX chipsets"
 	depends on (ARM64 && ACPI) || COMPILE_TEST
 	depends on HAS_IOMEM
-	select MTD_SPI_NOR
 	help
 	  This enables support for HiSilicon v3xx SPI-NOR flash controller
 	  found in hi16xx chipsets.
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
