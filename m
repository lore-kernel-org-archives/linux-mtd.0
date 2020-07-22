Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F49C433E1
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 08:04:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 227C820792
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 08:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yH/BewZU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 227C820792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsICI+XNZ9K0LV6NmKpBhgGAlYTUIkEQaGKPlsm7uak=; b=yH/BewZUIyiAqcf0Y/PaxHgKfw
	U7inLNq4dk1uA5A6Lg83w8lLIhGcwk0aymKv0Awt/HS9NEsFBnemmWw6Nwr1Brm3joaC4g8bitr2+
	CNiFybrAu0aYeIPWAOo+mB7w9+VQLAOEQrFgVyzpzrq5ZqQwX4fmQUwznGpsI63XOsRK8MMjBDlNb
	zlIPa65gM7Gc/vBUmKgX5dQukxsCFMnt7ljx8aECeed6LwJltIJwdaJHxlA9352UVzIhqKPxZy/2g
	mgnYB0BPvuermOB1tOKGSw45cE9L58XsZQL2HtgGaBhXSgYB39W1ketjc2TDkOV7LSCtUhoNkIfpA
	YidaM9wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy9j1-0007M6-GN; Wed, 22 Jul 2020 08:03:39 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy9iz-0007LL-41
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 08:03:38 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id 06M83Cpk002700;
 Wed, 22 Jul 2020 16:03:28 +0800 (GMT-8)
 (envelope-from ycllin@mxic.com.tw)
From: YouChing Lin <ycllin@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH 2/2] mtd: spinand: macronix: Add support for MX31UF1GE4BC
Date: Wed, 22 Jul 2020 16:02:58 +0800
Message-Id: <1595404978-31079-3-git-send-email-ycllin@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595404978-31079-1-git-send-email-ycllin@mxic.com.tw>
References: <1595404978-31079-1-git-send-email-ycllin@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com 06M83Cpk002700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_040337_552857_239E06CD 
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

The Macronix MX31UF1GE4BC is a 1.8V, 1Gbit (128MB) serial
NAND flash device.

Validated by read, erase, read back, write and read back
on Xilinx Zynq PicoZed FPGA board which included
Macronix SPI Host (driver/spi/spi-mxic.c).

Signed-off-by: YouChing Lin <ycllin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index c9aa9f4..afc631b 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -128,6 +128,16 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
 		     0 /*SPINAND_HAS_QE_BIT*/,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX31UF1GE4BC",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x9e),
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
