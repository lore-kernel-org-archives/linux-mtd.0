Return-Path: <SRS0=6coP=MY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20666C432BE
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Aug 2021 23:47:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC66E60F90
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Aug 2021 23:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC66E60F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3w279sJJqrFO1KbopvBM+NuDIcV4yQk6k6wh+bX1ZAA=; b=DOjst5fJQwRRLi
	+ckF4tmcONETjhnVcljueDdy3rr4zLFXsctscKacJzM2wk2Bl3jnkfKxI8c4OJ8Yfhd5cSv3B5qjc
	8O7LztMj1g2d9GGrnB6PwPIU+SYo0JPqrIiclbhh77RAhBOmt6x0vODY0H15jNhmnPIRb9BL5lZek
	L13XhyhQI8qIe1sxLRIqbHrJsIMMY/W9RHRGUWwbZvUJAHtJ/0fDFpxhj5zzBJYUCSWO+f/41/kiI
	1GY5H4g9eRMmSiPypbf4RWVsNOc0EP8SwOFm6vghTUqWc791uAKBazNwfEO+JNyQww7JARpRWnRG6
	EIDBPomzB74JenwHFjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mALAL-00EP0G-PW; Sun, 01 Aug 2021 23:46:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAL9F-00EOhC-Ub
 for linux-mtd@lists.infradead.org; Sun, 01 Aug 2021 23:45:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id EC1771F424CF
From: Ezequiel Garcia <ezequiel@collabora.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 1/3] mtdblock: Update old JFFS2 mention in Kconfig
Date: Sun,  1 Aug 2021 20:45:07 -0300
Message-Id: <20210801234509.18774-6-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210801234509.18774-1-ezequiel@collabora.com>
References: <20210801234509.18774-1-ezequiel@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_164538_150073_F13567DB 
X-CRM114-Status: GOOD (  12.80  )
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

JFFS2 can be mounted without 'mtdblock' since
a really, really long time. Some git-log
archaeology shows that in 2006 it was possible
to use 'root=' to mount a JFFS2 rootfs:

  commit e9482b4374e2596e6f3f1ab30c4ea469f4ac6311
  Author: Joern Engel <joern@wh.fh-wedel.de>
  Date:   Tue May 30 14:25:46 2006 +0200

      [MTD] Allow alternate JFFS2 mount variant for root filesystem.

      With this patch, "root=mtd3" and "root=mtd:foo" work for a JFFS2 rootfs.

However, there are still plenty of tutorials that mention
mtdblock, so users are still taking this route. Update the Kconfig
to reflect this is no longer needed.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/mtd/Kconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 79a8ff542883..32bed6c63863 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -127,10 +127,9 @@ config MTD_BLOCK
 	  on RAM chips in this manner. This block device is a user of MTD
 	  devices performing that function.
 
-	  At the moment, it is also required for the Journalling Flash File
-	  System(s) to obtain a handle on the MTD device when it's mounted
-	  (although JFFS and JFFS2 don't actually use any of the functionality
-	  of the mtdblock device).
+	  Note that mounting a JFFS2 filesystem doesn't require using mtdblock.
+	  It's possible to mount a rootfs using the MTD device on the "root="
+	  bootargs as "root=mtd2" or "root=mtd:name_of_device".
 
 	  Later, it may be extended to perform read/erase/modify/write cycles
 	  on flash chips to emulate a smaller block size. Needless to say,
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
