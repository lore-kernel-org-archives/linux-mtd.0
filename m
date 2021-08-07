Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C85FC4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 21:46:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96DC360F14
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 21:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96DC360F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Kbf5MAHvvb4PCSQRg9idiuW68irW4CNgQoN9FO7ss8=; b=fB/gmWar+V/NHy
	rr68HOb/dfK76Q+0x6AeGGN1tIfDHUJL7bBOOqosiVXIanzKB4Iceg1OvoppthRSdckP/MFx7qyFj
	WQnF7fSlZQCp6dY7vui7LvDfRKLUKP2qkAja4owc3dratlqGwbCJSX2XvTJl2um7Y4lidSZVgrTIy
	YcO02ob8CafoLCPiHdNJaMch+HAbnmFPMwd0d+k/PfrkvwuPRR+uw8nj+mq8W6qNX2ZjcFlxDFyhc
	8eMWvKsunYaBi5cb4nfBXVyPzjFLatSLSOVDtypTOJF9HK6AJb+CFTbds9Pi3B0RvKYNT645sfHsd
	P71S6r1wXNhGQardk/rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCU8x-00FBRF-Cm; Sat, 07 Aug 2021 21:46:11 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCU8U-00FBLS-M3
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 21:45:44 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 7B40EC6AA2; Sat,  7 Aug 2021 22:45:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1628372739; bh=Gv+0MpWO0mMlGAAP7l1ivWhAuigWD7h+69uax9Owqq0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=b2qknQf5ozy6SsHqrhzKH9FDcrG+1IPdPqFNXsRYT3qxBIusiHOu5zc5GwG+hAUuX
 rbrbFU8Wdi2jvGN17L8N3tWTGZc6x5prvbqEsk+JEmNALs6ULPXWf2ZTAzwVopb64B
 U/UZ1mQlKUAXaulY/xqORV6vJ+MMpRcRhZl/LlWpwlz6Skh+xhV9WpMG9ZyV9yykYR
 ZPu/quCEwQ2rlup1xm987awmgCjUv9u9EKey0XGCezY3Y6UMpOQwb+yHRiKfNSnQXC
 6n8kTiVBwiPOCcPsBASIvuyUH2BT9dOhbVofapSwQcHZuOND1WL5fnRSlBTkvrjbnB
 Vj6FscAZQef6Q==
From: Sean Young <sean@mess.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 4/5] mtd: rfd_ftl: fix use-after-free
Date: Sat,  7 Aug 2021 22:45:37 +0100
Message-Id: <20210807214538.14484-5-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210807214538.14484-1-sean@mess.org>
References: <20210807214538.14484-1-sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_144542_939649_B72016EA 
X-CRM114-Status: UNSURE (   9.42  )
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

del_mtd_blktrans_dev() will kfree part, so after this call both part and
dev point to freed memory. Move the call to avoid use-after-free.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/mtd/rfd_ftl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 7f5f6d247cae..52be9f1fa9a2 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -800,10 +800,10 @@ static void rfd_ftl_remove_dev(struct mtd_blktrans_dev *dev)
 			part->mbd.mtd->name, i, part->blocks[i].erases);
 	}
 
-	del_mtd_blktrans_dev(dev);
 	vfree(part->sector_map);
 	kfree(part->header_cache);
 	kfree(part->blocks);
+	del_mtd_blktrans_dev(dev);
 }
 
 static struct mtd_blktrans_ops rfd_ftl_tr = {
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
