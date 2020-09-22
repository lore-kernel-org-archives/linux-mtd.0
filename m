Return-Path: <SRS0=loyI=C7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DEAC2D0E2
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 11:29:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0203E239D2
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 11:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cfABbG+P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0203E239D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=21hnzX6C+JnE+FCTd5fTYnj8mJhc+Y61iNo0B/E0zyY=; b=cfABbG+P+EPFLJZlJ6XOBq1KIk
	rX09AucakEmQPTVP3jY4pxNPWkjwMZYwX8ZISFyLu7HeEwbX1icvVD0dCJOF5GCm13dUKrZp5K3jA
	uKNXqx+nXMA01AUefoYPrhks8UlPhP8R0wp0N5gNzabsMIHu/R4gX8Gh598zu6qYMgCKIgSr03PGc
	pt3bkVO0GGwIr9B2Xwo6f5FDVeH6sArQNDDMgsuIyvyWh3gJDdl1pbYiVKYHs2tRBSkAYzfc2N3KF
	bfQh7HuIrIeTTOlGS3Uh/tsWSikupuwlRMna2ovQNl2UWXx79U8glAXFCm91bvelISYVs3GNOwjW5
	w19Orp6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKgTX-0005OH-BH; Tue, 22 Sep 2020 11:28:47 +0000
Received: from mail-m17613.qiye.163.com ([59.111.176.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKgTS-0005MC-Ug
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2020 11:28:45 +0000
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id 15BAC481928;
 Tue, 22 Sep 2020 19:28:28 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Bernard Zhao <bernard@vivo.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd/map: fix typoes for struct memcard
Date: Tue, 22 Sep 2020 04:28:02 -0700
Message-Id: <20200922112814.26761-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSUhCGUtNGU1OQhkdVkpNS0tMTE9KS0NJTkpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PAg6EDo4Kz8hGg5CC08WMUsC
 Mk8wCh1VSlVKTUtLTExPSktDTUhOVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSkJLTzcG
X-HM-Tid: 0a74b592741c93bakuws15bac481928
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_072843_361665_E423D241 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Change struct memcard`s element "removeable" -> "removable".

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/mtd/maps/vmu-flash.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 177bf134e189..d48ecbdb007a 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -40,7 +40,7 @@ struct memcard {
 	u32 blocklen;
 	u32 writecnt;
 	u32 readcnt;
-	u32 removeable;
+	u32 removable;
 	int partition;
 	int read;
 	unsigned char *blockread;
@@ -619,7 +619,7 @@ static int vmu_connect(struct maple_device *mdev)
 	card->blocklen = ((basic_flash_data >> 16 & 0xFF) + 1) << 5;
 	card->writecnt = basic_flash_data >> 12 & 0xF;
 	card->readcnt = basic_flash_data >> 8 & 0xF;
-	card->removeable = basic_flash_data >> 7 & 1;
+	card->removable = basic_flash_data >> 7 & 1;
 
 	card->partition = 0;
 
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
