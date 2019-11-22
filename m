Return-Path: <SRS0=TlnG=ZO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B430C432C0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2019 12:03:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A1AD20674
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2019 12:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QrXUcsT9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A1AD20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TNME4waj7jajkOrGT6NU65f6HkbNMP85M0BdmVNvi6U=; b=QrXUcsT9A93cfL
	obHVsgcDO95PK39Or4a/JZmDuUA+lXmDO3/jjJh4yt0Rig54gM7CkkRp+5NC9EESZOy85wypwYb3m
	/1E1YtzYaa1/v7oSvFGn85IR1bAVogWsOt5EqNTcWSmtJlENL3YaSTqSKucAv8hrgcEmGKffFejN1
	MJcwDgoPcvwPTqorMvsan5hpseA+BDgR36aDnmevGMTFVvcSVKElixujhNHZWPhvQEVJHw4qJ+iC7
	/H+rq0knB6InXx2rJYGfTkjZnAer7+EMwIc+PTiyAHRc/Xz1+7R7HGfKusGver84CxVcj8sRECapc
	YYOfJvV2lD4QZeaaNQxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iY7ey-0007Ce-Gs; Fri, 22 Nov 2019 12:03:36 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY7ev-0007Bl-3O
 for linux-mtd@lists.infradead.org; Fri, 22 Nov 2019 12:03:35 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D76088106B322F716145;
 Fri, 22 Nov 2019 20:03:19 +0800 (CST)
Received: from localhost.localdomain (10.90.53.225) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Fri, 22 Nov 2019 20:03:10 +0800
From: Chen Wandun <chenwandun@huawei.com>
To: <kyungmin.park@samsung.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] nand: onenand: samsung: remove variable 'tmp' set but not used
Date: Fri, 22 Nov 2019 20:08:54 +0800
Message-ID: <1574424534-141265-1-git-send-email-chenwandun@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191122_040333_760017_F7670818 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: chenwandun@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes gcc '-Wunused-but-set-variable' warning:
drivers/mtd/nand/onenand/samsung_mtd.c: In function s3c_onenand_check_lock_status:
drivers/mtd/nand/onenand/samsung_mtd.c:731:6: warning: variable tmp set but not used [-Wunused-but-set-variable]

Signed-off-by: Chen Wandun <chenwandun@huawei.com>
---
 drivers/mtd/nand/onenand/samsung_mtd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/onenand/samsung_mtd.c b/drivers/mtd/nand/onenand/samsung_mtd.c
index 55e5536..3573b12 100644
--- a/drivers/mtd/nand/onenand/samsung_mtd.c
+++ b/drivers/mtd/nand/onenand/samsung_mtd.c
@@ -728,13 +728,12 @@ static void s3c_onenand_check_lock_status(struct mtd_info *mtd)
 	struct onenand_chip *this = mtd->priv;
 	struct device *dev = &onenand->pdev->dev;
 	unsigned int block, end;
-	int tmp;
 
 	end = this->chipsize >> this->erase_shift;
 
 	for (block = 0; block < end; block++) {
 		unsigned int mem_addr = onenand->mem_addr(block, 0, 0);
-		tmp = s3c_read_cmd(CMD_MAP_01(onenand, mem_addr));
+		s3c_read_cmd(CMD_MAP_01(onenand, mem_addr));
 
 		if (s3c_read_reg(INT_ERR_STAT_OFFSET) & LOCKED_BLK) {
 			dev_err(dev, "block %d is write-protected!\n", block);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
