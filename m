Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076C0C433E1
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:22:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEBBB20721
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:22:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nxJU4i9w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEBBB20721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqiDHDSS4rI3uauuYxyxSNbsS0CpAf1Afk56IBXoN1o=; b=nxJU4i9w6gNavw
	LUWG3qsY2O5roGkZKPCPX/Ylimde+BuEZzQ6N9ZJuI7l84O11yabaDcIcCTWf50GJYVtLoFOZRN/q
	bs5p+WNUiJIkwgRBpk0UBVXNU2Ah5e9PhWNiB7RIzy2g2TiLdbNnN1wmpwboZXGfqipQTXHFtoMOG
	eLc3S0qS8zwZqSYsem2hC33YUrhvFYgY6mZZK5pbiQl2FFtLTWnuLs7SMVc9M+wlMnlPLuNqFlKlE
	w3ZdcGEub9wJV6U5qVXAYAiQSL86kpLLelphPbZS/XP5FvWzcvtkk8rgViaA1TaoFxc60EKBTbOFE
	RKX62Cs40li7mQb+D0jA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeRqY-0004xR-A2; Thu, 28 May 2020 23:21:58 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeRlS-0006NV-Sf
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 23:16:47 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E4193240007;
 Thu, 28 May 2020 23:16:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v6 21/30] mtd: rawnand: legacy: Use a helper to access the
 timings
Date: Fri, 29 May 2020 01:16:03 +0200
Message-Id: <20200528231612.8958-22-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200528231612.8958-1-miquel.raynal@bootlin.com>
References: <20200528231612.8958-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_161643_137648_43EEA9C9 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Do not access the SDR timings directly but use nand_get_sdr_timings()
instead. This way, future patching over this helper will be easier.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_legacy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
index 60798eb29ca9..8f3644ca2ea0 100644
--- a/drivers/mtd/nand/raw/nand_legacy.c
+++ b/drivers/mtd/nand/raw/nand_legacy.c
@@ -354,6 +354,8 @@ static void nand_command(struct nand_chip *chip, unsigned int command,
 
 static void nand_ccs_delay(struct nand_chip *chip)
 {
+	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(&chip->interface_config);
+
 	/*
 	 * The controller already takes care of waiting for tCCS when the RNDIN
 	 * or RNDOUT command is sent, return directly.
@@ -366,7 +368,7 @@ static void nand_ccs_delay(struct nand_chip *chip)
 	 * (which should be safe for all NANDs).
 	 */
 	if (nand_controller_can_setup_interface(chip))
-		ndelay(chip->interface_config.timings.sdr.tCCS_min / 1000);
+		ndelay(sdr->tCCS_min / 1000);
 	else
 		ndelay(500);
 }
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
