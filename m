Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21643EB64D9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 06:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NpzNO15XNnc8ChuW8q+TT+e+PvLU5BGrIzRteyRma8k=; b=CuusNHMcSXwlDi
	+EqNWiUdIL40wngJGab/VzcLwn01L0HENe63vJwtqjYywi8VeukaKy8gjfco+tduhfjCZX5jhwvWh
	ltx4aqu3HGa4D0TbI+0+GaFYnNAg3e0wWuBEuSG+MD4RDaKPhh8B9rlugFcuWz4MRhNi4sEMOUAUT
	FiSdbO7ydM4aIIa2z6fn4zQIqn1+nG1OnUuGM+Fj3Em1/gRo+EAdU+GiOdGfhhCwp2VM4sFW+LlyJ
	ZlxCySP1MZkk5/XbtZmVGDpUTDcxJDNL6QN4ayJdP+EGB1o1GWDTg7O3PZTM3kXJCq0BNli530LAk
	5NrkJPbpJVHcEyh2xzwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9gAo-00DoQl-1l;
	Thu, 15 Jun 2023 06:09:34 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9gAl-00DoQH-2b
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 06:09:33 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f6283d0d84so9973173e87.1
        for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2023 23:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686809369; x=1689401369;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=26mSNpaphFv3eMUK08mrfdveKcRFHGUm7SxBgwM7wKQ=;
        b=Woo960oRlKIg2EO9OFoNW7FesqkkGf9xBhoIYZDNjt1dJxBNHuZnK+VLc/9VAKtIbB
         MIFaaMQOJpbzRMvEKHC8M53sfUbr9V0GugVDxrsUf61dadkbPdYrsY4ryYsgisavXLuq
         GVCLSVUM7A8owEn+P3cNKJj/Dp5sjsgSLfU2JQigNbfupI/XDJs7DPziKKeCBLhpnBc1
         CQ6v+/OkzDVhboP/zhMjbogBp4fx1V/gYUe6dH1X7A2ak718xx8C3vBT5lcK44FFh03C
         uB+wxQX+54xJXZHF6Gab1BN3VOHE9pRtlSwZutloZC9Yf15XqURADZgY/MMgfEyD57xV
         zrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686809369; x=1689401369;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26mSNpaphFv3eMUK08mrfdveKcRFHGUm7SxBgwM7wKQ=;
        b=LtR3YjPvERvBy3LyrZZh00H//0GZQl/wxwpYh1I4JXQKSumfDt5aBtbmHaVktGzXyE
         lD1ocFThfzFmYk6yDb5++6nP+ZJ2OqTntf8i3S1GptT9Iud1KwjZyMyNzp5nzdtDmCWg
         g7jx57sngArt0dp1BuPAMaKO13Du03Q9pIEIQQ1ZrnyBtK37EVaWmGwHRJ2CRAPn1XWv
         /6hbrhUwP4f43K0uEU3pf2n6C+/LZF3BlkkgzDEBtzbvcJN8qsKylgvz6zFXaKGmkvVP
         pHPWXv83B9mTNmLRF0lpH7+RJTHXvuVMQLpgw566NMRzTqPtaXLHQQw10Gg2kBkcEcwG
         MDgg==
X-Gm-Message-State: AC+VfDzhrsM+/MIEqvDASNPTKXHlw+IQUeJLxcBLKy2hNlzwEfqC073f
	u0fOizXRADeYEZtzHE7jtW4ccA==
X-Google-Smtp-Source: ACHHUZ5Shvz56GbCkrxmqunekg700y5QlXwXfz9Y+4BHSqVNQbdVIZx5EZrklFNOx9V5YkOPwD3XDQ==
X-Received: by 2002:a05:6512:329c:b0:4f1:3ca4:926f with SMTP id p28-20020a056512329c00b004f13ca4926fmr9429156lfe.21.1686809369499;
        Wed, 14 Jun 2023 23:09:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u26-20020a05600c00da00b003eddc6aa5fasm19463608wmm.39.2023.06.14.23.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 23:09:27 -0700 (PDT)
Date: Thu, 15 Jun 2023 09:09:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: otp: clean up on error in mtd_otp_nvmem_add()
Message-ID: <fe7ef901-9571-4c6e-a40e-449046efe2c6@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_230931_847385_19839F80 
X-CRM114-Status: GOOD (  12.64  )
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

Smatch complains that these error paths are missing cleanup:

    drivers/mtd/mtdcore.c:983 mtd_otp_nvmem_add()
    warn: missing unwind goto?

This needs to call nvmem_unregister(mtd->otp_user_nvmem) before
returning.

Fixes: 3b270fac8443 ("mtd: otp: Put factory OTP/NVRAM into the entropy pool")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mtd/mtdcore.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index abf4cb58a8ab..ab77f8f858f0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -975,12 +975,14 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 			void *otp;
 
 			otp = kmalloc(size, GFP_KERNEL);
-			if (!otp)
-				return -ENOMEM;
+			if (!otp) {
+				err = -ENOMEM;
+				goto err;
+			}
 			err = mtd_nvmem_fact_otp_reg_read(mtd, 0, otp, size);
 			if (err < 0) {
 				kfree(otp);
-				return err;
+				goto err;
 			}
 			add_device_randomness(otp, err);
 			kfree(otp);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
