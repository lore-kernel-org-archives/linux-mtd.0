Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DC4C4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfUSRj11rifPc/KR8Y/+pEUZVrf5sQtxneXwWEFTkxI=; b=o9fIhLGZsF+NZg
	ZKnyJr+7H/sP+8h6EL3IwfjEdMDJ7Da4mNBNROtB0KNjath9nuSkcvmHUYlsJRPI12FtFFGsd0Hss
	twDjT69xMLot0mfRT5tdIL9ONLTAZRGY7hNz592VDtVDRqO3aNfMef4ax/svtZxr+k1XA0YsD6hqC
	fH/5/aTIwNGjhV57/f03ANbOutiJLEv3Y6ijfpsXugeZWtCUPDT7fE2qnlhKoMwwE+g2T3Yn6IAgY
	I5tjJcShjqg0zebZjkmX+QMK6f5AshLiMkVBfpwneFCfGJAlokjzar1an1egqKZ/tzyBp+lOSqtIM
	HjiWxxrzjSQtVrA4qlww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16W7-00GhrL-OS; Fri, 02 Dec 2022 13:55:51 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16W2-00Ghot-DH
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2022 13:55:48 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id o12so3443610qvn.3
        for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2022 05:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGjb7Uqfw2TGFRhH8/MDvnTU61at8sAfSWXXepkn37Q=;
        b=uiLT3I4vgcsnSV/JwiTu0ZuYVwmaObX0mKCt6uVP215+MyIgPPlR2p9kLRQalYp964
         OHyPYDm2UevA8Pu+qA3v5CKAU73uTqt2Zw7EgPb0Dq4+5T1oN1/m6pM5qxL3g8sLffh4
         mlnti0ZmLHEIiM0gEDUEnnizIGBFlm792Z/mysV4DJQERCfG62ZlLxY5NngJXoq637IV
         m3fyj9RIrWiuCHfgDkZoy/9/aDnpwl6H36vS2gVE937kEq2AfDo3YDlY5ZFUoxR4YOD2
         ZUVedzGjYndMrQXC4xlTwEyG0sM8S/XeE+RRPkSBICPEDjZpgwxRGFK75EonDG21KNlA
         l5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGjb7Uqfw2TGFRhH8/MDvnTU61at8sAfSWXXepkn37Q=;
        b=WMlKWafY/Htou5zyJef8kcjiEjgqP15XVByUxldavDMaM/I7IJzthpzq7FiFgZf5j7
         SdOvHulSJ5lRtNKSSIkxuSmrHGPWKHY+xgxzVBrmzNiUHp0Fs0pWtmAWyNe2zojvDkiz
         xXHdlP1wqh1f9QILL/UIRC2i1XJYjL800Ut//hQioL7mvMWTl+OW/62NmpHXFlpFG3Cp
         nPByKxMxmp+v99GnqArgO4ziHrxa744e0ypGhwDiyTDJg35LWI6bmR4/rEuZ2Mom+syR
         rsesmUP1F69BbEU9VdHFiHl2ydsBm/BVcX+D5JyFaeuJikeGzIwt9SEDgAtPsR0FBivU
         uKmA==
X-Gm-Message-State: ANoB5pltwB/F/Zl9ASPLrTI1UScN9A5k7Pj4HA32JZAwnsrGM1+JUtE0
	R4a8qnT2FfXPQMd0qPSnvEwZUg==
X-Google-Smtp-Source: AA0mqf6XvaeEobvBP2i9JJSMxX4HladcBggX2v4svUzodqC/5Pwl4RQH84EVyVDtnyE1B3eGwqWNdQ==
X-Received: by 2002:ad4:44b4:0:b0:4c6:d91c:441f with SMTP id n20-20020ad444b4000000b004c6d91c441fmr37090751qvt.118.1669989345678;
        Fri, 02 Dec 2022 05:55:45 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id x1-20020ac84d41000000b0039a610a04b1sm4122237qtv.37.2022.12.02.05.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 05:55:45 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: 
Cc: nathan.morrison@timesys.com,
	greg.malysa@timesys.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/3] mtd: spi-nor: Add additional octal-mode page program flags to be checked during SFDP 4BAIT parsing
Date: Fri,  2 Dec 2022 08:55:38 -0500
Message-Id: <20221202135539.271936-3-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221202135539.271936-1-nathan.morrison@timesys.com>
References: <20221202135539.271936-1-nathan.morrison@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_055546_465301_B30F3016 
X-CRM114-Status: GOOD (  10.36  )
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

This adds some support for automatically searching a chip's SFDP table for:

program commands: 1S-1S-8S, 1S-8S-8S

Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
---
 drivers/mtd/spi-nor/sfdp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index e4e87815ba94..e1b7547bf81e 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1089,6 +1089,14 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_4_4],
 					SPINOR_OP_PP_1_4_4_4B,
 					SNOR_PROTO_1_4_4);
+	if (pp_hwcaps & SNOR_HWCAPS_PP_1_1_8)
+		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_1_8],
+					SPINOR_OP_PP_1_1_8_4B,
+					SNOR_PROTO_1_1_8);
+	if (pp_hwcaps & SNOR_HWCAPS_PP_1_8_8)
+		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_8_8],
+					SPINOR_OP_PP_1_8_8_4B,
+					SNOR_PROTO_1_8_8);
 
 	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
 		if (erase_mask & BIT(i))
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
