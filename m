Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A9FC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 11:12:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6251520724
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 11:12:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KAtfRpCO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpUkh7tM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6251520724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eFqzIeJU2P6JpUUA5CErWA+GujWOa33Yfng7wGWDHeQ=; b=KAtfRpCOBbw9WzElT6eoxgkoA7
	orghz9LsSx7VqnBS50LN7o8OWtI+9++vZ4td8g3SnaYTFBZxg+b7lwOOCkvSs9skA+GFoKBbva5Lj
	G0QhQDAKOM4wL5ecdKTx2CyeY7t+Pdao7+h0bjorymSMqGr2EIQ0TfMD7LhHO4tbwn8jWdtyDJpSn
	ILCOfJWCl8dQZ1esw0n1JEIkAfSICwWGE9bVFzehath/vJA76IJhWImS7IlOJIQ/gf5B1u0PdA+9j
	XABLJxSG9vMKJ54lS3RAnJ65jVJ9UE7etGUvjqVIyivGvnDTiNK76Ar+Ey+064Bjn7vwchDrsugRv
	N2IfyXng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomGn-00050U-Dy; Fri, 26 Jun 2020 11:11:45 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jomEl-00042I-Ev
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 11:09:43 +0000
Received: by mail-pg1-x544.google.com with SMTP id o13so1846077pgf.0
 for <linux-mtd@lists.infradead.org>; Fri, 26 Jun 2020 04:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8hbn7UZFqF9PIRjtizwNZTA+gU/bOSb+AYl7zS3TCto=;
 b=MpUkh7tMsH205FZWx4bKc4P8w0YCf2ZoQv8Udr+/xRCl3EnIKqo8MjiU6EvzraI6dm
 gh8VzQvOCKVFmyQ3qoh9eOjjnrKB//BhCqpyDMRJubJoHp0f4oyg8jqdQwI4v9QRNpmv
 ZVgEmFWufQZR0UklrI8IPvr0er6/2aKfYx1/YARBwQrDeUxEalhZRpQdt+Sb2KPCGohG
 ACY5J9fADI+6gKKcUiL5k6JK66CmszXrkZ7ncQre5947LE6l8SqGWCXh7R1eQIb+/fI9
 TZEyhaWkOjJAChLB0DdBbeKlpIYUMK3MQ3Y4QOP/FS2vj2mFejJdTdzriHEIG+BgbWZT
 ELIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8hbn7UZFqF9PIRjtizwNZTA+gU/bOSb+AYl7zS3TCto=;
 b=UntE8S3rqgbV7gHk9XBxTVoWofmte0sNFvYRlgfB36+2xeb5VBNbelj6uxm0SDs+Mv
 3d0qXnmNETZMUMo7+8Jf47IYjqCebyDdgmQOpcYl7VTGfhp2F+dP9rRmeZMIfxunNYkQ
 O1o8/qI8cGMa6smr6g2N4Sku9N2PZkDdgrPUCjyJ7ImCN2zV+oauR0maFAG8axWoAX6w
 /d9gppUCnQkpTFP4dyEgt7Tq8ucEXkN6I4OUzRVFbBYwSQfFFPVUsuX0QbHfivHhJRq3
 tDfeIPSVn/XZ05/zBO6xgQifOdsU5VyxYGekV7GzDrk/Qf0lioN1Zd9q2XUJNzmlg9o6
 EMug==
X-Gm-Message-State: AOAM530B0aKcyDfMgqh6fylsnbd1HuBsfqvaoxxc2d2h3XQAuh+xvV6m
 SkAxwiBRvIFj7so9hSKPzbivpzyotXw=
X-Google-Smtp-Source: ABdhPJzoC7qi7V7m5Q37V8AqO2tTpgqPNajiOM7TcOolGwPKIuHg7R12aXh0OcgEPIbb1uRr82gtRA==
X-Received: by 2002:a63:2148:: with SMTP id s8mr1264440pgm.37.1593148628183;
 Thu, 25 Jun 2020 22:17:08 -0700 (PDT)
Received: from JP00894.cysemi.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id d25sm21022560pgn.2.2020.06.25.22.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 22:17:07 -0700 (PDT)
From: kuwano.takahiro@gmail.com
X-Google-Original-From: Takahiro.Kuwano@cypress.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: spansion: Remove s70fl01gs from flash_info
Date: Fri, 26 Jun 2020 14:16:50 +0900
Message-Id: <20200626051650.495-1-Takahiro.Kuwano@cypress.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 Takahiro Kuwano <Takahiro.Kuwano@cypress.com>, miquel.raynal@bootlin.com,
 kuwano.takahiro@gmail.com, Bacem.Daassi@cypress.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Takahiro Kuwano <Takahiro.Kuwano@cypress.com>

The s70fl01gs is a dual die stack of two s25fl512s die with dedicated chip
select pins to each. Tested with the device and confirmed that is working
as two s25fl512s devices. The current device ID in the flash_info table
matches with s70fs01gs which does not work with current MTD.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@cypress.com>
---
 drivers/mtd/spi-nor/spansion.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index e550cd5c9d3a..953df1c488ec 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -64,7 +64,6 @@ static const struct flash_info spansion_parts[] = {
 	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256,
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
 	  .fixups = &s25fs_s_fixups, },
-	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
