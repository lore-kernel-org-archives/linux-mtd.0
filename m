Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCD5EE20A0
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=tQQyN1ic7I84qupbYlN2RZfC0HvhBlapzdTJXAhxySk=; b=bXHMEIliwjyJ8Q
	CKKryDLff2HDHg0kpnj6Zvh8et3sMAquNYgos9IVPnJi1p+KcGonRV0hlX/tc6asarMoTsl+sqZvD
	INRL/Ra20uL/loXpQywo7pqrX9cXxP+Xid4bnwg3RBuYGR8o59xxrs+fRmALQ87eCXqtJSWttJuYW
	tJsgl2KaqC90QAorVf36VKj+V5ZoyaqB/usW4CLLZ2Z8gzmf+fp6C4CcHoLxuf/Zo9rKtwwUN3jmQ
	10Jl/z/1MTroe3q9NmRq/5czsJDNGDr1WpTTkyI6KTRFlrxnkCdHy3WRAj2XLA/cJ3vsPqLFHFsRC
	V10brTpEo5zwsvhOWAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voM34-0000000BNG5-3muR;
	Fri, 06 Feb 2026 13:39:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voM32-0000000BNF9-1KGx
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 13:39:01 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4807068eacbso20030035e9.2
        for <linux-mtd@lists.infradead.org>; Fri, 06 Feb 2026 05:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385138; x=1770989938; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xSVsGkI58CbZq2nCLU80bXxVw6qpW/ZiID0uMzovT90=;
        b=WsoAmpRil1gBgAuPFiqtz8mMlXniBUfzxMYlBcouvO8dKlvtGdqFIMj+1Dual5O+YW
         be74VMLdZ5t0kmjfTObibrCMfjXkOBNw9Qn7fWwJ2P6P1RHoEc/YuDfyaeqO9w17Ks5y
         73dPwfkSCt9X4GFUTil0clsJK9qyEOdvXzAfQzJfr1+/9xIP7qf7lyET6VzRWKpDOggm
         UGd+dsIYtrA3GT+2OeKdCCHjakYE/U3g+YhZwvasyA1VNiZEYNZsFAYiQM9Aqc/k2Ywn
         vQKyrkrDSvJgsZVJwNUhgkkkk2v5mkkdp6XjhazhmNZNFCqtrljJyPEcc7vDLQrY4yKD
         oidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385138; x=1770989938;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSVsGkI58CbZq2nCLU80bXxVw6qpW/ZiID0uMzovT90=;
        b=CzypmaZIVpHwmOtnhfeRBHiOoNkv8afS7UtMuacaUyqrNOkl7q6LNsEOyOld0Zi866
         7mWA7CqgeK+cit+I990VgTQ20W+VYXbIH9NzMpsbwxGn34CNCQ7WXqgYu7ewS/+cIbLp
         XeP893H4fEfaqOix6kOdAgbWiAZHIv4fwV36CLQy8iewsxWh2r22hI4XJ43t9QTB1HqF
         3+wJ8Npx6SSuAj30TuoL7DCIgY09ZC7U7VLx2KycozORDV80HZpXt5/T8kWk2D/73/dx
         4KVfllFqxFv+1mSa3oquEiebn4ifM4nTcsXGgCUiyWrx7ZmQCrBH0Py7iiKvC4JHpbGl
         ofRA==
X-Forwarded-Encrypted: i=1; AJvYcCUuTLSQaxGQBFv2ABtZduVLkngP7ay3rk4cqPGXOxNakYlWugEo9nlG5pg1QnTy3Z6+APyGmcKk0/o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7bFYDqEpZirg8Ev2+Qqy0Nuk5BQY6lYs2LC2QxmNri6r5ZIr5
	fq2SDsK4BWy/qKK22k5bmKxXgJtFAO8OrJlWpnvDQ+C7IQerltrZEMZbccOHqPg3owg=
X-Gm-Gg: AZuq6aIzXIoCvFJe9f9J76U6KwtG7A6MB8wx0CKyf5I01x0iPyj0y9ZbyWCwk9pfrC5
	8uEirxsMRcSa4FfcstGAbrVn9M5JrZ+2CETbb6OAe2vv3+gKFhlEi9hkgeY8bspHWxxO+Rq5Cvd
	+m5ONhDgDHjKvMkhQSdVuqhJmU+i8jKVbm0SYgfpBZi8Bls53ulpL7fDW2TEbKGOtXJA6MWlZkp
	iQp8AZjltVedp6T6SZHEszeX/K4r5LNfH+tKynVQXSSTrn5T39VGBXmgI9IRZGC8bzXm+SABmyC
	ACpLqFwdkjelkTUpUsHgApmLMtYspnrY4tWN4AbwIO5dUWHelYiukw0iB6twgJaROOFoFYKJc3q
	8ktOn3NCvWymPzHdnMPfR0CKszRHiQlDySGP5pEC5+QNuXGahno1O9+/FZShUtfxbOo7Q+LEwDN
	DF3ZCLCJvtuzQMVwNQ
X-Received: by 2002:a05:600c:470c:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-483201dab23mr42682665e9.8.1770385137793;
        Fri, 06 Feb 2026 05:38:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4832a38425asm145755e9.7.2026.02.06.05.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:38:57 -0800 (PST)
Date: Fri, 6 Feb 2026 16:38:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] mtd: spi-nor: hisi-sfc: fix refcounting bug in
 hisi_spi_nor_register_all()
Message-ID: <aYXu7uqMQdZRMmQF@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_053900_355801_54138D51 
X-CRM114-Status: GOOD (  10.91  )
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

This was converted to a _scoped() loop but this of_node_put() was
accidentally left behind which is a double free.

Fixes: aa8cb72c2018 ("mtd: spi-nor: hisi-sfc: Simplify with scoped for each OF child loop")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mtd/spi-nor/controllers/hisi-sfc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
index 54c49a8423a2..6897ced2d57b 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -403,7 +403,6 @@ static int hisi_spi_nor_register_all(struct hifmc_host *host)
 
 		if (host->num_chip == HIFMC_MAX_CHIP_NUM) {
 			dev_warn(dev, "Flash device number exceeds the maximum chipselect number\n");
-			of_node_put(np);
 			break;
 		}
 	}
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
