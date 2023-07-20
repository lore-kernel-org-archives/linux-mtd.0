Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BBFEB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 07:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ziPLbJTRCjmVjV7Z4dSiHyLgYAL7pNA1i9dyNMS/6s=; b=WPPWEjMK2I3/B+
	lKXvxJbRZrErqfoNoUJD7ujWEHqDIREYDuNyGBSS7VNMCaUKoH/LYLEC41fRNA8mbTnevA7iqELoX
	+jg1MxTuV80gqlsNF8rG+sUbff4FfZz/Ol5poWsJqh9U3bGMnUPKrjKPn1TPsFQO1F8i3b9pXm/4Y
	wvCsnjEYtX67gQFK2XcidYUlZwaI59F0ytD6PvWb+Nd84hv4A12M2w5rPoife4WRE0G0KZI3YoThn
	XbM5s944PSPAFJyGvNYD2uqB/kUzHeJUYqJEdGUDxGSe4qIF/pCuiXruGK2nnAWa/H7MCrGyaOyk3
	Ax3FRRp6dBQZ2AZwlhtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNoD-00A4el-0B;
	Thu, 20 Jul 2023 07:10:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNo8-00A4Yc-14
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 07:10:41 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b9cd6a0051so2844545ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 00:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689837038; x=1690441838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qNGHKt053OGEcUV/YZJb9II3C7lhWR6742pba5dhA8=;
        b=bfvZrhLSVQYH3XxJZtuocEHoZEoiiB8kej5lBo6h47PJ7+UQlkMvpvseMHetKg93+8
         247GqJFy2JPa5tdYWIxWHYGlxjsfl3tRdWPwirbr4zSQ8yOO2zeSTM7MjFo0rH73Szpe
         XIwuxAU9Gfv+UQuU3Y7bHyxqPcLF8Tv/WmS8LR7otWda7T6rCizmrN8WZFDhChc6+G3z
         NVs6kcDi66iBOR7pF0rH9M27DMCtIU9ZhBtboOQSKiyU2FJi679a0t1CrOPz/DiFdRrM
         RNPREvxH6OhfbGHG09CbAELU8Dz5pn6kC2KAO7o6qyOUoW46dEdyFix7J9a/wugyINQ7
         UAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689837038; x=1690441838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qNGHKt053OGEcUV/YZJb9II3C7lhWR6742pba5dhA8=;
        b=TNsZtjFl7Mauf085+5b8r8y8Un3vyyiNgectFE7wEwzueJQ+tcSx9YAvL9TqrcRusc
         tUKWAX3l+rPze6fiNlNvGuK1u/dalZ/2FCzTa1JcsXRY1PyiFWMil7y2nzJYooa4z+0t
         WnqcE86WSpUOqTvkL7hy7+dW5Mx4VNY606zyVf4MeNRkh07rPMcShkxhtH6Sg7qqbxEu
         pOA48jNboejyBCmybOnzJwhfYB4W5oD6941Kt9aWN59n6sr5lytkz+ygFjJ3DRCMjox6
         RaQGiDd6LwxC0Zhy24D7QnyRmf5wpaikjcoBYAm12dBePoZdm86qm8bQgpfA8tQXr/t5
         a6uw==
X-Gm-Message-State: ABy/qLbJWVK65erDLlaDPMXeI0fdOrcs6yHfk7C0vCz3byF8JTJirR7N
	R4CCpZtYdWPYiwXVPjoozci0UQPiXus=
X-Google-Smtp-Source: APBJJlH4bHyGwH5cPgxUcXcuQIy//zt+rgEU9w3vklPRq1gATjxfskUBgjzzOvb4B+G2+/wZ1MqW4w==
X-Received: by 2002:a17:902:74c4:b0:1b8:4ec2:5200 with SMTP id f4-20020a17090274c400b001b84ec25200mr6801456plt.2.1689837038057;
        Thu, 20 Jul 2023 00:10:38 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm515821pld.13.2023.07.20.00.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 00:10:37 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 5/8] mtd: spi-nor: spansion: switch h28hx's ready() to use vreg_offset
Date: Thu, 20 Jul 2023 16:10:00 +0900
Message-Id: <9aabf8237cbe090ea982860ecda609063a2de7bf.1689836066.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
References: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_001040_400994_18508E43 
X-CRM114-Status: GOOD (  14.00  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

s28hx is the sole user of cypress_nor_set_octal_dtr, which already
uses vreg_offset to set octal DTR. Switch the ready method to use
vreg_offset as well. This is a preparation patch. The goal is to use
the same s28hx methods for the multi die version of the flash.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 9150840e748a..00d8305e25f4 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -732,9 +732,15 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 
 static int s28hx_t_late_init(struct spi_nor *nor)
 {
-	nor->params->set_octal_dtr = cypress_nor_set_octal_dtr;
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->set_octal_dtr = cypress_nor_set_octal_dtr;
 	cypress_nor_ecc_init(nor);
 
+	/* Replace ready() with multi die version. */
+	if (params->n_dice)
+		params->ready = cypress_nor_sr_ready_and_clear;
+
 	return 0;
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
