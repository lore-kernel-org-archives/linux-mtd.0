Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622B0C6FD1D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 07:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t33fCIWiizG30SZ2LVL3v+Ya5rO133ZhVg1/1Y4j7Bs=; b=lcjAKxYbZ7DPOB
	q2PslxrQaX3O1qd9s6CcemhPNNC6NJyEvJt1WLRjGo0kp3kxAR1HZP9CuglaXk/+Ct1WhIQZVlEHL
	FULuTn7UCvIBCw+ZB89lmA7I5kunDuXZJ+p5rgRQWJlVfocIBVJRerl+oP9fMr+dB5jGplRUkza/v
	RiPrkLgRn42L0IokAf2XuAaycO+iFdPC/uh3ECJ71hWViI9L/KIExwXgYUVHAprSKwFP1Vw5PC3ZV
	okBArMyJBHlYvnC2PFfMgr3f2TrPAXwpBGpHOJUtmxMVr9NktVVQ+Zb1PB5j2nk2QKwVbPXEqVn4h
	D/nQc3QbPWZkZH0E4E8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd4hs-001Jjq-2E;
	Fri, 17 Mar 2023 07:40:56 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd4hp-001Jie-35
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 07:40:55 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Ve20DQs_1679038842;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0Ve20DQs_1679038842)
          by smtp.aliyun-inc.com;
          Fri, 17 Mar 2023 15:40:47 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] mtd: rawnand: mxc: Remove the unused function is_imx51_nfc()
Date: Fri, 17 Mar 2023 15:40:41 +0800
Message-Id: <20230317074041.115036-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_004054_182916_01C3B870 
X-CRM114-Status: UNSURE (   5.57  )
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

The function is_imx51_nfc is defined in the mxc_nand.c file, but not
called elsewhere, so remove this unused function.

drivers/mtd/nand/raw/mxc_nand.c:1602:19: warning: unused function 'is_imx51_nfc'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4559
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index f6c96341b896..16d795c25609 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1599,11 +1599,6 @@ static inline int is_imx25_nfc(struct mxc_nand_host *host)
 	return host->devtype_data == &imx25_nand_devtype_data;
 }
 
-static inline int is_imx51_nfc(struct mxc_nand_host *host)
-{
-	return host->devtype_data == &imx51_nand_devtype_data;
-}
-
 static inline int is_imx53_nfc(struct mxc_nand_host *host)
 {
 	return host->devtype_data == &imx53_nand_devtype_data;
-- 
2.20.1.7.g153144c


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
