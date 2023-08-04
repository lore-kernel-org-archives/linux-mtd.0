Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE09BC04FDF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 09:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzFHorAIvlvhGSyV5P0XfORxV+vJJDw6aarZYRJAqSc=; b=a03dfoq4CUkx0O
	HK0RO29LaptohdemUZrsTGcgQpokd7n5ZmW6a/RRPTInTBiL8Eq6VxQw1vE7kwEzvb9NMmNmDrWpA
	FDd66+oKdbnjRjOvk6l0QWEmsz4U1TEpSFR5L7lSQN8ME0Lk96MC+b2CIFCSQPRtb6FzaQJdwQpTQ
	lZDSU9uQuEQFF5iBNPsdBPcrNXv0hNILwPsXQisoyLanGIghXsJniK9njSVv9UyyUz9NCTNWsb8rh
	TeM+d4+aoKBt2pwrICCf/peZBxiD8+Y0M3qwN2UJT7ldv+U4rRyZMnMqhmgR7c2rBjKZ/FtKO5ffI
	f9zrM90m6qXdCqWNCSew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrWR-00C48J-2J;
	Fri, 04 Aug 2023 09:55:03 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrWM-00C45S-2V
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 09:55:00 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bbc06f830aso13666135ad.0
        for <linux-mtd@lists.infradead.org>; Fri, 04 Aug 2023 02:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691142896; x=1691747696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUTHs6f1QvpBU/pyzTRqEeygVIjeSn4tLrXNrvJgpZk=;
        b=cflQSRiS/IZszLlDov+SOXTNRwq7bNlR1WqsiCdRTJ/sObnieR/SxCc+wyzYhkeDA7
         VLMC6PnY/QFZclwyVLuD1szF0iIbR2wzSDH3qNVEtvGuWxDTsFncrvqe3hxlgwvEd8hj
         uxVGEGICXaGlEW+4y4GgRLdlrpCA+Qpzro4joiA7fLYKouoxZcGDx6k0Jy9lZNweO11S
         6oYBOxjP17GGsDlFclk1bb9MVUjWArqJdJkJI4dnrxMl5b127Xu/jauKtx+hwWPDAzPs
         skZ/7sJhUBnGs8AWGZOddsjYq8gwhnbyIXGCJiCbnamjR4OtIfUQN1M9N3NoJoUDIxGt
         mZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691142896; x=1691747696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUTHs6f1QvpBU/pyzTRqEeygVIjeSn4tLrXNrvJgpZk=;
        b=Sb8GeFpnFEZM5+3Ei4LeJeAXCyjnN29HVRyX27F9dvZSdkzJnJ2feannCzZzd5IyzG
         ZNi4opnj5NGv5YQsF85O5+3X2xBRtOfpL9g0bCRNhX9ACH3D46HCMt13L5KLTqYGI/6/
         QUdKeERy9raVgCQdNMCGIodI+9LblOLi1Mcz4tUdVvttDXpYXLHk4xIoAPJ7kl4nTNmE
         qcnEcrmGR2RBkosK1lyj2k5UDWGaGoMLn6twW04L1AKf49DHwCyKJ8q/VTZN0pgCmyw+
         QxHfYkKYP/7mNNHqoTTI8/FnqwQCLuWYSL+RB1xAkNsZQnoMHzufSsUYASFMAdW6Xmh8
         Vr7w==
X-Gm-Message-State: AOJu0Yx1PDJ7uD9u0q3ww9bCZh2rY88Pq7Z06V2sBN2c2oNyEUHlqoMh
	stR0Npl8PN/Fl1mxCjvIEvc=
X-Google-Smtp-Source: AGHT+IGx1aDcn/4oo4404kn2fpcOQRcphul2FMWCl/Osu5fMkdcLY7TLLxOjp6dg99ZGphhKyW/SPg==
X-Received: by 2002:a17:902:da82:b0:1b9:e9ed:c721 with SMTP id j2-20020a170902da8200b001b9e9edc721mr1754220plx.19.1691142895868;
        Fri, 04 Aug 2023 02:54:55 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id v3-20020a170902d68300b001b86dd825e7sm1347858ply.108.2023.08.04.02.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 02:54:54 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 3B2B78056D;
	Fri,  4 Aug 2023 17:53:43 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v3 2/5] mtd: spi-nor: core: Hook manufacture by checking first byte ID
Date: Fri,  4 Aug 2023 17:54:06 +0800
Message-Id: <20230804095409.278419-3-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_025458_812096_BDCDAE87 
X-CRM114-Status: GOOD (  14.17  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

Patch ID for flash support is a thing that we keep striving to do.
Follow the optimization of software architecture, parse SFDP is
the mainstream in SPI-NOR subsystem.
Label "spi-nor-generic" to the flash which didn't include in ID table
but support SFDP, is a good way for flash support.
Building upon this fundation, achieve hooking the manufacturer using the
1st ID byte.
Consequently, extend support even for parts not descibed in SFDP.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5f29fac8669a..eb0a09c06bf4 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2036,10 +2036,13 @@ static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
 	for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
 		for (j = 0; j < manufacturers[i]->nparts; j++) {
 			part = &manufacturers[i]->parts[j];
-			if (part->id_len &&
-			    !memcmp(part->id, id, part->id_len)) {
-				nor->manufacturer = manufacturers[i];
-				return part;
+			if (part->id_len) {
+				/* Hook manufacturers when first byte (maf ID) is same as other IDs on ID table */
+				if (!nor->manufacturer && !memcmp(part->id, id, 1))
+					nor->manufacturer = manufacturers[i];
+
+				if (!memcmp(part->id, id, part->id_len))
+					return part;
 			}
 		}
 	}
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
