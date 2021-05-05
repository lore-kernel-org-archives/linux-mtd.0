Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A01C43600
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:39:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E3EE613F0
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E3EE613F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6ATPZplBhBU2ElWFYsIKQQuoRzljEZiDsNH/wxjf7/c=; b=B2kdmWTS+Z73zlIKvwSTlrXIq
	j9k+OlO0zBxsWW4Jb8Finmts4X1c4+dB4i5TmRtu80EOOv+7fQcjK1QWcz60s2VVPgnZ06YYYOWfe
	oUuIAiFtOhyA8YxUer71bb/HCbmvvRMtPXXCC3tqri7nB396OafvYy8DOv7yV8EeXGFwU8nGJ+Z3w
	8IioayMhacYi0sFDX+bbZQuATHnkv3RoWneJsyxSKUL7fQRDo2Ua0amAMvs2pVKIU8ur9MspEX9SK
	VwkNfW9SLOFk6P1tnb55lkHy1ml5vAzxt2n+Poi6RwIYU8hSPXKgr8u/vyN3qR7fhNnT8cMZVRjuf
	zKEmXJ/tg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePDd-002Ono-A5; Wed, 05 May 2021 21:38:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDW-002Olq-UG
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=csy7P3mblZhHTIjiD53gwX3SzQXtpEASnQz4Z5cjUYY=; b=JBMiMZqehjiM3/If/iDJFWt7VB
 xaNSsUUxHyRhlCVn37ooqJeYvfR767TVNLpcfhdckR08SM34CnBqTiADOB5aeY6SeZCETPTQXHkjK
 bFLwIm3Kd+3QMD2TaRgFR7eBcU/dlN0fsWFhQgNnMv1zlZEZ+U5beaYhNQ0IcpwrZEx5SCMAv5lDV
 WigcBm5Pff6eeGRCkItS9v44ARa61pqSVq0s842UXlE/Bq8QTmNbj3w3RTwFahAo+zzimCXOJ8R3d
 EIDzKOiIejEHPmsKiqIUvrYRZpcz7myhBcyFkxRGGgFXLXSRNAbnyCnHVp7v/txSPW2CZu3FWl0fu
 EbbVQ77g==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDT-005Ics-Mk
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:01 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id AAC481BF209;
 Wed,  5 May 2021 21:37:55 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alexander Dahl <ada@thorsis.com>
Subject: [PATCH 04/22] mtd: rawnand: onfi: Use the BIT() macro when possible
Date: Wed,  5 May 2021 23:37:32 +0200
Message-Id: <20210505213750.257417-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143759_930625_A439590A 
X-CRM114-Status: UNSURE (   9.16  )
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
Acked-by: Alexander Dahl <ada@thorsis.com>
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
