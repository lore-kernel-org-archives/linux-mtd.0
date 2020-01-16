Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FB2C33CB1
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 13:55:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE5782075B
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 13:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NiCEqDbG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eaxlabs.cz header.i=@eaxlabs.cz header.b="4O03aVWM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE5782075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eaxlabs.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VwDiFxK/SUeqDOVFSL/tXCpuPyCfuBExhyxKjlxVkdo=; b=NiCEqDbGgCGbyf
	RyawLKulli7tIxg0Rjf7kiYHG63gr3dubRp8T9snk6uvI9UXIy6q/huDbdGiPVXO0SGY6QmUT2lTW
	+Vb+HPcTK5xOgaC/IyH09ExIbnHoLSZkQR8qsEUousefL6BWbVdPOgtPF3NPD8TDiJHfXJnzg7hqf
	gj4AWCwag4mbn0sohpaz+LzuhR7FzXUIi+HvTvFmdl3/aQ8YGait5P9NBM/4jA3UADAwH/cuPpuZD
	4YSPrjodblZ3IQqMKLp4UrFxz5Da/tiNQ3JMxbR5dqMWZgwZglSfCJyevN+pVrCJSjeSHkjEIMimm
	HEh+NVWD3w3J4oDG+mfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is5cE-00034o-MV; Thu, 16 Jan 2020 13:55:18 +0000
Received: from ms9.eaxlabs.cz ([147.135.177.209])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is5c6-0002hV-W7
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2020 13:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eaxlabs.cz;
 s=mail; 
 h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
 bh=AypbPHseSp9PDoOGaACFm6NHLlTUiqThA0oEdf/FZa8=; 
 b=4O03aVWMzz2cILAb454sLxtOzXPEuV1cvmBjiTLzeue5H0qWx2g8uiPaWw+s5NW/EyfEF044c/70CDrVQk1SpkmMr4cSyrxSIyc+S5U+nE7BzrStnxCWR2icM005MNzNjD6xEzhWvGuNXWPAnWUA2HCZ2BgJq1uU6WwUdJDZr4Y=;
Received: from [82.99.129.6] (helo=localhost.localdomain)
 by ms9.eaxlabs.cz with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <devik@eaxlabs.cz>)
 id 1is5bs-0007Nb-Fo; Thu, 16 Jan 2020 14:54:59 +0100
From: Martin Devera <devik@eaxlabs.cz>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 "GitAuthor: Martin Devera" <devik@eaxlabs.cz>,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: Ensure nand_soft_waitrdy wait period is enough
Date: Thu, 16 Jan 2020 14:54:31 +0100
Message-Id: <20200116135431.17480-1-devik@eaxlabs.cz>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200109190423.60070968@xps13>
References: <20200109190423.60070968@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_055511_337887_616DF7A6 
X-CRM114-Status: GOOD (  12.66  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The used way to compute jiffies timeout brokes when
jiffie difference is 1.
Assume that nand_soft_waitrdy is called with timeout_ms==1.
Jiffies are 1000 for example (assume something more like 1000.99
- just before incrementing to 1001).
We compute timeout_ms = 1000+msecs_to_jiffies(1) = 1001.
nand_read_data_op is called for the first time and returns 0.
During the call jiffies changes to 1001 thus "while loop" ends
here (wrongly). Notice that routine was called with expected timeout
1ms but actual timeout used was something between 0...1ms.

Fixes STM32MP1 FMC2 NAND controller which sometimes failed
exactly in this way.

Signed-off-by: Martin Devera <devik@eaxlabs.cz>
---
 drivers/mtd/nand/raw/nand_base.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d527e448ce19..9a7e09c8d8be 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -721,7 +721,12 @@ int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
 	if (ret)
 		return ret;
 
-	timeout_ms = jiffies + msecs_to_jiffies(timeout_ms);
+	/*
+	 * +1 below is necessary because if we are now in the last fraction
+	 * of jiffy and msecs_to_jiffies is 1 then we will wait only that
+	 * small jiffy fraction - possibly leading to false timeout
+	 */
+	timeout_ms = jiffies + msecs_to_jiffies(timeout_ms) + 1;
 	do {
 		ret = nand_read_data_op(chip, &status, sizeof(status), true);
 		if (ret)
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
