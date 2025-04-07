Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB90C36010
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 07:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oA4V9n39P+9TGiOAXE+iYYbUwxie/+TkgvfT4D7JKyU=; b=KBMLxW1+AGzP2G
	D0jlz94c0z5uaEkfqL6ZsBAsl5Q2Uzax0bcsxCdrMq+xCsXJEi4yuSNWYVdirfIBPjncz8yRuC3G8
	JTAvn8ZN5vFF2iHa9JGM/9R/gEoyRraWbQ9+h2jEwpHh7+I42Rd4sdZ8JjsbuexoKm88tpDFCkowG
	jkcMBRcsF6yeXiq72WSGiH2PxrJZHRp0qLkESGAyFt+9sfvg0ZA/Quqa+Vc09U3p6ebcv/ZPeGPzO
	Km28ki9CD/y4JeTrWBFTAFZ9MkJNrFt+Wmt+uazWJH7uJnoVsp5UbdiLUvDHet57gCxLEzzsBx9GM
	mJInGrA/kd2T68ODl7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hL9-0000000Gt6G-2yIN;
	Mon, 07 Apr 2025 07:56:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gta-0000000Gllh-4795
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 07:27:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C021661146;
	Mon,  7 Apr 2025 07:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD250C4CEDD;
	Mon,  7 Apr 2025 07:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744010869;
	bh=R1GWFoYuoKhtrKRR83vBYR9KoCi0p9VDekqu42J5Cps=;
	h=From:To:Cc:Subject:Date:From;
	b=TAqQ7o68O0x+FZ0U221QbKnNfxIVtuJSPMzjCpWCK+2Zk+NF+DcE3985Wnk2rAFfF
	 kZVbxdSq68ljoZyTfUbl3aSUcUj/+Orz6LU3nP9NPU5E75m/nB/MoHbcSfXkvJX4O0
	 r37NmgaaDDI2k0rp2g18TiqsJkFXGlWuh/NjTCBJT6s6MRJ6jLMma4o0HDFG/eZPIZ
	 AhBSNVwLE8WJjlKfArX+/u+85RqEqMCGyOUv0XzFz3NxHPMSg7qAKltOQTWtZZWw5i
	 wmOgXV3N/uyJPf1NRNkfyWHZW0y+RddW9+4dFyPLcmEXjGQGh7bXUgTqAxhC6FXpgv
	 KfVoXAYNNW4pg==
From: Arnd Bergmann <arnd@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Mark Brown <broonie@kernel.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] spi: spi-qpic: fix common module build
Date: Mon,  7 Apr 2025 09:27:14 +0200
Message-Id: <20250407072745.186831-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

When the NAND driver is a loadable module, and the SPI driver is
turned off, the common part is not built:

ERROR: modpost: "qcom_nandc_unalloc" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_write_reg_dma" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_read_reg_dma" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_nandc_dev_to_mem" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_nandc_alloc" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_submit_descs" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_clear_read_regs" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_clear_bam_transaction" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_read_data_dma" [drivers/spi/spi-qpic-snand.ko] undefined!
ERROR: modpost: "qcom_write_data_dma" [drivers/spi/spi-qpic-snand.ko] undefined!

Simplify the Makefile to just build the common bits for either of the two,
so it will be built-in whenever one of them is, or otherwise a loadable
module if needed.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/nand/Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index db516a45f0c5..44913ff1bf12 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -3,11 +3,8 @@
 nandcore-objs := core.o bbt.o
 obj-$(CONFIG_MTD_NAND_CORE) += nandcore.o
 obj-$(CONFIG_MTD_NAND_ECC_MEDIATEK) += ecc-mtk.o
-ifeq ($(CONFIG_SPI_QPIC_SNAND),y)
 obj-$(CONFIG_SPI_QPIC_SNAND) += qpic_common.o
-else
 obj-$(CONFIG_MTD_NAND_QCOM) += qpic_common.o
-endif
 obj-y	+= onenand/
 obj-y	+= raw/
 obj-y	+= spi/
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
