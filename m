Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1E4C433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:09:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A7F9611AD
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A7F9611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mRxKQr3yrVCFUU/JCV/Pi3/6V+0hTgMUjqFEsRA7sRU=; b=UjccwQMpzwHFhY1ozR0w3/+hd
	BAMTSsfgTXOAjrwF4BvCjzzWjdZiqehNgSu+11zdLU1qmEwr+zKi8zaCqg6dgDWTFNjNkKhl6zfIh
	hkfldta12E/9ML2NgYgqo2xsBULDaYIbSmlBGfgabTap1itl76eQbegeHkSKpXwE4y+lnAa7paktW
	uPVrKxKPx2QMpWk30tiV7GfrwRqMU1ui4IgNO+j3XBS/zuJCfW5MH8dRrRr2nUdhWy0wtzbNoyHPA
	5Scw3y8q3ZX4Z8KC6VFxwU/bds3AGwvFGc1N2ISKZrtXCcBvlCxezCyFdZEQ9Yr9/orgWnQ8XP55E
	oW9uL9UWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePgc-002SiW-IT; Wed, 05 May 2021 22:08:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDh-002Oor-Pl
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=yDnZJ9ZL93wFBwZ6LHte+eDKbLLA2YkkY3YWKfGUHn4=; b=yI+0eQh9aHycE1guaZdNGtfa6F
 tJcH4We2R4oZqKfMcoTsdOxXTt1vPaId6y8rDu7Ph/Du2DDdhfpRRjHGdm0vDj+w3YvRSz1oL4UO2
 W8Mw9DIvLwNvuH71GWlKNGmrUKFI7pJg1gFR2K6t8mL4AXNYtagx34IxnpqsRFzYqlO/1eGN4t3ki
 BfrwQ/aJobUFesR0KD6fM4Abq2GsqTWc0hx0AgCyLj2pejtHqIWyhGMDyycOk33QrN19E3xHBllDD
 x+jjmhlB7B6ocz5jxS46sATIP8IeXiHG5ZcU5X0/6XMv/7GriyzaPixAqdNAP1jdJMuTKQKWqicHp
 /N6gycRw==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDf-005Ih2-9l
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:12 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1AE621BF20D;
 Wed,  5 May 2021 21:38:09 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 17/22] mtd: rawnand: Allow SDR timings to be nacked
Date: Wed,  5 May 2021 23:37:45 +0200
Message-Id: <20210505213750.257417-18-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143811_493742_F5EE099A 
X-CRM114-Status: GOOD (  11.05  )
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

This should never happen in theory and is probably a controller driver
bug. Anyway it's probably better to bail out at this point if this
happens rather than continuing the boot process.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index cfe8257bf175..e20551cb3ce5 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -952,13 +952,13 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
 
 		ret = ops->setup_interface(chip, NAND_DATA_IFACE_CHECK_ONLY,
 					   iface);
-		if (!ret)
+		if (!ret) {
+			chip->best_interface_config = iface;
 			break;
+		}
 	}
 
-	chip->best_interface_config = iface;
-
-	return 0;
+	return ret;
 }
 
 /**
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
