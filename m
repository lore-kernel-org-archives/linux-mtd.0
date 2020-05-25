Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A204C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:01:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5E38206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:01:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kDAszuJv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5E38206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsn5EbjaVNO4/mC4tF4L4NDC6NQepyHs15z4GkdSRDk=; b=kDAszuJvZJyLJ3
	k/Lzy+VatgvAkeXNOq31ZJgrszd3B1oX3vgXuwDhEuq7+KCi//1w4LcHA1ZSNjiWkOsGi0LJCAqLA
	VRoC6Ianr7H/b/oBYplJRkk1njXR6ZvXnGTo6vWF0/yyBWgvO1h3cXG1NeeAqcdwbDPOlIds2SiOs
	LN514lT1j2N2En2beIgv+8owUHGrnSSkhhmfIQ6hflFjEWE0qkC+TjiWgUMbqKtcGB7ndJbJh0bzN
	7wH/pWXHX6ftpZn/hbBDQJNgjmJeihggVgirCBTtEAF7YGWbgr3RMFosoDa9KVxW6DvkZaOgRZfri
	+91OJbvAVa8yY9qlU2Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd8yw-0000tx-QK; Mon, 25 May 2020 09:01:14 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8wx-0004ZN-GB
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 08:59:13 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 33D7C240012;
 Mon, 25 May 2020 08:59:09 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 09/17] mtd: rawnand: nandsim: Free the allocated device on
 error in ns_init()
Date: Mon, 25 May 2020 10:58:43 +0200
Message-Id: <20200525085851.17682-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525085851.17682-1-miquel.raynal@bootlin.com>
References: <20200525085851.17682-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_015911_723574_BC0F9D4D 
X-CRM114-Status: GOOD (  10.81  )
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

The nandsim device is allocated and initialized inside ns_init() by a
call to ns_alloc_device(), free it on error.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nandsim.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 53889bce81f1..d6e16ddb5de5 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -766,12 +766,14 @@ static int __init ns_init(struct mtd_info *mtd)
 		NS_ERR("init_nandsim: unable to allocate %u bytes for the internal buffer\n",
 			ns->geom.pgszoob);
 		ret = -ENOMEM;
-		goto free_partition_names;
+		goto free_device;
 	}
 	memset(ns->buf.byte, 0xFF, ns->geom.pgszoob);
 
 	return 0;
 
+free_device:
+	ns_free_device(ns);
 free_partition_names:
 	for (i = 0; i < ARRAY_SIZE(ns->partitions); ++i)
 		kfree(ns->partitions[i].name);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
