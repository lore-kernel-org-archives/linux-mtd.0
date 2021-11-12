Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15E7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 14:51:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BADF761075
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 14:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BADF761075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vuOZKTZ9hiEQ3GAOJqrHT91NXykBsfp11XHntlMaIO4=; b=j9rM9LLrHSeUM8
	qA7JzJk6r4t18yyb5EJGh5urDfy1+bJVeiZ14IR5jYTfbSJdmGRE6TppG+soySV5cAtb9zLy+dXnO
	OXlvwa5RWX6p1x3TSL+eBNkTY6ZjJ8QG2cI7cXfkKYf/cg7zOPhzxuaQOMzchdFwwPEKW/sPP8753
	3O3JA9TKoy9J5dzn0ykyk85YwAODhRZuNzpqaoxhR8wV+IQ7/xbdldbfbWAsTJj+VMAVP9DEEllSe
	UacOlUGvASi3HcGzFjN+lN3bsVA3+jWybhpz0Y3dkzxwY74ONfA/RTWTTjkT9dgPlEYpfIObSXczi
	TKrBuojSBFOxKVC/8NDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlXtK-00AuVJ-6D; Fri, 12 Nov 2021 14:50:58 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlXi6-00AqAL-1F
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 14:39:23 +0000
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPA id 9D3734000A;
 Fri, 12 Nov 2021 14:39:16 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 0/4] mtd: rawnand: Fixes nand infra delay setting and FSMC
 nand controller
Date: Fri, 12 Nov 2021 15:38:51 +0100
Message-Id: <20211112143855.2678989-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_063922_298410_CF4ED693 
X-CRM114-Status: UNSURE (   6.20  )
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
for the first patch which fixes an operation delay setting in nand base.

Details are given in each patches.

Best regards,
Herve Codina

Herve Codina (4):
  mtd: rawnand: Fix nand_erase_op delay
  mtd: rawnand: fsmc: Force to use 8 bits access when expected
  mtd: rawnand: fsmc: Take instruction delay into account
  mtd: rawnand: fsmc: Fix timing computation

 drivers/mtd/nand/raw/fsmc_nand.c | 46 ++++++++++++++++++++++----------
 drivers/mtd/nand/raw/nand_base.c |  2 +-
 2 files changed, 33 insertions(+), 15 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
