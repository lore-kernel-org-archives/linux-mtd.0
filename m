Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9502C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 15:04:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8947A61159
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 15:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8947A61159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wQSmw3zuq4sFrhNyDTg9yWqpd+bYCDvU52/296JNZuc=; b=obL3ezNNAZ+GKg
	8gD+ASSTjb1pqu8QVrk6cBBz45IxGQ2R8gfBL25LBSvAjZybIwNSKxj9RSGyUUQR3Fq35bCRPdXXd
	OFYYH25BdjB20NFIAA08c3/ek6AmF6x+8JtEpqf5Ja9h7ronrv+NMfeRKN+0uVE6ZxXAYjGUADuuD
	tUfQMJiN3ScNv4/DzemMO/g2FU/vJXi+4btQdZ/wsCvR2R2TV1hq7QYMB2jxyGuX/EU2hyuf+TthL
	dZpdHAjRTuJ1NRmi9UA8lBYraqFKny0Lp+6+HDamTnrUz71TRPJxRgeNSuiz9zEkdbC755f90U5py
	1IhUt0MgGkR4+zenN3TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo5QG-00Ammq-9I; Fri, 19 Nov 2021 15:03:28 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo5QC-00Amku-UP
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 15:03:26 +0000
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPA id D36DE1C000D;
 Fri, 19 Nov 2021 15:03:19 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 0/4] mtd: rawnand: Fixes nand infra delay setting and FSMC
 nand controller
Date: Fri, 19 Nov 2021 16:03:12 +0100
Message-Id: <20211119150316.43080-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_070325_138555_35C0BFCD 
X-CRM114-Status: UNSURE (   7.89  )
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
  issue I discovered during the v2.

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
