Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23F9C36010
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Mar 2025 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PbdHRnjp+LVTHqysK79Yy1imyR1blNilP/7Qe/EAm1w=; b=SADREGYi8kgcq4
	c/66+m5KQ3DZbgpAvzm5r4aOzcUjaGJZeqCJEWaFEEQCLId13H6JyadLPSpDeZOAYbsEhp1bKorGg
	gAx33pc2QNmxTZ8TTpFXGXiLNyDK9I8TvU0Dnb8I7FzRKdmSHT2VlbZgujoGoi0WF/EsU1tmEUV6i
	+8PYeBG+k9eweLgD/IqYPLFuMDUxDB98Ymn1YBE/szQgJIVU30ggYSnVIp2del4OhY/gLd1tF7UkZ
	WI+ewtFDh6Wc+41h4OgrGO5BoznEaTHSX9XmtsZbbQbU1wnFTCVB/pfYoyK+HXN2B/JOf331pAA9Z
	rzMIRFz2icy1N+ddJVoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty52C-0000000CufD-0fQf;
	Fri, 28 Mar 2025 08:25:48 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty50g-0000000CuOb-0v24
	for linux-mtd@lists.infradead.org;
	Fri, 28 Mar 2025 08:24:16 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:84f5:57a8:7b3b:9088])
	by laurent.telenet-ops.be with cmsmtp
	id W8Q32E0051KBnwa018Q3pj; Fri, 28 Mar 2025 09:24:07 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1ty50U-0000000G6nn-2d5Y;
	Fri, 28 Mar 2025 09:24:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1ty50V-00000006N2R-0Qmy;
	Fri, 28 Mar 2025 09:24:03 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] mtd: nand: Drop explicit test for built-in CONFIG_SPI_QPIC_SNAND
Date: Fri, 28 Mar 2025 09:24:01 +0100
Message-ID: <99eef91c334f3f2314c2f5671e1eb55211a5ff19.1743150196.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_012414_397004_0C4C264C 
X-CRM114-Status: UNSURE (   6.84  )
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

If CONFIG_SPI_QPIC_SNAND=m, but CONFIG_MTD_NAND_QCOM=n:

    ERROR: modpost: "qcom_nandc_unalloc" [drivers/spi/spi-qpic-snand.ko] undefined!
    ...

Fix this by dropping the explicit test for a built-in
CONFIG_SPI_QPIC_SNAND completely.  Kbuild handles multiple and mixed
obj-y/obj-m rules for the same object file fine.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503280759.XhwLcV7m-lkp@intel.com/
Fixes: 7304d1909080ef0c ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mtd/nand/Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index db516a45f0c52635..44913ff1bf12cc24 100644
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
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
