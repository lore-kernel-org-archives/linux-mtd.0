Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27B8C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 11:56:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 645AF6023C
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 11:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 645AF6023C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h+UfPATXicsNKoKUatj6Zb2dEQxFnsbqTbxCz79cmFQ=; b=dlSmw+CCsNNivZmBqBH9YTcrl4
	nU0GVZJBdF/s04f16E+lvaiCxZMwMoI5arg1RmwQPuHroRGe5bC9Oi8mmi0m1qFWfnyntHk2Z3V3o
	7s+HpDEVazIKLcVxUm1+FE1xKsGzZKj8s6e7jYA+1rxyE3QCrYicbrWVODDkcyIa1BFKa8wxfUOTy
	gniZoPyhGl2NWQyATN2Gtq5L8YqBYgU2WScdVLYTC1m48ZMnGbwhdo3WWVA9184OaEoOeatEHx9WQ
	4xfQAPSGtjXAkNUP0GaUmUCaTN6cHxArV/wyL1pshJiVuBBcU5RqGfDzXXDpWCrIEmvIR1fWMt6v0
	5UQquSAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEWHR-0007Em-EZ; Tue, 23 Feb 2021 11:55:05 +0000
Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEWHO-0007EB-Td
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 11:55:04 +0000
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id B8A6D4402B1;
 Tue, 23 Feb 2021 13:54:54 +0200 (IST)
From: Baruch Siach <baruch@tkos.co.il>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: parsers: extend Qcom SMEM parser to SPI flash
Date: Tue, 23 Feb 2021 13:47:04 +0200
Message-Id: <7f558e888a41c5b1fd4ca0427b3976531c51a876.1614080824.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_065503_164301_FA1282BE 
X-CRM114-Status: GOOD (  15.33  )
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
Cc: Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Qcom MIBIB partition might be stored on SPI flash devices, and the
parser works in this case just as well:

[    1.404229] spi_qup 78b5000.spi: IN:block:16, fifo:64, OUT:block:16, fifo:64
[    1.408078] spi-nor spi0.0: found mx25u6435f, expected n25q128a11
[    1.415016] spi-nor spi0.0: mx25u6435f (8192 Kbytes)
[    1.420756] 12 qcomsmem partitions found on MTD device spi0.0
[    1.425739] Creating 12 MTD partitions on "spi0.0":
[    1.431381] 0x000000000000-0x00000000c000 : "0:sbl1"
[    1.437058] 0x00000000c000-0x00000000d000 : "0:mibib"
[    1.442143] 0x00000000d000-0x000000027000 : "0:qsee"
[    1.447057] 0x000000027000-0x000000028000 : "0:devcfg"
[    1.452088] 0x000000028000-0x00000002a000 : "0:rpm"
[    1.457065] 0x00000002a000-0x00000002b000 : "0:cdt"
[    1.461832] 0x00000002b000-0x00000002c000 : "0:appsblenv"
[    1.466736] 0x00000002c000-0x000000036000 : "0:appsbl"
[    1.472248] 0x000000036000-0x00000003a000 : "0:art"
[    1.477297] 0x00000003a000-0x00000003e000 : "config"
[    1.482047] 0x00000003e000-0x00000004e000 : "data"
[    1.487257] 0x00000004e000-0x000000200000 : "0:hlos"

Remove dependency on MTD_NAND_QCOM. Update the Kconfig prompt and help
text accordingly.

Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/parsers/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index d90c30229052..96d5716db544 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -162,9 +162,8 @@ config MTD_REDBOOT_PARTS_READONLY
 endif # MTD_REDBOOT_PARTS
 
 config MTD_QCOMSMEM_PARTS
-	tristate "Qualcomm SMEM NAND flash partition parser"
-	depends on MTD_NAND_QCOM || COMPILE_TEST
+	tristate "Qualcomm SMEM flash partition parser"
 	depends on QCOM_SMEM
 	help
 	  This provides support for parsing partitions from Shared Memory (SMEM)
-	  for NAND flash on Qualcomm platforms.
+	  for NAND and SPI flash on Qualcomm platforms.
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
