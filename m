Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA93C25B7E
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2024 20:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xuy6WbtIaJ6DJ+LdfzCchitL1Hg540qaCKEXg0gS6XM=; b=0TEuvPLZWwfvHc
	ErSffO9hhrXFDR1VzMVg+XlaUdLUHEBpdzxMryiBlxMSPKNo/ToYZJDbG5BkhrbYsQt+lSiecB38P
	LufiMzF/IaMDwUanMcBAp+WT3Ile11Yr1mZ08qLp0bWuO+K1vg/tqCYsllFYn/K/enPSAdZflfhR6
	wc46DG96iOmZSgUAq/ifZjI0VLg5niFHBb17dxb4PwjlTQiZ8lVaNseAFlM2EeUGNx/zMjHz36Uit
	Q76DbsDw1xbEamgrO07oOwXzflyUNwq/00UjIym1Ketwnl5DAcrir9TqR9RAo5Bz1IPdlrUZ3V1uk
	ROjKxRpQ2B/FPhfzUC7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC3Sa-00000001yif-1ra9;
	Tue, 28 May 2024 20:30:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC3SX-00000001yi9-3rz4
	for linux-mtd@lists.infradead.org;
	Tue, 28 May 2024 20:30:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1sC3SW-0007Mg-AK; Tue, 28 May 2024 22:30:12 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1sC3SU-003N9K-TD; Tue, 28 May 2024 22:30:10 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1sC3SU-006Cok-2X;
	Tue, 28 May 2024 22:30:10 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] mtd: nand: mxc_nand: always copy_spare() for page write
Date: Tue, 28 May 2024 22:30:06 +0200
Message-Id: <20240528203006.1479230-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_133014_056682_CC38CCE7 
X-CRM114-Status: GOOD (  12.64  )
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

When doing a page write we always have to copy the OOB data in place,
as the controller will always write it. Not copying it means we write
random data to the OOB area.

Fixes: 3df54960b63cc ("mtd: nand: mxc_nand: implement exec_op")
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Miquel, feel free to fixup the original patch with this.
---
 drivers/mtd/nand/raw/mxc_nand.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 9d50f41b3d5a1..e90c6047e82a5 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -806,8 +806,7 @@ static int mxc_nand_write_page_ecc(struct nand_chip *chip, const uint8_t *buf,
 	struct mxc_nand_host *host = nand_get_controller_data(chip);
 	int ret;
 
-	if (oob_required)
-		copy_spare(mtd, false, chip->oob_poi);
+	copy_spare(mtd, false, chip->oob_poi);
 
 	host->devtype_data->enable_hwecc(chip, true);
 
@@ -823,8 +822,7 @@ static int mxc_nand_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
-	if (oob_required)
-		copy_spare(mtd, false, chip->oob_poi);
+	copy_spare(mtd, false, chip->oob_poi);
 
 	return nand_prog_page_op(chip, page, 0, buf, mtd->writesize);
 }
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
