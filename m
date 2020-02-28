Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73DFC3F2D2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 18:26:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C269246A3
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 18:26:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i+kLLAF6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C269246A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=9HYK74m2wg+NGEq00awmRqIDhEX6wWyIOj/bMZZufdg=; b=i+k
	LLAF63Qde3K9qvGuOt/v8JQnKCZADJ5evCDwKX0ucPrcbFz1lMpJCtJjpakGO6NXG80DdsyMuZqbT
	4szaKeUY7icjCWjQSahjptD1uVS62TLyNnsJY6goFIIUCwvdqOpURBnn9WaBpApnF0k6LrPnIz8Km
	mu1sRzjxK7rlWmd+vT1p2rWhwsTWtTbxATvaB8Bwg1EYmLu8ocOcNSS2oywlVlpaOxbEblkzcay9L
	e99Y8GFSXiq4TBykZYqkqkQW3c2dKU3HCv/YCeNvC+6vu3ZLoal1vaaOBoWpQ8RMROEzp4OC6NZoh
	nbLX6ZJvcphWuQp0WLgxj1EzaoyssrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7kKi-0005PW-Tj; Fri, 28 Feb 2020 18:25:56 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7kKS-00058e-4f
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 18:25:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3A4B31B;
 Fri, 28 Feb 2020 10:25:39 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47EE23F7B4;
 Fri, 28 Feb 2020 10:25:39 -0800 (PST)
Date: Fri, 28 Feb 2020 18:25:37 +0000
From: Mark Brown <broonie@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Applied "spi: Allow SPI controller override device buswidth" to the
 spi tree
In-Reply-To: <1582903131-160033-2-git-send-email-john.garry@huawei.com>
Message-Id: <applied-1582903131-160033-2-git-send-email-john.garry@huawei.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_102540_280748_ABA49745 
X-CRM114-Status: GOOD (  17.80  )
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
Cc: linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, andriy.shevchenko@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch

   spi: Allow SPI controller override device buswidth

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

From ea23578611dce2eeaf31dcfe12cd7130cf3d1411 Mon Sep 17 00:00:00 2001
From: John Garry <john.garry@huawei.com>
Date: Fri, 28 Feb 2020 23:18:49 +0800
Subject: [PATCH] spi: Allow SPI controller override device buswidth

Currently ACPI firmware description for a SPI device does not have any
method to describe the data buswidth on the board.

So even through the controller and device may support higher modes than
standard SPI, it cannot be assumed that the board does - as such, that
device is limited to standard SPI in such a circumstance.

As a workaround, allow the controller driver supply buswidth override bits,
which are used inform the core code that the controller driver knows the
buswidth supported on that board for that device.

A host controller driver might know this info from DMI tables, for example.

Signed-off-by: John Garry <john.garry@huawei.com>
Link: https://lore.kernel.org/r/1582903131-160033-2-git-send-email-john.garry@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi.c       | 4 +++-
 include/linux/spi/spi.h | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 38b4c78df506..292f26807b41 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -510,6 +510,7 @@ struct spi_device *spi_alloc_device(struct spi_controller *ctlr)
 	spi->dev.bus = &spi_bus_type;
 	spi->dev.release = spidev_release;
 	spi->cs_gpio = -ENOENT;
+	spi->mode = ctlr->buswidth_override_bits;
 
 	spin_lock_init(&spi->statistics.lock);
 
@@ -2181,9 +2182,10 @@ static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
 		return AE_NO_MEMORY;
 	}
 
+
 	ACPI_COMPANION_SET(&spi->dev, adev);
 	spi->max_speed_hz	= lookup.max_speed_hz;
-	spi->mode		= lookup.mode;
+	spi->mode		|= lookup.mode;
 	spi->irq		= lookup.irq;
 	spi->bits_per_word	= lookup.bits_per_word;
 	spi->chip_select	= lookup.chip_select;
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 6d16ba01ff5a..600e3793303e 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -481,6 +481,9 @@ struct spi_controller {
 	/* spi_device.mode flags understood by this controller driver */
 	u32			mode_bits;
 
+	/* spi_device.mode flags override flags for this controller */
+	u32			buswidth_override_bits;
+
 	/* bitmask of supported bits_per_word for transfers */
 	u32			bits_per_word_mask;
 #define SPI_BPW_MASK(bits) BIT((bits) - 1)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
