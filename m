Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213ECC001DB
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Aug 2023 05:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sn4cbd6pMzChiNl+QlqPxQ+GLFfwTK2xARj1g8s0MRQ=; b=X+4po3UDNBiqdt
	owD+bS4CHzHUG/POtt819DIrPKFEULHBt9rtsMTnt7xTXkSckVeA7oUPy9Scypn+8EEW4ccv/Htii
	LoEpCTkQukjt89Fw/EEOfn6BtaXybY3rKUGiSIY7wsP9FfNUAXqyGHDzLKMeYlpa0392UpQXumWdV
	WowuMAHN9Vu04GkWxkabfuOAGSTX1asZkgELrSvPu+uIGlHOkaCKV8p0j6ZEKlSxph88lOBupiNgS
	45VN5Ov5DZaEEuyEFCOiM99Sur8twJkvHeOnh+3rKepB2UbQ3sWelgK+FmVsVVR5v+UWjx+kf2jNm
	dUL4cWnNSeeGnSr2ZR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS9R4-00Di69-2S;
	Sat, 05 Aug 2023 05:02:42 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS9R1-00Di4r-2U
	for linux-mtd@lists.infradead.org;
	Sat, 05 Aug 2023 05:02:41 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RHr3V16dRz1Z1Vy;
	Sat,  5 Aug 2023 12:59:34 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 5 Aug
 2023 13:02:19 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <linux-mtd@lists.infradead.org>, Brian Norris
	<computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2] mtd: rawnand: Propagate error values for brcmstb_nand_wait_for_completion()
Date: Sat, 5 Aug 2023 13:01:46 +0800
Message-ID: <20230805050146.1858880-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_220240_038383_6F7E2203 
X-CRM114-Status: GOOD (  11.84  )
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

As bcmnand_ctrl_poll_status() return negative errno, and the < 0
case does not exist for wait_for_completion_timeout(), so return
-ETIMEDOUT if sts = 0 and zero otherwise. It is not sensible for
brcmstb_nand_wait_for_completion() to return bool value, change it
to int to propagate the error.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
v2:
- Update the commit title and message.
- Propagate the error instead of upon error.
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 03764b589ec5..25e5b15fbd6a 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1653,12 +1653,12 @@ static void brcmnand_cmd_ctrl(struct nand_chip *chip, int dat,
 	/* intentionally left blank */
 }
 
-static bool brcmstb_nand_wait_for_completion(struct nand_chip *chip)
+static int brcmstb_nand_wait_for_completion(struct nand_chip *chip)
 {
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_controller *ctrl = host->ctrl;
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	bool err = false;
+	int err = 0;
 	int sts;
 
 	if (mtd->oops_panic_write || ctrl->irq < 0) {
@@ -1666,13 +1666,14 @@ static bool brcmstb_nand_wait_for_completion(struct nand_chip *chip)
 		disable_ctrl_irqs(ctrl);
 		sts = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY,
 					       NAND_CTRL_RDY, 0);
-		err = (sts < 0) ? true : false;
+		err = sts;
 	} else {
 		unsigned long timeo = msecs_to_jiffies(
 						NAND_POLL_STATUS_TIMEOUT_MS);
 		/* wait for completion interrupt */
 		sts = wait_for_completion_timeout(&ctrl->done, timeo);
-		err = (sts <= 0) ? true : false;
+		if (!sts)
+			err = -ETIMEDOUT;
 	}
 
 	return err;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
