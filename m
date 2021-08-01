Return-Path: <SRS0=6coP=MY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CE9C4338F
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Aug 2021 23:46:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EE5160F90
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Aug 2021 23:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EE5160F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ug0vZfOVRCvw7TY8DGQ9KZdKDP5I4WmgHI99B1gCB1s=; b=2KGfSlsrVfGoTJ
	a0I5cwqSFG6/ZBl6NVAm3VYD0ElWPyOvBu5KqNuEVDGN3rIUzcu41MDBOCCamZmEbcIG26UKbl6YE
	sCLwnyoMxsREfW/ewi91ADJXbOnnhgMTma9bdqTLwtmBWFiUUN2+fHZmQpq4WllApmakd1xrXZGg+
	y0TplkyJ+o8rsccKpprVzgBqHOgCs/l7AwPxVaGsSI8x1qAAuYOk0fm4hobkk6FO56HJ3OWIszv76
	NrkION36WyQ3dUKAK7jdwZciPVXjApash6WckCwi+BFEb6fYoJCWJdQBr5v49i4WeqwodSpNNPNUO
	weHhhQPvd2uG809JnjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAL9U-00EOkS-ES; Sun, 01 Aug 2021 23:45:52 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAL95-00EOfH-5H
 for linux-mtd@lists.infradead.org; Sun, 01 Aug 2021 23:45:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 9AD2E1F424CC
From: Ezequiel Garcia <ezequiel@collabora.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 2/3] mtdblock: Add comment about UBI block devices
Date: Sun,  1 Aug 2021 20:45:04 -0300
Message-Id: <20210801234509.18774-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210801234509.18774-1-ezequiel@collabora.com>
References: <20210801234509.18774-1-ezequiel@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_164527_377616_3C458A58 
X-CRM114-Status: UNSURE (   9.60  )
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

There is a surprisingly large number of tutorials
that suggest using mtdblock to mount SquashFS filesystems
on flash devices, including NAND devices.

Given this approach is suboptimal than using UBI, and given
the UBI block device layer was introduced many years ago
specifically with this use case in mind, add a small
comment inviting users and developers to consider UBI block.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/mtd/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 32bed6c63863..91cdbbd44317 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -151,6 +151,9 @@ config MTD_BLOCK_RO
 	  You do not need this option for use with the DiskOnChip devices. For
 	  those, enable NFTL support (CONFIG_NFTL) instead.
 
+comment "Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK."
+	depends on MTD_BLOCK || MTD_BLOCK_RO
+
 config FTL
 	tristate "FTL (Flash Translation Layer) support"
 	depends on BLOCK
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
