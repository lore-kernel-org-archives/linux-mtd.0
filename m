Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F614C41513
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 21:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0R1GnJ1EO8QNhS7Sy5B2D/H5XWxXK1MhbGWbdd4sCEY=; b=CTZkCQJbfQD/qV
	m2zGIoRUOSAPgXSEO9Yvzcqf2oQFjieE9PzTLAzvHADYJNN7zu8nlN+k0+0tDzpvynFvXgI+0D7gY
	Bodn2FbWzarKVAeP3DHvU7JR2v9EFsu1JJFVg165k/bOEh0cENCfl8053O2/phfSdHtQBrbbGQZkO
	n4crMBAYVNvLaE8AFNiQX2YL1HBbSJENpcNAP8v1NipqU+dIb8YGPedQXTPaFGar+Hq46Qx1Rzjji
	ZY6m8+zxhqXnKVBRNgozyy+i8OepuM9vJr48YZv90ZobvJkj+8DnkyVjsoHqZ9ykxc3lLRoMbZSvD
	mMyP7lpgX43uzeRcFDsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEbit-00000003rIV-0gAo;
	Tue, 04 Jun 2024 21:29:39 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEbio-00000003rDs-3Zik
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 21:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=jNaCNho3HkpDyJKsOVs+JnrFnTAQRUo8cA0Au9KuneI=; b=goYC5Q
	ZYCkI43IZ1cDYG9/MiRnx4/qitPVvR9trSSdIkyUU9HOKNbtOHE06oYckn/gBdwL
	4AaIoV2WUrWwltIDSzIR6kfyepo4XckxtcR0N5nA2CGe8C8OHH3OrkPqhXHYfxSD
	ceOIC5tTEInewC7QCNN650EZMgoIdAfBDPF9MByFZZzNxiLSJwq3L/ZNuBbjC0Oh
	BYKJEVngtBHWUmm+MGcuBdxKTmZ5j43gg/N8NOpZGlGYeOSe/eDSK45V2nBZ7c4J
	uVdSA5jxQPkj5GkOAmRi9I+qO9loA/7FSoeAqtX5+juIUH43s1Mh1+c8O7VgOgUk
	PZhCC5QWGnLY+TfA==
Received: (qmail 2450944 invoked from network); 4 Jun 2024 23:29:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2024 23:29:27 +0200
X-UD-Smtp-Session: l3s3148p1@Lcj4JBcaAtpehhtB
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: rawnand: intel: use 'time_left' variable with wait_for_completion_timeout()
Date: Tue,  4 Jun 2024 23:29:21 +0200
Message-ID: <20240604212919.5038-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240604212919.5038-4-wsa+renesas@sang-engineering.com>
References: <20240604212919.5038-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_142935_195865_7C0A6093 
X-CRM114-Status: GOOD (  12.55  )
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

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Fix to the proper variable type 'unsigned long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index f0ad2308f6d5..78174c463b36 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -295,7 +295,7 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 	unsigned long flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
 	dma_addr_t buf_dma;
 	int ret;
-	u32 timeout;
+	unsigned long time_left;
 
 	if (dir == DMA_DEV_TO_MEM) {
 		chan = ebu_host->dma_rx;
@@ -335,8 +335,8 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 	dma_async_issue_pending(chan);
 
 	/* Wait DMA to finish the data transfer.*/
-	timeout = wait_for_completion_timeout(dma_completion, msecs_to_jiffies(1000));
-	if (!timeout) {
+	time_left = wait_for_completion_timeout(dma_completion, msecs_to_jiffies(1000));
+	if (!time_left) {
 		dev_err(ebu_host->dev, "I/O Error in DMA RX (status %d)\n",
 			dmaengine_tx_status(chan, cookie, NULL));
 		dmaengine_terminate_sync(chan);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
