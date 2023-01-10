Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4842C54EBE
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Jan 2023 16:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eImzalBaIz3Qc3Grd+3jEZwGx6VoHAtXJzAWWAzrrZM=; b=kOlkSoMYAoZnz+
	5TwKkR0Abt0HOxIrlKTqa+KACWiajDGLzRGmBdDgt2qJkO8rZJm3w44ueaUm2PBlivXXd/5GK29k7
	Y+6liz4G6GfsU8cdU7RkatIXR70+6QhiQLDrWJ+HIK2k7ZF+2ywq4Tt1nbdsmahPYAfqXVm4BVHpO
	jQJ4f/3n9pcYe79aU/IdqtkV5jZTTvGEXDqo4qeO/dCg8g16bWAd1IIJZ7BJx9kuck0cadWXNx8/T
	rcQwx4ojeuX8CNBYgx9JaZeAo+LrtA/qJgwACgQAdlNlmakRkNJpF4bcMCs8DWS/Cdu9mi/N1Eov8
	d8jS0e9dV/5GzxhwMQSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFHmO-007qvK-9a; Tue, 10 Jan 2023 16:47:16 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFHmL-007qta-8M
	for linux-mtd@lists.infradead.org; Tue, 10 Jan 2023 16:47:14 +0000
Received: by mail-ej1-x62d.google.com with SMTP id fy8so30168941ejc.13
        for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2023 08:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ls6LBcwMm2xVgGGJTeN+YYoIl2kLVK7Yc/+Xn5DZygM=;
        b=aJ0gqoWO+qWvHTvMdMgNi0wkV9wmQ+77YhfTQfHAJGFSXtwLzqO1xcV2q79INgIVAg
         8J/MNyx6jxujXomJn1bV+NAxU1cWuwq55gGqf2KJ9CH9CV2UmhuLglzeUOtISVo9Av9R
         ZSxr7QDGdMlCov6XXmSHYOy4L79ESVQ/l6BrvmBRCn0CPL5sYQCJp9rxO3ClemXOZ3p9
         BFhOi9pbGIGKUI+qp5v8ASDtBB0KOBF5xKYSDVndBipyE2sZjnWktkMyeM2kQzSUUrqt
         ckG+i4Jh/nCPXzs1jn56QWBpzi4aF0opTDIlNlmhpN/LbDXiQM5OCZasAkg/QV4YQVbU
         M8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ls6LBcwMm2xVgGGJTeN+YYoIl2kLVK7Yc/+Xn5DZygM=;
        b=ut93bE0EJAPxCOWzOTpw9ZTHtka5upsH5qVM6ohk7HUyFSDA6EOgUtcBqOsWk7IHPq
         Ar5WAma51OR2erXaCrdi32ZFBUtPpnoexfCKvuUstbZff5TUfV71Nf5+Wz4H90pblP2d
         /fJKwZv77UZrhQ4lpq5PgrWKZq8nzI7jSUnAIC8R04kVeME+voeWaIOwvBLSWLcx3xBL
         0kNPh/L5N66BpBqFkV7bjmM2PUDrb86O2ngyJf5PtGEpJxj15KG6SBCV2ehDp/EyegNT
         sUxAcYP80Lg7smZS5weVPUHyu18aPW1suH0GafHcqYwfxrjGFfBjT8Se9ovie/zqqlI+
         SZrg==
X-Gm-Message-State: AFqh2krGiD+ck/qTS7tatZijs6bwEF1ZeMGXePMu31iDgfZBerOpFyWz
	wTjQ9HF1mkObIR8bRLwC/hgHVhuC8DDT3l+9qGg=
X-Google-Smtp-Source: AMrXdXtNpex0rz7ncY6hnmVTtHkYo68HdNvSt4pr+LePBAEm6sfd8JaKtzZDRshV3pZ5cD01QlwhJg==
X-Received: by 2002:a17:907:a28c:b0:7c1:6794:1623 with SMTP id rd12-20020a170907a28c00b007c167941623mr72399049ejc.58.1673369227315;
        Tue, 10 Jan 2023 08:47:07 -0800 (PST)
Received: from 1.. ([79.115.63.215])
        by smtp.gmail.com with ESMTPSA id lb11-20020a170907784b00b007b935641971sm5053699ejc.5.2023.01.10.08.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 08:47:06 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Takahiro.Kuwano@infineon.com,
	tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Bacem.Daassi@infineon.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] mtd: spi-nor: spansion: Consider reserved bits in CFR5 register
Date: Tue, 10 Jan 2023 18:47:02 +0200
Message-Id: <20230110164703.83413-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
References: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606; h=from:subject; bh=jF3FpErLQTCqtOjjNcuMmC7+pgd25X61qd7O/piXeqY=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBjvZaGkPAxjVl/mkjAg+vTBPpEWaj47jQ3EBf4n5VY 274YmO2JATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCY72WhgAKCRBLVU9HpY0U6Ty4CA CHotWONuxMqIYV0veIwP56hAutrw5hZ8R/LdMakq/waAIUo+6moepfs9+lgGqCcyuxw5CfGKebVaJG f4H9q4bEG+YOSrNErtpok37evTZj7Bx6G09OVqe2r+wqoT8S+Vs6ehM2ksXSsOA3uuf4JQ4+Se7CwZ EHcRsdm37r3ZlQlepNVyutQFUH5jce00w0PjFTqWP16MfuU1nbF2av6f0r52zKu3Z0iq5XDTh6o+K+ 8EYMobyPS4WD1mdpmBwnQDiO6ZwvJJV5qRE0ivkEBzEPNcEy0VEE9A/d2GnmWeUGYPHfHHWHpyoYim diRNpS2SIW9XA3+yL4lrbKTwaTWSVU
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_084713_316329_7BA13320 
X-CRM114-Status: GOOD (  11.36  )
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

CFR5[6] is reserved bit and must be always 1. Set it to comply with flash
requirements. While fixing SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_{EN, DS}
definition, stop using magic numbers and describe the missing bit fields
in CFR5 register. This is useful for both readability and future possible
addition of Octal STR mode support.

Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")
Cc: stable@vger.kernel.org
Reported-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b621cdfd506f..07fe0f6fdfe3 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -21,8 +21,13 @@
 #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
 #define SPINOR_REG_CYPRESS_CFR3V_PGSZ		BIT(4) /* Page size. */
 #define SPINOR_REG_CYPRESS_CFR5V		0x00800006
-#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN	0x3
-#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
+#define SPINOR_REG_CYPRESS_CFR5_BIT6		BIT(6)
+#define SPINOR_REG_CYPRESS_CFR5_DDR		BIT(1)
+#define SPINOR_REG_CYPRESS_CFR5_OPI		BIT(0)
+#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN				\
+	(SPINOR_REG_CYPRESS_CFR5_BIT6 |	SPINOR_REG_CYPRESS_CFR5_DDR |	\
+	 SPINOR_REG_CYPRESS_CFR5_OPI)
+#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	SPINOR_REG_CYPRESS_CFR5_BIT6
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
 
 /* Cypress SPI NOR flash operations. */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
