Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FE4C7EE22
	for <linux-mtd@archiver.kernel.org>; Thu, 18 May 2023 08:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fiSpUTLZfxCWsSTJQChjUEXiCzh9AkzjcemKCwax3ys=; b=ecY6z7B0MMklsZ
	69lpV4zX5dI22yKhpnab5J3iEi/AOG3VYdts0nQp2H/tF1/hkXvUtess8En8ghar/GIwAyl7PKI70
	jt9TTvpx2VppKo1Gczr4E3pkRlqdr6TbDQ100tjgkdlDn/32l48byGTDwB8atTCb0D4mn/xNGA+qD
	GUAPnk9g7+yH2w16xU0pXYPSvTTgBInEW9w/JsUJWBQSivhA0QayBJKIMQP1xBIRaRWMaLMXWC/Mf
	5/12M2Qjv38sx034onzHv5p6c7NwOahjL58h1iqNrz1CgAj8uqAnOxZX83/yf9heZkwWq2yKq1zM3
	ntFyIWxWRhh8VJmKGoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzZPV-00COes-1f;
	Thu, 18 May 2023 08:54:57 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzZPS-00COdQ-0X
	for linux-mtd@lists.infradead.org;
	Thu, 18 May 2023 08:54:55 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f26f437b30so2108411e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 18 May 2023 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684400086; x=1686992086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BjAvVBk1hRLHZrA8OFaE6F4f4RtrYr9WV2xvjiGYmh4=;
        b=g32/8heJ3DktSiEENGsRXd/v01cczhkq4W1Yo5mCj/C2Ef4XQ3F8RBjeoC3Cm3DN8S
         7M/2xNp7FAvmxQ9FOwsLAQ801Rl13p7l+bPmWxjhWSofWnKJJ3RlBpOVsBp6BddReuYe
         OBgU9Ahs9LpQM2V0pui+DuCGk5FrCpA07QC1eBgCz8eQWG/FCFyQXMTkPMZzR9PjJWE6
         15dma5h07NttmZepJmV9ilnjYzDM4HmqK543iEqme5pbcZFchnMll0aV+zuPCO8drIv7
         u+8cRTckWZ3Qsddb3ZEtRBkclqOnus/KX6IqkIqNyes5kdUCnbi1GXgB5K6RLjc+i99A
         9Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684400086; x=1686992086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjAvVBk1hRLHZrA8OFaE6F4f4RtrYr9WV2xvjiGYmh4=;
        b=btfG7RaB+wSeUAFa9niZHL1YHd9aa8Qw2Kes/ysPx4E7NKm3DZ4S/SvKJGwREXRBLz
         7H92JJX9oRYYB3+u3QZollEQavYP573pYS6yhaCc74crtRBcG5ErdOO2JXUWhrs1qqvC
         an53X65BmJtlFFg+Hx/gWIquwnCuc9303nWT1POHVjKOI+ITZktu5yStOhbSaQW8e+Dn
         0YgUmBOyU/O3GiQg8DtSB5nqVs8+IcMnH+exUj79CCc+Bj3HZu91t2Kw+bhxEYpO946v
         XmW1TaLWOYVGjKvFkjoKn6orHUQFAXc85NVu+KYZ6prqQC+IWaZZOfwhvmBGvckuMzKx
         0Ofg==
X-Gm-Message-State: AC+VfDxqoVb+x1XQ0Shna7xDdHaNeFfAjYGnd+j3WByfw2QIatyrni9O
	fTKG4FQIm86w4fphT1Z2f2fHFg==
X-Google-Smtp-Source: ACHHUZ66yUDz9VH5R8zAhzwAIypF9QSua+hRd28G08W56sm7WWljOyDQ3Gn2wHIXgoozj0EISiOr9w==
X-Received: by 2002:ac2:5dc2:0:b0:4f3:82aa:142d with SMTP id x2-20020ac25dc2000000b004f382aa142dmr1171051lfq.47.1684400086103;
        Thu, 18 May 2023 01:54:46 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id r4-20020a056512102400b004f24db9248dsm177513lfr.141.2023.05.18.01.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 01:54:45 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	todd.e.brandt@intel.com
Cc: vigneshr@ti.com,
	pratyush@kernel.org,
	michael@walle.cc,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@leemhuis.info,
	bagasdotme@gmail.com,
	regressions@lists.linux.dev,
	joneslee@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Todd Brandt <todd.e.brandt@linux.intel.com>
Subject: [PATCH] mtd: spi-nor: Fix divide by zero for spi-nor-generic flashes
Date: Thu, 18 May 2023 08:54:40 +0000
Message-ID: <20230518085440.2363676-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_015454_202503_2412EB08 
X-CRM114-Status: GOOD (  13.98  )
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

We failed to initialize n_banks for spi-nor-generic flashes, which
caused a devide by zero when computing the bank_size.

By default we consider that all chips have a single bank. Initialize
the default number of banks for spi-nor-generic flashes. Even if the
bug is fixed with this simple initialization, check the n_banks value
before dividing so that we make sure this kind of bug won't occur again
if some other struct instance is created uninitialized.

Suggested-by: Todd Brandt <todd.e.brandt@linux.intel.com>
Reported-by: Todd Brandt <todd.e.brandt@linux.intel.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217448
Fixes: 9d6c5d64f028 ("mtd: spi-nor: Introduce the concept of bank")
Link: https://lore.kernel.org/all/20230516225108.29194-1-todd.e.brandt@intel.com/
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0bb0ad14a2fc..5f29fac8669a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2018,6 +2018,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 
 static const struct flash_info spi_nor_generic_flash = {
 	.name = "spi-nor-generic",
+	.n_banks = 1,
 	/*
 	 * JESD216 rev A doesn't specify the page size, therefore we need a
 	 * sane default.
@@ -2921,7 +2922,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
 		spi_nor_init_default_locking_ops(nor);
 
-	nor->params->bank_size = div64_u64(nor->params->size, nor->info->n_banks);
+	if (nor->info->n_banks > 1)
+		params->bank_size = div64_u64(params->size, nor->info->n_banks);
 }
 
 /**
@@ -2987,6 +2989,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	/* Set SPI NOR sizes. */
 	params->writesize = 1;
 	params->size = (u64)info->sector_size * info->n_sectors;
+	params->bank_size = params->size;
 	params->page_size = info->page_size;
 
 	if (!(info->flags & SPI_NOR_NO_FR)) {
-- 
2.40.1.606.ga4b1b128d6-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
