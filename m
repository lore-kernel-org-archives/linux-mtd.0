Return-Path: <SRS0=3IXU=IX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5AAC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Mar 2021 10:25:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 351F661A0A
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Mar 2021 10:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 351F661A0A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BUvmdsOc4/31nqCbIdKDAfEjxnc1hEeZGh4yTaKqOMs=; b=c9n6lZmpecVEoTUT9gdLd1xRzv
	Tkz8buGXiYFDABZhFZPn4L8cdPYh/K/BwucEwpq//RoqeEXAjoFKS91Vp7SV9ZA5LDjvKnApWocxD
	G6v4oiDJiyJiNtZNyzpnCMBcmFrnBXFW8vGQsQbedMQk5erdLB1yaCNI0SHNkU3BZksGyeYbKTiDT
	QLEP0VSXBxYYpl2Q3bm8YSuSA1zPZMFEO7f7c1jpbrXwMkOVmHdmFrGvVjJK7ArdspytUACWllqUZ
	Ds39k2gsc/2T4UASkugCgJtz2+p5NUQEYjK8gcVpa8zYbdmjors+b99CzPouaglvXcDZoTZgIudEr
	LSDlrV2Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPN9n-001Cq6-53; Thu, 25 Mar 2021 10:24:03 +0000
Received: from mickerik.phytec.de ([195.145.39.210])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPN9d-001Cox-3A
 for linux-mtd@lists.infradead.org; Thu, 25 Mar 2021 10:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1616667825; x=1619259825;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XX4NYHDVdIgAN4+alHloHPftwp/jpIXj92Iyg+stYRI=;
 b=Uk2lHMmpx3dpmxY9cRjYqJ/7+6crykxYhG58hiB+/kvGFb9drKEZnzMRcIPZlo03
 Qv8xTs68SCb73l9Y9s7DLfVw1nxwCMxtjPFelWwTZDWceYEL7IOIf9E5UbPMbWpl
 IKMieQCOzXb7IXPJ6sVaw/QrngESA/3qL4xXQ/flCDc=;
X-AuditID: c39127d2-868b870000001c91-c3-605c64b15204
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id E2.DE.07313.1B46C506;
 Thu, 25 Mar 2021 11:23:45 +0100 (CET)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021032511234504-229425 ;
 Thu, 25 Mar 2021 11:23:45 +0100 
From: Stefan Riedmueller <s.riedmueller@phytec.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH] mtd: rawnand: nand_bbt: Skip bad blocks when searching for
 the BBT in NAND
Date: Thu, 25 Mar 2021 11:23:37 +0100
Message-Id: <20210325102337.481172-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 25.03.2021 11:23:45,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 25.03.2021 11:23:45
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsWyRoCBS3djSkyCQfseLovLu+awWexuWsZu
 cbh9H6vF5J1vGC3+n/3A7sDqMW9NtcfmJfUeN+cVehy/sZ3J4/MmuQDWKC6blNSczLLUIn27
 BK6MNd82MBd84a7omvGWvYHxCWcXIweHhICJxMI3aV2MXBxCAlsZJQ6f6mGGcK4xSvz/dpWl
 i5GTg03ASGLBtEYmEFtEIESi//0ZFpAiZoFJjBIP9pxnBUkIC0RLHNk2kRVkKouAqsSl4wEg
 YV4BW4kfj56D9UoIyEvMvPSdHSIuKHFy5hOwORICVxglbj3fxgZRJCRxevFZZhCbWUBbYtnC
 18wTGPlmIemZhSS1gJFpFaNQbmZydmpRZrZeQUZlSWqyXkrqJkZg+B2eqH5pB2PfHI9DjEwc
 jIcYJTiYlUR4k3xjEoR4UxIrq1KL8uOLSnNSiw8xSnOwKInzbuAtCRMSSE8sSc1OTS1ILYLJ
 MnFwSjUwbrkVOz167mWRz5bO2kYWjlea7ywx2Lfjh5ba3BRGDns7j9Rbni9rQnMvtW98O0VB
 85PczAPpxzMblQV0d7p/55vvoXt8WeOJJR+7prjXbzvzRbadTWza2/31gXOPe8QayYcduPnr
 yflWy2WFxUsYzRT8/3d93S0xl2f54uxuv5e5G/VyxVc3KbEUZyQaajEXFScCAA/Fb8stAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_102357_284407_5E628987 
X-CRM114-Status: GOOD (  11.18  )
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

The blocks containing the bad block table can become bad as well. So
make sure to skip any blocks that are marked bad when searching for the
bad block table.

Otherwise in very rare cases where two BBT blocks wear out it might
happen that an obsolete BBT is used instead of a newer available
version.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/mtd/nand/raw/nand_bbt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index dced32a126d9..6e25a5ce5ba9 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -525,6 +525,7 @@ static int search_bbt(struct nand_chip *this, uint8_t *buf,
 {
 	u64 targetsize = nanddev_target_size(&this->base);
 	struct mtd_info *mtd = nand_to_mtd(this);
+	struct nand_bbt_descr *bd = this->badblock_pattern;
 	int i, chips;
 	int startblock, block, dir;
 	int scanlen = mtd->writesize + mtd->oobsize;
@@ -560,6 +561,10 @@ static int search_bbt(struct nand_chip *this, uint8_t *buf,
 			int actblock = startblock + dir * block;
 			loff_t offs = (loff_t)actblock << this->bbt_erase_shift;
 
+			/* Check if block is marked bad */
+			if (scan_block_fast(this, bd, offs, buf))
+				continue;
+
 			/* Read first page */
 			scan_read(this, buf, offs, mtd->writesize, td);
 			if (!check_pattern(buf, scanlen, mtd->writesize, td)) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
