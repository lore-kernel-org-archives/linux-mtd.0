Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DAAC04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:43:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A1192173C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:43:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G+m1/HGn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A1192173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=it5mlcTSGKJ8fHvluxwAOMaV7YT8Td9yt0sPvjyJGtE=; b=G+m1/HGn799aNW
	M28Xc1F5qIpPQ4pEI6nZJD1xuSP28ZHKSH5sNQ8OcUX/6b3rlR3NEZpj4z892kxbkPSuSG85zw4T+
	kl2lU/8beqnH71KI3+737gDXNjKT3NLjTKLpUMk6VCGNG+zDpnfAlnzTbnyK3bnu4hxahkGYNDiRg
	g1p2xu8tBWY+ivNRk2mgJ9I6yUaEqMPS0kp6987EvsQ30t7dO7WLlVZwWRB9KojlBn8k6n9azKzqt
	D204hFJ3o4xX0QYqlzoemTk+dGd5JP4Y7+N1XoHKcog2jeZpCljWmZ8XZ7lhGgQ5ZpmFceOSmRhtc
	6gUC6u68dYwsF5hZrluA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT0N2-0006mq-JI; Tue, 21 May 2019 08:43:40 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT0N0-0006mL-7z
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 08:43:39 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hT0My-0003PV-L9; Tue, 21 May 2019 10:43:36 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hT0My-0003v3-Aj; Tue, 21 May 2019 10:43:36 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: rawnand: initialize ntargets with maxchips
Date: Tue, 21 May 2019 10:43:35 +0200
Message-Id: <20190521084335.15026-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_014338_444460_CF4519CA 
X-CRM114-Status: GOOD (  14.51  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, kernel@pengutronix.de,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

memorg->ntargets is initialized with '1'. It should be initialized with
the maxchips argument from nand_scan() instead. Otherwise multi chip
support errors out on the secondary chip selects when trying to call
nand_reset() on them:

WARNING: CPU: 0 PID: 1 at drivers/mtd/nand/raw/internals.h:114
nand_reset_op+0x194/0x1c4

With this memorg->ntargets is initialized with the maximum number of
chip selects supported by the driver. After having detected the number
of actually connected chips memory->ntargets is updated with that
number.

Fixes: 32813e288414 ("mtd: rawnand: Get rid of chip->numchips")
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---

Changes since v1:

- initialize memorg->ntargets directly in nand_scan_ident() rather than
  passing it as argument to nand_detect()
- Fix Fixes: committish, leading '3' was missing

 drivers/mtd/nand/raw/nand_base.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 7db0f04cf52b..a8a7e81be710 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4638,7 +4638,6 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	memorg = nanddev_get_memorg(&chip->base);
 	memorg->planes_per_lun = 1;
 	memorg->luns_per_target = 1;
-	memorg->ntargets = 1;
 
 	/*
 	 * Reset the chip, required by some chips (e.g. Micron MT29FxGxxxxx)
@@ -5003,6 +5002,8 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	if (ret)
 		return ret;
 
+	memorg->ntargets = maxchips;
+
 	/* Read the flash type */
 	ret = nand_detect(chip, table);
 	if (ret) {
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
