Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18047C0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 07:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMxyuiIwp4dOjddrNQ9LCa2d3myjwr+30Im2zh9PWKA=; b=z8fRWSZvhmDzmX
	hg274Px6h0+0Ci9su+ledrVONSXTLt9dWz+s91+g4ULaYjuAGwai5w3jundLLMKxi7KIBVCGjrrOa
	/OHV1K4iRJDeQ1q4RO6SdJoZVsYPpHkhEQeWAfiWCxSorcpdkfNoWIxvAMagIhR8TJOo4ZeW/QH4/
	SLpvxcdvZdf493WKAMWWhUex58zhhrgmO4d/XBP8oE+z/97TpTZZo1ZKUAC9oOz/xeW3Rg7+VlFtx
	2ujvRSYTrNIehufM0aq7GabYN1b8Mk86NyohamWqVjJTgRHRBi6WE0zTKWeopwBrfurZ0qtFT3tsj
	OpuGXreYM8AFAscQp01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKi-009V2T-1e;
	Wed, 26 Jul 2023 07:53:20 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKb-009UxO-0m
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 07:53:15 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9bb097c1bso860261fa.0
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 00:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690357990; x=1690962790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0Gap5z5HQj+20KA+5rR6ZWXU3MXLJY5RV2SAA/NzIc=;
        b=JTaUGxTaEzP8WuluF6JI7pcb3FNbQyMdYooHInNRIoD/+m/jyNLdY8PLNgTir7NFNt
         xxX32PLRCjTkGLkDI+GeSrjtoswcKBjXudphHTpsrrF/+2ZKmjtFkE6mHok1zBbYtL09
         YPZGaTsB1yAPTTe0DIVZm2QSRbdLiCrHoANSLFlb2K1sxp2v9psoYQ1Wu9s8mJwGElb6
         Md2CKj/rd/oKqURKUF5av1CiVf5kc5Mz34cOXLkPuCvjNQTWSo+hw2lSzrFKNaoYe62M
         SzfuFAfYA2PmOgKjKKgcV3YcB273IIx7cyqi3HHlU0KuyWOFdh6zsCKGtE5fMPtbRUwa
         gvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690357990; x=1690962790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0Gap5z5HQj+20KA+5rR6ZWXU3MXLJY5RV2SAA/NzIc=;
        b=HoW6uiakcLDTyeo0naXy++sTmofRvsK9XS0PRh2hDwXr6AREBWlRL6fU+OaYQIK+/O
         qXhx5VC3oCczojFZfzNxv5xWZRVfIDRAJaHds2JLulbTY0kGEAjMNCW4O46gSasbTbWl
         Y+6LZFj/BJH7KtyFG25M14k/6u4f3r4jor2Qkf1lsauruz48ogKJTM8BzqeYEabwnzCh
         I0Np2ZDHTzX7r/CVGfV99g7qT6JF+I8ESeGv3zgcZzwfZTI9JagOa/Qdi+TdpOcrYIu0
         rouv1cjit2awICCe23MTa6WQWZZQTsopdQIAdy4MF21jGG9p1gsD+jCFhkZenFEc+cY5
         gcCw==
X-Gm-Message-State: ABy/qLbm0oZq3ZCtaRrpi4u6+o1x+eP8FcRV4W/iMe2l1gV1+7wwe6PQ
	TjgXsvISmIUQ7nLHrK7xX48Urg==
X-Google-Smtp-Source: APBJJlGvbeA1bwNEatZegegZYcyw8ZenkB8PdMHec6wLbL3TAmih1qzN2A3UEFv6Rlc8mfMVplU2EA==
X-Received: by 2002:a2e:80d3:0:b0:2b6:f009:921a with SMTP id r19-20020a2e80d3000000b002b6f009921amr921837ljg.13.1690357990399;
        Wed, 26 Jul 2023 00:53:10 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c260e00b003fbca942499sm1264346wma.14.2023.07.26.00.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 00:53:10 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 05/11] mtd: spi-nor: spansion: switch h28hx's ready() to use vreg_offset
Date: Wed, 26 Jul 2023 10:52:51 +0300
Message-Id: <20230726075257.12985-6-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726075257.12985-1-tudor.ambarus@linaro.org>
References: <20230726075257.12985-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=851; i=tudor.ambarus@linaro.org; h=from:subject; bh=q/Qc3k9qz6CGFcYot604zmE6bU9NIV/TJy23m7QhG7U=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkwNDYlft4XVdhUmR6ygrhXLxkoNCICvSgBiqvh UqcRB9M36uJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZMDQ2AAKCRBLVU9HpY0U 6ecVCAChy9qN/FV0Ep/NahRCUBvsEecWHg3rWVBFRK2+nZiAefeyDXaelwOVrvbB5Lo9Uwj8s/a iLX5lIkS18KbB/29CjxJ7cJXEwKAQFlu+yHMENoGdDrfccdeCv5FlHNSnUomR2oPRaBqoPR7V0k 4ndWXvTUsF1y7+DcPSPtdd0H/MV2TUjc/qA8urT2xYkYlN8uqhDd+Vb3AK2M1Rc5MTIPxJYgV7t f1mi4jVSbQjSgHhoAs+i3ApJRLNwg4BM3e4djHJQwUK+nIZ1pGtUf/kayMgcaXWUjVuPgtsiKWp PQkB3VfmX7citfYlFFZm2tL1KKfBTVYO+3/3oBoil9apeons
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_005313_766624_73D64239 
X-CRM114-Status: GOOD (  11.26  )
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
 drivers/mtd/spi-nor/spansion.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 94d98b5b0ff1..6d8dd800ba65 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -728,6 +728,7 @@ static int s28hx_t_late_init(struct spi_nor *nor)
 	}
 
 	params->set_octal_dtr = cypress_nor_set_octal_dtr;
+	params->ready = cypress_nor_sr_ready_and_clear;
 	cypress_nor_ecc_init(nor);
 
 	return 0;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
