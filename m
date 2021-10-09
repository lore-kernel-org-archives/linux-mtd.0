Return-Path: <SRS0=mnIE=O5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7041BC433FE
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 18:50:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2251760F9C
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 18:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2251760F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JWXXQu3C2K4JAQhXjYhEjTQOkLZ3aSVT29w2n/OlTBU=; b=ZxBm7RVmgXY4K5
	SEwv9YmdA5aSZo29Lx7Jq/QCnqx/i1jaDQ8xFIiBxX+NYHgVbsYzojWMwUufWpbbOM0ZbOfaJofZw
	ZzZW3KSOh+jE0/+WK8M+Ffc9KAVnLjyluFr9fmO7PrX3yoLCxzx/tE0MVB7yHZuvlfLvEZpHDXyMT
	w8Fa/ojycO2oc2wFHYP8jvRRxVLabAZ16JqgeD17aA3Hx7EEOiZgUKlDz/THcbbChOXrJMJQE/sTy
	RpdpiAU+lUavtAsuzSbHVOg9bfspfUFzf3kBQ8PyiMidXw0sorzp8SaxSr7qSNo6R7g9Pp1W72qg2
	4kMguINqDyM8GCfBrCgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZHQD-005z3R-2k; Sat, 09 Oct 2021 18:50:13 +0000
Received: from aposti.net ([89.234.176.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZHQA-005z2n-99
 for linux-mtd@lists.infradead.org; Sat, 09 Oct 2021 18:50:11 +0000
From: Paul Cercueil <paul@crapouillou.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: list@opendingux.net, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 0/3] mtd: Ingenic NAND fix for JZ4740
Date: Sat,  9 Oct 2021 20:49:49 +0200
Message-Id: <20211009184952.24591-1-paul@crapouillou.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_115010_520155_EEFDB943 
X-CRM114-Status: GOOD (  11.75  )
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

Looks like NAND support has been broken on the JZ4740 SoC for a while;
it looks like it comes from the fact that the "hw_oob_first" mechanism
was dropped from the NAND core and moved to the Davinci driver.

It turns out the JZ4740 SoC needs it too; I didn't notice it when
writing the new ingenic-nand driver (to replace the old jz4740-nand
driver) most likely because my Device Tree had the "nand-ecc-mode" set
to "hw_oob_first".

I am not very sure about patch [1/3]; to me the original code does not
make sense, and it didn't work out-of-the-box on the JZ4740 without it.
By applying patch [1/3] the function nand_read_page_hwecc_oob_first()
can be reused for the JZ4740 SoC as well. But I did not test patch [1/3]
on Davinci.

Cheers,
-Paul

Paul Cercueil (3):
  mtd: rawnand/davinci: Don't calculate ECC when reading page
  mtd: rawnand: Export nand_read_page_hwecc_oob_first()
  mtd: rawnand/ingenic: JZ4740 needs 'oob_first' read page function

 drivers/mtd/nand/raw/davinci_nand.c           | 73 +------------------
 .../mtd/nand/raw/ingenic/ingenic_nand_drv.c   |  5 ++
 drivers/mtd/nand/raw/nand_base.c              | 69 ++++++++++++++++++
 include/linux/mtd/rawnand.h                   |  2 +
 4 files changed, 77 insertions(+), 72 deletions(-)

-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
