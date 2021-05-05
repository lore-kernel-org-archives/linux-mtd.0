Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB4BC433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:40:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3282F613D6
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3282F613D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vrI4zDPQzK/5c/XIfYrCWC0ybvrDgl3rfj9sE8b6NXI=; b=B7VvtzMQa+IxBODQm4DCSbH/m
	Pp96LOWTuYWTl5s4vUK7Wy6IvWlS+5C3rKTHSXh2VI67dLWJmin01Ybfsu3FZRF7FypDhq94ZXeLQ
	q7lA+UilyAzLFJStdS39MyFTxdEEr6terNrDp5K+VPrqA7DwT+d4ca14MVPc7PmMADWOOWOPNQWzx
	oorC0XLM2Pl71hZYKSsoKrcxqaWG+MKDBtSniHRXiObWn7coxAj2vSVJcfE+emU1gtWoRKJtZ0ry+
	ueHQzDAJm8aTEGzgVdOXj1uM+0sjyCeCcK92AYcxsMpKzamHiNz71rdgV+jBiX3AtM66rxboiowZ5
	4jkjSxfsQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePF3-002P7C-8v; Wed, 05 May 2021 21:39:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDY-002Om5-4C
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=i3ci5ggcheeL1JyJYbTgWBjlG2Pd/s523RdjxCi8d6Q=; b=sBzsl/VpIpYyqKD2u8jzVrLEFd
 q84RugV3LELepBpbQwU0JrLglyp/VPT5MH4m/UJ5iKclJN10Jy1DG9lnJDOoBVIS0qYa75g3wqSqg
 5dOAyf+zwT/O9QI8bMBuZbXujVgN4NvHfutH+Wp8mYBAPAuwDXr08SrEDnHNBgKQVRhoN2Kh5EKlW
 CE3z34v27i/k45j6q5R2+kRSNpoJAd/InV1BQKo9DM85l/xIkqyqnWZ23zve216xHpi/W2crXN90e
 d11PkEJXx41mTHjhTD+cy6JuS3Q0/qLsfQvtwg3/N+TFe3f60L0PkDOQxVUp/I/XQH3YxvEdoCKwM
 2+cv26UQ==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDU-005Icr-Dp
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:02 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B65EA1BF208;
 Wed,  5 May 2021 21:37:54 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 03/22] mtd: rawnand: atmel: Check the proposed data interface
 is supported
Date: Wed,  5 May 2021 23:37:31 +0200
Message-Id: <20210505213750.257417-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143800_623325_50D5A2D2 
X-CRM114-Status: GOOD (  10.13  )
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

Check the data interface is supported in ->setup_interface() before
acknowledging the timings.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 53b3a11b9952..6e15f424b071 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1524,8 +1524,13 @@ static int atmel_nand_setup_interface(struct nand_chip *chip, int csline,
 				      const struct nand_interface_config *conf)
 {
 	struct atmel_nand *nand = to_atmel_nand(chip);
+	const struct nand_sdr_timings *sdr;
 	struct atmel_nand_controller *nc;
 
+	sdr = nand_get_sdr_timings(conf);
+	if (IS_ERR(sdr))
+		return PTR_ERR(sdr);
+
 	nc = to_nand_controller(nand->base.controller);
 
 	if (csline >= nand->numcs ||
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
