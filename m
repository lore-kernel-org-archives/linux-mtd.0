Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F09AC433ED
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:38:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3528660FE5
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3528660FE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EyWru6fWFGHot9hl2F6vxnFGCdazTG2W8oJkPDue4Yw=; b=br/HxoMQRjyM3KZekiuvHtW1Z
	D/G3m51BZnCKQa4GAEoBuN/4ing3fsXtVlxU7nggfS/p17t3FGeuciNXYdt1Q14v9SDfzW1ZOLx3g
	jQdVDpi/cKW0T2lWiNW7jlEx20uIp/VXj27/KjhIsqSkAUKkLUQZtZzwa2L50fMOQ59yuDWAnyBi/
	co2QVH0PXKT4VrBPF8AZ5kzu6EvdUGzzlojSSY5AK7AEqFPIY1C16ZHQ6BXO1e1crA1IUcfYCBJrN
	jn5s1hnPJtShbTDX/Eb7y33+hr0cxKB5UQ0/N0InsGy3vXphnXKkHVlh1UD2C12tb4GJ60XhaenLe
	Vdz4S7mvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljR50-004msD-3Z; Wed, 19 May 2021 18:38:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuN-004lOV-Es
 for linux-mtd@desiato.infradead.org; Wed, 19 May 2021 18:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=O+JSxHbIXfG9iygu2w01FFnvivSoZdA5MHTI9G7OFAE=; b=IsexJpJ+/iUD11n+nEdmm02Cnc
 F9u6OFVejNn6FbAkkKNchqEC0qn3SPXwBZFaWNAwE/HI68TKRLg19Td7nZJDW7JCZTWXMkbGpuFSQ
 Z8Zv2THQ00TMNX4rwq5KPDL/2RQuDZK1cT+btB9YMaFP1H59HEd6g7NbbjTKhLAOTWJ0VvV0hJsBi
 Ol0lXDLUQIGzIV3hne6kssPeXk5V7ZHfvGwqw/nnvAP2DRZbgK5zUsYU3YboMeRf+3pSVKIPtoDXY
 GjoYX3nfmwA7LLg36jpMjOYKKcE9yXS5PpyCy/CZXegQz9z9YClbFU3xw8JCvgRg2Xp11mfJ1dplP
 eekvnH4w==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuK-00Fh87-Sv
 for linux-mtd@lists.infradead.org; Wed, 19 May 2021 18:27:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4171CC0016;
 Wed, 19 May 2021 18:26:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Helmut Grohne <helmut.grohne@intenta.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v20 11/19] memory: pl353-smc: Fix style
Date: Wed, 19 May 2021 20:26:28 +0200
Message-Id: <20210519182636.1110080-12-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_112701_087872_9D21003C 
X-CRM114-Status: GOOD (  10.90  )
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

Use proper spacing.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/memory/pl353-smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/pl353-smc.c b/drivers/memory/pl353-smc.c
index 9c0a28416777..2d20b1b2c0e3 100644
--- a/drivers/memory/pl353-smc.c
+++ b/drivers/memory/pl353-smc.c
@@ -436,8 +436,8 @@ static void pl353_smc_remove(struct amba_device *adev)
 
 static const struct amba_id pl353_ids[] = {
 	{
-	.id = 0x00041353,
-	.mask = 0x000fffff,
+		.id = 0x00041353,
+		.mask = 0x000fffff,
 	},
 	{ 0, 0 },
 };
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
