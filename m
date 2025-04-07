Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60B0C3601A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C8+vkCFL/ERkF6APLtgiKqcF75AGgpqsM+yVtjSQmKA=; b=CF6C4gG0g2ou+H
	YhR981bnFzsoZime7Fm6Z86TNyKETHn3Bqj0iyCjj+v+2G8imZ14kUiS7ZdbY1Yynx1bkqUvM02UC
	9x2MNzP74sZ//iJtOo1bcNhZ8LGpRYxc8GRv7LjWHUYxGSqqmoLqQfJxBycNR+XW4DcgO8FBe9pq1
	CpvbDjypCXIwn9HO3ZZ+rEjHeuzs5BQHE64Bbq4gqhQ2CVGWgyfXBeg9kd1FeqAZnulNJX7jWcd0Q
	WYO9ToRCle9dpiyHz2XlL7SsbYI7fsQYEKfzMgxOK9sbSsHGiZKvj2WXP60VDowCELBBwgzkreIV+
	JiIvUWlLbwN6KxfbH0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jDK-0000000HHXr-2Fea;
	Mon, 07 Apr 2025 09:56:22 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1j1Y-0000000HF2I-1D3V
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 09:44:14 +0000
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowABXAQJjnvNnNazXBg--.76S2;
	Mon, 07 Apr 2025 17:44:05 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH v3] mtd: bcm47xxnflash: Add error handling for bcm47xxnflash_ops_bcm4706_ctl_cmd()
Date: Mon,  7 Apr 2025 17:43:47 +0800
Message-ID: <20250407094347.2108-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
X-CM-TRANSID: qwCowABXAQJjnvNnNazXBg--.76S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw18WF17uw47XFyUAr1UZFb_yoW8WFWUpr
	47Xa45t3Z5X3WDtFyUWF18KF1Yv348KF4jg3yvva48ursavFWxGrZ3Ga4jq3y8Gw18Jw17
	XF4F93WxWr9FkrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUcBMtUUU
	UU=
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCREFA2fzgKdR5gABsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_024412_694314_E99B4D9B 
X-CRM114-Status: GOOD (  11.53  )
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

The function bcm47xxnflash_ops_bcm4706_cmd_ctrl() calls the function
bcm47xxnflash_ops_bcm4706_ctl_cmd(), but does not check its return value.
A proper implementation can be found in bcm47xxnflash_ops_bcm4706_write().

Add error log to the bcm47xxnflash_ops_bcm4706_ctl_cmd() via pr_err()
to prevent silent failure. The error Log funciton 'dev_err' is unsuitable
in this situation for it is hard to get device pointer.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
v3: Improve code for logging error.
v2: Fix spelling problem.

 drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
index 6487dfc64258..e532c3535b16 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
@@ -171,6 +171,7 @@ static void bcm47xxnflash_ops_bcm4706_cmd_ctrl(struct nand_chip *nand_chip,
 {
 	struct bcm47xxnflash *b47n = nand_get_controller_data(nand_chip);
 	u32 code = 0;
+	int rc;
 
 	if (cmd == NAND_CMD_NONE)
 		return;
@@ -182,7 +183,9 @@ static void bcm47xxnflash_ops_bcm4706_cmd_ctrl(struct nand_chip *nand_chip,
 	if (cmd != NAND_CMD_RESET)
 		code |= NCTL_CSA;
 
-	bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, code);
+	rc = bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, code);
+	if (rc)
+		pr_err("ctl_cmd didn't work with error %d\n", rc);
 }
 
 /* Default nand_select_chip calls cmd_ctrl, which is not used in BCM4706 */
-- 
2.42.0.windows.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
