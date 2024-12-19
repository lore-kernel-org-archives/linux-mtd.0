Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013D1E7718A
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 14:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U1zsJMgZ8+8y/4UYrv3YbeR6Spuf2QWz2KE6iq7BuY0=; b=hYulOA8byRvzrZ
	VE7crd+s6Ib4jRjz4GWjr8/xJSnFKjTyuZYVgq8wsxR0StfrThYs7Mdm9H+Je93Fphx0POgAKvqE+
	nKf4XoJB9VH26KC6Sv6AXX5g6XEmp6bjomqk3Cc8ZoFdzsYh6GWnsX8mg9dg9xf/1EpMk+bvuUwNe
	TDAMDv9HKe47y207DVc5V64UYic92BfiOisEA0AbxnZiM1AlVkIinh3IsKo+mSn+sw6AuILNsQOW6
	ZHeNfs4uLs7TErX+JR673lxOCoZt8bkWOmTjGM4KVwTJt10z/BPITFllnQPouBhsR1JgcLtVGbp5t
	59W6YAmEZesLKPNDTlIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHym-000000026gS-1ho2;
	Thu, 19 Dec 2024 14:58:20 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHyj-000000026g2-0cXU
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 14:58:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2093B40005;
	Thu, 19 Dec 2024 14:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734620293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mWYUstccGxYLPvPQO9w2QnpqTpWw5Kx8+nrdOLymIbs=;
	b=L/AEeElVt1WMFTe1n7q4hn/HltSDaf8rKXjDJN1RY7K1zwxRjpRMwvVz2dOkqArWvfA8aD
	hZNkF+XAjfda6t0xCCwqRG5XXZfR5hVHRhdi2n8guRdNaL6rFhdGUxnd64SWJQaTE79dHh
	BQ9UdlSPQqEn2kkF2Dic8MaDwpT/2H9ocou2Zb/ahGf9lk0PwS3b7Zck/bvmAAnjUn0pAy
	y9sky9tEDcDX4wa659WWlqrWPNVSp+hAuXYhIw7wzTCndCCCWf2BFd7qitDUBejk8kGgzu
	3gyEA6mgET7J6dXNlAtnyfOJENKnOLClmZY/vk3i+wypfPfvJYhivmF9Mg8qaA==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Date: Thu, 19 Dec 2024 15:58:10 +0100
Subject: [PATCH v2] mtd: rawnand: davinci: Reduce polling interval in
 NAND_OP_WAITRDY_INSTR
MIME-Version: 1.0
Message-Id: <20241219-patch-nand-poll-v2-1-cc80a1ee4e0f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAIE0ZGcC/3WNQQ6CMBBFr0Jm7RhmQmt05T0Mi1IGmQRb0hKiI
 dzdyt7le8l/f4MsSSXDrdogyapZYyjApwr86MJTUPvCwDU3xHTF2S1+xOBCj3OcJuyYzMVacbV
 jKKs5yaDvo/hoC4+al5g+x8FKP/u/tRIS2tqIGcgM3Lh7F+MyaTj7+IJ23/cvgeYp7LAAAAA=
X-Change-ID: 20241219-patch-nand-poll-b215766ea0a2
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Christopher Cordahi <christophercordahi@nanometrics.ca>
X-Mailer: b4 0.14.2
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_065817_335225_05CD81DD 
X-CRM114-Status: GOOD (  11.28  )
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

For each NAND_OP_WAITRDY_INSTR operation, the NANDFSR register is
polled only once every 100 us to check for the EMA_WAIT pin. This
isn't frequent enough and causes delays in NAND accesses.

Set the polling interval to 0s. It increases the page read speed
reported by flash_speed by ~40% (~30% on page writes).

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
Changes in v2:
- Fix SOB.
- Link to v1: https://lore.kernel.org/r/20241219-patch-nand-poll-v1-1-605e5f15f24a@bootlin.com
---
 drivers/mtd/nand/raw/davinci_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 1f8354acfb50b2f4d155cdfc03afcf2863539f66..b3fe6f62bb3bd6a51da891c604d38142055ab1d3 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -724,7 +724,7 @@ static int davinci_nand_exec_instr(struct davinci_nand_info *info,
 	case NAND_OP_WAITRDY_INSTR:
 		timeout_us = instr->ctx.waitrdy.timeout_ms * 1000;
 		ret = readl_relaxed_poll_timeout(info->base + NANDFSR_OFFSET,
-						 status, status & BIT(0), 100,
+						 status, status & BIT(0), 0,
 						 timeout_us);
 		if (ret)
 			return ret;

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241219-patch-nand-poll-b215766ea0a2

Best regards,
-- 
Bastien Curutchet <bastien.curutchet@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
