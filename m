Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DC1C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:01:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 137502071A
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:01:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KGqTlFDk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 137502071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7vCN2WLh0G2Qa/+0QiPqmb0bYDjUmgrrz8UJ3YqY2U=; b=KGqTlFDk8wDP2v
	0OskBW18GV/R17sB//uuzwDFzYHyIqBlgUDP+6n46BC9RlGYEJV5OYTMa3k4AadZYWwjeD2za3PK0
	cHth9YhmMQGEcGlIdFwEZ6vdeHFixH7M5LDjZEknfLxQqFnb+pywP0Sy5AkGtqSfp0F+AJkbIKwSC
	MeAwYJhBKKLGcNMEvx95xiMMtWsXTH7QrEvybHRmm5RBL16Imkl1cY3Kv6nNX8gpO2JM9AkxfBUSC
	MvjnYETv5aH2S8QxlLu9RrSUDYsuqdorz9E4hB48LliywX8kxjgJ2fSuJWqp4DvHdlGopEaAm7Nij
	CQwpYYJE9pGSbyxY5hfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd8zR-0001NY-Tf; Mon, 25 May 2020 09:01:45 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8wv-0004Wy-9H
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 08:59:11 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id D600D240009;
 Mon, 25 May 2020 08:59:06 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 07/17] mtd: rawnand: nandsim: Fix the two ns_alloc_device()
 error paths
Date: Mon, 25 May 2020 10:58:41 +0200
Message-Id: <20200525085851.17682-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525085851.17682-1-miquel.raynal@bootlin.com>
References: <20200525085851.17682-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_015909_484900_4C5697D3 
X-CRM114-Status: GOOD (  11.06  )
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

The ns_alloc_device() helper has actually two distinct path. Handle
errors in both of them.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nandsim.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index a439949945f7..da6d919ed185 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -543,12 +543,12 @@ static int __init ns_alloc_device(struct nandsim *ns)
 		if (!(cfile->f_mode & FMODE_CAN_READ)) {
 			NS_ERR("alloc_device: cache file not readable\n");
 			err = -EINVAL;
-			goto err_close;
+			goto err_close_filp;
 		}
 		if (!(cfile->f_mode & FMODE_CAN_WRITE)) {
 			NS_ERR("alloc_device: cache file not writeable\n");
 			err = -EINVAL;
-			goto err_close;
+			goto err_close_filp;
 		}
 		ns->pages_written =
 			vzalloc(array_size(sizeof(unsigned long),
@@ -556,16 +556,24 @@ static int __init ns_alloc_device(struct nandsim *ns)
 		if (!ns->pages_written) {
 			NS_ERR("alloc_device: unable to allocate pages written array\n");
 			err = -ENOMEM;
-			goto err_close;
+			goto err_close_filp;
 		}
 		ns->file_buf = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
 		if (!ns->file_buf) {
 			NS_ERR("alloc_device: unable to allocate file buf\n");
 			err = -ENOMEM;
-			goto err_free;
+			goto err_free_pw;
 		}
 		ns->cfile = cfile;
+
 		return 0;
+
+err_free_pw:
+		vfree(ns->pages_written);
+err_close_filp:
+		filp_close(cfile, NULL);
+
+		return err;
 	}
 
 	ns->pages = vmalloc(array_size(sizeof(union ns_mem), ns->geom.pgnum));
@@ -580,15 +588,15 @@ static int __init ns_alloc_device(struct nandsim *ns)
 						ns->geom.pgszoob, 0, 0, NULL);
 	if (!ns->nand_pages_slab) {
 		NS_ERR("cache_create: unable to create kmem_cache\n");
-		return -ENOMEM;
+		err = -ENOMEM;
+		goto err_free_pg;
 	}
 
 	return 0;
 
-err_free:
-	vfree(ns->pages_written);
-err_close:
-	filp_close(cfile, NULL);
+err_free_pg:
+	vfree(ns->pages);
+
 	return err;
 }
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
