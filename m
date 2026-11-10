Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CB0606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 14:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4nXJkLYb;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Yi4cEGyr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/fsghjoB/tJjcdh7SAwRVS5GfiZHjN7Hr9A0HYkWfoQ=; b=4nXJkLYbf7fYOPk6kn0cxp0q3O
	FtMP9mr71K7kjuAul0kYqOF1yu8vEf4Co6VgI+CSopYhhR0jMY13EppGdAYdJaOFTwYqcmyTmDGOu
	F5tTzOMvN6ZlnKZbIKiaxbHpFtsKLpdgbB5uHFG7Z+0OrVjlK4RyrqzpTcUQ+tYjv9FnBwkZ2OpQ+
	a3vqYzuA1dwePEJVGxFyH68ieIduqxfL2tpdgZNwNJd21h5x/ypkIEvRGA2DXBZb+Zy3ZgXkqpDpO
	b6q2YFSim0m1NtK7lCJYDhnTeF23RseawVeyofLuqaAfB0NgvYB6NVIWh6Y1IWYC0pCC6LiA+pd6e
	swo+QVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmts-00000004DEU-26l5;
	Tue, 10 Nov 2026 14:32:40 +0000
Received: from [101.71.155.101] (helo=mail-m155101.qiye.163.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmtn-00000004DDP-0Ecl
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 14:32:38 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 542cd9c44;
	Tue, 10 Nov 2026 22:32:24 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: marvell: Fix potential DMA buffer leak
Date: Tue, 10 Nov 2026 22:32:24 +0800
Message-ID: <20261110-9f141e6bc8-mtd-marvell@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0aa1c5dfdbe803a1kunm14d8f7f016cdcd
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSBhOVkgeHUgeHR0aTE4aGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=Yi4cEGyrTSWNWL2mU/L5MBq86NhDW0yruf3+vN9mPP7yb8zhVPOVnOuFroF/4USBDiCWs3f/jbqvGPmKZRGtwsppggVgMBz3T13E3BER2PLRmk0yAzdW+HG2lolgHOvPi1y3BhNoPAGl5H4RF3nG7/i11Ukb2J2ZqitSuMnRLpY=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=WiJbtImCGtCDtksbAdjOSBGm2MNtIJsPvCdE4RgPTvI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_063235_939899_530480EA 
X-CRM114-Status: GOOD (  10.88  )
X-Spam-Score: -1.3 (-)
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

The bounce buffer allocated by marvell_nfc_init_dma() is not freed on
probe failure or removal. Releasing the controller loses the buffer.

Use a device-managed allocation so the buffer is freed after the DMA
channel has been shut down.

This issue was found by our static analysis tool under development.

Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/mtd/nand/raw/marvell_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index e5fa5540e80a..1adf4dcee93f 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2862,7 +2862,7 @@ static int marvell_nfc_init_dma(struct marvell_nfc *nfc)
 	 * for DMA transfers and then copy the desired amount of data to
 	 * the provided buffer.
 	 */
-	nfc->dma_buf = kmalloc(MAX_CHUNK_SIZE, GFP_KERNEL | GFP_DMA);
+	nfc->dma_buf = devm_kmalloc(nfc->dev, MAX_CHUNK_SIZE, GFP_KERNEL | GFP_DMA);
 	if (!nfc->dma_buf) {
 		ret = -ENOMEM;
 		goto release_channel;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
