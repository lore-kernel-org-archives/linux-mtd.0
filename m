Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4A1C44500
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 07:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qY3Wjnmlm2pr/i/c/celTDk9Xa+I0hRjg3utjxuez2g=; b=rMZ5hGpcwvblQg
	qgVw7wCgXqQ6j4g6SXL8K7T0QpuQj0sOGln5gkSHi0V3adzGLjRLL4lruF7REuc89pO8PpPBYkUb7
	bFeXYY4MXpEfGssDZLsu6IvdPVT0bwKCtemruyFNZUMwA7fXgGNvYA3Le0+emNRq7RfO42TlrRkkq
	+CojYM1/qxofOu1oiDGWG/oudOy7kxswB/X9XwU7T/TWkijP55+Dgjxwpwgu9wj6rKqZuG31E7oh5
	2CO5iuSVsUW5dvAiH1L2/cPhInVWdQ2lWq1Xkr2UpVCPURALkwrquMsQ85QkXh+b4o+ROBEjh1Dtx
	PB0SWtB8aUAKlG/QkaMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYZ2-00000006ILV-3JTT;
	Fri, 03 Jul 2026 07:43:56 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYZ0-00000006ILB-284r
	for linux-mtd@lists.infradead.org;
	Fri, 03 Jul 2026 07:43:56 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAC3vcQ3aEdq8E7AFg--.1761S2;
	Fri, 03 Jul 2026 15:43:51 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] mtd: onenand: samsung: report DMA completion timeouts
Date: Fri,  3 Jul 2026 15:43:50 +0800
Message-ID: <20260703074350.65127-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAC3vcQ3aEdq8E7AFg--.1761S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar47Xr47Cw4UZw15KF17Jrb_yoW8Cr47pr
	42g3yDKr4Utr1jyw1rA3ZYqr1rZa1fJrZ7GF9Yq3yrZrykX3Zrur4rKry2qFZ0y3ZIgw4x
	XFW8XFsxAw1q9rUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUO73vUU
	UUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_004354_922006_0A3F9E31 
X-CRM114-Status: UNSURE (   8.36  )
X-CRM114-Notice: Please train this message.
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

The S5PC110 OneNAND DMA helpers have bounded waits for transfer
completion. The polling helper falls out of its timeout loop and returns
success, and the IRQ helper ignores wait_for_completion_timeout().

Return -ETIMEDOUT when the DMA transfer-done bit or completion does not
arrive before the timeout so callers can treat the buffer transfer as
failed.

Fixes: e23abf4b7743 ("mtd: OneNAND: S5PC110: Implement DMA interrupt method")
Cc: stable@vger.kernel.org
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260623061233.40188-1-pengpeng@iscas.ac.cn/
- add Fixes and Cc stable tags as requested by Miquel

 drivers/mtd/nand/onenand/onenand_samsung.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/onenand/onenand_samsung.c b/drivers/mtd/nand/onenand/onenand_samsung.c
index 6d6aa709a21f..b7b7758ce4d8 100644
--- a/drivers/mtd/nand/onenand/onenand_samsung.c
+++ b/drivers/mtd/nand/onenand/onenand_samsung.c
@@ -554,6 +554,9 @@ static int s5pc110_dma_poll(dma_addr_t dst, dma_addr_t src, size_t count, int di
 	} while (!(status & S5PC110_DMA_TRANS_STATUS_TD) &&
 		time_before(jiffies, timeout));
 
+	if (!(status & S5PC110_DMA_TRANS_STATUS_TD))
+		return -ETIMEDOUT;
+
 	writel(S5PC110_DMA_TRANS_CMD_TDC, base + S5PC110_DMA_TRANS_CMD);
 
 	return 0;
@@ -608,7 +611,9 @@ static int s5pc110_dma_irq(dma_addr_t dst, dma_addr_t src, size_t count, int dir
 
 	writel(S5PC110_DMA_TRANS_CMD_TR, base + S5PC110_DMA_TRANS_CMD);
 
-	wait_for_completion_timeout(&onenand->complete, msecs_to_jiffies(20));
+	if (!wait_for_completion_timeout(&onenand->complete,
+					 msecs_to_jiffies(20)))
+		return -ETIMEDOUT;
 
 	return 0;
 }
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
