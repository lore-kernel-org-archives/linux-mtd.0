Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68677C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:04:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A0AD206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:04:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bmAO/1hI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A0AD206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NT2hSGFZZeVXxnvx9CGxeiw+7bO7FuukRYU0vKanFbY=; b=bmAO/1hI8N1Z5b
	vsJ9ZxFVnt3mjuI5Ljd2pYFvWWKj65sO56678Byvp73H7MygFhclkKk+gucVATFUfdILjdi+kkV3r
	ysXYHIDhVqBkMKG+HUtGGRiJugAM6p6NjsNym62vL/RRNM4mVe+n/32DgzvFSqk8rvMGVh+FK3UqH
	NmOY+iyJ5eVVmB2BzMnOtOJf+rvibAPQPSNVgi9YOJVgGyYXX1mqXkd5QpQeHVVHdnMbI3XgZaAcn
	HfnF0bV4LDNShpSQ878P5e2FSRhFuD/rJFgJ8EL1UlL0/AL/XoxIOUgiT0YXCNQvQFs37OdcXn0A7
	j1PKmk9mxtC9rdQtXiRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd91V-0003A7-5s; Mon, 25 May 2020 09:03:53 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8x5-0004gV-2v
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 08:59:20 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4B427240006;
 Mon, 25 May 2020 08:59:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 16/17] mtd: rawnand: nandsim: Rename a label in
 ns_init_module()
Date: Mon, 25 May 2020 10:58:50 +0200
Message-Id: <20200525085851.17682-17-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525085851.17682-1-miquel.raynal@bootlin.com>
References: <20200525085851.17682-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_015919_336374_1D438855 
X-CRM114-Status: GOOD (  11.96  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Rename the "error" label to gave it a meaning.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nandsim.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 4492b9a9962e..7076acfbe0f4 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2310,7 +2310,7 @@ static int __init ns_init_module(void)
 	default:
 		NS_ERR("bbt has to be 0..2\n");
 		ret = -EINVAL;
-		goto error;
+		goto free_ns_struct;
 	}
 	/*
 	 * Perform minimum nandsim structure initialization to handle
@@ -2337,7 +2337,7 @@ static int __init ns_init_module(void)
 
 	ret = ns_parse_weakblocks();
 	if (ret)
-		goto error;
+		goto free_ns_struct;
 
 	ret = ns_parse_weakpages();
 	if (ret)
@@ -2428,7 +2428,7 @@ static int __init ns_init_module(void)
 		list_del(pos);
 		kfree(list_entry(pos, struct weak_block, list));
 	}
-error:
+free_ns_struct:
 	kfree(ns);
 
 	return ret;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
