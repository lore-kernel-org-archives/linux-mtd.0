Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EE3C10F0E
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 11:51:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C345620830
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 11:51:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JZ2skXrN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hU/qmB+G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C345620830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpIFfGiKHIS3Oa9NgqGoJdHJYWWGyuSpxeGWv0o6Q9E=; b=JZ2skXrNLA40QS
	aD38rPNkMD0ciHi83fJBOO1+t3+GGD4Z/dT5oo+DqoWMY5wFUYSb+O2L0SbpUQ8vkMpAJFsDa+X5W
	8q9zdgubrpznJ6XqkjkwQMIAOHBFmddkPLGNarkxedFJ5VymJ9g6hufMjl8ElbPrRC3KHPbVA0eqS
	9exDAnIFAamcy+/z3mLPL4P4gVCMvtcZVPzWH/0Fl79wfSAwIc40pfmpzo9RsP3hbhUMJXzLtzuEb
	iQJ0rhWdQhaQT/J2pQx34xiseWF0gKp2pKCO6AM0x/Vl9xO4WF0Dj/7KcOshuRCGfIoH1YU73CE+T
	ZMLbuRejQjnIU0yjgC1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDpHP-0000B3-WD; Tue, 09 Apr 2019 11:51:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDpHO-0008Ut-HU
 for linux-mtd@bombadil.infradead.org; Tue, 09 Apr 2019 11:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MOeKsH7L58cJqmbQuXbbK880bfUHGM5XiaPHP1MLXyo=; b=hU/qmB+GZQvgIHBFbUCa/cETNs
 7aExmQ9RXmtObeQH/G0t5pVBRsbBYI9OpiW0xnBBMSrOz9Cl46g2nqC1RLm4CVRrydlShwg5QNb3k
 Zd8XUuwclw+Xqcm3z4PYoN4r8a3KLYkfouYmynEmBrIbAowOFqgoP7EoKL5NBTP+lKtCCqTMEKDVg
 kDromIQmDoL5u2reDrjIGwhp9UFe+gzItsgV4F+PRJnBHbt0suBdQ61/B33FXBOj2wja00WELFF/B
 totbD70iGGqRQ1HkrjE7WghBiEQZ336gfruxhPzzTUQ8R17+wbxpRPsVCE1eNY/dxk4cIjgMsYefn
 vPiza+FQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDp2H-00051M-W6
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 11:35:31 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hDp1D-0001OP-Mk; Tue, 09 Apr 2019 13:34:23 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hDp1C-0001bq-IK; Tue, 09 Apr 2019 13:34:22 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/14] mtd: rawnand: gpmi: remove unused variable
Date: Tue,  9 Apr 2019 13:34:11 +0200
Message-Id: <20190409113421.3037-5-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190409113421.3037-1-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_123530_189923_074E0AC9 
X-CRM114-Status: GOOD (  10.56  )
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
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Han Xu <han.xu@nxp.com>, Shawn Guo <shawnguo@kernel.org>
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
