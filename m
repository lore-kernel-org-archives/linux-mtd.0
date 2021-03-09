Return-Path: <SRS0=cj04=IH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464A8C433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 00:03:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1F0C6527E
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 00:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1F0C6527E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nKiwDeZcrGTQpbdgIFf+qGlvcjnGkbnREg9vGYu4pZA=; b=Hq8FNX4N4R2wgPiVW8JVc6tfoQ
	tJq7LdGm6VLZoAlYdbSL9GRld+aytrwCEIKD7VYziTxdFetNl3tCPlEcsb52T0oEm1A3CyLr9BFwh
	SWQBAqon+gjDd1aYXR89NdfyU0DGGbcgcieGRx1XhgANRUJ/Yej9GaV/QM2jVMSl6Oa8MSn1UCP+b
	4Phu1Iad3WCRPi+w7TuqULTu/ietPvOFDVU+w/3EaqGxcQONWX1e3/RqIdyQwhT0YzDzlAaqrhys1
	ufAu5GgFUr0iT8du2simsvKBGpjoUf4H+0LP2I15ltbG7ErBnMbFQTYM1nDx1R3CIIBW+NP6fb8nY
	Dhqbb1GQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJPpK-003RRm-9a; Tue, 09 Mar 2021 00:02:18 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050::465:101])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJPpE-003RQg-Fe; Tue, 09 Mar 2021 00:02:15 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Dvb4228bKzQjmS;
 Tue,  9 Mar 2021 01:02:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001; 
 t=1615248127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IIjhrNKPHSKrk9t+iVyUseYnv1umUwhzDurztxg1f/Y=;
 b=DA/U1unP8IIuCIlPa+iGD6Q5cYqyWcs4YIw6oJ9JCXAsTLZSr/ZXCMZtKxfsCEsmUvJsaB
 XS1qXA8dvaYGC1K/VKqMdj422xktOrn5HhsUafvSfVRq/7Rdw5HRvuAv/9oPQ2Tr9TAEVl
 8UWHxrmB30BTT3vzdt/0Op592u9uhCuoulIAWn2Vd2MYvfy0CDAMlMdlhIdym4KJYIF+9E
 CYr+i0QL6aerno4AYZ3GeVM6Kw8lbIkaY0oi5xW6JLS4i3hNbSPYwlhQEblQaSBvZw9Mat
 0yqX2U1+V70RAktEpHEX8EjuSgqLGGobIkzQSm+0n3GIdA3kRgQBV1P7wXlMNg==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id DlRNqmkt5Zj1; Tue,  9 Mar 2021 01:02:02 +0100 (CET)
From: Hauke Mehrtens <hauke@hauke-m.de>
To: miquel.raynal@bootlin.com, richard@nod.at, boris.brezillon@collabora.com
Cc: vigneshr@ti.com, matthias.bgg@gmail.com, linux-mtd@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH] mtd: rawnand: mtk: Fix WAITRDY break condition and timeout
Date: Tue,  9 Mar 2021 01:01:07 +0100
Message-Id: <20210309000107.1368404-1-hauke@hauke-m.de>
MIME-Version: 1.0
X-MBO-SPAM-Probability: **
X-Rspamd-Score: 1.67 / 15.00 / 15.00
X-Rspamd-Queue-Id: 4A9BB17D9
X-Rspamd-UID: 806a35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_000213_123864_C3CD14FF 
X-CRM114-Status: GOOD (  13.09  )
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

This fixes NAND_OP_WAITRDY_INSTR operation in the driver. Without this
change the driver waits till the system is busy, but we should wait till
the busy flag is cleared. The readl_poll_timeout() function gets a break
condition, not a wait condition.

In addition fix the timeout. The timeout_ms is given in ms, but the
readl_poll_timeout() function takes the timeout in us. Multiple the
given timeout by 1000 to convert it.

Without this change, the driver does not work at all, it doesn't even
identify the NAND chip.

Fixes: 5197360f9e09 ("mtd: rawnand: mtk: Convert the driver to exec_op()")
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/raw/mtk_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 57f1f1708994..5c5c92132287 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -488,8 +488,8 @@ static int mtk_nfc_exec_instr(struct nand_chip *chip,
 		return 0;
 	case NAND_OP_WAITRDY_INSTR:
 		return readl_poll_timeout(nfc->regs + NFI_STA, status,
-					  status & STA_BUSY, 20,
-					  instr->ctx.waitrdy.timeout_ms);
+					  !(status & STA_BUSY), 20,
+					  instr->ctx.waitrdy.timeout_ms * 1000);
 	default:
 		break;
 	}
-- 
2.30.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
