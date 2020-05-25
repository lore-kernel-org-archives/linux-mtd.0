Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07989C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:01:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF5F9206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:01:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sEoCBE0Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF5F9206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXDsjvp6a0hG6hI+dp/trg90dZcPb/9vUZfIYXXHZso=; b=sEoCBE0Qo3RJSu
	ufU/zu/c2rzNP+qGv+vBdgJJDiu7+1lapGHjRTJZuqgRT5aKzKxmLUU+OHRvi0dzqauHBs1ItRJuR
	V0EQnVglY3l9O50dgCgCWovnUua4NMT2fmSa46FZlAfJvpe2Fj0rm18fkXLbwCKvrOOVMBZo+AiPn
	F0Mzr6ZDZh9VXMlhWbldAi7U8KOH+/MrTgXaBiTLI2SoXU6lPsOyYDxPxwEPONqWCjZLuNyH2Eevt
	2EVOty4cPFulxHKNvUJtUOvOeitctNyBFuG3jGgxyQDwhtPLyQWCWiCEJ0R4D8TJ2E7v//qDCW7Lh
	2+HXvbWUGS1XGkvwqpsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd8zB-00018i-Bi; Mon, 25 May 2020 09:01:29 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8wx-0004Yg-2t
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 08:59:12 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id BF81224000B;
 Mon, 25 May 2020 08:59:07 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 08/17] mtd: rawnand: nandsim: Free partition names on error
 in ns_init()
Date: Mon, 25 May 2020 10:58:42 +0200
Message-Id: <20200525085851.17682-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525085851.17682-1-miquel.raynal@bootlin.com>
References: <20200525085851.17682-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_015911_281014_C913589C 
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The ns_init() function shall free the partition names allocated by
ns_get_partition_name() on error.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nandsim.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index da6d919ed185..53889bce81f1 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -722,12 +722,14 @@ static int __init ns_init(struct mtd_info *mtd)
 	if (remains) {
 		if (parts_num + 1 > ARRAY_SIZE(ns->partitions)) {
 			NS_ERR("too many partitions.\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_partition_names;
 		}
 		ns->partitions[i].name = ns_get_partition_name(i);
 		if (!ns->partitions[i].name) {
 			NS_ERR("unable to allocate memory.\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto free_partition_names;
 		}
 		ns->partitions[i].offset = next_offset;
 		ns->partitions[i].size   = remains;
@@ -756,18 +758,25 @@ static int __init ns_init(struct mtd_info *mtd)
 
 	ret = ns_alloc_device(ns);
 	if (ret)
-		return ret;
+		goto free_partition_names;
 
 	/* Allocate / initialize the internal buffer */
 	ns->buf.byte = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
 	if (!ns->buf.byte) {
 		NS_ERR("init_nandsim: unable to allocate %u bytes for the internal buffer\n",
 			ns->geom.pgszoob);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto free_partition_names;
 	}
 	memset(ns->buf.byte, 0xFF, ns->geom.pgszoob);
 
 	return 0;
+
+free_partition_names:
+	for (i = 0; i < ARRAY_SIZE(ns->partitions); ++i)
+		kfree(ns->partitions[i].name);
+
+	return ret;
 }
 
 /*
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
