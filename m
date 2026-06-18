Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFF8CD98F2
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jun 2026 20:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FdVbmXxjbF7f27HV1F+90w3bR380MRdwJdBViVuYq0Y=; b=bJxyc6OsySwIWj
	qQgohVma/bHdhElYPFr3jn7NWECN+wuJoaE/9KlprkWIcfajsDQlzL5cBQgWENJ21oIztvsqv2YWP
	fkUmlsluYZpsl+mk/Lp2Breyu3NotrCGmK07+8Q1pQhHiVpZb86rCIZIa4inRuLrGKJaK6iSktabw
	ulOSiMui5OxnKP8/JPQRG7bgvoZ02KFLIgISWJNQ2kE5Bq+62o3VlFGt4CoOE1TFwuTmfqaDJHMhe
	pVaZeKWxKI6kTxrMnEdgpgM3u0SsHSv7mvfOpanwUQ7ixuoOgZypEs0p13+pMoGUOGbra2wRx9fh6
	M3BtK8GF/HGTPx3FB10w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waJox-00000001nAA-18b8;
	Thu, 18 Jun 2026 20:58:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waJow-00000001nA4-0SrF
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jun 2026 20:58:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E054601E1;
	Thu, 18 Jun 2026 20:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C360F1F000E9;
	Thu, 18 Jun 2026 20:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781816320;
	bh=BT8gehoS8o4fNFAcD//E1FfqJRiHz+h+pYHCDl+AfzA=;
	h=From:To:Cc:Subject:Date;
	b=Tx+x4bdnbjoXNVe2f/6i+HdIgJ0S73/Y96BnY4cFpZCYAmZOay0+WByBlmgOcQAxL
	 +gC+qwLiWhtfJGW1mLTKKNOsiHlXm3hPeIgi5G6BHK/acZpFBtx4Tj557g+V6KzlVi
	 it7ShRH+3FKE4wdKD23muQ4rTYC7RnEAWJX1HwMPPBIReAzhyf+Srk8pdJou4OjTsj
	 pEMPd0f5G6kcvi/+gDfVs/+oEaOyyzMzWNUaT0wnN7nAEcgm2BwsC33GFUIIFvP6vd
	 zzpjHyunHWgfs/BDm23z6rYdyQF1sKyjVvuTnl4Bqfs3cNs1xWSV6dpU6hZnaNT3Mt
	 NaxWjO6TWaVsw==
From: Arnd Bergmann <arnd@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rosen Penev <rosenp@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Chris Down <chris@chrisdown.name>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: ndfc: add CONFIG_OF dependency
Date: Thu, 18 Jun 2026 22:58:27 +0200
Message-Id: <20260618205835.1497952-1-arnd@kernel.org>
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

When compile-testing on x86 without CONFIG_OF, the ndfc driver produces
a harmless warning:

drivers/mtd/nand/raw/ndfc.c: In function 'ndfc_probe':
include/linux/dev_printk.h:154:31: error: 'len' is used uninitialized [-Werror=uninitialized]
  154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                               ^
drivers/mtd/nand/raw/ndfc.c:196:17: note: in expansion of macro 'dev_err'
  196 |                 dev_err(&ofdev->dev, "unable read reg property (%d)\n", len);

Limit compile-testing to configurations with CONFIG_OF to trivially
avoid this. The driver will still be built in allmodconfig and many
randconfig builds.

Fixes: 4f2692a5383e ("mtd: rawnand: ndfc: use ioread32be/iowrite32be and allow COMPILE_TEST")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
We may also want to change the of_get_property() stub function to
initialize *len.
---
 drivers/mtd/nand/raw/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 64b8b99a3a68..1f4053e531fd 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -72,6 +72,7 @@ config MTD_NAND_AU1550
 config MTD_NAND_NDFC
 	tristate "IBM/MCC 4xx NAND controller"
 	depends on 44x || COMPILE_TEST
+	depends on OF
 	select MTD_NAND_ECC_SW_HAMMING
 	select MTD_NAND_ECC_SW_HAMMING_SMC
 	help
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
