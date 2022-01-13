Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB87C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jan 2022 18:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8Kd+jcwsWQ1u49HAVJm3IOVY3RLlD/Vd2hZnzQrHmEc=; b=E5rHhEFHp+hwML
	ITL6XYIZ7+BFBjD3p1HRXcnF0KsyFxDOZlUzpJibjuXR5JH3PoSi47QVy7RlnqKwpcrl9Oi44tHBv
	eJ9Z/J5VWiel8FgfDfQtCP3zhSN7nw38qRwT95/XatflMRl+vNAipf9p89JiIiYH4G1bhiOS9EoeJ
	m2UKmndz6UQzTStJdCxVnu62MgY1YkNQ1L0YTimynAtIhNi3tAKvUYy4rudim8w1dLrhAYbqUwzrx
	ex7cK0GKRohPW3aIeb+f8BZk2TWmFuiG+74FqUtHEFny78ZV6WR38y4Cy3kDvJ3c+CqZOP7iCgcAE
	edYqRYlXm0wDDPFpUjtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n855i-006tCC-6c; Thu, 13 Jan 2022 18:44:54 +0000
Received: from relay01.th.seeweb.it ([2001:4b7a:2000:18::162])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n855e-006t7y-S1
 for linux-mtd@lists.infradead.org; Thu, 13 Jan 2022 18:44:52 +0000
Received: from localhost.localdomain (83.6.165.232.neoplus.adsl.tpnet.pl
 [83.6.165.232])
 by m-r1.th.seeweb.it (Postfix) with ESMTPA id 103461F5EB;
 Thu, 13 Jan 2022 19:44:34 +0100 (CET)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: ~postmarketos/upstreaming@lists.sr.ht
Cc: martin.botka@somainline.org, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, jamipkettunen@somainline.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: raw: qcom_nandc: Don't clear_bam_transaction on
 READID
Date: Thu, 13 Jan 2022 19:44:26 +0100
Message-Id: <20220113184427.2259509-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_104451_113049_85D54F2E 
X-CRM114-Status: UNSURE (   9.95  )
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

While I have absolutely 0 idea why and how, running clear_bam_transaction
when READID is issued makes the DMA totally clog up and refuse to function
at all on mdm9607. In fact, it is so bad that all the data gets garbled
and after a short while in the nand probe flow, the CPU decides that
sepuku is the only option.

Removing _READID from the if condition makes it work like a charm, I can
read data and mount partitions without a problem.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
This is totally just an observation which took me an inhumane amount of
debug prints to find.. perhaps there's a better reason behind this, but
I can't seem to find any answers.. Therefore, this is a BIG RFC!


 drivers/mtd/nand/raw/qcom_nandc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 04e6f7b26706..506006ccdf1a 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1459,8 +1459,7 @@ static void pre_command(struct qcom_nand_host *host, int command)
 
 	clear_read_regs(nandc);
 
-	if (command == NAND_CMD_RESET || command == NAND_CMD_READID ||
-	    command == NAND_CMD_PARAM || command == NAND_CMD_ERASE1)
+	if (command == NAND_CMD_RESET || command == NAND_CMD_PARAM || command == NAND_CMD_ERASE1)
 		clear_bam_transaction(nandc);
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
