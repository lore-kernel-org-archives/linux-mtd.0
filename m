Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C82C531DC
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2024 19:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/3bVLiUNWKeUQyV45xXqqNOKz7N9ElR238KUYH0b94c=; b=V7+lj/uutf/gu4
	rv7CY/ol4xCPcWLVX0deMOsZ6Id7mQYM1wNGewncY3OU0h1saYpVjhaASkGO6Jn8YKoL53NGfspvY
	hwMbPbeBO9Ipt6wmbUY+vnzJyAsMiTLxoYXtYRESDFluEs5PwVEbMJyUuIJW0nG+i9GPHsvHM2HWU
	qtmzv3D1nAtzBKnRZOu+fhDY2jZE1VD9s9PbxGDKCW8F/5UNzAftsRLjlQNjLIRy9A6xp9alSRe9p
	oPLOXe23PIZjJOiHN3Wau8GdfW6ZskX/qznCTyjWPCwOPT2TnmmSPsK6WOSV654XUYbY2VMUHrLtk
	x2ozagxwIAcmgGygBPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seK9T-000000087jV-1p0Y;
	Wed, 14 Aug 2024 19:59:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seK9R-000000087jH-3Y8x
	for linux-mtd@bombadil.infradead.org;
	Wed, 14 Aug 2024 19:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=2htqNeW12YiZCg0oFZHJYYAzv3at8noFM0U063pem/Q=; b=qBS5+BPFJokDCTQHBm/5lFCzUc
	1CSH2Ker5yGkPgyAy3/7pQv0aGGWzQU3iwq+Dpl6OU/wgOqM/Mcg4gkSG12mjMYHmww4DiLYIE/BE
	A5/3GeELMog1vmNNyIWezq2/HDUMWcM3le18ZDqzcK4yFJB3AmfVyh/YiMLSH281ZR95OSyl1d2Q+
	sJfzcB4PLM78rrfcbTQKRxCySgmUVqjZ13gZVeZkqcKx1gFzNHIiuiBs6yqCrs58SVldVpSWE1jVl
	5G0nzprf573B5k9XAOP1PTZAPYg9wtKl2/PsjCuyXva4gVJhHd6R6BMhQ5AgMhuNRD99cX/D0S4bf
	pWmiADRw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seK9Q-0000000130S-1pXG;
	Wed, 14 Aug 2024 19:59:20 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH 0/2] Finish converting jffs2 to folios
Date: Wed, 14 Aug 2024 20:59:11 +0100
Message-ID: <20240814195915.249871-1-willy@infradead.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
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

This patch series applies on top of fs-next.  I suggest it goes through
Christian's tree.  After applying these two patches, there are no more
references to 'struct page' in jffs2.  I obviously haven't tested it at
all beyond compilation.

Matthew Wilcox (Oracle) (2):
  jffs2: Convert jffs2_do_readpage_nolock to take a folio
  jffs2: Use a folio in jffs2_garbage_collect_dnode()

 fs/jffs2/file.c | 24 +++++++++++-------------
 fs/jffs2/gc.c   | 25 ++++++++++++-------------
 2 files changed, 23 insertions(+), 26 deletions(-)

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
