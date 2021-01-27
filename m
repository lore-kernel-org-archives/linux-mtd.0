Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E38CC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 20:31:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8352C61488
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 20:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8352C61488
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=73cuQulXLlGyKPa7IPSlQIis5vvQo1vWwiElN4FNr+Q=; b=zyf/kVe9PGOvJ3OiuCeMnGegP
	Tamq4BigXxvzlN5VGNv6VvdtDYuH36tSDkiuldc7b7V66fPosISVxCxOevjUwnpUJ7ksaif0KWVcD
	EZ62xjTB/67UaAcCK9JIvSb5bhRaIFqYRG6aH1JLRt6D9mLBtRgCdgY2zaytmh6pFgQhctfDbWS63
	QLlmiGfs4Vq/W2Rc8zOrRXc+FV1JpjxqOiQqB6pQ2QhdpC3UMCS9DAbdvIZH24ZiL22xn+HQyluwr
	MjvT65hMTQp1wSzGprRb55xBVv4qz9TRx97S3tB6dRL5OtUGXIdg7kMFXykMwNDjVWCgxVBL/NXIf
	D7zNbF/MA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4rSV-0002AU-If; Wed, 27 Jan 2021 20:30:35 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4rSN-00026c-Nf
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 20:30:28 +0000
X-Originating-IP: 86.210.203.150
Received: from localhost.localdomain
 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr [86.210.203.150])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C19CC1BF211;
 Wed, 27 Jan 2021 20:30:24 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 2/9] mtd: nand: ecc-bch: Populate the public nsteps field
Date: Wed, 27 Jan 2021 21:30:13 +0100
Message-Id: <20210127203020.9574-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210127203020.9574-1-miquel.raynal@bootlin.com>
References: <20210127203020.9574-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_153027_973018_5A2483BC 
X-CRM114-Status: GOOD (  10.61  )
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
 Adam Ford <aford173@gmail.com>, ladis@triops.cz,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Advertize the actual number of steps that will actually be used by the
driver by populating the public field.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-bch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/ecc-sw-bch.c b/drivers/mtd/nand/ecc-sw-bch.c
index 0a0ac11d5725..5018bc0db626 100644
--- a/drivers/mtd/nand/ecc-sw-bch.c
+++ b/drivers/mtd/nand/ecc-sw-bch.c
@@ -245,6 +245,7 @@ int nand_ecc_sw_bch_init_ctx(struct nand_device *nand)
 	}
 
 	nand->ecc.ctx.priv = engine_conf;
+	nand->ecc.ctx.nsteps = nsteps;
 	nand->ecc.ctx.total = nsteps * code_size;
 
 	ret = nand_ecc_sw_bch_init(nand);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
