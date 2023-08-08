Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E3FEB64DD
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 03:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CLPhTR1sYkbuzbUK8CSal4KMkDpwG/fDWCzdEEWvFXM=; b=RzyCPeTeyNRI9J
	uJ+kOaC9sVHAAShwOCZVrmbVeAZyGFJ0zPdXMyqRN9ZlncgKUc8ecJGcSgyvy0+IO8Iatq+uzxKE7
	+M/Rjx3DyFFuBu64CUAUbkKEyqLJrhKGRAFLK5gZYPoLX6MHwDtfoMOw2p8KOL3RHQ5m0HR3h4GqU
	J2j9+1AnawUl2IxGTfLiPm7zJBN9isxunptVYnBzrpS/I8wb7pSPoG27i3D7cKpk+gONYsJeNkpAq
	Q1G0EtLVe9tG//yDoCdSq2SguVqczIcQqsSIx/ocQoPmcm+w2v1ypMYTr35IZLr31ythXOwr+dPMo
	KxbOk4K6qXJ5RYvyhh0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTDQQ-001dlF-0j;
	Tue, 08 Aug 2023 03:30:26 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTDQN-001dkE-14
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 03:30:24 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RKdsr0bf5z1Z1X5;
	Tue,  8 Aug 2023 11:27:28 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 8 Aug
 2023 11:30:16 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <linux-mtd@lists.infradead.org>, Brian Norris
	<computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v3 RESEND] mtd: rawnand: Propagate error and simplify ternary operators for brcmstb_nand_wait_for_completion()
Date: Tue, 8 Aug 2023 11:29:43 +0800
Message-ID: <20230808032943.3890545-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_203023_541351_D633E5AB 
X-CRM114-Status: GOOD (  11.66  )
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

As bcmnand_ctrl_poll_status() return negative errno, so return true if
sts < 0. The < 0 case does not exist for wait_for_completion_timeout(),
so return true if sts = 0 and zero otherwise. Both of the true return
of them can be considered as a -ETIMEDOUT err, so return -ETIMEDOUT
if err is true to propagate err from its caller.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
v3:
- Update the commit title and message.
- Do not change the return type from bool to int.
- Return -ETIMEDOUT if err is true.
v2:
- Update the commit title and message.
- Propagate the error instead of upon error.
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 03764b589ec5..440bef477930 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1666,13 +1666,13 @@ static bool brcmstb_nand_wait_for_completion(struct nand_chip *chip)
 		disable_ctrl_irqs(ctrl);
 		sts = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY,
 					       NAND_CTRL_RDY, 0);
-		err = (sts < 0) ? true : false;
+		err = sts < 0;
 	} else {
 		unsigned long timeo = msecs_to_jiffies(
 						NAND_POLL_STATUS_TIMEOUT_MS);
 		/* wait for completion interrupt */
 		sts = wait_for_completion_timeout(&ctrl->done, timeo);
-		err = (sts <= 0) ? true : false;
+		err = !sts;
 	}
 
 	return err;
@@ -1688,6 +1688,7 @@ static int brcmnand_waitfunc(struct nand_chip *chip)
 	if (ctrl->cmd_pending)
 		err = brcmstb_nand_wait_for_completion(chip);
 
+	ctrl->cmd_pending = 0;
 	if (err) {
 		u32 cmd = brcmnand_read_reg(ctrl, BRCMNAND_CMD_START)
 					>> brcmnand_cmd_shift(ctrl);
@@ -1696,8 +1697,8 @@ static int brcmnand_waitfunc(struct nand_chip *chip)
 			"timeout waiting for command %#02x\n", cmd);
 		dev_err_ratelimited(ctrl->dev, "intfc status %08x\n",
 			brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS));
+		return -ETIMEDOUT;
 	}
-	ctrl->cmd_pending = 0;
 	return brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS) &
 				 INTFC_FLASH_STATUS;
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
