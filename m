Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41855C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:10:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11F4E217D4
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SkDVzKQZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UpGfOPLZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11F4E217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpIFfGiKHIS3Oa9NgqGoJdHJYWWGyuSpxeGWv0o6Q9E=; b=SkDVzKQZK2RHqm
	3luEHofEzz1lZavVpRfBH0Vjdo2nQtq1QjI8JsK4Ao8Qt3d3YSxkECDymwF9RQjBKeNGE8lnc4t+m
	WXro+vSDjwCqe2I44CwFDn2Gy+Ixn8o4nKj+sS6nYrF4bNrPb8/AGq5XTEHHjqmZG9muJF2Dv17mc
	wMFyMAmnkMH4HJi+wzWNe+MKvrDW14gp2PtMS6t2owmGmxWF+5AXc5oyKEFNzStpr/ewE6WRjH7zM
	+ViKq8fG3BtY5Pwx4WeUM4yIZbF40o17q+ykFDHGiPFcO/979lJGqq6GFng5LYxpoEIjbYNNSy+Ds
	dE9Tgk5LdlV6j4O01IDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCLo8-0004VT-Qp; Fri, 05 Apr 2019 10:10:48 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCLny-0004FQ-HJ
 for linux-mtd@bombadil.infradead.org; Fri, 05 Apr 2019 10:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MOeKsH7L58cJqmbQuXbbK880bfUHGM5XiaPHP1MLXyo=; b=UpGfOPLZEJ3eOqp1KmTtGdY+aV
 mx9mrvEVxxQgk+LTJctjEmtzNrkqsrrj5h6uV9OSJSpsTzTyq5m2nrCaqK80rgvEgm9z2GkFWaHE4
 uruAAjgZXaOVhR/tWxmbH50/v+yEMErNOOvcVYiOHlfb12a7couLfmVcnU31ME7MXZR8XvIaweO+i
 ORjg0rE7Kb2JUaYeSogmtz5o7tbIeO6cBKmizrStggzdg5Tq8kaL4sn8wKGDwY7quQlC8Meb7yQKX
 Merm/LCzv+yniNwqrTgapAD34DJWQWlpThXonwhcNIBxgMbiUnlL7ocpWJQXAwhFrXd9z4T9PO8eu
 8M7L2Q+w==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCLly-0007xF-PN
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 10:10:37 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlB-0000RM-TS; Fri, 05 Apr 2019 12:07:45 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlA-0008Iv-IU; Fri, 05 Apr 2019 12:07:44 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/10] mtd: rawnand: gpmi: remove unused variable
Date: Fri,  5 Apr 2019 12:07:34 +0200
Message-Id: <20190405100740.5074-5-s.hauer@pengutronix.de>
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
X-CRM114-CacheID: sfid-20190405_111034_943334_D533797B 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index e6b588c77f2f..5cd54c3a65dc 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -154,9 +154,6 @@ struct gpmi_nand_data {
 #define DMA_CHANS		8
 	struct dma_chan		*dma_chans[DMA_CHANS];
 	struct completion	dma_done;
-
-	/* private */
-	void			*private;
 };
 
 /* BCH : Status Block Completion Codes */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
