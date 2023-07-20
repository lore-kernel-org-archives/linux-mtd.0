Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6592DEB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 08:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQVHZgm4+zAjC1flwSBjPeDAZvj/CiId7TK6SdF3M2o=; b=pPub+EDL/gi8/9
	BhG8d331jkpHr8dS7iSeVTNB+1GK4tFdY977VuOGxihFAGUCZZZUEvBQ8b+peOT6OT4me06WbyKwp
	4u5AtE40cYHsxxdiSxB3l3MPjyKAjUBlUSAeGc2KZEUuoZXaiUtDeGajXMCkPseDl+GTauHXYgCtM
	asfBwPppIiCJr5L2z/GwrYhCvZcHxL2u7Qol98ynrSmuTtbFWK15XYGMBCw95BioI64Cs/Ilnjqbq
	5v6TfdppzQhNMybfLu4/6SpL7j7WAlMnVoXhKNYh3yvbAVu+U2Ru93RI6EcrJWj5m5XP9xyP38ZFw
	tzjpJC/odJrwxQi80FnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMOqG-00AGe2-0L;
	Thu, 20 Jul 2023 08:16:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNoG-00A4gE-1L
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 07:10:51 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b9c5e07c1bso3252165ad.2
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 00:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689837046; x=1690441846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqyYepH/FlXk6VtiIQSEhFLnwR4FesB5ets8V6xpObA=;
        b=icbfO4o2bMskQ/gOZ51o1occ4LWqlb0rqvPSyqzEfRW+weMXGrCEcEEojEoLOUZ++R
         37BwGVqpGifaC6SKEY1zFkX++4p1ly6RzrxT5H6WzIzRZFEOci50gz5qfBTxY73OWjSN
         jpzL5p6nMFlZQe/3QMWppGmpX6944h7B4jtM6kG9vJzQTVubGdZIULkFpweBkC2En6I/
         qbeXs9RLHP4RoyKa8JfECbMH36U7wYH1is2WDt1r4VFvxYtaTG117o1PpzPzt2VccUQB
         dmxbEtl3UhTSgersjn/NpL1fATEzxnbnYZwcz0yJloaThOOgbZLgisvxHDLA85GXn66G
         DSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689837046; x=1690441846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqyYepH/FlXk6VtiIQSEhFLnwR4FesB5ets8V6xpObA=;
        b=dxLF5sBUDaMfMnxB6DmXUDBpI94L8ZbBQoXZxVwUakiyuoNq40x2gPRT48WKZJmL5R
         32aRkMixOrAGhWfxIIAGhyskh5dguuLkdoZcy/7gjjTmSxNWVzd2yks+KPhT1nqGDHxo
         IaypjbwoVDyih7IFU4Iz3UKEixk+KsBg4YGWHfs4pskqtcRNqh4TG9ub/Rcdz99Af9ue
         K2G5gHUcbiSQ0JGcQi7qvYM51ZQVs0t0pWWC1lXckzIh90D7Q2r1/6RUut1uXxelPDqo
         55d12EnDmzOp+tS8SJ/SP/76VsbbeE16UuVa6se9KdazyWpXDVqyBg0sAWkykcDPakGh
         ZBag==
X-Gm-Message-State: ABy/qLbPQhilh0R2iaCa0CSHwMWkP3bOA8ybdcqymCHhXaB59B11Ibr+
	4rvBummF7F+Jp9ZtYmS796ukYygExi8=
X-Google-Smtp-Source: APBJJlFKPIunTIFq4TteX8GpsAh8Zt4qz7aSUNOsBcoPweV+9BbC/nxQKIQx8eIRyCebkU8x7i3dEw==
X-Received: by 2002:a17:903:2595:b0:1bb:4861:d39e with SMTP id jb21-20020a170903259500b001bb4861d39emr1391024plb.12.1689837045935;
        Thu, 20 Jul 2023 00:10:45 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm515821pld.13.2023.07.20.00.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 00:10:45 -0700 (PDT)
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
Subject: [PATCH v2 7/8] mtd: spi-nor: spansion: add octal DTR support in RD_ANY_REG_OP
Date: Thu, 20 Jul 2023 16:10:02 +0900
Message-Id: <44d3bb750bc6e335980eb2c39c24f1e91954df69.1689836066.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
References: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_001048_493076_600290A2 
X-CRM114-Status: GOOD (  11.85  )
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

S28HS02GT uses RD_ANY_REG_OP to read status of each die. In Octal DTR
mode, RD_ANY_REG_OP needs dummy cycles (same as params->rdsr_dummy) and
data length should be 2.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 4e791f1b9044..dbf19580c3c3 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -104,11 +104,17 @@ static void spansion_nor_clear_sr(struct spi_nor *nor)
 
 static int cypress_nor_sr_ready_and_clear_reg(struct spi_nor *nor, u64 addr)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_mem_op op =
-		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes, addr,
+		CYPRESS_NOR_RD_ANY_REG_OP(params->addr_mode_nbytes, addr,
 					  0, nor->bouncebuf);
 	int ret;
 
+	if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
+		op.dummy.nbytes = params->rdsr_dummy;
+		op.data.nbytes = 2;
+	}
+
 	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
 	if (ret)
 		return ret;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
