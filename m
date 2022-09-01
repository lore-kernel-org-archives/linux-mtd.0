Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D88ECAAD1
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 07:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KCFlLh1Z3fglH3aui9gp07LhJhgWgBB7+jDEwCoNqq0=; b=beKQHC6y1H0Bcn
	ATmhUmquFcFApMEQNs3Miscv/8q/ldQMl9IwsjyivPe85OSqJxlBhuuKpC+k53M2IAeui4XnVWuBq
	RH7L3IOinA/NywFFhMSAKo+jgXFIhPo8Ita3Tul0yT/1evew0OkE4dCRU7kjiG+T3+CI55M3CAbDT
	GkUs1QqWobkHnwXhhezhS5jbKO4EE6aRTjduvcB3NBzvMPEUAbYPGP2TQmNE9n+K9Ov58OqOJIbXl
	iZXERPYw8Fh6fVfyMsIY6+yqOBSpvEFvlhqK3ZTdEtrItijmR6ZzeMTUCi/FbfuxP0Gxj6MIORIU+
	2cSrGEaUsg5B3EHvOFSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTeUn-00AGZz-CK; Thu, 01 Sep 2022 07:20:13 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTeUk-00AGYO-LI
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2022 07:20:11 +0000
Received: by mail-pg1-x52f.google.com with SMTP id c24so15565624pgg.11
        for <linux-mtd@lists.infradead.org>; Thu, 01 Sep 2022 00:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=815Gjw3HK9478QD1Sqai4I+FP8/nY6nDek0KFtTv1Zg=;
        b=eMLZofmh/hEppGLb5xQrS2Iv96u+3wG/zpIvuvyf7HkIMm/5hyf36TZVY74SCUNZCE
         rcvvZDB8jY5insEc1eRt5gI+GDbvVHd5WqhsrJWEMutkny4W4kX8pdgSoBI+pzNEGkCC
         OFrTwCwURJdjRGOVH/xVK0MzDhaNunoVaPdd6t3TztFpdkzxU29xdZwC2TJHrjJ8lJMP
         bflw1aHEC757QBMsB18uO5f+HoFYDIo2CydsL8RM73/z6WS7pX1qA6y/3ASWTHQnV9mB
         +cJuLZuPImBuCp5Ll0hqqt4u8LgFhaDB8dFXZynQm13yC1JW8QU+/zfRrZkGjg9WZby1
         OgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=815Gjw3HK9478QD1Sqai4I+FP8/nY6nDek0KFtTv1Zg=;
        b=fRNpkqZFOgY4SYhxIVutKQXLISQ6NefSAqwinOqkNqWWq2WKxMVBz/u5d8Wly2+OkZ
         oKkza8seAdvrzvvPWACB2Of8PK7bowLpBKtk5+gkxGOYi/I4XKWSFYk+wuN4T8QUoY8L
         q21TqJawY3OxQCooqeVtH9TdPJwgtxPEbYvokuMcvhINdL1/sbbmMJEKRQLXIFr3IlC8
         IzpIVG33/SW4zMYVYO5LEunHM5ZARTGjtXb/PtqK7vwsjekiLmK7Jy3+JUIHTplBofUJ
         0E7HhEdnBesB/VKe0uX5hQVHJm49VIcnTwZc0Hmcg0QH71dr9EhWagkNFwSWwuzt1cC6
         Depg==
X-Gm-Message-State: ACgBeo0vyDLmPnpbeTnznaw3btR3VTAFoSDUPGtQGMygDBdFt52KYINi
	i0AbqwdXLKb2Y+PsGfM0s1gw24LMe5s=
X-Google-Smtp-Source: AA6agR6SSo6gbuLuFYzYbOMWun3GMuYUEOsS2o7xwDN1KK+ysptEPmAqagWxeuuZw5DbeAYWmo5Fkg==
X-Received: by 2002:a63:cd55:0:b0:42a:7649:77c7 with SMTP id a21-20020a63cd55000000b0042a764977c7mr25061586pgj.149.1662016807160;
        Thu, 01 Sep 2022 00:20:07 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090322c700b00172b42c1a02sm13196196plg.83.2022.09.01.00.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:20:06 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH] mtd: spi-nor: sfdp: Fix index value for SCCR dwords
Date: Thu,  1 Sep 2022 16:19:04 +0900
Message-Id: <20220901071904.27622-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_002010_732964_7144739B 
X-CRM114-Status: GOOD (  10.16  )
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

Array index for SCCR 22th DOWRD should be 21.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/sfdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 2257f1b4c2e2..681e5e78724c 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1222,7 +1222,7 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 
 	le32_to_cpu_array(dwords, sccr_header->length);
 
-	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[22]))
+	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[21]))
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
 
 out:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
