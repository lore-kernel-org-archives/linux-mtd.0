Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6D0C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:31:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F7D320652
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:31:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JJ2HiGqe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="av/bH/oO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F7D320652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0EkCx3QOfRoxSZvQ4tS7VTuDKX41y3ozS5rOKk4uzpI=; b=JJ2HiGqeuinH8u
	KKTREaOj4HMYerO9CunR/6RvtGR/j4Ta64e/a/RuxwXRpNunm0W4+U6h4fwCvymudCXCWsq5RgTx4
	hyfZ0qkXtSFDWJ3ILq4AYftjRt7hCrx0YZzxdLlHB4lmYM+y0TFJInhY/76XLM452f+4dso/k5ChE
	AXuGdVQy6QWWbiLAfdsDeyWpO08LxMwHq5sFPCx121GURjzMXGybNGXigEPPBulxrwW4xMClNTSk5
	nYCIb9bf3MM50suNTGp5W6fzTmabChmnq7I58khQZvzNimhlIPHU+j6J8sZHHOweJthR3RK4iJHaX
	qPxWGMRlE1lLyyesd2QA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCM7g-0005Za-2Y; Fri, 05 Apr 2019 10:31:00 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCM7d-0005Z4-Of
 for linux-mtd@bombadil.infradead.org; Fri, 05 Apr 2019 10:30:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EXKW2T7wP1AaGdW8D2tZNX5e6UqOiZecgAEo/0NFTEs=; b=av/bH/oOrRDO3OaCC2IbtGxbZS
 6foVw0TkDWtMH/WFGvbw5fEJkBQHBCJi/ZyCjmOYoy1h7eBt1NnZr9cMNVFiNwwM2WQr90ruyp6WB
 Lq2WxIhSmNCxbkxuZ4i9kQ3AOXi9Y7BV9bXwfqgAY+9i2rLLC2GmRg+Gp1TmRxOZMAGAe0gjxdYRP
 BQlD5ReeoEAioQQDSdzz0FMWpI40NF1tcYofu3iAg29FmBLvQ5d283YIJEQBJUQ7114gHSU+SNQo+
 0EZlc6R5trTScjazGfC/bSkj1kWJ2RF1to0kWIZMZMQypzdpnpoqX5QRjI1BeIfs5FNREyADgodQE
 SGvpgMlQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCLln-00034V-A7
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 10:08:24 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlB-0000RO-Tc; Fri, 05 Apr 2019 12:07:45 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlA-0008J1-Ji; Fri, 05 Apr 2019 12:07:44 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/10] mtd: rawnand: gpmi: read buf in nand_read_page_op
Date: Fri,  5 Apr 2019 12:07:36 +0200
Message-Id: <20190405100740.5074-7-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405100740.5074-1-s.hauer@pengutronix.de>
References: <20190405100740.5074-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_060823_512664_C88BAFFD 
X-CRM114-Status: GOOD (  13.63  )
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
Cc: Sam Lefebvre <sam.lefebvre@essensium.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>
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
