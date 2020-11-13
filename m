Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388DAC4742C
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E07CC20797
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tN33r8l/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E07CC20797
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nl2SLccwbrZouVUA34RudrtzKQbwuCjrJRR13tHfEOM=; b=tN33r8l/xyPZi69i5ZyE2WFgr
	gGPKFKxqfUlxERY3oMYTC7/LTwvrznU0bMUJFEtGyCR1TmnFcGoMC1OPjjMikLp9q9DJO1AwU7vDm
	JaNWA4j4DZmuWsWwUumgAts6Jakd3zrwQFQY+CmgxoHjCp7S4f4MXqhaV4E5bSrNVmdij8zLrt8D+
	aw0m+r+ZH7sJNGJNM3LQn71hHRbQLY115AFbAtF2aHIy35ikPtNxEG3yhbaioIffqG/MAUqUVEqXO
	RhLy2fqQUzgzPp4TmEKz2Qw07uAsts/wDZhYaqYPC0i/ddksJwFabti8dWdwRICqhoyEkSDqxqhdu
	fOhfitwvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYIP-0008GS-7k; Fri, 13 Nov 2020 12:35:17 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHj-00081L-6o
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:36 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 7938FC000E;
 Fri, 13 Nov 2020 12:34:33 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 10/19] mtd: rawnand: lpc32xx_slc: Move the ECC initialization
 to ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:15 +0100
Message-Id: <20201113123424.32233-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073435_474772_30FD9040 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The probe function is only supposed to initialize the controller
hardware but not the ECC engine. Indeed, we don't know anything about
the NAND chip(s) at this stage. Let's move the logic initializing the
ECC engine, even pretty simple, to the ->attach_chip() hook which gets
called during nand_scan() routine, after the NAND chip discovery. As
the previously mentioned logic is supposed to parse the DT for us, it
is likely that the chip->ecc.* entries be overwritten. So let's avoid
this by moving these lines to ->attach_chip().

Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: Sylvain Lemieux <slemieux.tyco@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index e98ab22f9047..6b7269cfb7d8 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -774,6 +774,9 @@ static int lpc32xx_nand_attach_chip(struct nand_chip *chip)
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
 
+	if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
+		return 0;
+
 	/* OOB and ECC CPU and DMA work areas */
 	host->ecc_buf = (uint32_t *)(host->data_buf + LPC32XX_DMA_DATA_SIZE);
 
@@ -785,11 +788,22 @@ static int lpc32xx_nand_attach_chip(struct nand_chip *chip)
 	if (mtd->writesize <= 512)
 		mtd_set_ooblayout(mtd, &lpc32xx_ooblayout_ops);
 
+	chip->ecc.placement = NAND_ECC_PLACEMENT_INTERLEAVED;
 	/* These sizes remain the same regardless of page size */
 	chip->ecc.size = 256;
+	chip->ecc.strength = 1;
 	chip->ecc.bytes = LPC32XX_SLC_DEV_ECC_BYTES;
 	chip->ecc.prepad = 0;
 	chip->ecc.postpad = 0;
+	chip->ecc.read_page_raw = lpc32xx_nand_read_page_raw_syndrome;
+	chip->ecc.read_page = lpc32xx_nand_read_page_syndrome;
+	chip->ecc.write_page_raw = lpc32xx_nand_write_page_raw_syndrome;
+	chip->ecc.write_page = lpc32xx_nand_write_page_syndrome;
+	chip->ecc.write_oob = lpc32xx_nand_write_oob_syndrome;
+	chip->ecc.read_oob = lpc32xx_nand_read_oob_syndrome;
+	chip->ecc.calculate = lpc32xx_nand_ecc_calculate;
+	chip->ecc.correct = rawnand_sw_hamming_correct;
+	chip->ecc.hwctl = lpc32xx_nand_ecc_enable;
 
 	/*
 	 * Use a custom BBT marker setup for small page FLASH that
@@ -880,21 +894,9 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, host);
 
 	/* NAND callbacks for LPC32xx SLC hardware */
-	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-	chip->ecc.placement = NAND_ECC_PLACEMENT_INTERLEAVED;
 	chip->legacy.read_byte = lpc32xx_nand_read_byte;
 	chip->legacy.read_buf = lpc32xx_nand_read_buf;
 	chip->legacy.write_buf = lpc32xx_nand_write_buf;
-	chip->ecc.read_page_raw = lpc32xx_nand_read_page_raw_syndrome;
-	chip->ecc.read_page = lpc32xx_nand_read_page_syndrome;
-	chip->ecc.write_page_raw = lpc32xx_nand_write_page_raw_syndrome;
-	chip->ecc.write_page = lpc32xx_nand_write_page_syndrome;
-	chip->ecc.write_oob = lpc32xx_nand_write_oob_syndrome;
-	chip->ecc.read_oob = lpc32xx_nand_read_oob_syndrome;
-	chip->ecc.calculate = lpc32xx_nand_ecc_calculate;
-	chip->ecc.correct = rawnand_sw_hamming_correct;
-	chip->ecc.strength = 1;
-	chip->ecc.hwctl = lpc32xx_nand_ecc_enable;
 
 	/*
 	 * Allocate a large enough buffer for a single huge page plus
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
