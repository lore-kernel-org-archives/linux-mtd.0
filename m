Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EDEC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 08:04:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F2120792
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 08:04:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LXDFfP8q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26F2120792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l75hcEJmmPN0vL9LMSo0TJTjkrrikxpTj2dSPysp0b8=; b=LXDFfP8qIh2wzy+5xtsosJI/vA
	E14f8VZiGVJiV6G/Zet74lMC7GsV3KwO7JmTo+XwZcqQuVwFrvap0UkNBO0a5cbbHzuEKotpJWXHg
	q288s/UIyXpCKTF5Di8ZscbcWdI2L6umawqaVAy9BwBvc3Fl6lJYvoMuWdBMO2o+gVBoX0e3Wsnp6
	vRMjB5QY5RIfhR/TzRPWO/JC8Z4lOI5Fc2nGgbT7bDKPEZy5C0DpDaisdQpPY2S9Al6gpV1iOOqrp
	iviqwbJQ/HsGMcfnmEzNqCiJ//wKa49+abYn547u12jVx4doLsAjGV3ax+03BxbD0jW3Kp+21ntZf
	oZHS+kZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy9iw-0007Hp-2J; Wed, 22 Jul 2020 08:03:34 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy9iu-0007Fm-0y
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 08:03:33 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id 06M83Cpj002700;
 Wed, 22 Jul 2020 16:03:26 +0800 (GMT-8)
 (envelope-from ycllin@mxic.com.tw)
From: YouChing Lin <ycllin@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH 1/2] mtd: spinand: macronix: Add support for MX31LF1GE4BC
Date: Wed, 22 Jul 2020 16:02:57 +0800
Message-Id: <1595404978-31079-2-git-send-email-ycllin@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595404978-31079-1-git-send-email-ycllin@mxic.com.tw>
References: <1595404978-31079-1-git-send-email-ycllin@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com 06M83Cpj002700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_040332_527415_8FEF7B52 
X-CRM114-Status: UNSURE (   8.41  )
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
Cc: juliensu@mxic.com.tw, YouChing Lin <ycllin@mxic.com.tw>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Macronix MX31LF1GE4BC is a 3V, 1Gbit (128MB) serial
NAND flash device.

Validated by read, erase, read back, write and read back
on Xilinx Zynq PicoZed FPGA board which included
Macronix SPI Host (driver/spi/spi-mxic.c).

Signed-off-by: YouChing Lin <ycllin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 0f900f3..c9aa9f4 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -118,6 +118,16 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+	SPINAND_INFO("MX31LF1GE4BC",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x1e),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0 /*SPINAND_HAS_QE_BIT*/,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops macronix_spinand_manuf_ops = {
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
