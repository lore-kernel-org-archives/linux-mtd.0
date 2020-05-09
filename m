Return-Path: <SRS0=nfTR=6X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7453C28CBC
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 19:18:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A91BB20644
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 19:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JgIJfJD7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A91BB20644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HO3tE3KUIOzD9tdZ8IHhvzrmRvjQX47RvHLPshWhCUg=; b=JgIJfJD7vdhuK2
	XDFi8Obby6iMNT7gpknpxGShvmKYsKebep3TK/bNmkEpUF+4i3ADSnk3H5XPg+ZNO1EypceAS1/Ru
	2WN9BQMstc5MVhRX4V+XbjB+wfseL0/e392MaYCOusVSD8+yzQTvBk2KbuT9mzRmgIODULfJwuOEh
	AnBDFwf9SmWbzaohOq9hWY5P2Fl16GgMFr5l57ov7uYQQffYJWHJbDjbHCYowqUYleQJqsqgoLh5k
	bcmLICZdGhr+STxW5JCZ/KF1wAVn69z5k7NvZvBibLlDGmof7J+BUB6j5ZS/z5lQjyOmtdKb0q0Y3
	ftkHMZMXBtVr24UC6xnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXUzi-0007kF-Vv; Sat, 09 May 2020 19:18:42 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXUvx-0001wR-CD
 for linux-mtd@lists.infradead.org; Sat, 09 May 2020 19:14:50 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id EFB72100009;
 Sat,  9 May 2020 19:14:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 16/17] mtd: rawnand: nandsim: Rename a label in
 ns_init_module()
Date: Sat,  9 May 2020 21:14:29 +0200
Message-Id: <20200509191431.15862-17-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509191431.15862-1-miquel.raynal@bootlin.com>
References: <20200509191431.15862-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_121449_563705_04A99E4C 
X-CRM114-Status: GOOD (  10.94  )
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
Cc: dedekind@infradead.org, Boris Brezillon <boris.brezillon@collabora.com>,
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
index 26d23ab5b794..fa84f373b4e9 100644
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
 		kfree(list_entry(pos, struct weak_block, list));
 		list_del(pos);
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
