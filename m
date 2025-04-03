Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF39C3600C
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 13:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qZBxV3OGABBEU4UM4H5ABB6f6yARrTKCwGazo1rx7Uo=; b=gdm1+o+8V8c4WM
	2sfvRT2AteTSRai0EPOSUKWJBjcAVumCurA9DFVivk0gru78wkpxYCKNZZ5QdQkRi0u56sIk8tMg/
	SDTkq3YCr73OJ5Jd076osuFOhbt0MQvewGWBrCEZrLcReEvhYI1N3WBPg6yFtDLUtmOrGE7zG37cI
	ksGjnKqeNd29UQ9NlwLS6vaHiBgF53+LdjoPiL88TvQjlhYT6C1uNeeoOmWkF7ZZwcK2bQv0znlOx
	RiOamprLyaxRJtXlkDDCWTia3sBLmZpfETVl8ZPEDWqiTmDMiBeeSNXtvjie/5HCxFVxWsdEclpFL
	Wq9y997s+6zR3Hi094tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0KvL-00000008xhe-2N4G;
	Thu, 03 Apr 2025 13:48:03 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0KvH-00000008xgK-3M0w
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 13:48:02 +0000
Received: from localhost.localdomain (unknown [221.222.48.127])
	by APP-01 (Coremail) with SMTP id qwCowAAHqvqGke5n5ouGBQ--.42939S2;
	Thu, 03 Apr 2025 21:47:52 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] mtd: bcm47xxnflash: Add error handling for bcm47xxnflash_ops_bcm4706_ctl_cmd().
Date: Thu,  3 Apr 2025 21:47:31 +0800
Message-ID: <20250403134731.2054-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAHqvqGke5n5ouGBQ--.42939S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZry3ZF4DCr4kZrW8CFWxJFb_yoWkKFb_GF
	4avr9Fy3yYyw1xZFn5Ar4kA3sIqr4kurnYqwsIyr43G3y3uF18Wa4kZr1Ygr40yF48tF15
	ArWSvF4Fq3WkGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7UUUU
	U==
X-Originating-IP: [221.222.48.127]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwwBA2fuaeJ4fQAAsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_064800_253001_87FFCA4D 
X-CRM114-Status: UNSURE (   9.01  )
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

The bcm47xxnflash_ops_bcm4706_cmd_ctrl() calls
bcm47xxnflash_ops_bcm4706_ctl_cmd() without printing error message. A
proper implementation can be found in bcm47xxnflash_ops_bcm4706_write().

Add error log to the bcm47xxnflash_ops_bcm4706_ctl_cmd() to prevent
selent failure.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
index 6487dfc64258..c89129588bb6 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
@@ -182,7 +182,8 @@ static void bcm47xxnflash_ops_bcm4706_cmd_ctrl(struct nand_chip *nand_chip,
 	if (cmd != NAND_CMD_RESET)
 		code |= NCTL_CSA;
 
-	bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, code);
+	if (bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, code))
+		pr_err("%s ctl_cmd didn't work!\n", __func__);
 }
 
 /* Default nand_select_chip calls cmd_ctrl, which is not used in BCM4706 */
-- 
2.42.0.windows.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
