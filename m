Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FA8C54FD0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:23:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2591B20661
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:23:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bq2iS0uk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2591B20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=95Ipk0zEAqqKcLvasOlnwshZq8IKixgXFosTgFTmh9I=; b=bq2iS0uksIy1Yc
	LcSrZ29Fv67Z30GO/U6RkHIlLxumlA8a4L8Le4aaDmZFCHsWf56/SPAVJUaQnl638V7oKSJzxeQid
	J2iWzNKxbHhxVrUJDy1veVGGZKj7+zQxgtrbur6V7+8xX8JiNWjeR6626yZhKnWJe2mKaRbT/BWAk
	MEsz/mwG9HGsiIWK+YOVJgX2QIeUKRJwdipzwYQfkHXhT8cce2Keqtb6lZjnPyQDLk/YisgFvfDBT
	pUPU3bO4ApMnaYETgnlE9tK3CCe4TS9QER59LjCVs5SlEdWrjZFnDm/i7oYOlu5myIfjwvFl262q4
	fFOcpr0f0Q17y5cYoYZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSz2t-0000E3-OX; Mon, 27 Apr 2020 08:23:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSz0G-00061U-IH
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 08:20:38 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B8D6C2A08B4;
 Mon, 27 Apr 2020 09:20:31 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 00/17] mtd: rawnand: cafe: Convert to exec_op() (and more)
Date: Mon, 27 Apr 2020 10:20:10 +0200
Message-Id: <20200427082028.394719-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_012036_801065_7C76DD3A 
X-CRM114-Status: GOOD (  11.52  )
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

So here it is, a series converting the CAFE NAND controller driver to
exec_op(), plus a bunch of minor improvements done along the way.
I hope I'll find someone to test those changes, but if there's no one
still owning OLPC HW or no interest in keeping it supported in recent
kernel versions, we should definitely consider removing the driver
instead.

Regards,

Boris

Boris Brezillon (17):
  mtd: rawnand: cafe: Get rid of an inaccurate kernel doc header
  mtd: rawnand: cafe: Rename cafe_nand_write_page_lowlevel()
  mtd: rawnand: cafe: Use a correct ECC mode and pass the ECC alg
  mtd: rawnand: cafe: Include linux/io.h instead of asm/io.h
  mtd: rawnand: cafe: Demistify register fields
  mtd: rawnand: cafe: Factor out the controller initialization logic
  mtd: rawnand: cafe: Get rid of the debug module param
  mtd: rawnand: cafe: Use devm_kzalloc and devm_request_irq()
  mtd: rawnand: cafe: Get rid of a useless label
  mtd: rawnand: cafe: Explicitly inherit from nand_controller
  mtd: rawnand: cafe: Don't leave ECC enabled in the write path
  mtd: rawnand: cafe: Don't split things when reading/writing a page
  mtd: rawnand: cafe: Add exec_op() support
  mtd: rawnand: cafe: Get rid of the legacy interface implementation
  mtd: rawnand: cafe: Adjust the cafe_{read,write}_buf() prototypes
  mtd: rawnand: cafe: Handle non-32bit aligned reads/writes
  mtd: rawnand: cafe: s/uint{8,16,32}_t/u{8,16,32}/

 drivers/mtd/nand/raw/cafe_nand.c | 805 ++++++++++++++++---------------
 1 file changed, 423 insertions(+), 382 deletions(-)

-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
