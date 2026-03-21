Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997DF1094474
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Mar 2026 14:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=qPjYfGw8KZye81v4YVuI7b9qLtRTRT9SUIEGHr3e3L0=; b=Lsrrv0025c/tB1
	9pa8cJ2x9cAyKDtF3Q1jflEOSZju4E33yKcBYImY6IQIO/1iH1kAKNtk1JOPvi7GGXTsOTu/6vOB8
	vHvCZdVA84Wcug3YqoxHQbsf+8W5yoc54oz6NZHNYIIBljxapMqIfC2PskOU2ibgdrpP3FC5W+ReE
	IkHQeTY+iwjxuFkmI1AVm4lRm1PDeLw9llA8+QfnAkaBdYNPDY0bT9X49HUcTl/RlGCUCypxkGc2V
	j9gZHDCTJ02hnLZTtEwT0VfCOQGOJU5+sMCeIUiOzKpJ/Ro7C4tGZxE97eES+dl97BxSmX9rxegRl
	fHZHnMl1Ao94nyLVBE5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3xZv-0000000EYNj-3aUT;
	Sat, 21 Mar 2026 14:45:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3xZs-0000000EYNd-2mWN
	for linux-mtd@lists.infradead.org;
	Sat, 21 Mar 2026 14:45:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7897260097;
	Sat, 21 Mar 2026 14:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DB8C19421;
	Sat, 21 Mar 2026 14:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774104323;
	bh=b5maaOXK97u/xSOzzsEPuIC5eVg9IHQKM4u5SdvNuBg=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=cnRTgTriX/zds5cf1LIW0MV7U7DHwqznSeYsWQSAEuJBWiRTii7j+m0JTAo+BntIN
	 /roHx8iALwijApTYRnHerNCBDG6TbKf2S4Rn5d6WM9x/+AgOpNg9HyqjOJQqIJTxpi
	 MKL48OKgNS9QB7cGWJGhYoI4n4D7VX3RgKWjUNeQ=
Subject: Patch "mtd: spinand: macronix: use scratch buffer for DMA operation" has been added to the 6.1-stable tree
To: d-gole@ti.com,daniel@makrotopia.org,frieder.schrempf@kontron.de,frieder@fris.de,gregkh@linuxfoundation.org,linux-mtd@lists.infradead.org,miquel.raynal@bootlin.com,richard@nod.at,sashal@kernel.org,vigneshr@ti.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sat, 21 Mar 2026 15:43:43 +0100
In-Reply-To: <20260310171544.1568499-1-frieder@fris.de>
Message-ID: <2026032143-magnetize-curator-f33d@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore
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


This is a note to let you know that I've just added the patch titled

    mtd: spinand: macronix: use scratch buffer for DMA operation

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mtd-spinand-macronix-use-scratch-buffer-for-dma-operation.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-224526-greg=kroah.com@vger.kernel.org Tue Mar 10 18:16:43 2026
From: Frieder Schrempf <frieder@fris.de>
Date: Tue, 10 Mar 2026 18:15:44 +0100
Subject: mtd: spinand: macronix: use scratch buffer for DMA operation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Dhruva Gole <d-gole@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <20260310171544.1568499-1-frieder@fris.de>

From: Daniel Golle <daniel@makrotopia.org>

[ Upstream commit ebed787a0becb9354f0a23620a5130cccd6c730c ]

The mx35lf1ge4ab_get_eccsr() function uses an SPI DMA operation to
read the eccsr, hence the buffer should not be on stack. Since commit
380583227c0c7f ("spi: spi-mem: Add extra sanity checks on the op param")
the kernel emmits a warning and blocks such operations.

Use the scratch buffer to get eccsr instead of trying to directly read
into a stack-allocated variable.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/Y8i85zM0u4XdM46z@makrotopia.org
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/mtd/nand/spi/macronix.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -83,9 +83,10 @@ static int mx35lf1ge4ab_ecc_get_status(s
 		 * in order to avoid forcing the wear-leveling layer to move
 		 * data around if it's not necessary.
 		 */
-		if (mx35lf1ge4ab_get_eccsr(spinand, &eccsr))
+		if (mx35lf1ge4ab_get_eccsr(spinand, spinand->scratchbuf))
 			return nanddev_get_ecc_conf(nand)->strength;
 
+		eccsr = *spinand->scratchbuf;
 		if (WARN_ON(eccsr > nanddev_get_ecc_conf(nand)->strength ||
 			    !eccsr))
 			return nanddev_get_ecc_conf(nand)->strength;


Patches currently in stable-queue which might be from frieder@fris.de are

queue-6.1/regulator-pca9450-make-irq-optional.patch
queue-6.1/mtd-spinand-macronix-use-scratch-buffer-for-dma-operation.patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
