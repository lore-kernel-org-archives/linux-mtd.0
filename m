Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0F0ECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 06:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bdIZeena8PCDwACo9gR+PBwoamgZncvNRWH5o3N8HxE=; b=ZOjrMHNPt0+nOg
	FDThKxoSBEZaSCy1SiZN8/vmNpoItXjmd3Ih1Rb26eAOzhVgAg+BuOSa9WjKLEw6lyXUfc5IPBRy5
	Oc3u81pY6CXqpID2/45vCBR7Gx1xHX66MIQktXdUatGXIfv7gc2FXb5Ywk9tSGmiZVsrqbdORY8aZ
	IBRVEoVzu0pH4qNvYcC4+j3INhTqP0HO/KvHKTvikpgaGznUXfzsm205P0v21Tga/fVMHjhqq3U3A
	fwV1RgNbOEO9QehHf930aBC0EWv4wXU/Jpk9uEN1grm3ayjG7G4jqZ7872jqIQFzwqBe2YH3YLby7
	/ptlXqALiuP43491JeyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5sc-00CXuo-0I; Mon, 05 Sep 2022 06:46:46 +0000
Received: from mail-m973.mail.163.com ([123.126.97.3])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5fU-00CICM-L7
	for linux-mtd@lists.infradead.org; Mon, 05 Sep 2022 06:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=56QwR
	QkLZn5ZFYd4Q2aRadVIzGx++uGfkoHnHFr0I70=; b=XWNXelXe3Of2F7afarMP9
	fafQ9z07T/7qTwyRqm9yAOKP5dxvPQ9pp1fNC0PT42+vdQJ2hWBhY9dMRtyICSl+
	x7iWofPRq7WkhdsgJf4y2xHL6jd+fDVmzvtq42NWlymDFzEt5UMrwbb2Cy35yVnL
	yUWUTofnjWv+m+9V3B2CJA=
Received: from localhost.localdomain (unknown [116.128.244.169])
	by smtp3 (Coremail) with SMTP id G9xpCgDnL1QJmBVjG_YAbA--.31732S2;
	Mon, 05 Sep 2022 14:32:43 +0800 (CST)
From: Jiangshan Yi <13667453960@163.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH] mtd: rawnand: fix spelling typo in comment
Date: Mon,  5 Sep 2022 14:32:32 +0800
Message-Id: <20220905063232.1830197-1-13667453960@163.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CM-TRANSID: G9xpCgDnL1QJmBVjG_YAbA--.31732S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrury7Jr47ZFy5GFWfCrWDCFg_yoWftrb_W3
	W7AryvkrWqyF109rn3Crs3A3y5ta1Ygr1kXrn8Zr43Jw43uw4UX3yDJr1ftw1jkr48tF15
	Wa43t3s3Xw1ktjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1GNtDUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: bprtllyxuvjmiwq6il2tof0z/1tbiyAtz+1p7HmmGDQAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_233314_138524_DDD7BC30 
X-CRM114-Status: UNSURE (   9.30  )
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

From: Jiangshan Yi <yijiangshan@kylinos.cn>

Fix spelling typo in comment.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
index 8bb17c5a66c3..6487dfc64258 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
@@ -14,7 +14,7 @@
 #include <linux/bcma/bcma.h>
 
 /* Broadcom uses 1'000'000 but it seems to be too many. Tests on WNDR4500 has
- * shown ~1000 retries as maxiumum. */
+ * shown ~1000 retries as maximum. */
 #define NFLASH_READY_RETRIES		10000
 
 #define NFLASH_SECTOR_SIZE		512
-- 
2.27.0


No virus found
		Checked by Hillstone Network AntiVirus


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
