Return-Path: <SRS0=0ANE=S3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B6CC43219
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 19:25:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2583320717
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 19:25:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QtzPXp7b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="s1ihMDtq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2583320717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=WFS7xM1XY7fO5Icj4OzsMvCa8YshBveas7/a1HFE6uw=; b=Qtz
	PXp7byt2sqij/sFbNOJIuxUOcxfoxhwqZ9oiof1EHIZBTlixyGG0/KWaej5u3DeHK3wwkkXUKm9sY
	lkSub9xViq7OG+J5c9C7ntdHhM8z6TizMlWWpZ+K+Np4LWE2/eFngjN/++DTEYMEHmvGsTm03JnGw
	z7qsPJoZkPw886bBQWXyjsQEwlpiUx+EECa3tt6oA/JHyj1nyCpcJGMNSwrj7JG9vK7WFo1NS6mYZ
	Y6WBeN1iAOGSgpwhLw4wFYica2zg8/o0khSY6uu7dQcZVJZWoh083ej226HYPg5kvEruylZL4d2fc
	qOSOljzeGG74GGHdk4XI37rEcqSp5Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJjzk-0002dm-HB; Thu, 25 Apr 2019 19:25:20 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJjzJ-0000tv-62
 for linux-mtd@lists.infradead.org; Thu, 25 Apr 2019 19:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Ujin8fPqiBYO8fG0iJPxqJkdDmUEfnPunS2eRUnJRt4=; b=s1ihMDtquzaX
 y5REDM3DR8EnLtSD6RvB2HPa5BNhuneeTvCe5hWKSKKZSsl5627yGxE5VZsGOrFiV0/ldoRyZd5kI
 Ta29g9lg8BKdXGR+kC+/Od7QyWNDAV88b5jBU+qfDomtfceCO3bnoB86VB0x9K6Lis2s2Y3dG0rK+
 rEhK4=;
Received: from 188.29.164.24.threembb.co.uk ([188.29.164.24]
 helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hJjzA-0004a5-9b; Thu, 25 Apr 2019 19:24:44 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 11C2E441D3E; Thu, 25 Apr 2019 20:24:43 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Subject: Applied "spi: spi-mem: zynq-qspi: Fix build error on architectures
 missing readsl/writesl" to the spi tree
In-Reply-To: <1555918009-13172-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
X-Patchwork-Hint: ignore
Message-Id: <20190425192443.11C2E441D3E@finisterre.ee.mobilebroadband>
Date: Thu, 25 Apr 2019 20:24:43 +0100 (BST)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_122453_373180_C8874666 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: kbuild test robot <lkp@intel.com>, bbrezillon@kernel.org,
 nagasuresh12@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, marek.vasut@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org, richard@nod.at,
 michals@xilinx.com, dwmw2@infradead.org, vigneshr@ti.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch

   spi: spi-mem: zynq-qspi: Fix build error on architectures missing readsl/writesl

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.2

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

From 2a2dd8cafc06d72a6ad12d9726c9e514839a82bf Mon Sep 17 00:00:00 2001
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Date: Mon, 22 Apr 2019 12:56:49 +0530
Subject: [PATCH] spi: spi-mem: zynq-qspi: Fix build error on architectures
 missing readsl/writesl

Alpha and some of the architectures are missing readsl/writesl functions.
so the zynq-qspi driver won't be able to build on these arches. hence use
ioread32_rep()/iowrite32_rep() instead of readsl()/writesl().

Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-zynq-qspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
index 8079d0062d03..c6bee67decb5 100644
--- a/drivers/spi/spi-zynq-qspi.c
+++ b/drivers/spi/spi-zynq-qspi.c
@@ -407,8 +407,8 @@ static void zynq_qspi_write_op(struct zynq_qspi *xqspi, int txcount,
 		count = txcount;
 
 	if (xqspi->txbuf) {
-		writesl(xqspi->regs + ZYNQ_QSPI_TXD_00_00_OFFSET,
-			xqspi->txbuf, count);
+		iowrite32_rep(xqspi->regs + ZYNQ_QSPI_TXD_00_00_OFFSET,
+			      xqspi->txbuf, count);
 		xqspi->txbuf += count * 4;
 	} else {
 		for (k = 0; k < count; k++)
@@ -433,8 +433,8 @@ static void zynq_qspi_read_op(struct zynq_qspi *xqspi, int rxcount)
 	if (count > rxcount)
 		count = rxcount;
 	if (xqspi->rxbuf) {
-		readsl(xqspi->regs + ZYNQ_QSPI_RXD_OFFSET,
-		       xqspi->rxbuf, count);
+		ioread32_rep(xqspi->regs + ZYNQ_QSPI_RXD_OFFSET,
+			     xqspi->rxbuf, count);
 		xqspi->rxbuf += count * 4;
 	} else {
 		for (k = 0; k < count; k++)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
