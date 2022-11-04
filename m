Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF864C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Nov 2022 19:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0BY4hWE+OQBAuYk5xc/OfY6F79azsQf0PVH5n8DAY10=; b=mpoydkTfeyEZjA
	u2aGG6azYxyBr40z3mGT4mOaFKVJX0UtdC/R4iDSju/GzfhypNdwYY5tTg92w4KOHi0gzhd1azdSw
	XzBZv43i/8lY/YUR+lWc/XIK9MJXsVP22MGPMLOC4+1z4Kf5+1xJXozQgxDNCyWlLMWyziH1CpweL
	O3bs92h2HnlHZZWEZQtrVg33we9X5C4+dzemdTwWk7IAexfhowG8OOa+qYL0OKFyyILXe6UgLNzB5
	nNArYlps/YvtTi87yv6myQsjzyzlqZbx8knpQDbkL6RTvQkEtP3jIi/ppGVrc3nr+DqoZ/5TOLrPh
	JRuXHkN7xTWUEYHEExmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or2hJ-004wa6-3b; Fri, 04 Nov 2022 19:49:49 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or2hG-004wZb-8h
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2022 19:49:47 +0000
Received: by mail-qv1-xf30.google.com with SMTP id j6so3873769qvn.12
        for <linux-mtd@lists.infradead.org>; Fri, 04 Nov 2022 12:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xGSGXGZQEff5krqyQd+s6hk5UW3mqSBj41TQ1U2uPHM=;
        b=k6woOhyB/rwLPf6UeUnssyahQq5VM1lJdF89aZcIDKVQ8YkEHfdNc+21YhGxC4zUOO
         KiOrrPC4HcpBAKLMmhPbCZ7mdwUBDEtGQtsjc5lkgC9YxrNgBcLQpH9c2TKsU52XJTYJ
         3uJdSBlEpFVTeLu1qn0ZaVUzgNt1aJjVk8Ql7WItk/G4GuY3rQ2nKyOTz9b4lCSZyk7C
         uffxJMzkOwCLKL5VSIjsBP+oM7a4+kM0dZVligTPZCCbfM9ynFk/99zaKHdU44nxwfRR
         Spdy1Tf/pdHJ6kLF86QZotMXSAqUxIa22um0DaH7t1A+3wwX0KUULsgDIS2KMrSk4iw4
         h5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGSGXGZQEff5krqyQd+s6hk5UW3mqSBj41TQ1U2uPHM=;
        b=vC13UoqvrjJr0Eoy3fRg4yakKPB9KNN2h7X+5qF2B5t5zfzQqWtqWab6OgSXrwMjcF
         It4r4f+ScMDK9bF9fS0m1WR2TbcIpTpbebcgOMacRHpJwOGjSai6FYqFPqDdrOWMywSa
         mAIOml/+rvduje9MCHCHj/hYjcmEFWg10GZwj1qup3JXQCtCQnBfzYWB1cLaFlccq1F8
         KSGGlYDaO0aeWUmVqSYAcEe4JXGj0CdgK+JClt409lBojdlE6CmtHcivlVVdqPLdFQc5
         cKOkdyDRUJPTA3kcjvfx72zxXScVR/RkvVnVO1Oif/+TnpSRXKq6oc0wuGQApedQ0F0q
         l4/g==
X-Gm-Message-State: ACrzQf0xA/eEdEr4TgmTiGVQTpNOLeziewr5C4LK7+QUUszyjQ6wi5/K
	cNghLhFYrisLm+V6TaJOpER0BS1v1GW/oA==
X-Google-Smtp-Source: AMsMyM4TX+MjUeivu1bdtFqBLQEpJVDi+fyaBHbX/Sg4qWUthM5x/Dgbom3s+jaFIcs/w4dnmFXwHg==
X-Received: by 2002:a05:6214:29c9:b0:4bb:b957:cd4a with SMTP id gh9-20020a05621429c900b004bbb957cd4amr33584296qvb.108.1667591384169;
        Fri, 04 Nov 2022 12:49:44 -0700 (PDT)
Received: from krzk-bin.. ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id n8-20020ac85a08000000b0039492d503cdsm138771qta.51.2022.11.04.12.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 12:49:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Kyungmin Park <kyungmin.park@samsung.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Roger Quadros <rogerq@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH] mtd: onenand: omap2: add dependency on GPMC
Date: Fri,  4 Nov 2022 15:49:34 -0400
Message-Id: <20221104194934.384371-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_124946_332359_AE996A2B 
X-CRM114-Status: GOOD (  10.89  )
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

OMAP2 OneNAND driver uses gpmc_omap_onenand_set_timings() provided by
OMAP GPMC driver, so the latter cannot be module if OneNAND driver is
built-in:

  /usr/bin/arm-linux-gnueabi-ld: drivers/mtd/nand/onenand/onenand_omap2.o: in function `omap2_onenand_probe':
  onenand_omap2.c:(.text+0x520): undefined reference to `gpmc_omap_onenand_set_timings'

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 854fd9209b20 ("memory: omap-gpmc: Allow building as a module")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mtd/nand/onenand/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/onenand/Kconfig b/drivers/mtd/nand/onenand/Kconfig
index 34d9a7a82ad4..fa94c514626d 100644
--- a/drivers/mtd/nand/onenand/Kconfig
+++ b/drivers/mtd/nand/onenand/Kconfig
@@ -26,6 +26,7 @@ config MTD_ONENAND_OMAP2
 	tristate "OneNAND on OMAP2/OMAP3 support"
 	depends on ARCH_OMAP2 || ARCH_OMAP3 || (COMPILE_TEST && ARM)
 	depends on OF || COMPILE_TEST
+	depends on OMAP_GPMC || !OMAP_GPMC
 	help
 	  Support for a OneNAND flash device connected to an OMAP2/OMAP3 SoC
 	  via the GPMC memory controller.
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
