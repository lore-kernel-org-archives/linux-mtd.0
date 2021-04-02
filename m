Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278E3C43460
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:54:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76534610D1
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76534610D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yNyELDc3AJQ5XBYeVyVsJ0OjZACnnWR8Cwp7pBoXT5I=; b=k4pQ5BowUPaNLi1W2fGaIcUKq
	Ahlgh5k2ADAryyfwMlb6gN8oZeHgyZ6ybj/fSR1qBPh0fQLTwqWk1gc94Vqz/VlkEyvJ6rnYZx7FG
	S5CBBHhTsFtN1wa4weTpak9Ws5gsPUqbXkNtM7KygSKREKYLbHW5izAxyCAm1PmLjBmAhuk1mOPcT
	Kfpa6EDovIeG9eITskbsciG0ASTh4yF1u7QtxOmom+4LeUwE4PnTZrK8V4UkxcKrpA4LkuI3A6WCO
	CYldKmHx/UrLwCu7KRQ+gAZaTElK9AivYU/o3QTgcUN9Iv2ayiGl6OB7xUKYRgMhvEP5lTbCIFrAa
	3MjsuHy6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSGUm-00CfIu-S7; Fri, 02 Apr 2021 09:53:41 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSGTK-00CevH-Tw
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 09:52:14 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 487391C0004;
 Fri,  2 Apr 2021 09:52:08 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 05/16] mtd: rawnand: Update dead URL
Date: Fri,  2 Apr 2021 11:51:34 +0200
Message-Id: <20210402095145.254867-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402095145.254867-1-miquel.raynal@bootlin.com>
References: <20210402095145.254867-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_105211_463051_C3424424 
X-CRM114-Status: GOOD (  10.11  )
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

The current link to the ONFI specification is broken, the onfi.org
website now points to materials on Micron's website. Update the URL
accordingly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/rawnand.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 7f6a937a0bed..e9512ac3ff5a 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -385,8 +385,8 @@ struct nand_ecc_ctrl {
  * This struct defines the timing requirements of a SDR NAND chip.
  * These information can be found in every NAND datasheets and the timings
  * meaning are described in the ONFI specifications:
- * www.onfi.org/~/media/ONFI/specs/onfi_3_1_spec.pdf (chapter 4.15 Timing
- * Parameters)
+ * https://media-www.micron.com/-/media/client/onfi/specs/onfi_3_1_spec.pdf
+ * (chapter 4.15 Timing Parameters)
  *
  * All these timings are expressed in picoseconds.
  *
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
