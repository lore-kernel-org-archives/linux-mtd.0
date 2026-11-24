Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804CA606A335
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 09:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=evOtN7qN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ip0+fvPH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5FaQGyr7dC7yYPH9VCgdGYBrrankEzc0VfiK3rjd1v0=; b=evOtN7qNZbE6TxJh6m7Va6hr5G
	zvmWp8GOKpEKBsfMfJprXvgZ1kud7BJFhLiY/2rgi1E7F7GwChuL8GpTPdV8bUAi0iI+/k7dIfh5t
	Pzxt1Gus2pJlm9g5Ua+hfIa96Hvqjycc7ZafNs/wTOuBszVVHq93E0wDNG2MZPlGq6AWRUMiSvvUa
	l2xYH5B8nA2GwKz9qmPbzJb6buVvy19FwNIUqMbOyGa9CYPHAaUblinJy6LxMtnoOzuSR5b5Wiz4z
	ufCiZ2SY7f9JYainHpVc6cxd1Rk4d0JGRUkKJmpe1u86KI2jwcDRSiZfmwPXJEmEsaX7Ly0iN9buo
	GAzAt/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmlZ-000000063Hj-3msO;
	Tue, 24 Nov 2026 09:24:45 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmlP-000000063Cj-3avT
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 09:24:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B20C4E4175B;
	Tue, 24 Nov 2026 09:24:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1ABBA601E1;
	Tue, 24 Nov 2026 09:24:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2218111E6A9B3;
	Tue, 24 Nov 2026 10:24:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795512273; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aoI8AlSI3VF7hQCQWNsK0cPXv5qsgsj2161PVO/bKVs=;
	b=Ip0+fvPHtXLgnCo+SM/S6acz+lzzOI2el35iIWyX2xi4rAK9gb3vRfvcvlvXPPDKYDc4pt
	f+PAElG4w5jIS5GbdLpOd83QRbfjcDZeV3udvjURNFvdrNEzGgXU0Ctajj0KyfnEV2NUdH
	VBOl338USGubER0qQInlPiieVM4PtCJBv47K/kXWaMRhwQVCiKcyF1y6BzWXCRPV2Of3Rw
	VuGTcAkLAaQBlGfRlNpJR0LxVscdRbIKXDa7vtxt90DQr9o4TH59WISWZ33QnWUhXxI4SV
	qZ65R6dd9vXt2+oKXji30m6KeBZWPEi7i+YRYMJEOVXFAKs24WUkWEo4tpd60g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 10:24:23 +0100
Subject: [PATCH v2 2/3] mtd: rawnand: cadence: Resize the bounce buffer
 before the BBT scan
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261124-perso-upstreaming-rawnand-fixes-v2-2-69db17ad07bd@bootlin.com>
References: <20261124-perso-upstreaming-rawnand-fixes-v2-0-69db17ad07bd@bootlin.com>
In-Reply-To: <20261124-perso-upstreaming-rawnand-fixes-v2-0-69db17ad07bd@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_012436_046088_F2BAF7D4 
X-CRM114-Status: GOOD (  16.35  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The bounce buffer is allocated with a default size and only resized to
the actual page + OOB size once all the chips have been
scanned. However, the bad block table is scanned during nand_scan(),
before that resize happens, using the same bounce buffer. Chips with a
page + OOB size larger than the default size may therefore overflow the
heap buffer.

In practice, this default is safe since it is set to 16kiB and I
currently know no chip with a bigger page size, but chances are that
this is not a future-proof bet, so let's resize the bounce buffer
whenever we attach a chip whose geometry needs a bigger buffer.

Fixes: ec4ba01e894d ("mtd: rawnand: Add new Cadence NAND driver to MTD subsystem")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 42cc62b36457..912148f90ece 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -2970,8 +2970,17 @@ static int cadence_nand_attach_chip(struct nand_chip *chip)
 	chip->ecc.read_oob_raw = cadence_nand_read_oob_raw;
 	chip->ecc.write_oob_raw = cadence_nand_write_oob_raw;
 
-	if ((mtd->writesize + mtd->oobsize) > cdns_ctrl->buf_size)
+	if ((mtd->writesize + mtd->oobsize) > cdns_ctrl->buf_size) {
+		u8 *buf;
+
+		buf = krealloc(cdns_ctrl->buf, mtd->writesize + mtd->oobsize,
+			       GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+
+		cdns_ctrl->buf = buf;
 		cdns_ctrl->buf_size = mtd->writesize + mtd->oobsize;
+	}
 
 	/* Is 32-bit DMA supported? */
 	ret = dma_set_mask(cdns_ctrl->dev, DMA_BIT_MASK(32));
@@ -3136,8 +3145,11 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 	if (!cdns_ctrl->cdma_desc)
 		return -ENOMEM;
 
-	cdns_ctrl->buf_size = SZ_16K;
-	cdns_ctrl->buf = kmalloc(cdns_ctrl->buf_size, GFP_KERNEL);
+	/*
+	 * Allocate a scratch buffer for the identification phase. It gets
+	 * resized to the actual chip geometry in ->attach_chip().
+	 */
+	cdns_ctrl->buf = kmalloc(SZ_16K, GFP_KERNEL);
 	if (!cdns_ctrl->buf) {
 		ret = -ENOMEM;
 		goto free_buf_desc;
@@ -3194,13 +3206,6 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto unmap_dma_resource;
 	}
 
-	kfree(cdns_ctrl->buf);
-	cdns_ctrl->buf = kzalloc(cdns_ctrl->buf_size, GFP_KERNEL);
-	if (!cdns_ctrl->buf) {
-		ret = -ENOMEM;
-		goto unmap_dma_resource;
-	}
-
 	return 0;
 
 unmap_dma_resource:

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
