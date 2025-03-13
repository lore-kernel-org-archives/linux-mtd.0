Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19C6C28B2E
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7yhuBqWrZrbYGRsD6IY2I2fgrq9KKfu8201CiV87Oc8=; b=HSZ67LNhJSfYbg
	G87VlKt0FLQwuLZzyA+IkjwjfaVBdLM5ZbFnSXOyJQjOBZKXiNQjo6E3HQJw241vy8BlIzpzco64l
	CPPSz0NtgvkCHP6tGH3LOs23RMFWEIgC55VJnTnR9oWkEv+4ElNQCPCfkIOKt2MPZ/z3trn7PSheU
	VVOyazaRUHXaY5twYiM0Cdkq2A9TqyfeH9SzgOzprQo8rgCyR+ozbiXjyYejzdNzS4ccQq8HBBfZ1
	gJShIBn02M3vJDUI3b8JbPSQ5OseQv7OQ2IkrVMYMsrU0tT0p+lR9tjd+p7QtkiyPimxgBBz81H1Y
	0hA+0JADfzLcidBGE3jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsfKe-0000000AnWN-0bXi;
	Thu, 13 Mar 2025 09:58:28 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsfKQ-0000000AnRi-10ow
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 09:58:16 +0000
X-UUID: a6f5324efff111efa216b1d71e6e1362-20250313
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:e2b2fb55-5bd7-4a50-bc8f-f02c2a35492d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:39939feb8854b0a194969a4e76a66e63,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a6f5324efff111efa216b1d71e6e1362-20250313
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1315595742; Thu, 13 Mar 2025 17:58:02 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 4C2B0E008902;
	Thu, 13 Mar 2025 17:58:02 +0800 (CST)
X-ns-mid: postfix-67D2AC2A-121602164
Received: from kylin-pc.. (unknown [172.25.130.133])
	by mail.kylinos.cn (NSMail) with ESMTPA id 8E0A8E008901;
	Thu, 13 Mar 2025 17:57:59 +0800 (CST)
From: Zhang Heng <zhangheng@kylinos.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	han.xu@nxp.com,
	hs@denx.de,
	david@protonic.nl,
	jre@pengutronix.de
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 1/2] mtd: rawnand: gpmi: Use str_enabled_disabled() in gpmi_nand_attach_chip()
Date: Thu, 13 Mar 2025 17:57:55 +0800
Message-ID: <20250313095756.945890-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_025814_634016_0F3A3DD4 
X-CRM114-Status: UNSURE (   7.01  )
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

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index d76802944453..f4e68008ea03 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -17,6 +17,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/dma/mxs-dma.h>
+#include <linux/string_choices.h>
 #include "gpmi-nand.h"
 #include "gpmi-regs.h"
 #include "bch-regs.h"
@@ -2319,8 +2320,8 @@ static int gpmi_nand_attach_chip(struct nand_chip *chip)
 					  "fsl,no-blockmark-swap"))
 			this->swap_block_mark = false;
 	}
-	dev_dbg(this->dev, "Blockmark swapping %sabled\n",
-		this->swap_block_mark ? "en" : "dis");
+	dev_dbg(this->dev, "Blockmark swapping %s\n",
+		str_enabled_disabled(this->swap_block_mark));
 
 	ret = gpmi_init_last(this);
 	if (ret)
-- 
2.47.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
