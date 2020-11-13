Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C992C4742C
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 13:52:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3006A22240
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 13:52:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bh5p+9XY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3006A22240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uJD7KiGOsYvFQW+COTsd+koG4JMgGCtdaT825zOwyHY=; b=bh5p+9XYGp1RiE3ER0NC1KuDa
	Isr0tQUfnYixB7w5FiIDJk5SRUSmxXg4Mj0UnlQsgrYAkV6wR0ROvXJfd7paras7qirHa8gqFMUS1
	CdXZ1nAIEOl1rkYqq585YHagjJVniUKc354S0rNBCEQ1hzKeFbZWjrnLpjcKd+Crfvt/V6iTapOPf
	NSQ5A5ZWKaE+KTwbpP7byw5pDbbanmmXjuF97Yam6HEm1gZZkXrFBh+eocvt9XRS8/1ABTRO2rFJb
	iWL/njsvcNbTyOtKJMqVlysMsMqC3fsypSg2bxg5FHdEuIcydjKKylMrwnNfw9uelcmuWtQxDwnjM
	MRuFcZAag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdZU5-0007sL-Sa; Fri, 13 Nov 2020 13:51:25 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHp-00084h-JC
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:44 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 14971C0010;
 Fri, 13 Nov 2020 12:34:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 19/19] mtd: rawnand: socrates: Move the ECC initialization to
 ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:24 +0100
Message-Id: <20201113123424.32233-20-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073441_835109_A0063451 
X-CRM114-Status: GOOD (  15.58  )
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
 drivers/mtd/nand/raw/socrates_nand.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 0f63ff6f7fe7..107208311987 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -22,6 +22,7 @@
 #define FPGA_NAND_DATA_SHIFT		16
 
 struct socrates_nand_host {
+	struct nand_controller	controller;
 	struct nand_chip	nand_chip;
 	void __iomem		*io_base;
 	struct device		*dev;
@@ -116,6 +117,18 @@ static int socrates_nand_device_ready(struct nand_chip *nand_chip)
 	return 1;
 }
 
+static int socrates_attach_chip(struct nand_chip *chip)
+{
+	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+	chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
+
+	return 0;
+}
+
+static const struct nand_controller_ops socrates_ops = {
+	.attach_chip = socrates_attach_chip,
+};
+
 /*
  * Probe for the NAND device.
  */
@@ -141,6 +154,10 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	mtd = nand_to_mtd(nand_chip);
 	host->dev = &ofdev->dev;
 
+	nand_controller_init(&host->controller);
+	host->controller.ops = &socrates_ops;
+	nand_chip->controller = &host->controller;
+
 	/* link the private data structures */
 	nand_set_controller_data(nand_chip, host);
 	nand_set_flash_node(nand_chip, ofdev->dev.of_node);
@@ -153,10 +170,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	nand_chip->legacy.read_buf = socrates_nand_read_buf;
 	nand_chip->legacy.dev_ready = socrates_nand_device_ready;
 
-	/* enable ECC */
-	nand_chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
-	nand_chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
-
 	/* TODO: I have no idea what real delay is. */
 	nand_chip->legacy.chip_delay = 20;	/* 20us command delay time */
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
