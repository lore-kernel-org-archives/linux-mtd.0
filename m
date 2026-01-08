Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA112D185E8
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XcFa2awmmID+O7Uc5SFxTRw5WKfnAZCtaDPflwUlsMs=; b=cCeCr9QTh+eU4x
	w2T8ssgdLFx43uY7PCvDUzMl7an3cK2g0R1fcCLWTuDX+qS11V9NRxTEBK6Dk+3lWZGRkhKntfWMS
	UVvBXPECBebAJZWukPPiMoe+P2oLtGCXRQ7UX8D1Isjji8NJ21+7HAUDrBOXDCyUMZ06cId5DPc/+
	Keq3IFmaF3irJuFKsMEtq78gczq7kwWIkwsLSLlaE/lLENzbTlGsrZBHzeLP4beBRLslKM52A7VeW
	Tvy4De7IIgqPA/cCjNNym6NZASp6LhUHebiv5jj3Y0jOKY3lCClgj9IsbIMBA52JjGc2mqX8qBTyi
	d8WXKA74zdjHYZe/ClkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoud-0000000Gx6Z-08II;
	Thu, 08 Jan 2026 12:14:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdouX-0000000Gx4F-2XLI
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 12:14:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 18BFD4E41FF6;
	Thu,  8 Jan 2026 12:14:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA600606B6;
	Thu,  8 Jan 2026 12:14:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 131FF103C884B;
	Thu,  8 Jan 2026 13:14:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767874475; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=U8AMlOAXuvdOQIU+BpPDe2HHzjRW2TslN/Gs7O4DKCc=;
	b=lS23nRVp8TrGPyC3Ad9ZZvaZEyXpfPsimXF+OOrsl/5EBM28T8hmbsTuxZdaozezCQcioy
	NIFa/4VADoRx8KkWboAeDB5QJiEobvsnjAid8WWb0unAVFbvuhIYrVDx+/zA4wpEjb0Fhn
	UGeos2pDig/ihH5kF4Z2hfSbSFdtNBAMUjeoHcKUC8Av5Sq5WVUMgJQGLrVyN82OWqyGV4
	ZEeVoEBcDw/y+xaTfu4CB2rFA4Ir8XyJ4QgzwWXNpuixvKAhIxMKPb0am13yhHvGcrkE89
	u/ozGVBR1UF+Dd69Io96uJ5n7kDoMdJ79+oQoCk4T1yuxYBxMFgeiWwHsiQqlg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Jakub Czapiga <czapiga@google.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/2] mtd: spi-nor: Fix RDCR controller capability core check
Date: Thu,  8 Jan 2026 13:14:29 +0100
Message-ID: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_041442_221197_A45FC650 
X-CRM114-Status: GOOD (  16.46  )
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

Commit 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support") adds a
controller check to make sure the core will not use CR reads on
controllers not supporting them. The approach is valid but the fix is
incorrect. Unfortunately, the author could not catch it, because the
expected behavior was met. The patch indeed drops the RDCR capability,
but it does it for all controllers!

The issue comes from the use of spi_nor_spimem_check_op() which is an
internal helper dedicated to check page operations, ie. it is only used
for page reads and page programs (despite its generic name).

This helper looks for the biggest number of address bytes that can be
used for a page operation and tries 4 then 3. It then calls the usual
spi-mem helpers to do the checks. These will always fail because there
is now an inconsistency: the address cycles are forced to 4 (then 3)
bytes, but the bus width during the address cycles rightfully remains 0:
impossible, the operation is invalid.

The correct check in this case is to directly call spi_mem_supports_op()
which doesn't messes up with the operation content.

Fixes: 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d3f8a78efd3b..1f2e312feec7 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2466,7 +2466,7 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
-		if (spi_nor_spimem_check_op(nor, &op))
+		if (!spi_mem_supports_op(nor->spimem, &op))
 			nor->flags |= SNOR_F_NO_READ_CR;
 	}
 }
-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
