Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA27C001DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 07:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PUozmLOYTRamtLL7Qp9XTAOSou0doH59TJwbiMhoKG4=; b=CwwY2+chrHBYO/
	mLUd70DrWhNfXqgCeIbgYq14C2kxq3sSgeMCV8sw9uEUTty7gqv0ivK30u7tO9KVhrb+79Nb32ZPQ
	4dTlpjsuvDAJ/pvdF5ddLRhnJCQx0cpH7pg/D8GIkHtJZGlV9f/R3QOE5rkH+cRMZ8RkzE8wR0S27
	o6NfHjxQ9HT84/xK+DbOzdeXOaeFHJaqIpZDagBXDdV+ksTKA8+sPFE2WJ6Va6PhX3IPPoP2f4og0
	QFaz4BkVlZ1Qr1ESAllysoemohvSTAwWJEMsnP//bhywQV+XGUDFEvkdDrvceqtAp0k8CpBJJuKKr
	cP32Kh9kTBiHA0YrGdAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRphD-00Bpgz-1o;
	Fri, 04 Aug 2023 07:58:03 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRphA-00BpgR-2q
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 07:58:02 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RHJ1l0J5nzVjxQ;
	Fri,  4 Aug 2023 15:56:11 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 15:57:57 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <linux-mtd@lists.infradead.org>, Brian Norris
	<computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] mtd: rawnand: brcmnand: Remove unnecessary ternary operators
Date: Fri, 4 Aug 2023 15:57:17 +0800
Message-ID: <20230804075717.3336709-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_005801_096201_855CD1E9 
X-CRM114-Status: UNSURE (   9.42  )
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

Ther are a little ternary operators, the true or false judgement
of which is unnecessary in C language semantics.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 03764b589ec5..dc66590eb4cf 100644
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
+		err = sts <= 0;
 	}
 
 	return err;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
