Return-Path: <SRS0=yokd=EK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F128FC2D0A3
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 11:49:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B7EF2071A
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 11:49:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N8fYi0kG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B7EF2071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fsfKBB2mlgYbtNZGkIYAV5bl+K/IYNiwbFxoXJjI63Q=; b=N8fYi0kGz0UlEIPaK2KDIDbnIV
	r/09+W44F8UJbhzIGlmaQ8iq9tWieQkI/GIl0x+KqDEx9PoAxVoE4KWtjjpCmGTJeULWLdNXFq8xX
	Ho7Tx4GEIbpBni8G1Zg5BoLwTncqtWTj6yOb2wVbOuv3GyKQMDHb1WY89l3rl3n0YHUUceSZBNfyn
	rVBtF4fQKIpGOoWuuc4MB74c32ZGcf2cKnJYtMrJYQC+KPSH3s5kSatJoxVCWXb+0JPOoOJH3hqXC
	9eUzMExZpAg/OF+WSfrjTg6HzVnNiv5Ei/xN2lVq6M189tU5gmmRgY6+C8ajJaVGRXafj8ge0oz5u
	w1786c/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaHGp-0001tf-Es; Wed, 04 Nov 2020 11:48:07 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaHGm-0001sm-Hx
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2020 11:48:05 +0000
Received: from localhost.localdomain ([172.17.195.95])
 by TWHMLLG4.macronix.com with ESMTP id 0A4BlVqd025422;
 Wed, 4 Nov 2020 19:47:31 +0800 (GMT-8)
 (envelope-from ycllin@mxic.com.tw)
From: YouChing Lin <ycllin@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH] mtd: spinand: macronix: Add support for MX35LFxGE4AD
Date: Wed,  4 Nov 2020 19:47:22 +0800
Message-Id: <1604490442-9052-1-git-send-email-ycllin@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG4.macronix.com 0A4BlVqd025422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_064804_952463_C0F950A8 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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
Cc: juliensu@mxic.com.tw, linux-mtd@lists.infradead.org, gch981213@gmail.com,
 linux-kernel@vger.kernel.org, ycllin@mxic.com.tw
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Macronix MX35LF2GE4AD / MX35LF4GE4AD are 3V, 2G / 4Gbit serial
SLC NAND flash device (with on-die ECC).

Validated by read, erase, read back, write, read back and nandtest
on Xilinx Zynq PicoZed FPGA board which included Macronix SPI Host
(drivers/spi/spi-mxic.c).

Signed-off-by: YouChing Lin <ycllin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 8e801e4..4f7f954 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -119,6 +119,26 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+	SPINAND_INFO("MX35LF2GE4AD",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x26),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0 /*SPINAND_HAS_QE_BIT*/,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35LF4GE4AD",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x37),
+		     NAND_MEMORG(1, 4096, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0 /*SPINAND_HAS_QE_BIT*/,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX31LF1GE4BC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x1e),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
