Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA19EC4742C
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:36:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DAE720797
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:36:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v3NPy65i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DAE720797
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NSxSQBx+NSVkSeYnKAh6HxLFuRARbIu9OhW003rXk+8=; b=v3NPy65iTGPM6UMdDzQ/8KWf+
	TjH6HDE3YSP2tqRgPVJiCKer2ipTdSoGJF60RWauP5hb/6LlIIE2TVwE3gQTLEE4rEUH5GC3UUfXY
	ts1Xp6FkPwgKIf0pnaiN2O7zN6qPL1mUXTzyTTMFev/o4Prf9mE60bT+G+DF7q9SxBRMddN288nQ7
	RtqTQ/pox5nllnckaB//Yf52Ls+nABX9DcciiWDKk/KG0CcgegayYmNd2f7zHwzpd8N6Jdt/BHqOp
	R1qeGgLrENT4tBJ3xp3q5wGFEueC4yFIrB04vxCCEUjKFE1eDCrJx4No66jNDvlwtQLADYc4wCWoU
	ElGzmlvRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYIb-0008MQ-14; Fri, 13 Nov 2020 12:35:29 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHl-00082Q-8L
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:38 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BDB57C0012;
 Fri, 13 Nov 2020 12:34:35 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 13/19] mtd: rawnand: txx9ndfmc: Move the ECC initialization to
 ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:18 +0100
Message-Id: <20201113123424.32233-14-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073437_504508_1C4D79B0 
X-CRM114-Status: GOOD (  13.75  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
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
---
 drivers/mtd/nand/raw/txx9ndfmc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 5f3dbff60d47..1a9449e53bf9 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -252,6 +252,11 @@ static int txx9ndfmc_attach_chip(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
+	if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
+		return 0;
+
+	chip->ecc.strength = 1;
+
 	if (mtd->writesize >= 512) {
 		chip->ecc.size = 512;
 		chip->ecc.bytes = 6;
@@ -260,6 +265,10 @@ static int txx9ndfmc_attach_chip(struct nand_chip *chip)
 		chip->ecc.bytes = 3;
 	}
 
+	chip->ecc.calculate = txx9ndfmc_calculate_ecc;
+	chip->ecc.correct = txx9ndfmc_correct_data;
+	chip->ecc.hwctl = txx9ndfmc_enable_hwecc;
+
 	return 0;
 }
 
@@ -325,11 +334,6 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		chip->legacy.write_buf = txx9ndfmc_write_buf;
 		chip->legacy.cmd_ctrl = txx9ndfmc_cmd_ctrl;
 		chip->legacy.dev_ready = txx9ndfmc_dev_ready;
-		chip->ecc.calculate = txx9ndfmc_calculate_ecc;
-		chip->ecc.correct = txx9ndfmc_correct_data;
-		chip->ecc.hwctl = txx9ndfmc_enable_hwecc;
-		chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-		chip->ecc.strength = 1;
 		chip->legacy.chip_delay = 100;
 		chip->controller = &drvdata->controller;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
