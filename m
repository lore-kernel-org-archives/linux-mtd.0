Return-Path: <SRS0=+Ogn=6P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08890C47253
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 10:08:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEB0A2071C
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 10:08:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tHqzKYeU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEB0A2071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XftwRo6igSAFV42t7YvsM2bXmO01ccrTwWcq1r2TxVU=; b=tHqzKYeUSGdK0t
	ZwZaWN6Sc9OAssT7FwSvKxUZg5VkICJy7/CEizNRw/5dTiUvGKQITdetZBS96nw/8x/LACrPaDLck
	FpVt6A27n4mObC+GEj4ldadpWRuO7UDWg/Pm4XD9IesRSqFGPe2NKojDK0wI9r0bXgKzaOg5lSKgN
	4Am9wz5CTXj6qHnBj9t5v70W6gvGERw/0Zxbj1ZoPkIyfEM5UGBNfeKyqapHzmOIWylJwciXWjP3O
	Fgl/zaZUFsszU0PjpnQ+N7x2fbS+QEBgf6N1U/0qgktnZlH6I/m8muQE2pIZ8HMSdO9IbSrnkmJWa
	JZLGliWiR0k/Oymz3EwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUSa8-00007K-R6; Fri, 01 May 2020 10:07:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUSZz-0008PZ-CU
 for linux-mtd@lists.infradead.org; Fri, 01 May 2020 10:07:36 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6D4B62A2DC5;
 Fri,  1 May 2020 11:07:33 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/5] mtd: rawnand: davinci: Convert to exec_op()
Date: Fri,  1 May 2020 12:07:24 +0200
Message-Id: <20200501100729.1237040-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_030735_557377_1B870A7F 
X-CRM114-Status: UNSURE (   9.83  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

A bit of context to explain the motivation behind those conversions
I've been sending for the last couple of weeks. The raw NAND subsystem
carries a lot of history which makes any rework not only painful, but
also subject to regressions which we only detect when someone dares to
update its kernel on one of those ancient HW. While carrying drivers
for old HW is not a problem per se, carrying ancient and unmaintained
drivers that are not converted to new APIs is a maintenance burden,
hence this massive conversion attempt I'm conducting here.

So here is a series converting the Davinci NAND controller driver to
exec_op(), plus a bunch of minor improvements done along the way.

Regards,

Boris

Boris Brezillon (5):
  mtd: rawnand: davinci: Inherit from nand_controller
  mtd: rawnand: davinci: Stop using nand_chip.legacy.IO_ADDR_{R,W}
  mtd: rawnand: davinci: Implement exec_op()
  mtd: rawnand: davinci: Get rid of the legacy interface implementation
  mtd: rawnand: davinci: Change the {read,write}_buf prototypes

 drivers/mtd/nand/raw/davinci_nand.c | 161 +++++++++++++++-------------
 1 file changed, 85 insertions(+), 76 deletions(-)

-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
