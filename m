Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBD8C4708E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Jan 2023 03:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WAsfk8JlzFr5nrEaasjhAxILki5oo5xzUjEOED9W/t4=; b=noFN6VXnco+2Nz
	KgXT/x5E312sNE3tZYuCrPjatheNrs1uRIT9QSPqLanqjvaWmBXQuZC6VXltGreT0JLHNExXCG7xa
	+v0o1w9w3ockVyhWwmrfxUbba3nRS6aFzIDcny14sDoJ4zEddtlNvLgg6pvsSJsRMi5tNvk5I+foF
	1aJAMufys8S89KWYLtJdFV7rnrkcVd9Uv918FEuoQuAxTVFU9gtgCAcrH3ZwV7nODTY/Wxu01+nW5
	ZotvPaT2SvmNBaZMLoXeXlVPBR0QX04TBjoNu8E4hzTo5AHgMduSI2ifTBc2xtEGYSif4vKh04LiQ
	S8k1jf/ehVvkG+3tO9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDd5v-00HQqa-Gc; Fri, 06 Jan 2023 03:08:35 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDd5s-00HQnA-Eg
	for linux-mtd@lists.infradead.org; Fri, 06 Jan 2023 03:08:33 +0000
Received: by mail-pj1-x1036.google.com with SMTP id q64so256335pjq.4
        for <linux-mtd@lists.infradead.org>; Thu, 05 Jan 2023 19:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2VLetstegDAmF4ny1Y3gq8bwqwrD3M6s6ZsjuqPUW4g=;
        b=SQPs4GjIr8E+QL7RL+S6LiM5UGFEtcKNIVi1YyDci+rzwXIkEZ6ibNhWiz33+cCUf0
         77uyX8lmz34q4uMLDII1loYhM6yh6LNqUc9qlvAHGRZwWlNl/AQGnB6pqlihsIl6cish
         SYdIgmU7p7B4gL4JD98JMpgthQbianUbZPVIJZavBEDJ5FrozI+6lV5KfMm+aiG4AhGf
         cy/BRBjyxeW6Z1RMf6rpj7jkXIyubdQonF77zlBpokVJMUIr3HPujjlENJ+vKO2ZyP4x
         rTfqNLQsGM8nW50SCv8qZ6/UJJ5EA2wBqbYuRAdSmUE6jPB9vJtGLZNZPZ8lMNAe4TWF
         u08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VLetstegDAmF4ny1Y3gq8bwqwrD3M6s6ZsjuqPUW4g=;
        b=jkTGA1eCpMtA3edQvAJ3+aisPtGNYvq0BUOwnhST3ux7WnbM4995nWlb8LSfYbVc0V
         lw6cT98ihBs+Y9izvMg3Kx+lZ0Fe3w6Aiq/LgIiLbQY9EEHXDFPpyrVgOLxN+DPTQ9Ci
         PsfXbj531Vld3efholxE954ZhmD8JrmojPHuaZ8ssABWFHbQp5PG3HrN7MXMw8u4wRr7
         VID2lTXhLpLxcPU27xwM1gFGD+K/prnJE9+hmyMoJCkxpH1FINsJusTRS2vQt4Q+Qan1
         ZdtmRfTdUtRP3PTNOABCCFEn8+1zAf3qS3ud1/Iauc63h9zugeFoCtXUvegCx6m8HsKH
         DU9Q==
X-Gm-Message-State: AFqh2kq5M++iUEBapQMTstPA2dQ/TbEEH0/WF217JDHo1fCX6YeZDF+p
	WL3+ThmeUi7vFfLtJvWGfJ6ngMbl5FY=
X-Google-Smtp-Source: AMrXdXuTzulKtnn92wYsH6GDStMBQGa72y5AwYy4Qvf8gge4HSZhAb2ApBfO6xNG7QyeUPGPRrgsag==
X-Received: by 2002:a17:90a:62cc:b0:223:7910:95f8 with SMTP id k12-20020a17090a62cc00b00223791095f8mr65230627pjs.36.1672974510675;
        Thu, 05 Jan 2023 19:08:30 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id ns22-20020a17090b251600b00218f9bd50c7sm1979891pjb.50.2023.01.05.19.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 19:08:30 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: spansion: Keep CFR5V[6] as 1 in Octal DTR enable/disable
Date: Fri,  6 Jan 2023 12:06:01 +0900
Message-Id: <20230106030601.6530-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_190832_534184_F4FD34FA 
X-CRM114-Status: GOOD (  10.29  )
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

CFR5V[6] is reserved bit and must always be 1.

Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: stable@vger.kernel.org
---
 drivers/mtd/spi-nor/spansion.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b621cdfd506f..4e094a432d29 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -21,8 +21,8 @@
 #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
 #define SPINOR_REG_CYPRESS_CFR3V_PGSZ		BIT(4) /* Page size. */
 #define SPINOR_REG_CYPRESS_CFR5V		0x00800006
-#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN	0x3
-#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
+#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN	0x43
+#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0x40
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
 
 /* Cypress SPI NOR flash operations. */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
