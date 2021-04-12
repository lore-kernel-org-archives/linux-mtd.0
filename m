Return-Path: <SRS0=MywH=JJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54284C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 16:01:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4A9D6124C
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 16:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4A9D6124C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XP/fUIguHoJ0xUZIt4cxu+1gI1Pi/9ejM99gNl/n2aI=; b=ADhnUvmUl0z3wbnLmZDXIAyFVA
	chKTkqf0+D1gT6PKKlEIxR5joyjiLqsYe3XxETw1AdugA5GtURn2CCAXpG5tNyrXI0yxyEMbqDvcP
	OOEzpRB89VemfIfJuN8F9uhWM/Y404D23C/Uc4Mv65eAiRX5tgbpCJQt5oMpRvTcX9h/Vi1ofSzLY
	EvnL1wHbSSE/+QQ18dQwE0vx5uZFyePFEpHL/F5gwAARdhcRsstOJRs7rRXvZSS14gbx05o/9vA9m
	JD+/qQ+EZCLrp4v0cHImKz/FLHaZ73vLIbwFkjpeEyH/FVwiyhAlZ+C/PufC4gX8yRn2wckMQ9U7Y
	XRIUV1ag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVyzH-007BC0-K4; Mon, 12 Apr 2021 16:00:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVyys-007B74-Hd
 for linux-mtd@desiato.infradead.org; Mon, 12 Apr 2021 16:00:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=j9V6vL6SqVOqhKcnm1qWMwur6IAbJ6bA1QicLZW5k00=; b=W4Q1q3j7AH1EpfhjDblCLEsQ1q
 97m57Xz0jfjQ5Gbt7xPUt1RQQBQLe6OnrjpG+aShzKFsWiaKjareabOEaOtUH1YjZjQ/LN2BQNhFu
 AiXEBtraNe+G7TdLf8YXlCNkFA16np69V/13gu9kXuwrG3xEDjgUYluU2P/8vMMrZahc5BrpgkPPW
 VTRLwrI78ux5MFK79DOStWQZeo6yGrO/GsPkhJXP7aC5NTSPcoO5Wl70tWGSzk0BoNEoEZdiZrBiP
 RjcYYIqRQ9U9g6IKE7cwnpe+7nyl2zEg1Ybu5+XCrojY9wyrFGhfXqyBXZODMwDJfax/N19W20z/l
 x0I7N9UQ==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVyyp-006MvC-Lf
 for linux-mtd@lists.infradead.org; Mon, 12 Apr 2021 16:00:05 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A9B6AE0013;
 Mon, 12 Apr 2021 15:59:56 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org,
 Trevor Woerner <twoerner@gmail.com>
Subject: [PATCH] mtd: rawnand: lpc32xx_slc: Fix Hamming initialization
Date: Mon, 12 Apr 2021 17:59:56 +0200
Message-Id: <20210412155956.314283-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_090003_862609_0D7179EB 
X-CRM114-Status: GOOD (  10.93  )
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

Since the Hamming software ECC engine has been updated to become a
proper and independent ECC engine, it is now mandatory to initialize the
engine before using any one of his functions. Failing to do this will
generally produce a NULL pointer dereference on the non-allocated
buffers at runtime.

Fixes: 19b2ce184b9f ("mtd: nand: ecc-hamming: Stop using raw NAND structures")
Cc: stable@vger.kernel.org
Reported-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 6b7269cfb7d8..df3b4415438f 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -773,6 +773,7 @@ static int lpc32xx_nand_attach_chip(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
+	int ret;
 
 	if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
 		return 0;
@@ -805,6 +806,13 @@ static int lpc32xx_nand_attach_chip(struct nand_chip *chip)
 	chip->ecc.correct = rawnand_sw_hamming_correct;
 	chip->ecc.hwctl = lpc32xx_nand_ecc_enable;
 
+	ret = rawnand_sw_hamming_init(chip);
+	if (ret) {
+		dev_err(mtd->dev.parent,
+			"SW Hamming ECC initialization failed (%d)\n", ret);
+		return ret;
+	}
+
 	/*
 	 * Use a custom BBT marker setup for small page FLASH that
 	 * won't interfere with the ECC layout. Large and huge page
@@ -819,8 +827,14 @@ static int lpc32xx_nand_attach_chip(struct nand_chip *chip)
 	return 0;
 }
 
+static void lpc32xx_nand_detach_chip(struct nand_chip *chip)
+{
+	rawnand_sw_hamming_cleanup(chip);
+}
+
 static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
 	.attach_chip = lpc32xx_nand_attach_chip,
+	.detach_chip = lpc32xx_nand_detach_chip,
 };
 
 /*
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
