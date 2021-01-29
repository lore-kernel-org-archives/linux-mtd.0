Return-Path: <SRS0=IJeB=HA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D35C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 08:20:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F47364E07
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 08:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F47364E07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QclsW223kW4b+rdnvXPmG3WR3sizpVZuGdLMN7SiNY8=; b=zIkmL9OhjQapR4S4pt17TF5qX1
	QFMN0UTKu2lDWxBbUol5JpkecyXzxELrA8lbQHW/CZoWjVsfILsTD1zNJ1F4roS7B5EEaCiXLF+4M
	P21FHsyd2FKvLpQIszooywTISi0QSgtpMEP+RVjLjCs7EskOeWfu4w2Dk3c6VRqpLgOKM80XbIWRW
	22nOw10/ZKSlQBAxRWzQeGyJULJqxzqF/xszLvKt6lR0k5IUrd/0YJsqvom05Yi4Rl64f1O4HPHTI
	tjmWz1/Ux/neClwXHPlz2k0ovMlHAjOQ0p0dvqJEDWkLJ7b1vSaBc4bT6OXrvWPrCP6BosVSvjE5K
	7ab04Qfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Ozh-0002vl-UP; Fri, 29 Jan 2021 08:19:05 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Oze-0002th-Gt
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2021 08:19:04 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0UND6mPW_1611908332; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UND6mPW_1611908332) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 29 Jan 2021 16:18:52 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: vigneshr@ti.com
Subject: [PATCH] mtd: rawnand: qcom: Simplify bool conversion
Date: Fri, 29 Jan 2021 16:18:50 +0800
Message-Id: <1611908330-92094-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_031902_796261_230E9AF7 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, Yang Li <yang.lee@linux.alibaba.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix the following coccicheck warning:
./drivers/mtd/nand/raw/qcom_nandc.c:1793:13-18: WARNING: conversion to
bool not needed here

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 667e4bf..a0410e0 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1789,8 +1789,7 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 			 * ERASED_CW bits are set.
 			 */
 			if (host->bch_enabled) {
-				erased = (erased_cw & ERASED_CW) == ERASED_CW ?
-					 true : false;
+				erased = (erased_cw & ERASED_CW) == ERASED_CW;
 			/*
 			 * For RS ECC, HW reports the erased CW by placing
 			 * special characters at certain offsets in the buffer.
-- 
1.8.3.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
