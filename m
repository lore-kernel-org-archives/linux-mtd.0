Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D894C54798
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 03:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yr6/OwtZ44MRdnq7d5YrU2nwYOg1wEE2jE+Xp31XMS8=; b=2u7BfpXd9aCUGI
	Eexzgj4bqQSm6GshleIRRA8dFDdWTMWVQdtkbn5z9ZsMK2AutbPcDaWK/4oa/zdLMg8UrBD67gvNL
	B3Tp7D9GSUZseOUWo8gqIZudYKpWOD36NjtS1r8kkLGB/VuYahN3FjfMV395g1Q3q6tUt9AXrVGaK
	jGgfyd96XEkmu9w0+IvL+bkgDNDr0iZomfA53Bwl9Jqa6dJAFx5KMTpq387wtja0pnYeru7r+okCk
	zQsbMOzhj51y+XPmFj4ulauYeyI8z9FSJDPMl0cvD/0w4uEcZKbttdXqeXsjTJKHTiaOHq+WolAbH
	JnQ8oRcfee78TduRlpTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMZM-00000007k6k-2DXs;
	Fri, 23 Feb 2024 03:49:52 +0000
Received: from lpdvsmtp11.broadcom.com ([192.19.166.231] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMXy-00000007jay-3HQs;
	Fri, 23 Feb 2024 03:48:37 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 23F68C0019AB;
	Thu, 22 Feb 2024 19:48:26 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 23F68C0019AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1708660106;
	bh=1E8LlEJSmZyzjiVTNvXJAATm4YWjLO1n2vn04c4dfGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OSOvTxOvY72/fbB86m2S4hUe7kNtTp9vE0ml9JS6GpTKG2Y8D9LKYOOEv2+QMAgBZ
	 3BzW/N7Hc0BVNB6fd8BioT20YuRAu7sg4SQqMf3qzHl4MgBnlUhR1nYOLr0wPkdYiz
	 eC3VgORvH/h+8EiZjNsTVHvr6IWQado7So8eIDqE=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id AC70F18041CAC4;
	Thu, 22 Feb 2024 19:48:24 -0800 (PST)
From: William Zhang <william.zhang@broadcom.com>
To: Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	David Regan <dregan@broadcom.com>,
	William Zhang <william.zhang@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH v6 03/13] mtd: rawnand: brcmnand: update log level messages
Date: Thu, 22 Feb 2024 19:47:48 -0800
Message-Id: <20240223034758.13753-4-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240223034758.13753-1-william.zhang@broadcom.com>
References: <20240223034758.13753-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_194829_155931_0688810F 
X-CRM114-Status: GOOD (  13.47  )
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

From: David Regan <dregan@broadcom.com>

Update log level messages so that more critical messages can be logged
to console and help the troubleshooting with field devices.

Signed-off-by: David Regan <dregan@broadcom.com>
Signed-off-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>

---

Changes in v6:
- Fix style issue

Changes in v5:
- Update the commit message

Changes in v4:
- Revert the log level change for correctable ecc error

Changes in v3: None
Changes in v2:
- Added to patch series

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 5f34e5a51d25..f1f0de50b5f7 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1084,8 +1084,8 @@ static int bcmnand_ctrl_poll_status(struct brcmnand_host *host,
 	if ((val & mask) == expected_val)
 		return 0;
 
-	dev_warn(ctrl->dev, "timeout on status poll (expected %x got %x)\n",
-		 expected_val, val & mask);
+	dev_err(ctrl->dev, "timeout on status poll (expected %x got %x)\n",
+		expected_val, val & mask);
 
 	return -ETIMEDOUT;
 }
@@ -2137,7 +2137,7 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 				return err;
 		}
 
-		dev_dbg(ctrl->dev, "uncorrectable error at 0x%llx\n",
+		dev_err(ctrl->dev, "uncorrectable error at 0x%llx\n",
 			(unsigned long long)err_addr);
 		mtd->ecc_stats.failed++;
 		/* NAND layer expects zero on ECC errors */
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
