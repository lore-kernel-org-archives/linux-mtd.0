Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C8DC43334
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jul 2022 11:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nL7an70fuR+zqXUGOnJddxG3voj1yQCbhgFJ+6RZZrU=; b=bMRq36pJecw080
	rBi7BSl+/w0dhZMy7mU4VzNp/xC8rSJJW8I3po6DiYOYxPIyrIykMcj5PTrKf0IkzdxGmvJsZRmHQ
	/eqiVMi59yi1xV+o5QGE/MFey2gB6Rc04MOEvq1YzmU750m4pVgEfd62daExVNv5irHEbop5cKCDA
	8MiZtKhH1W8l0nuGBX6J3ctbfArWcVtXwjmIL+hjgpCneuclGsHRhSli8EnBag+oaPbjMhH2RMx/o
	5+zdsRZzzpFPxf2P+J1UuSfjnouzDGICWK3xtoLu8HExfwsCjqr0hU+vQF0s2hRfmP4iH938cuuTM
	XlGYBb6wFzIchJqNbitw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFw8h-008pcC-Fp; Mon, 25 Jul 2022 11:20:43 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFw8e-008pST-J4
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2022 11:20:42 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LryFD1xMLzjXSS;
	Mon, 25 Jul 2022 19:17:36 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 25 Jul 2022 19:20:09 +0800
Received: from huawei.com (10.67.174.33) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 25 Jul
 2022 19:20:09 +0800
From: "GONG, Ruiqi" <gongruiqi1@huawei.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Naga Sureshkumar Relli
	<nagasure@xilinx.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Wang
 Weiyang" <wangweiyang2@huawei.com>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: [PATCH] mtd: rawnand: arasan: stop using 0 as NULL pointer
Date: Mon, 25 Jul 2022 19:21:07 +0800
Message-ID: <20220725112108.686347-1-gongruiqi1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_042040_843440_7EC818E5 
X-CRM114-Status: UNSURE (   9.09  )
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

Fix the following sparse warnings:

drivers/mtd/nand/raw/arasan-nand-controller.c:918:70: warning: Using plain integer as NULL pointer
drivers/mtd/nand/raw/arasan-nand-controller.c:918:73: warning: Using plain integer as NULL pointer

Signed-off-by: GONG, Ruiqi <gongruiqi1@huawei.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 296fb16c8dc3..ec7e6eeac55f 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -915,7 +915,7 @@ static int anfc_check_op(struct nand_chip *chip,
 			if (instr->ctx.data.len > ANFC_MAX_CHUNK_SIZE)
 				return -ENOTSUPP;
 
-			if (anfc_pkt_len_config(instr->ctx.data.len, 0, 0))
+			if (anfc_pkt_len_config(instr->ctx.data.len, NULL, NULL))
 				return -ENOTSUPP;
 
 			break;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
