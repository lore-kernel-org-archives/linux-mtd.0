Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A8AC433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:53:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90ACE610D1
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90ACE610D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pegfNvnQYHHZV0IFUXjsaXrET/AIdkQno5oEr7lkB9E=; b=KZykiYcivAC03Qh8mba3SpBAL
	cC4kQodBNVgfDd2wv+bc1XCwVthBe/gYcix/Wq/oa8ijpDucd5EnPI7tJVqTH17B2+xoWpd3HJJ4b
	2VGA83EXRrv0dJxPoGs8qXWHLKc7xVJp4BrS2sE6/Ws2p1c+SFPCfwUVJUbdr6CC1mcylSGiRygpY
	FmRwa9kLU2qbx2rAsQigmr4F3Gd0rGbknYdmPJSlaqJRusXqs+hzPBu6gsSp6hSPvdL3G8XMN4ABR
	2kvRDV86ClDa8BTjkMETmB+JY+NYTBT1vgldsROjoWpXRmgEfE2hNtNj9V/dOhdDZRQ1FKegYZjwz
	r+JjWLQew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSGUG-00Cf8y-2L; Fri, 02 Apr 2021 09:53:08 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSGTI-00Ceub-5a
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 09:52:10 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BF63C1C0003;
 Fri,  2 Apr 2021 09:52:04 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 04/16] mtd: rawnand: onfi: Use the BIT() macro when
 possible
Date: Fri,  2 Apr 2021 11:51:33 +0200
Message-Id: <20210402095145.254867-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402095145.254867-1-miquel.raynal@bootlin.com>
References: <20210402095145.254867-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_105208_655171_2EC1A512 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

Update the onfi.h header to use the BIT() macro.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/onfi.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/mtd/onfi.h b/include/linux/mtd/onfi.h
index 339ac798568e..cf14474bc454 100644
--- a/include/linux/mtd/onfi.h
+++ b/include/linux/mtd/onfi.h
@@ -24,17 +24,17 @@
 #define ONFI_VERSION_4_0		BIT(9)
 
 /* ONFI features */
-#define ONFI_FEATURE_16_BIT_BUS		(1 << 0)
-#define ONFI_FEATURE_EXT_PARAM_PAGE	(1 << 7)
+#define ONFI_FEATURE_16_BIT_BUS		BIT(0)
+#define ONFI_FEATURE_EXT_PARAM_PAGE	BIT(7)
 
 /* ONFI timing mode, used in both asynchronous and synchronous mode */
-#define ONFI_TIMING_MODE_0		(1 << 0)
-#define ONFI_TIMING_MODE_1		(1 << 1)
-#define ONFI_TIMING_MODE_2		(1 << 2)
-#define ONFI_TIMING_MODE_3		(1 << 3)
-#define ONFI_TIMING_MODE_4		(1 << 4)
-#define ONFI_TIMING_MODE_5		(1 << 5)
-#define ONFI_TIMING_MODE_UNKNOWN	(1 << 6)
+#define ONFI_TIMING_MODE_0		BIT(0)
+#define ONFI_TIMING_MODE_1		BIT(1)
+#define ONFI_TIMING_MODE_2		BIT(2)
+#define ONFI_TIMING_MODE_3		BIT(3)
+#define ONFI_TIMING_MODE_4		BIT(4)
+#define ONFI_TIMING_MODE_5		BIT(5)
+#define ONFI_TIMING_MODE_UNKNOWN	BIT(6)
 
 /* ONFI feature number/address */
 #define ONFI_FEATURE_NUMBER		256
@@ -49,7 +49,7 @@
 #define ONFI_SUBFEATURE_PARAM_LEN	4
 
 /* ONFI optional commands SET/GET FEATURES supported? */
-#define ONFI_OPT_CMD_SET_GET_FEATURES	(1 << 2)
+#define ONFI_OPT_CMD_SET_GET_FEATURES	BIT(2)
 
 struct nand_onfi_params {
 	/* rev info and features block */
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
