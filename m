Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292F7CCFA03
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Nov 2025 13:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4n9BvIoj2iPECrnC1/W0jQ73vi2Y54VXADu8CMi+Zck=; b=L1m0LV3WTQm7D6
	Wx35D7Lr4olNT7SHuKoGpwxUyM4JtY85H+I50KzIrrQ5M4U/pJjb6hFNkMdxq5gFwRvpI0Ku+hvb3
	mNhyOB5TLVDmevueNZ3vY0UMEgj8ErCF05djD2sglrlCxK49hbNExS9BFYa9yNIEldE8KUiuL+z+C
	mF0WIVxfVtxTJgZJWipoUZqaNhu+5tHGe2iOSY+0bvErVQI+xyWGX77gD0qUqbkg+6HD8FD8V6upP
	pF+GhtB2tMv9G4oZSMdxTdzR5SVsD5CLhXDTX8oH6Dkf6JDMpDFAVspUD+88oszj61j48ZQojgz9Z
	TSLe0/61LTYdtf0zq7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBcF-00000007lil-0pFj;
	Sat, 01 Nov 2025 13:25:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBc9-00000007li8-32PO
	for linux-mtd@lists.infradead.org;
	Sat, 01 Nov 2025 13:25:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-475dbc3c9efso18328505e9.0
        for <linux-mtd@lists.infradead.org>; Sat, 01 Nov 2025 06:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762003551; x=1762608351; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kefLFDRMJrK9HnSrDfYpLnvqtBuSL8Qun0L1purZEqI=;
        b=dTNfd5HKUsRexg9L0W7qJetiLlyXOwVOcwtAEANZM5IpYzO+AYYQjwOsh0b7L/3Px6
         puAyoQ4+BXEQiJ6Yngkf24nDZfy3Ba2r9ZTCCCXifkfLhUSPZ5vrTrZ6yB+eAjIL9C3D
         X48GLSixYIH7/YQ4wQ6yK2s3z0nzPk7yrP1lWgUBVn0sQuw8ns9cYMCFT8gPt1dv9qAE
         /lvdp+5BnugR1/Z8XLQhD7VgLVdXZzKKbSxt1/xm2Cu699rsHljbL3RAfsrA7kC+ghjz
         VSTWI1M0z+reZSSnLLaSC11XNutcbC/ccdHilzJycMy6UzpXZlNmleY7W1CsSnjDXVMc
         ZTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762003551; x=1762608351;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kefLFDRMJrK9HnSrDfYpLnvqtBuSL8Qun0L1purZEqI=;
        b=hZNvf8pFzGnVxbtsRld3oWE3ZKv9On9ZpVB2KPTS05rskr1BIDX7STlDeTZ+67LWzB
         qc2tEWh3HrhiAqUBkxn11t8K4y9101YiyX6hihVcQUcabTyYC0YFiywPWyrntb+ICuEB
         bhN5m1W5ABAQ2OFl+1X2DDblCh7Iqmz1G0ZK//rAnQrHHq9ZXD8DpwPapVEIeoGjs9kH
         J1QGh1oh/eUyzm/O8jLyqocQuvbwa6idzUsNZM2mFYG98e6oR9eq2lxKccWW5xmP7g4m
         Ujcen/eNukY3ywg6KZK8bCx/gDsnBGsKM2IzTRoJQJSCJ2Rrqth80Nigo42Jc3tLP08b
         0FGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV1WtFXyJn5nwtqaUZylOWMSZHkCfVbty9ENCxAlDNqdyI+UyLg0lmbN/ekQThwGwvwyXFlzeld3k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWj18Vdr7vCdfCI8YWV+ZnvKqFR2G9Q6YVkUtVbpOBNQnYQ3cf
	tUp6Y9nZiw6TtIhQ/03MT3Ejb50K9agkQkortbo//Q8m0FYNmZPs1bvGXiUWraoXC8o=
X-Gm-Gg: ASbGncvn6G/Zl1S0TyBOh1xXxVNCx6rezIdT8i7Oc27zYiEy/7lFbW37WwoUtky9oEP
	yySEBTqOBCmryL62lso6uvPcRGcwgderDmbD9Ftk3EiXVQR/lKIn/tZnYLg7QwFrZI+4uEXozUq
	RTNCRgP9Fzf9B9hgXeUO1VHxup/YHHvbJKL0CKsKUmD675JNpmehBumS+kB7d2785H7oQQ3VPRT
	Q4lK0I+jdvlqL+W1aTk6s07qi0qnQAaeJ5nXhl39KGQJvflZJfsM1/F780BXQbqaCI35dKf5wVK
	0y+WDduBygWHLbQwEk/IdSbT48VaN4dH+KJQ4z0l84TCI/kwbv1JB8xchpjc+HBvzFKByl+eg74
	wn5EWIwEvyO5juYhzpMjS+Z+H2dn2EYeJAVTybSv44oqRQq3E4qMq4yNFxhbBWZO1lMMlytkS3T
	S2cWOqeHiw95z3tgIB
X-Google-Smtp-Source: AGHT+IHg6f3fIsXsLrLzGR7r5NdaH5rE26INwWReTi4lRgX0CdFFywAF4j5hbZstscw0VD02x8o6vg==
X-Received: by 2002:a05:600c:c4a7:b0:475:de81:563a with SMTP id 5b1f17b1804b1-477308b22a2mr64707215e9.33.1762003551417;
        Sat, 01 Nov 2025 06:25:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c2e674csm49318355e9.4.2025.11.01.06.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 06:25:51 -0700 (PDT)
Date: Sat, 1 Nov 2025 16:25:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: onenand: Pass correct pointer to IRQ handler
Message-ID: <aQYKXGSoLqCLNqKg@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_062553_774120_5663F5F5 
X-CRM114-Status: GOOD (  14.24  )
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

This was supposed to pass "onenand" instead of "&onenand" with the
ampersand.  Passing a random stack address which will be gone when the
function ends makes no sense.  However the good thing is that the pointer
is never used, so this doesn't cause a problem at run time.

Fixes: e23abf4b7743 ("mtd: OneNAND: S5PC110: Implement DMA interrupt method")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mtd/nand/onenand/onenand_samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/onenand/onenand_samsung.c b/drivers/mtd/nand/onenand/onenand_samsung.c
index f37a6138e461..6d6aa709a21f 100644
--- a/drivers/mtd/nand/onenand/onenand_samsung.c
+++ b/drivers/mtd/nand/onenand/onenand_samsung.c
@@ -906,7 +906,7 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 			err = devm_request_irq(&pdev->dev, r->start,
 					       s5pc110_onenand_irq,
 					       IRQF_SHARED, "onenand",
-					       &onenand);
+					       onenand);
 			if (err) {
 				dev_err(&pdev->dev, "failed to get irq\n");
 				return err;
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
