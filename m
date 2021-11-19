Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E492C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 07:40:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BA6861B3E
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 07:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BA6861B3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TD+6bRIwl1qU8a0C9U+tKQpx00r5dAfhI0GLG2DOuq8=; b=CGPMclgughmNkV
	IIlgQFmUiCHLeuB/fmD5osrr0cDAUIfalLrLkEH6dgxWm4dRmyD8ZUIlOk1kPoAbB0eiG8kzwxkKY
	W8jmrG2uE7YNO7jt0fRAcaYDOaVHxJDhztiIW805C0s1G8kVSpmMQ4/9yaj2stiNcHH5V9yx8eE6r
	zT5j1CKGQqWXFcVNCKXPd/nKGXMSleYXLOPMpGtFlVe5XyhPk1wvJ9xxWy+2hxM9gMR5h+umumgqd
	fpUogWUZkGVjNSgH7Fp0wcdqgn6r03F8ePF1z2t6JfhxhvjdJ0W/TxtV45l60jtQBEcs15XfS4lX7
	mfUPVXoRMmE6+DOHR73Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnyUV-009cxz-NA; Fri, 19 Nov 2021 07:39:23 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnyUR-009cwv-Up
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 07:39:21 +0000
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPA id 605EC20008;
 Fri, 19 Nov 2021 07:39:13 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 0/4] mtd: rawnand: Fixes nand infra delay setting and FSMC
 nand controller
Date: Fri, 19 Nov 2021 08:39:05 +0100
Message-Id: <20211119073909.1492538-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_233920_173134_4C221FB5 
X-CRM114-Status: UNSURE (   7.75  )
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

Hi,

This patch series is mainly related to FSMC nand controller fixes except
for the two first patches which fix some issues in nand base.

Details are given in each patches.

Related to the v1 series:
- the patch related to 8bit accesses has been removed as it was
  not needed (I misunderstood 8bit accesses meaning).
- A new patch is introduced related to nand_choose_best_timings()
  issue I discovered during this v2 testing.

Best regards,
Herve Codina

Herve Codina (4):
  mtd: rawnand: Fix nand_erase_op delay
  mtd: rawnand: Fix nand_choose_best_timings() on unsupported interface
  mtd: rawnand: fsmc: Take instruction delay into account
  mtd: rawnand: fsmc: Fix timing computation

 drivers/mtd/nand/raw/fsmc_nand.c | 36 +++++++++++++++++++++++++-------
 drivers/mtd/nand/raw/nand_base.c |  6 +++---
 2 files changed, 31 insertions(+), 11 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
