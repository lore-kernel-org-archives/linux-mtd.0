Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BF3CD5BB1
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 08:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ijv5V7YaM3S7n2m3oBUDf4XyrbltRUTeldaE/xg61M=; b=GWMKzp9i19QIfG
	1ICezkozuo1ntR4ZncYlNXPM0uIslbWAGyavpYS52yfx5qBaWa2CQgP3jLoHjz4dRy7EW2JH6R3m5
	9Nifai3lbA8+SCvdAzuJ63MaadH/qWY6HRZM7o+7KMlK41KrU2lHgCPc59bkmPww9h44UYIvSbMio
	RtUyT4BpnCyKIVPqCvjOOYu7HOvMhvKbet/QpaKrHpxVNrCQv8EfAGjGd0IiCx5d2bpHwKMCLmtUy
	9WPVZQvK2MbG3gNCqKqi0fPDu0XG9azKJ43znnW/Fp88WzH2o9zr2Y2iYLVYkRzD58ycoSvh0rWdn
	W8O8M7GI9L0tHw45ybug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLYe-0000000AEXo-2eAI;
	Fri, 22 May 2026 08:48:40 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLYc-0000000AEX7-2nP5
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 08:48:39 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2bccb978bd9so47882875ad.0
        for <linux-mtd@lists.infradead.org>; Fri, 22 May 2026 01:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779439718; x=1780044518; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8hl6ndgkcLN/B5VYGouQ3PaB3QiaN1IHGvG4dIhEOA=;
        b=bilf3fwcl0ScuN/VKieuamEy4kZStKGaclkKx5B/yix6ak2+np54/+HWKr4IiMW1mC
         vcqLknRUfP0S3nbFgiJIVdHjSWHuReeiaqKIWZJZ/GINVsFwUUjDlzDEadPWU2Dmydq1
         1MI7jMgjZnsf+h8XCeSPcal3jCb2xCMyKo14n9d5SOfnXtfIjSIONDNMURbznOW48YmU
         R07/bVH4rTQkOOgVC2BwPCFVClr/m9GeNL5boDJgx5BgNE8hzs6d/A5PGudftFnG/u8M
         ude0u72jPnUYPPSL7wizrpaZnjsmTAgbxkVom/AmFjggk5n/M33WhDWA1WBv4NhZeHIT
         ipzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779439718; x=1780044518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8hl6ndgkcLN/B5VYGouQ3PaB3QiaN1IHGvG4dIhEOA=;
        b=IfjUjqX8iidnOCR/rQu2Be987f2DkLAUpCniXYIO4dIXAdvwIBCWQng+ySa5bqR+WG
         YH0QhfJ9WT2PYku2c2zJcbpjOIlu6GuWb67bR8zZ2g5BtAhhDnZrsmrLdB78tlt5DfgG
         wcBXiNAVyY4L3T1gG06VWY8wX7TNIsfLn9NXXF0LAdoJDUg6WnAT7Jp59+AMHjf+ibAX
         Mc6UFNM1HbW6e6xKSlZbnS/b8JVdRwlbkdxk0dB5gQQqvzWP/RJFr6dFjY/rb8m5w+qc
         26jxfufg8/kys1UYrbsysdIb+vCofY3WRMUhTQ2RWrIyYvHDJDzXxNXAFKZtUW3+APD0
         TJjQ==
X-Gm-Message-State: AOJu0YyqJb4PUmjb1f0pMeOJTaDNvZp17rqziAbbeROrN/wizPOzJC4d
	IuGLa49J41vYBPbHvxfy9Fvg/nbZFEsdw8OfAhYpbircl3gc6ZWYGHPH4Jaqtw==
X-Gm-Gg: Acq92OH0UonAYPh7bnTmYuQ9I5GkwCzIIGUGV+QjXSJgMef3DI/DmQ15L5xsjENLp4l
	s7RS2vVdDzcGfWFY5CyrFtTJP2sCmCsnDfGMfgIyOUvjEhpxuuXC6fTmAoWpv1wQyQ36plO3+eb
	WpDRPsGB8Slxfnp6y6sTmP7UlW85lTFqCHnlLov+VSkn5EMloi9BuY0tEB908cgq0ynlq6JPlPg
	s0BA5z6n3uUEvSP1mzNyxyQEp64a8pO27C5NZkKCiJEFrXiTOvEusJatcKfewjVox2IK5ExiHfE
	oeLbTfEwurao8r2P75ujlk2p2KCdaZo216E98jX79/OaSDHx2tyR9BUJBHPFej+0YK62PBs4Zac
	K8zrO6DedIhSnFxD+iiaMPpCNteJ8w1JOldf/y4OnPsEgBRMY9vynECORRxOvQ5LuvpwayEi7la
	GitN6sglYfqD5jnOn58uHivwV6Z8fLHwKR2FQnTRXGGxX31pkQTrFyd5YXMeYXMOySiG41SbJUl
	7lkw1OG4wYWp/dXZhY=
X-Received: by 2002:a17:903:19e7:b0:2bd:e021:6dbc with SMTP id d9443c01a7336-2beb0794b7cmr22143565ad.2.1779439717879;
        Fri, 22 May 2026 01:48:37 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58e4fcfsm9937795ad.71.2026.05.22.01.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:48:37 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Date: Fri, 22 May 2026 17:48:10 +0900
Subject: [PATCH RESEND 1/2] mtd: spi-nor: spansion: use die erase for
 multi-die devices only
MIME-Version: 1.0
Message-Id: <20260522-die-erase-fix-v1-1-733ac8967df1@infineon.com>
References: <20260522-die-erase-fix-v1-0-733ac8967df1@infineon.com>
In-Reply-To: <20260522-die-erase-fix-v1-0-733ac8967df1@infineon.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, stable@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779439709; l=1018;
 i=takahiro.kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=8yx//9tvT7Tt3lxpUbTiukCjbjkctB90zoxhmldjicY=;
 b=7L0qQKBmTpabLmmQRbx5zisnqoMkCf9nEL1ADE+VuSpPUA1vxvc4oEj8B4B+gHNtNGMwuShES
 hQ6LEA2XIVsDEZgewChIN4RkuHcsa9ajMC7nEpuobt9mOTKLvK16vbi
X-Developer-Key: i=takahiro.kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_014838_714883_47DCDD7B 
X-CRM114-Status: GOOD (  11.43  )
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

Die erase opcode is supported in multi-die devices only. For single die
devices, default chip erase opcode must be used.

In s25hx_t_late_init(), die erase opcode is set only when the device is
multi-die.

Fixes: 461d0babb544 ("mtd: spi-nor: spansion: enable die erase for multi die flashes")
Cc: stable@kernel.org
Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 8498c7003d88..b6023076903a 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -674,7 +674,9 @@ static int s25hx_t_late_init(struct spi_nor *nor)
 	params->ready = cypress_nor_sr_ready_and_clear;
 	cypress_nor_ecc_init(nor);
 
-	params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
+	if (params->n_dice > 1)
+		params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
+
 	return 0;
 }
 

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
