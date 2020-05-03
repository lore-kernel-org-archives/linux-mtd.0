Return-Path: <SRS0=EGP2=6R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B844C28CBC
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 11:40:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D9E205ED
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 11:40:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eIZfZ+Ms"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10D9E205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ey8e1FW/I6oYXsYMd7cMfEsXELUz/i/y+Cdq+4fAql4=; b=eIZfZ+Ms6EU/wY
	G66mM3xQEU/94PdT9bw0asa6NFkSvoTeLYKJhy1vyrc/a8iFefD2D9YDTEEWYHEwpmVl/JeYHlPtH
	Lu305Y6KtWu8eOU9thx9Y2uhQTtM3+Qnmt/Kq5W5Yp3I/7QI/UFgmH+AHbhZvtWJVqq3DAgIOpbP0
	N5aKaJCRg1pPXbS5Uk+VbtiU6R2fJ4l/c5CzrI3dJ9rschdf19UsQHxjaka3e9DzFbCMqJlxlUFLF
	MR2eAX/F1jyJHtJJysKtGiFi/fZO3PLzj73OYW98FMBffddSlhYT1HjLXs2zR4xSXvN1WEigjr8Hc
	j6744Z4PZ1Vmc29krX2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVCz8-0003I6-QO; Sun, 03 May 2020 11:40:38 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVCz5-0003Gv-Rw
 for linux-mtd@lists.infradead.org; Sun, 03 May 2020 11:40:37 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AEC71FF805;
 Sun,  3 May 2020 11:40:30 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 0/3] Fix proposal for the Micron shallow erase issue
Date: Sun,  3 May 2020 13:40:26 +0200
Message-Id: <20200503114029.30257-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_044036_040403_4E915BC3 
X-CRM114-Status: UNSURE (   9.18  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Zoltan Szubbocsev <zszubbocsev@micron.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, tglx@linutronix.de,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

After a first proposal by Thomas Gleixner and then another proposal by
Bean Huo (Micron), this is an attempt to mainline the fix for Micron's
"shallow erase" issue. IMHO this is a "pretty way", not so invasive,
with a limited performance penalty.

It has only be *compile-tested* and this is just to know if the
approach is fine or not, then I will optimize, maybe rewrite a bit and
forcibly (ask to) test it.

Changes in v2 (v1 was an RFC):
* Fixed the written pattern: should have been 0x00 instead of 0xFF.
* Removed files that I added in my commit by mistake.
* Reworded a little bit the comment about writing only odd pages.
* I am still waiting for Bean to comment of the need to write main
  area vs OOB and also the need to write pages starting from 0 or
  starting from the middle of the bloc. Anyway if I do not get more
  information, and people agree (or even test it), I will merge this
  set.

Miquel Raynal (3):
  mtd: rawnand: Add the nand_chip->erase hook
  mtd: rawnand: Add the nand_chip->write_oob hook
  mtd: rawnand: micron: Address the shallow erase issue

 drivers/mtd/nand/raw/internals.h   |   2 +
 drivers/mtd/nand/raw/nand_base.c   |  14 +++-
 drivers/mtd/nand/raw/nand_micron.c | 121 +++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h        |   6 ++
 4 files changed, 142 insertions(+), 1 deletion(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
