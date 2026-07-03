Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C7AC43458
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 07:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=etgegxxz5C68EPZavMpcqG1KmRN1qLivCybfotkjz2A=; b=KFRLebiyLQQcRJ
	41fgbUoFnRSmJcALygL891TtxqvOjb4JNn2WU1DLyl7WXWpcFnQEHWBV7nHUj2cJJXI6mPyeY2IVo
	kSPlLGn+PD4AU+y/VvrmXIfbnFmZJZNeHs/vJ7URDKK2Yrr1d0WGpjHhWLWsFBGyjLF01MsYnkHB/
	Kz68nuQDNBlhTVBDiuGqMJW4WswpRT0njOfcXQy4xFBVyZ9spsn3u4k091+0zhHVcwP2E9LEycJA3
	MhOZ4nNphF5w51V8lKq0nXVxOvt1B4b80pp1YsK28LxIozT7rpI6j0R1dahmud5TMECwwhilUEEIS
	ChqPohonA9MIdmWDzQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYTP-00000006HZO-35Ey;
	Fri, 03 Jul 2026 07:38:07 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYTM-00000006HYS-1UuR;
	Fri, 03 Jul 2026 07:38:06 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAD3GODYZkdqez_AFg--.1719S2;
	Fri, 03 Jul 2026 15:38:01 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] mtd: rawnand: lpc32xx_mlc: fail DMA transfers on timeout
Date: Fri,  3 Jul 2026 15:37:59 +0800
Message-ID: <20260703073759.31388-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAD3GODYZkdqez_AFg--.1719S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4kJFyfKr13GF4xZF1DJrb_yoW5XFy8pa
	1j9wn0kr4jyrsIgrWUCa1UZF1Y9a1rArW7K34qg34F934qvr1q9FnYgFy0qF1YkF95GF12
	qFs8t3ZxCr1UJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_003804_770073_13951374 
X-CRM114-Status: GOOD (  11.46  )
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

lpc32xx_xmit_dma() starts a DMA transfer and waits up to one second
for its completion, but it ignores the wait result and returns success
after unmapping the buffer.

A timed out read can therefore return success with incomplete data, and
a timed out write can continue the NAND operation without proof that the
DMA payload reached the controller.

Terminate the DMA channel on timeout, unmap the scatterlist through the
existing cleanup path, and return -ETIMEDOUT to the NAND read/write
callers. Initialize the shared cleanup-path result before using it for
dmaengine_prep_slave_sg() failures.

Fixes: 70f7cb78ec53 ("mtd: add LPC32xx MLC NAND driver")
Cc: stable@vger.kernel.org
Reviewed-by: Vladimir Zapolskiy <vz@kernel.org>
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260625003327.11060-1-pengpeng@iscas.ac.cn/
- add Fixes and Cc stable tags as requested by Miquel
- carry Vladimir's Reviewed-by tag

 drivers/mtd/nand/raw/lpc32xx_mlc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 19b13ae536d4..8f6a89d9ba83 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -396,6 +396,7 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, void *mem, int len,
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
 	struct dma_async_tx_descriptor *desc;
 	int flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
+	unsigned long time_left;
 	int res;
 
 	sg_init_one(&host->sgl, mem, len);
@@ -410,6 +411,7 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, void *mem, int len,
 				       flags);
 	if (!desc) {
 		dev_err(mtd->dev.parent, "Failed to prepare slave sg\n");
+		res = -ENXIO;
 		goto out1;
 	}
 
@@ -420,7 +422,13 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, void *mem, int len,
 	dmaengine_submit(desc);
 	dma_async_issue_pending(host->dma_chan);
 
-	wait_for_completion_timeout(&host->comp_dma, msecs_to_jiffies(1000));
+	time_left = wait_for_completion_timeout(&host->comp_dma,
+						msecs_to_jiffies(1000));
+	if (!time_left) {
+		dmaengine_terminate_sync(host->dma_chan);
+		res = -ETIMEDOUT;
+		goto out1;
+	}
 
 	dma_unmap_sg(host->dma_chan->device->dev, &host->sgl, 1,
 		     DMA_BIDIRECTIONAL);
@@ -428,7 +436,7 @@ static int lpc32xx_xmit_dma(struct mtd_info *mtd, void *mem, int len,
 out1:
 	dma_unmap_sg(host->dma_chan->device->dev, &host->sgl, 1,
 		     DMA_BIDIRECTIONAL);
-	return -ENXIO;
+	return res;
 }
 
 static int lpc32xx_read_page(struct nand_chip *chip, uint8_t *buf,
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
