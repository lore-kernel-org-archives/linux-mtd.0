Return-Path: <SRS0=EGP2=6R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB6FC28CBC
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 15:56:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E02EB206EB
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 15:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="loinXHNy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E02EB206EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZbY8EBHU6BEaZvjXCZ+qpPz1bPr9UypjppHO2ksSYc=; b=loinXHNyywqMJZ
	eG51Do9r6WU9IOmG0cL0lSfztVcv7i6laVlOD05gkzRxCJdDyikvixfqzcXR/HdZQRq+A2byoCARY
	lTkt23DIz1PtYaCPoN7uv/UE4Pmjnrj5PXNxk+vGsl0TG68c1b/auVfzcHcabRZodE6CSZR7lXNsb
	G8UwAaXzhzSIXm7vf5ml/NUAKCVfrOAhVJewc8JQQBWL/95jP2VW9MkOCNOZZEhUj6c7tFcpexquz
	yAtfew5M4qyOTaE4EOU8FRXgfLDpgciLaFjEOLM0X770u2ZPyCD1jznoaTPB1d+iRk2hvX2oW1D7M
	j9f/Uj9kiLoc+qWxZ83A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVGyB-0006mo-LV; Sun, 03 May 2020 15:55:55 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVGwF-0002ih-AE
 for linux-mtd@lists.infradead.org; Sun, 03 May 2020 15:53:56 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C81F5240006;
 Sun,  3 May 2020 15:53:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 8/8] ubi: Relax the 'no MLC' rule and allow MLCs operating
 in SLC mode
Date: Sun,  3 May 2020 17:53:41 +0200
Message-Id: <20200503155341.16712-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200503155341.16712-1-miquel.raynal@bootlin.com>
References: <20200503155341.16712-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_085355_500927_B867C594 
X-CRM114-Status: GOOD (  10.63  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Maxime Ripard <maxime@cerno.tech>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

The MTD layer provides an SLC mode (purely software emulation of SLC
behavior) addressing the paired-pages corruption issue, which was the
main reason for refusing attaching MLC NANDs to UBI.

Relax this rule and allow partitions that have the
MTD_EMULATE_SLC_ON_MLC flag set to be attached.

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 12c02342149c..e85b04e9716b 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -867,8 +867,11 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	 * Both UBI and UBIFS have been designed for SLC NAND and NOR flashes.
 	 * MLC NAND is different and needs special care, otherwise UBI or UBIFS
 	 * will die soon and you will lose all your data.
+	 * Relax this rule if the partition we're attaching to operates in SLC
+	 * mode.
 	 */
-	if (mtd->type == MTD_MLCNANDFLASH) {
+	if (mtd->type == MTD_MLCNANDFLASH &&
+	    !(mtd->flags & MTD_SLC_ON_MLC_EMULATION)) {
 		pr_err("ubi: refuse attaching mtd%d - MLC NAND is not supported\n",
 			mtd->index);
 		return -EINVAL;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
