Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88131C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 22:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H4YOgKQVwWW8sDVqb0RiRbtGMEKF3qbC1YeYm6NM9iE=; b=NbBA0c33Rz8n5I
	4uwDGfeJWLeSxVikleGlP5Pan/6k2qYuIE2cISkNQpmjm9IuvD+J4w2LDp/WdQowYMF57tJ2yxcWb
	M2DJS4VGBKWIiFXyTHEUnFgIrLcho7KcW78cul8HTTf/bvnTgZ/FOfgsav+fUW4upiexD6ACwsEyf
	ezzxI3Ygc/UmDt6qOD99T5tr6pyf0sAzRcdl0Hk+BKZpclIDySdYy/wu5wzkm3tWP8J0lAEqnfQ0H
	CKaz48L3QDJsmRqD75G1PdlALoLJI/pJ3hSjGd7W+FmZl0LhVmqzLaQNB5B24PaUS8LBFgc9zFyjl
	kswTXRyLnOca5Pudvarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCUgF-009fJg-F5; Tue, 25 Jan 2022 22:52:51 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCUgB-009fJE-UK
 for linux-mtd@lists.infradead.org; Tue, 25 Jan 2022 22:52:49 +0000
Received: by mail-pj1-x1034.google.com with SMTP id q63so16788668pja.1
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jan 2022 14:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZWfMgnceP3WNDhbbX8eL5TtVhp988kv+nIi980hVt9M=;
 b=mLs3FRh8AoMm97R70t9K+b92xF7pHWbm9IlS6mJi+fR488otarAvNiw0dF1FthzNYU
 vxHCkvSAQvZJ44eJXWYo/yeXiGD6Ft4twLaB/V87Jqadr39Z57Y0qqf5hACOgtri0M2O
 tzpyNzDQK2scwbqZ4J8GT9S1+jhHHm8inOUqAlTwNfy1KAIVZbHSSTfZ64+VSFY2cKHA
 K5Ey2zr/YzQ3uJmmSwa5yocYkz0Filv2KCfGP7hO65siu95zt0KL2FH35qBA0dRq2On8
 LBDowfH8Eyjf7JFL+ooropxmccKktFN50pbbvLabB7d1vRsBuij3rpDDS5OpNEDz8JVS
 /CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZWfMgnceP3WNDhbbX8eL5TtVhp988kv+nIi980hVt9M=;
 b=unAhbzByNGsUpzNNzDg1/52Uki8CkFtdnp8l0K/nrUxHjIWsD7sUXhAfMzk0pwQB/i
 3uXa4Tej72+rSzxE+uSDFtYvC38dzL5cexqioexduEGSqapJ27ruAWBd3nhkFXIAnIE9
 OMll9eJ+ZEjnGk2Q17yRntN1CM/6caeROBOjT/ZuREwPi+OMJiCrw4/gAcReVIZkkouH
 ZLMOxjjgIczXcAdd7SUvGhy+zVNG2mRho/JaZ2xNbM/ueCocQT8xqFrLzEjajxrd6VEu
 BDhOfj3JS/m8X8eMDWVmbMuiY6Pfcb6joQwdqDCwW/S0NnRCYvS0xdx621wVvG8JSrQx
 RB2w==
X-Gm-Message-State: AOAM533rpKg2HRr8sguY+YmLCtzD+qK3krW0Voz8zINEUrZqo9utW8nX
 GQltYvTFQNp40UD/W6EJLYh3+GthlGw=
X-Google-Smtp-Source: ABdhPJwqxRDRTRsp6A8LruKcke8RE+wvSNE+TXzWM9Mm8YCSFHd1tBRXIYzPjoqOnDHoY3H70+IS6g==
X-Received: by 2002:a17:902:6bc9:b0:149:fdf1:f031 with SMTP id
 m9-20020a1709026bc900b00149fdf1f031mr20329013plt.58.1643151166761; 
 Tue, 25 Jan 2022 14:52:46 -0800 (PST)
Received: from 7YHHR73.igp.broadcom.net (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id me4sm1449899pjb.26.2022.01.25.14.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 14:52:46 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, kernel test robot <lkp@intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: brcmnand: Fix sparse warnings in bcma_nand
Date: Tue, 25 Jan 2022 14:52:43 -0800
Message-Id: <20220125225243.15201-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_145248_001173_BCD98818 
X-CRM114-Status: GOOD (  12.34  )
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

sparse was unhappy about the way we woulc call cpu_to_be32/be32_to_cpu,
apply the appropriate casting to silence the warnings.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/ZNHPJFYLO64EGI5QUT7HZ63J7O5J2G7N/
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/bcma_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/bcma_nand.c b/drivers/mtd/nand/raw/brcmnand/bcma_nand.c
index d7c62988c452..dd27977919fb 100644
--- a/drivers/mtd/nand/raw/brcmnand/bcma_nand.c
+++ b/drivers/mtd/nand/raw/brcmnand/bcma_nand.c
@@ -58,7 +58,7 @@ static u32 brcmnand_bcma_read_reg(struct brcmnand_soc *soc, u32 offset)
 
 	/* Swap if necessary */
 	if (brcmnand_bcma_needs_swapping(offset))
-		val = be32_to_cpu(val);
+		val = be32_to_cpu((__force __be32)val);
 	return val;
 }
 
@@ -75,7 +75,7 @@ static void brcmnand_bcma_write_reg(struct brcmnand_soc *soc, u32 val,
 
 	/* Swap if necessary */
 	if (brcmnand_bcma_needs_swapping(offset))
-		val = cpu_to_be32(val);
+		val = (__force u32)cpu_to_be32(val);
 
 	bcma_cc_write32(sc->cc, offset, val);
 }
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
