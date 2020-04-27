Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103CBC54FD0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:25:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E34B20661
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:25:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mo+Ufx8W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E34B20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGjR4+I55E+3CWUN5j5Bjlh0y6idRk3vTfTJcQF0r4M=; b=mo+Ufx8WbS1URs
	6yxB1rsZQKvgE22/FWybZAwrhXrOG/TP7m2b1bWWNTjWaPt3KFqLLHd7ceOP6V+kLqTsRUVVonCh0
	x218aObslG0RFxm6oGaEFQ5t55ZYdyx4OqtQOgGrj/ObT7ec/OZSBBZaT7V2ow+fniFGDXyuypSAK
	bIhxVo3IiUeLlgH/xuvQpgzL+GomrTd+MN81m2Eu4yQiHM5QexD8inqK/+KVmf0KzaU0/Gfu2HUuC
	JglqFcikKkBX6DRC1B8BAaNT9ZjAFVsltlHvOwNicckm8vrh9+KMmlTkLxSK/Cra6NzlSkbQ+6VRQ
	+LcT6OFsqWfQ15K9b3ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSz54-0004KE-4n; Mon, 27 Apr 2020 08:25:34 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSz0L-0006Ap-Ex
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 08:20:45 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 65C052A0630;
 Mon, 27 Apr 2020 09:20:38 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 09/17] mtd: rawnand: cafe: Get rid of a useless label
Date: Mon, 27 Apr 2020 10:20:19 +0200
Message-Id: <20200427082028.394719-10-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200427082028.394719-1-boris.brezillon@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_012041_662786_A3E75B1A 
X-CRM114-Status: GOOD (  12.89  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We can return 0 directly instead of branching to the out label.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index 3eab57e63215..348debbc04af 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -932,7 +932,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	if (err)
 		goto out_cleanup_nand;
 
-	goto out;
+	return 0;
 
  out_cleanup_nand:
 	nand_cleanup(&cafe->nand);
@@ -943,7 +943,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		    GLOBAL_IRQ_MASK);
  out_ior:
 	pci_iounmap(pdev, cafe->mmio);
- out:
 	return err;
 }
 
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
