Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4913AC433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 09:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SVrymx0GIo2fHzs09JrK2N5S9myHAV+YS9YIi25uQo8=; b=Hy0cw5mENcNlTp
	AAzBmm4SV0/GIu9fAW0/tMplqaThxjPidhuaJF77LptAc0HHABeBw78JQmrV3P6ip3naDb9S4xkPY
	7px85cv1TmD2AzeA6MGnf3EPG48KHiZZVdkXAG0bnk/UBIBKojKflWC8arcbal2wCSUFv+WKUulW0
	qPrs9++fcsi0Qbg/8c6dIaLHBXOxFVvqaZUSD2FPJ7bAxk0qtwe77XxYwBfDCP3hLnEhd8Zkblt+F
	BSJ1ScCW6QZsIGTRNxtwh0weDaoH46Ijb8oTeg4LRwY1ZEFidk0r1R2oMzVku2sxnoEqnbzxmT0ss
	GaVTbFwqml6QtOcZI+Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryE5-00DAXc-QU; Mon, 07 Nov 2022 09:15:29 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryE3-00DAT0-1C
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 09:15:28 +0000
Received: by mail-lf1-x12d.google.com with SMTP id p8so15828379lfu.11
        for <linux-mtd@lists.infradead.org>; Mon, 07 Nov 2022 01:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9uKTBrb1cZ8JuClZS3AGG9aisdrkJ7CzIFst1hgk3qs=;
        b=oDJNR31hj7iUbwjauab9UvB3Q9h9onQgb7TbWvtG4rm7WHKo7YonXPQBbM51Z74olx
         e9Goa2k6AMJfwomNn+qPUFKY0/UJemsbDejiKJNTan/eQeaLAvNhkukaLci0U49Py7ow
         YPXN3gYV7QDU7aGA6AjofZGtDuD4BEmNiT5a9Y+IMVBRc/LmmPR0QWrt++f4Jg98QTnu
         i/PeIjHwqMK8K+QfvFTjTt4jzkYdbqIAslPP3O+45m1YFMDns1+OOU7GNumZ6XLT2ZQ4
         zBj/HqvcMR9kZw3luuh6b5oypg8YqZmaIM96TzvwO4SqPRTXobUDdVYG7zkky19YRCGR
         wqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9uKTBrb1cZ8JuClZS3AGG9aisdrkJ7CzIFst1hgk3qs=;
        b=jdMsUWWSfJ/uFB+ufqzNsfL0FO3D/Ii/lbtKJs/FdSS0WL/xQpTq5zO4LXHj3IPyx3
         YGbJXSL5wMuuPE4KgdRliCERM7bxrMMlTfoJyXQcz4pTKJr50oOLG7yOlHuzRgS76Puw
         e0P+Fbfpfqwc74wtLSucJAAEXGykfI65SoejV6TATlg6RErZ3VhwU8yrlBX6bJgPWuom
         ADvpKT66FWigLU8lB2RjOsiXiPkdo3aocK8H4CWB2amPNaVMEYNWMB83UBE6bUkeoIfJ
         bSRsHyBABh76u/y3ZacYNliWz+e0Pm9r6JyT/+kogaTCl76Rgm8kyUkwgt5sFNaFlgpt
         /K2A==
X-Gm-Message-State: ACrzQf0F3LsuyT0oDwLrn9XSw8xohamUBRLGhx/vgFIhCgGwgqkrr15I
	H5dZpeg+qNXj2a15II3bUPoVtA==
X-Google-Smtp-Source: AMsMyM6YWPkIuKdP98rWv6xcwRnTEE1S5vHzsHTFZZwL75lSkeSRTzSr+lizaqvB8PzLV/E4+XZy6A==
X-Received: by 2002:ac2:47fc:0:b0:4a2:4e9a:64f5 with SMTP id b28-20020ac247fc000000b004a24e9a64f5mr18556671lfp.434.1667812523272;
        Mon, 07 Nov 2022 01:15:23 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id h20-20020ac250d4000000b004a240eb0217sm1133588lfm.251.2022.11.07.01.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 01:15:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Kyungmin Park <kyungmin.park@samsung.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH v2] mtd: onenand: omap2: add dependency on GPMC
Date: Mon,  7 Nov 2022 10:15:20 +0100
Message-Id: <20221107091520.127053-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_011527_109504_D71E5E23 
X-CRM114-Status: GOOD (  10.88  )
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
OMAP_GPMC driver, so the latter cannot be module if OneNAND driver is
built-in:

  /usr/bin/arm-linux-gnueabi-ld: drivers/mtd/nand/onenand/onenand_omap2.o: in function `omap2_onenand_probe':
  onenand_omap2.c:(.text+0x520): undefined reference to `gpmc_omap_onenand_set_timings'

The OMAP_GPMC is also a runtime dependency.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 854fd9209b20 ("memory: omap-gpmc: Allow building as a module")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Always require OMAP_GPMC (drop !OMAP_GPMC).
2. Adjust commit msg.
---
 drivers/mtd/nand/onenand/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/onenand/Kconfig b/drivers/mtd/nand/onenand/Kconfig
index 34d9a7a82ad4..c94bf483541e 100644
--- a/drivers/mtd/nand/onenand/Kconfig
+++ b/drivers/mtd/nand/onenand/Kconfig
@@ -26,6 +26,7 @@ config MTD_ONENAND_OMAP2
 	tristate "OneNAND on OMAP2/OMAP3 support"
 	depends on ARCH_OMAP2 || ARCH_OMAP3 || (COMPILE_TEST && ARM)
 	depends on OF || COMPILE_TEST
+	depends on OMAP_GPMC
 	help
 	  Support for a OneNAND flash device connected to an OMAP2/OMAP3 SoC
 	  via the GPMC memory controller.
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
