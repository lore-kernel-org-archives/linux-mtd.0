Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CE2C7EE2E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 10:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTWwFwHghm9eAaOA9jU1+1eIvRNeKBXXj68kk/ANMuI=; b=dotqVDnTO/PTbe
	s81hG8hK91sOuYgX74AqlyOe1nCTK5FT0PIimjN1QO/pIrMRTqIEUxpQR9QfKlJKKjCgDZSDpnIqf
	d2lXFOBhxGRc5oZNXE+RxyWz56LBO2emgIhiIm+QPIgw9jvRRLqi3vEE4qeAGmgqsKIyYlBJUJSFT
	gOCCOWzJJa68Ji2UQFXOv6HSOu+MDgVgZXOVYR8GfMg1vr97d9ORbC4bxz/7SAsVz6CXkmFrez8AC
	P8HzsYyaHzvVJnEO/egIwT1nSKLDC3turjMdl1vUUM2pZl9DPV8Bq8NBjByZGsE75rxoQu/Y0p9rb
	8zMJUwBk5M49B+Xp20qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ePr-003QNU-3C;
	Mon, 12 Jun 2023 10:04:51 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ePm-003QKU-39
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 10:04:50 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-650c89c7e4fso4435638b3a.0
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2023 03:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686564286; x=1689156286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjtdEUMGku2Ac1RZ1FXVQmr4E0SXPmqlEKdrejTJLpw=;
        b=iK/3nVoAAfnGqF4Ne7V3/7VxNxu8eSZChfgaTmnzrN+SijcgLmE0Om/0TOOfMcUVYQ
         hqZcLpyE7Ni8VREB+sUj0kcemi4blAz2tF552Afb0sWVT9EmctsYokisq6a4A2+1U077
         rqTvDId8Z20Z9FTUN0NU+ihCW5d+5VK2arcFJhS/VcRzgwPnSaP+DwoTRu968hYW+Ovg
         v22nPTyIBebLmBo9f6BOxpURO7tfHHdxY5hDBmxrUQuo5tEbeA4pJh05SnAMjtoDnzUa
         EoA7f6M7OWG62qMJ3gLxBqCpdjXqRS3WLE8G6djEDxFedFcOhp4hXawmIMii5apbf1nl
         klMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686564286; x=1689156286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjtdEUMGku2Ac1RZ1FXVQmr4E0SXPmqlEKdrejTJLpw=;
        b=inDEF/jMotAtUMWbF6CynWJRifLrISEPXRhSyaBgSxFH510byuaBzElyk/5q8zpbko
         mRrYb6l/X+6pbagDtLGRUyusqyfziX0IEYRPvU7YKGvI0Sqm8jUK+rGMf9PmysqzC2C8
         reZV/ijtpi43dPU62lUmI1VKosHxRoGDJvcmXqq0foQGpzlYZcuawSLZ++AHo8cqs3IL
         Eqc5DZMBI8PwgZx9lETKJNzfHD9Kxaf/tTBrD6CmZVdvBg/cWEHHUzgElD/44zz6RWeT
         AhzcIfDyfoD9N623d8OQXybdPKjbLVx5RmdKk1p8J0s4EQ9d0t9nDErb3RlTgh2Ftqpp
         mr0A==
X-Gm-Message-State: AC+VfDxdTTkDFJDE3sp66cN1t9l55CRgbPgVTlqIdRBAylAhxQiyDLCy
	zELytbDRBlzWQkyo77EzoaSDYfCLhug=
X-Google-Smtp-Source: ACHHUZ6gcYopeAESZmibxw5doVD623mhbJXb7O7/FIKZPvhLbjTtsLgtBwGzJbLD+WGXWnC7KDDj1Q==
X-Received: by 2002:a05:6a21:339b:b0:117:497a:a936 with SMTP id yy27-20020a056a21339b00b00117497aa936mr11679798pzb.21.1686564286198;
        Mon, 12 Jun 2023 03:04:46 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79211000000b00662610cf7a8sm6723376pfo.172.2023.06.12.03.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 03:04:45 -0700 (PDT)
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
Subject: [PATCH 4/5] mtd: spi-nor: spansion: Octal DTR support in RD_ANY_REG_OP
Date: Mon, 12 Jun 2023 19:04:08 +0900
Message-Id: <5322b787dc0a2943d2563d433216429b47ce7ff8.1686557139.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
References: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_030447_025826_3E359A54 
X-CRM114-Status: GOOD (  11.42  )
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
index eda3731c17be..8b8512402639 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -103,11 +103,17 @@ static void spansion_nor_clear_sr(struct spi_nor *nor)
 
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
