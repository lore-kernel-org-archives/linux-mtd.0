Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC51C001B0
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 08:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvKEg1Rqn89LD1RUKiwfgtS1ffjyy4ZsjQEyxMipai4=; b=PSWZit8t9gIKKA
	JkZxo4ATtaJG1QMkt/XSQddfAjKqoA0kRgOpZ6yKbrLhH0nfFkpjpV7QqMPVqlSuV5Zh9tROCcLF6
	mBWYHOdjawz+ZFGtsn7SVCk9qP0WOR5knFweVEKuC+6iSXroDcJIFONRfrPulsJuyaqgLdwijbCTK
	pyGn4kBnxLU/NKskUmJd6Qme+L6ME8twHieD90ljWRoCtVsm21dlx5p0iuA2vaxXgNsdqulZL0v1Z
	YU2Hg8mzE5qvfZOU5/6W6hKUjceIPkbFMADehazRSK5JPSJjNifFL3c7cClfI/hXxeanpF1s6YPZl
	mpAn8dgayUsxiOrJ0pPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgq-003CPa-05;
	Mon, 24 Jul 2023 08:13:12 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgm-003CM2-2u
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 08:13:10 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51e56749750so5769679a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 01:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186385; x=1690791185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQWD6o2QmQMIWADk9Uuk1r2hOrPJzs9WMOrl4s2UcP4=;
        b=TOspIZRVdxW+KctBUpzedxlrRyCBWoiE4/Y43E0WszgR4uL2m5kri2Cm2crujjE6Xb
         WaSPPQtb1VI0KIWu/JaMHAkE7gb7FGnMCx67INEINzHhzclnBur3wAUsulYwFNKcn7Q3
         0/p18ZUYciCIvQ3FnOns88/A9p05Ge/RbDlv+q1Wro9a8e/CHIkmZTvH6RcZpV2+omoW
         r+3lDpi2DGk9Gb6p0MbFYDKcMFz9nTV1zG/cgDZxQeXTGSiryM2V3ZdW91UVWi4Yyoai
         ja1nPqz0gWTsQjKMapq8LYWVAskMTc8VtmZ5RdD2tHqyJjO6gGpmzUg32UFABSHXhkxO
         xmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186385; x=1690791185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQWD6o2QmQMIWADk9Uuk1r2hOrPJzs9WMOrl4s2UcP4=;
        b=Ab+jHgT53QdHzVhQKYyW9zUbyPVFxHG+tI2BSBEkzcR6NA2EPCS7dAB5W5p8hO4Mwz
         yHPIOY0EVFiBQFBMardvbecEuEVpzb/9ldMamtl4jusGZq4/WGpe76k+VCwznB22jWHX
         uciJUB1tJStLX211DlJ0fQMXWk0G+vak2LKcDGc3mLwPmWjWpRgYYno1zGsQdiaxPOW+
         fJzirEs+xLE1krL3QyNu0G8XXglNCK1tHo8c4XazQ9c4WX79Va51yXtum34nFwmM7o7r
         9LUkrOtmPp87YCgMAdul8EGneDlMeXvM5dV/AglsXV8G8lgWIQsKg5dkvN53fVQbQieU
         chiA==
X-Gm-Message-State: ABy/qLbSKWxri4uLG0MEyNkJPhSqfqQ8olDaIwNKiYaBiu3O2z0WSD7n
	xhCqs1n7iyrvaNsA96UpvEgl6A==
X-Google-Smtp-Source: APBJJlEMJswmOKOAqJzwRQ5aFVr0jQaI5nq1DEVa4URq69sVkBeRtwC3r2KBUvBj511T9cXfd5lwiw==
X-Received: by 2002:a17:906:cc0e:b0:99b:4a29:fb6a with SMTP id ml14-20020a170906cc0e00b0099b4a29fb6amr9268494ejb.59.1690186385224;
        Mon, 24 Jul 2023 01:13:05 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709065f8600b0098ec690e6d7sm6355395eju.73.2023.07.24.01.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:13:03 -0700 (PDT)
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
Subject: [RESEND PATCH v3 05/11] mtd: spi-nor: spansion: switch h28hx's ready() to use vreg_offset
Date: Mon, 24 Jul 2023 11:12:41 +0300
Message-Id: <20230724081247.4779-6-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724081247.4779-1-tudor.ambarus@linaro.org>
References: <20230724081247.4779-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=851; i=tudor.ambarus@linaro.org; h=from:subject; bh=WVFbE2wfxt/8hLhyWshKgP+KuZXcvV9Z2hzSYAD/Z5w=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkvjJ+ywSNb/VFIiWHMUEXC6o5GvL5YbM7I7q4J IEexIEmBVOJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZL4yfgAKCRBLVU9HpY0U 6eJNB/4+GW3Up54GTrKVZ3mORH/AXQ4goiqFedFcFMq5+rzCmlhsMNZMPtCayF3XYjkYioQePJ6 t77LMQ6vU0lhJhZc+cFFAajMT/KRpl2rL1CCBRmGsYBGupKFjEt2/kx1995y3vclQwGOo5QEHZi LzOeN3QfUMJvfQkJKkPPUuTyFtZO+on+ZxG1pTb/v8+vmNUMW8VfRIFtDTsBntBJEUOvH5bBfqs sKiuaOD6DyQgiaMfeCg06P86hkgmF6vvdz8JwsfcZf8cyJClhHeGzRrerrRsK+T8bqfBVwEdMqZ zpFUiN5MiLajo+IXlGncp/ROz/y4mMixiUOQ4iyvbDhb37il
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_011308_960977_9FC9898A 
X-CRM114-Status: GOOD (  10.60  )
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
index dc4841891b74..5b6f36b56e9f 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -730,6 +730,7 @@ static int s28hx_t_late_init(struct spi_nor *nor)
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
