Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F82C433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:52:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED600613D6
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED600613D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M3+l5Om2SfF2fXcUzNMROQKPyFB8Bh2hhBGG082pORQ=; b=ZmCJOIjODlwGyzyqQ1NFdH4Wn
	4jB65fEU9ZL4OUPMRLoZ+F5TGpqKv0JHcRkBl8g11HMOeNBOY79R9jSl2DEW2yNf51BxPhYn7YsJD
	YPQqxNNDEcWbGJt/TWlkC8WSVmndrNi+c9gxL+HE9U1v53Ghrw7jok+RpViqcOdSY0FM/YNVGgLal
	OMmEnEQ3i2wLK1GT4uVW91n9cE4ME16QkxBIqCxTplF0YbkQ6tNgh9duZTGjIRO4RAtjtne0h+qVG
	4BWAIi1hSXvdDZq3m5Fpi4LoM0r0Qxy79BWqX91cjYWpKefIFP2LR1xhIrAWIdbHXP+L71S1+T7rb
	wT47PSOQA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePRB-002R57-Vg; Wed, 05 May 2021 21:52:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDc-002Oo7-Dk
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=u6dUEWChTuMOIPDfhDbRNh7s1cM78mpMS4t/83J2FgQ=; b=mdBYlCQbVzoaIdx9bWKlGc8czH
 /rVL3jUMpGTGqyoysk63kM6Ap4qymXdKTysu48eamf5VZMaEdXfWxs5QwfFut0aTJa/07gpoYjReS
 PT1JxuvgzNJPekZmbBihvjDj4feJbxyp0ThRlE3OH2NXrshzM3B48XzlvudV1VAr2A7JwPiKrHrxb
 1w7jxcgP9zSNDVzMSDfWnxH1hapKBVaEYOTJn8HzaTE4E4iT0TvN2fcIjsFeba/VU8Qk//I9msEU3
 Lic01vifaj2cTGPVw0fj86MrV5iiGnGIgw+vvcgvInEKR9MN8VYmczSj3DBvohTMvpyEuaoIW2uE2
 4jdbxTww==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDZ-005Ifh-Uy
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:07 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C58171BF206;
 Wed,  5 May 2021 21:38:03 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 12/22] mtd: rawnand: Avoid accessing NV-DDR timings from
 legacy code
Date: Wed,  5 May 2021 23:37:40 +0200
Message-Id: <20210505213750.257417-13-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143806_154944_15012D5C 
X-CRM114-Status: GOOD (  11.64  )
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

Legacy code should not benefit from newer features, especially in
helpers that have been deprecated for a very long time. People who want
NV-DDR support must migrate their driver to the ->exec_op() API.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
index eccc18b266d5..743792edf98d 100644
--- a/drivers/mtd/nand/raw/nand_legacy.c
+++ b/drivers/mtd/nand/raw/nand_legacy.c
@@ -369,7 +369,7 @@ static void nand_ccs_delay(struct nand_chip *chip)
 	 * Wait tCCS_min if it is correctly defined, otherwise wait 500ns
 	 * (which should be safe for all NANDs).
 	 */
-	if (nand_controller_can_setup_interface(chip))
+	if (!IS_ERR(sdr) && nand_controller_can_setup_interface(chip))
 		ndelay(sdr->tCCS_min / 1000);
 	else
 		ndelay(500);
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
