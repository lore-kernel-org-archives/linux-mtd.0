Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4271DC25B47
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 01:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SMNAC5yc+gn8waih4nyC8zpXjOYNaIb+rQc97TjtysY=; b=OXuJENcPBtUrjK
	G+jXpJcegD3/i0o+G1DyQMcCCOcbGakObSjR7kUNlWBM8Wi7tHFPMbkOJKnk61PbT9HeD7Z6pNHQK
	YVPQS6VaZ3qppR/HMR9vqyX64uiBPnfPSsJsHhqCybdYI/6pISpWmQ8blHD4H71IUM9t3iWR9OeSI
	dHvRT1bFQ7VuLzW8Brh0IRxCWUF/SSzobeuUHiG+RQ9O/uFPM0r4GM/8sySPstSnWrRacOS1vf0fm
	y/YFCkQcEGFszDUguzKqlwK+O8lP8uCBun/cEOR+qSmmcVqs0Vl+PAzx/AGKtuQ6X8YIUbuGC/szf
	4+5K3rw6szGuO9bcnntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvp2y-00DRVn-1q;
	Thu, 26 Oct 2023 01:20:28 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvp2u-00DRUv-21
	for linux-mtd@lists.infradead.org;
	Thu, 26 Oct 2023 01:20:26 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1ca72f8ff3aso2646685ad.0
        for <linux-mtd@lists.infradead.org>; Wed, 25 Oct 2023 18:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698283220; x=1698888020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PmRrkZ15lkbJoZUemYsPfR2kJiWVaXMup1NLxDeednM=;
        b=PW6/gYxvGQJmzJK4paLrUpndvPcQWZv572LNfAcuFldZ4LB8fHf6JkqMVpTp5e0cOM
         1/G/mZafhzrHCdaS+KUeqbpwB5rgXYXiS20EiPZd5NrF6fEPNFQmh4RVr1aLolV+nTxN
         wlkiOYjIGxJ79seGCV4W8N7hM6AXnZLlE0GgUETVpD6Fh/y2UnSj+s3zQsRtzprLq6cN
         2Hh/AqVhXxY/RzOIYyeZFLSh6fwDfNAPDCwiGlwOKWk0CkhkiF9kQ1TWs2Bl//PeXuyi
         rjo4dEogVW60ovpJJLSDA56yr+r3U0o8kpe/MpJR0YK5GSJL41C7VMAE24GLntIkPIDD
         PEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698283220; x=1698888020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmRrkZ15lkbJoZUemYsPfR2kJiWVaXMup1NLxDeednM=;
        b=Y25FZWSFZ6+l5z1E6p4Rr2qkMJqAfPNwU6riuLDi/3/GK3Hss9Jgdv2VYawrBZ7kXC
         LuVqo2KiYkNqGHQ9bMvRw8/kUIPZz2pU/XsSdy8rLEZEgIKn0Twa7aq9V5LGKatfVOWv
         MAceV4ISJEWcVPwfX47Zwt0CeugcBhHq+c98O0uSAOtnmnpTcpL3yIEuJP6GWySW0dAp
         OCjDbHkGDMxL9sSumpmQ8J0tEQZ8ylasy3JPQ0W/+pXXcmP4dG4DGGgvs1wFs6d0gX2n
         2pKJXhOthE5k3GlO50sH43kwkcUBVJfg9YxKWp/YsihQIZfIu0rV/RUq4V3LfrMdN+hG
         /6Iw==
X-Gm-Message-State: AOJu0Yxze63fQK0AOMn9am37yteM64VvslgKcUUcPkYu0AETg59zFr3P
	z1PQSbFPRhp6yMJTozKHDQvbkn7XUMBZsIBxYSE=
X-Google-Smtp-Source: AGHT+IHH9nUNlfNW4sc+uxwQ9e6vxbK8ETxv+grb9f43DKtYOdLJ/LFZS9Vkvy6sbRddhqDBh1xjHA==
X-Received: by 2002:a17:902:cf4f:b0:1ca:64f:35ff with SMTP id e15-20020a170902cf4f00b001ca064f35ffmr14180050plg.48.1698283220020;
        Wed, 25 Oct 2023 18:20:20 -0700 (PDT)
Received: from localhost (211-75-139-217.hinet-ip.hinet.net. [211.75.139.217])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902ed8c00b001c60c8d6b4asm9884343plj.149.2023.10.25.18.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 18:20:19 -0700 (PDT)
From: AceLan Kao <acelan.kao@canonical.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] mtd: spi-nor: Improve reporting for software reset failures
Date: Thu, 26 Oct 2023 09:20:17 +0800
Message-Id: <20231026012017.518610-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_182024_667209_C7ED34F2 
X-CRM114-Status: GOOD (  13.15  )
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

From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>

When the software reset command isn't supported, we now report it
as an informational message(dev_info) instead of a warning(dev_warn).
This adjustment helps avoid unnecessary alarm and confusion regarding
software reset capabilities.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
v2. only lower the priority for the not supported failure
v3. replace ENOTSUPP with EOPNOTSUPP and check the first command only
v4. move the version information below the '---' line
---
 drivers/mtd/spi-nor/core.c | 5 ++++-
 drivers/spi/spi-mem.c      | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1b0c6770c14e..42e52af76289 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3252,7 +3252,10 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
 
 	ret = spi_mem_exec_op(nor->spimem, &op);
 	if (ret) {
-		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
+		if (ret == -EOPNOTSUPP)
+			dev_info(nor->dev, "Software reset enable command doesn't support: %d\n", ret);
+		else
+			dev_warn(nor->dev, "Software reset failed: %d\n", ret);
 		return;
 	}
 
diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index edd7430d4c05..93b77ac0b798 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -323,7 +323,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		return ret;
 
 	if (!spi_mem_internal_supports_op(mem, op))
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	if (ctlr->mem_ops && ctlr->mem_ops->exec_op && !spi_get_csgpiod(mem->spi, 0)) {
 		ret = spi_mem_access_start(mem);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
