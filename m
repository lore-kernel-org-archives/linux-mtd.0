Return-Path: <SRS0=iF+I=2U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43249C2D0C2
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 16:52:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 123B2206CB
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 16:52:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mQ4zhe+M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 123B2206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUp5e+AlagMlXl3uAWM54QAO1hvLsrflpS6I4OL10nI=; b=mQ4zhe+MkJiLeb
	QVsju5Uf9Ee+yPQNDSA/9uzImnjCGmC5nCC3m/o7a8LFoi762ITz8iK5dV16e21AEmKRO6RAmKJ7s
	TpQsaMCbWVHNdNvds+fhdWu3RC9MP2dzPxH11TZHQaUsTtEjD1BWyy20pcd+oMvTS0Kk3Cih1gwS+
	Yk0MGyv4YMaf3oKCDddukuAJca8RhyjM4w1VZZDjNvKhRp3TSgWgkFdpZi4Qh6sVf3VRz58n6rWNj
	YdSYby0znZhxxt64iYhnWUYg15RmajZOV21cNmOIMX2iv6i3L4m7rpIrftg64gVFZU2i/rHQjznmg
	/gA2iQ81xKWxueYCeS9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilyGz-0003h7-2r; Mon, 30 Dec 2019 16:52:05 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilyGd-0003J2-GM
 for linux-mtd@lists.infradead.org; Mon, 30 Dec 2019 16:51:46 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A516EC000C;
 Mon, 30 Dec 2019 16:51:38 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 8/8] ubi: Relax the 'no MLC' rule and allow MLCs operating in
 SLC mode
Date: Mon, 30 Dec 2019 17:51:29 +0100
Message-Id: <20191230165129.11925-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191230165129.11925-1-miquel.raynal@bootlin.com>
References: <20191230165129.11925-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_085143_697529_148421AD 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@bootlin.com>

The MTD layer provides an SLC mode (purely software emulation of SLC
behavior) addressing the paired-pages corruption issue, which was the
main reason for refusing attaching MLC NANDs to UBI.

Relax this rule and allow partitions that have the MTD_MLC_IN_SLC_MODE
flag set to be attached.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/ubi/build.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index d636bbe214cb..d917cc4cd937 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -846,8 +846,11 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	 * Both UBI and UBIFS have been designed for SLC NAND and NOR flashes.
 	 * MLC NAND is different and needs special care, otherwise UBI or UBIFS
 	 * will die soon and you will lose all your data.
+	 * Relax this rule if the partition we're attaching to operates in SLC
+	 * mode.
 	 */
-	if (mtd->type == MTD_MLCNANDFLASH) {
+	if (mtd->type == MTD_MLCNANDFLASH &&
+	    !(mtd->flags & MTD_MLC_IN_SLC_MODE)) {
 		pr_err("ubi: refuse attaching mtd%d - MLC NAND is not supported\n",
 			mtd->index);
 		return -EINVAL;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
