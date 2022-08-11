Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88A8C19F2D
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Aug 2022 09:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5FPusNFw36zsMC0zfa7o+vl16XRWEgEq7N954B3h2k=; b=akDy82PmaH6337
	HwN9VXbvYp3Gpe22ZbrZVL5o35XBvGPTmczB7SsELcgB4Sra2yne4Yd7PGAjygopvbHdgs8cFAtJj
	92MohCnURSaml+wBFiJN8JDzXgVG4jzt5uoZ6yTfeqG392EUMi4aep5ok8zlAX9YPoHTnzB78KLo4
	BA8wBKTRWFRv4R6PhXU5isOKxooBvP0DomYrTQQVGU+bGw6w3OparkeXeT6ZT6IltkR0qlTjPoeX8
	PFoo9wyHEVdvIWlg519GLbgAAAqjowIhUD6+tJmLROqZ6C4ZnX3EBic/p4/oTkzfdSzVpa0J3DxAx
	HE/UATIplVA0MPYDZ4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4lK-00AspT-Lo; Thu, 11 Aug 2022 09:45:58 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4lD-00Asjx-T5
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2022 09:45:53 +0000
Received: by mail-pf1-x430.google.com with SMTP id 130so16005163pfv.13
        for <linux-mtd@lists.infradead.org>; Thu, 11 Aug 2022 02:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=R3+d2NUvwS5vdY/FxE7eQo0wmaUCOn21uym/zDK+C9g=;
        b=mjivED/VyHRNVPlzg0ZQCAUWVbbmNzD4Ih06mvyk86z50qB1vmcZjbBv1HOMPzXncs
         GqLSJypRf8zh8IOxgtUYRy8OGaVTOtk0g5RBJuBJExdvG4rZPbi/nqI7qwvbFSKHRZIX
         WOxBZJxlt8ZsQ0uqT6+eFWT83+mN8Pmyj2V0twlYdnZWZl/dUIQtxWEJh2qkAKGUCQ/D
         MqUn1tN7xTqMR7vh7Plg0ZeHWLL0iUK+uJ2bLA+vnVZEWvufIm0tHismmPrhgMcDbTlb
         MxcRdzlvqM35zPN/2FTM9YGEx2fO07KLgFmLr5zKVmcRlm5p7hfKUKNMrB4lgjCjo9bU
         aciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=R3+d2NUvwS5vdY/FxE7eQo0wmaUCOn21uym/zDK+C9g=;
        b=XBpJfwlhKfJmB08p/iGmW9s8bo4IEvV+iIA0yoXVM+Fl3+y/V69wCvC7ezfpB+k0DA
         adBAxD023jRjQcO3Xe5A1v+MGQrT2J4N8qQjaKO6wzLcAMXb8rATsKlrmV7gvGUYyfdZ
         XetEoZ1ESq2c/cCIHxuuXLRU3z0JtqZ7dheL5mqHSmmO4NPzDlRleAC0cnkN9Hf5sbSu
         5QsnCFQj0Je6M/vEhHnEXP1dyLstrM4YXZMU1vGCF4Jzx5/z7XQOpLWUb9QTnWnS0lEh
         Wdv+UUoi/QvIGTcPiQ5AQlenryWRUE4SUNzLlDJnFzqFXFyfTLhjx1BW2yokBm3wOJUw
         ysvA==
X-Gm-Message-State: ACgBeo2KD+CyAXEPEMsqmOC8zVg4EGEHFodbh/GpQP97Td8DvyURFdAH
	13jf3Qw5LBmce2dUWLrAD7/q09QYCs8=
X-Google-Smtp-Source: AA6agR7SFXY9ETJZEAmr8rQ+WQwRaS47kF1Ho4T7fjR0DE8thGu5ric8l+HYC1qVdG6+SZM2LlvR+A==
X-Received: by 2002:a63:84c1:0:b0:41b:ebff:f3bf with SMTP id k184-20020a6384c1000000b0041bebfff3bfmr26758372pgd.435.1660211148833;
        Thu, 11 Aug 2022 02:45:48 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id x14-20020aa79ace000000b0052d7606d144sm3586922pfp.74.2022.08.11.02.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 02:45:48 -0700 (PDT)
From: JaimeLiao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com
Cc: jaimeliao@mxic.com.tw,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH v1 4/4] mtd: spinand: macronix: Add continuous read support for MX35LF2GE4AD
Date: Thu, 11 Aug 2022 17:45:36 +0800
Message-Id: <20220811094536.24498-5-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220811094536.24498-1-jaimeliao.tw@gmail.com>
References: <20220811094536.24498-1-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_024552_016719_3179F051 
X-CRM114-Status: GOOD (  10.63  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add continuous read flag for MX35LF2GE4AD

Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>
---
 drivers/mtd/nand/spi/macronix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 3f31f1381a62..02fb8f37947d 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -126,7 +126,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35LF4GE4AD",
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
