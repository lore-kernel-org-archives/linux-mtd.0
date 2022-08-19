Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243C0C00140
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Aug 2022 01:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ijgfKXi5RYKsYt6T+vZmNrAP7i6Jn83EVdM82J3fPu4=; b=sSZrHXeR/60IFm
	8E+5JnDz+0ma9RxDaFB8NaL/UhYjJjpSZgUaDquktcqM1wYY0RoHGfVI17if3ThGNfgFOrgoFx0iV
	M61NJdWGUTuuMH58GGiFYJcTHaju/6+DcUIgBXfD23bC3+EN0u6Zw/ub+nmRCnnIqjdVJBRupqlId
	EZUAWbgdRbd/Ip1hm/3nEzovmTScPFGPrlSAM1i8Vjw50BLLGqZuzrxxHVJ+c9Uh/QnDyOPA1xfoi
	T0zkXnQ93Qtbb4r1SErLEO6bfScNKUpWeMSOtOB1vV6GiPQ6W7H8c6FNq7soyIv23Z3je69TRbTKB
	R9QEC2iBN7SB7Pgj8kdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOqg0-00D7Ma-TH; Fri, 19 Aug 2022 01:19:56 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOqfx-00D72m-2O
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2022 01:19:55 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4M83k80QwHzlW7K;
	Fri, 19 Aug 2022 09:16:32 +0800 (CST)
Received: from kwepemm600015.china.huawei.com (7.193.23.52) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 19 Aug 2022 09:19:38 +0800
Received: from huawei.com (10.175.101.6) by kwepemm600015.china.huawei.com
 (7.193.23.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 19 Aug
 2022 09:19:37 +0800
From: ChenXiaoSong <chenxiaosong2@huawei.com>
To: <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chenxiaosong2@huawei.com>
Subject: [PATCH] mtd: rawnand: remove misguided comment of nand_get_device()
Date: Fri, 19 Aug 2022 10:18:46 +0800
Message-ID: <20220819021846.2924539-1-chenxiaosong2@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600015.china.huawei.com (7.193.23.52)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_181953_308506_A788075B 
X-CRM114-Status: UNSURE (   6.90  )
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

After commit 8cba323437a4 ("mtd: rawnand: protect access to rawnand devices
while in suspend"), it will wait while in suspend rather than returning
errors. So remove the misguided comment about return value.

Signed-off-by: ChenXiaoSong <chenxiaosong2@huawei.com>
---
 drivers/mtd/nand/raw/nand_base.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 6b67b7dfe7ce..5e99e4c96da4 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -335,8 +335,6 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  * @chip: NAND chip structure
  *
  * Lock the device and its controller for exclusive access
- *
- * Return: -EBUSY if the chip has been suspended, 0 otherwise
  */
 static void nand_get_device(struct nand_chip *chip)
 {
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
