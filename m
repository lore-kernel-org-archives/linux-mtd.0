Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA6DC282DA
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 11:35:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C0962133D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 11:35:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="leiBzAWj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C0962133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0EkCx3QOfRoxSZvQ4tS7VTuDKX41y3ozS5rOKk4uzpI=; b=leiBzAWjGjROwD
	edtT3apIpu2KJl8k4yA9zc90+1QzFOC4obPdObOHcs0T1xIyPkc9qCljedoFBODGQgOPRJw1jbN+x
	9QVmq2KXM0Livxwe1l1Nmupe85dcV9AkqnEcvkHJi3T1yBl947zH7npoaObS+IeuNm8jiJjYShDLv
	SZXzkgTSUlP1VGgu8E16myzee5OD1MzAbIhqzhhSzr7yIElk+DY49llT7hVdUpYM0PJLNCYTsDp4H
	nmYXNDXJh00s5gpVY18fx8SAc3y4S5geW0u8nMTCTQAmLWkpPkvxOrsT7Y/bydiGfqpjK7I93wkHk
	lYk6aMWw+LGfd+wyJF1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDp2P-00025b-OJ; Tue, 09 Apr 2019 11:35:37 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDp1l-00005k-MG
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 11:35:36 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hDp1D-0001OR-Ml; Tue, 09 Apr 2019 13:34:23 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hDp1C-0001bw-K6; Tue, 09 Apr 2019 13:34:22 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/14] mtd: rawnand: gpmi: read buf in nand_read_page_op
Date: Tue,  9 Apr 2019 13:34:13 +0200
Message-Id: <20190409113421.3037-7-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190409113421.3037-1-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_043458_483952_131260CD 
X-CRM114-Status: GOOD (  14.86  )
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
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Han Xu <han.xu@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The driver calls nand_read_page_op without a buffer passed and then
calls chip->legacy.read_buf to read the buffer afterwards which is
the same as passing the buffer nand_read_page_op in the first place.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 8c6aa8112923..6736d76fa1fb 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2250,8 +2250,7 @@ static int gpmi_ecc_read_oob(struct nand_chip *chip, int page)
 	memset(chip->oob_poi, ~0, mtd->oobsize);
 
 	/* Read out the conventional OOB. */
-	nand_read_page_op(chip, page, mtd->writesize, NULL, 0);
-	chip->legacy.read_buf(chip, chip->oob_poi, mtd->oobsize);
+	nand_read_page_op(chip, page, mtd->writesize, chip->oob_poi, mtd->oobsize);
 
 	/*
 	 * Now, we want to make sure the block mark is correct. In the
@@ -2260,8 +2259,7 @@ static int gpmi_ecc_read_oob(struct nand_chip *chip, int page)
 	 */
 	if (GPMI_IS_MX23(this)) {
 		/* Read the block mark into the first byte of the OOB buffer. */
-		nand_read_page_op(chip, page, 0, NULL, 0);
-		chip->oob_poi[0] = chip->legacy.read_byte(chip);
+		nand_read_page_op(chip, page, 0, chip->oob_poi, 1);
 	}
 
 	return 0;
@@ -2548,8 +2546,7 @@ static int mx23_check_transcription_stamp(struct gpmi_nand_data *this)
 		 * Read the NCB fingerprint. The fingerprint is four bytes long
 		 * and starts in the 12th byte of the page.
 		 */
-		nand_read_page_op(chip, page, 12, NULL, 0);
-		chip->legacy.read_buf(chip, buffer, strlen(fingerprint));
+		nand_read_page_op(chip, page, 12, buffer, strlen(fingerprint));
 
 		/* Look for the fingerprint. */
 		if (!memcmp(buffer, fingerprint, strlen(fingerprint))) {
@@ -2691,8 +2688,7 @@ static int mx23_boot_init(struct gpmi_nand_data  *this)
 
 		/* Send the command to read the conventional block mark. */
 		nand_select_target(chip, chipnr);
-		nand_read_page_op(chip, page, mtd->writesize, NULL, 0);
-		block_mark = chip->legacy.read_byte(chip);
+		nand_read_page_op(chip, page, mtd->writesize, &block_mark, 1);
 		nand_deselect_target(chip);
 
 		/*
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
