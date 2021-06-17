Return-Path: <SRS0=jwHe=LL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F100C49361
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 11:09:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19EBA61209
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 11:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19EBA61209
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ifhn72eXI+zoKDbdVgT0bO75/P9UeETMc8Ytw+f1/OA=; b=YE35IBNoHKPb36
	6+4FtYru5oOIBpG5ijfTY8M34lmtUGr98PgKm4Wl7fJRp+4HSD7plZUUiYrXAyt9M+O1uRBJxoHfc
	elSggucGpd+HvKT8kOhutssLFz4HM6nkPORcTFCmF8ONi3wJma/Wc11/MP+eHa2ytyVHLjf1jMdy6
	fD2Wn6ehwBa102bqbeGlcDGo1OARR4LsEQEwInSR/45fcPLDOXQyBpKQcj8unt9eqdWouttBL+0vV
	joSKtLZUCj+ZhXqQIDzpM0OTH1M/adDu9S68p8HMgWP2ERI1MpUbI94QwFuyBucBrv7aI2CwBJEaI
	4yC6fWxymf/81EHTncjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltptU-00A0jF-J4; Thu, 17 Jun 2021 11:09:08 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltptR-00A0ic-HY
 for linux-mtd@lists.infradead.org; Thu, 17 Jun 2021 11:09:06 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso5299621pjz.0
 for <linux-mtd@lists.infradead.org>; Thu, 17 Jun 2021 04:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ubwQxfJ7r76nVrpUfP56UmNpDWURO/0W1EJ6byvdhqE=;
 b=b5XI3pLjW8Bkk/y11RUW1X7ngiOhbQFGpfWTdcOaHe5dmr05zK6CWVzeaz4OzqyEEc
 PquhzWGNflnMM4bLsK/zokD2Dq5JCGWKPp9aw6QWSqbHj5hS8b2s2kmkSbzaQf1u1CLJ
 uhJ1pxjoR62dGO69hVN5zfYOrXoeZunG3st/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ubwQxfJ7r76nVrpUfP56UmNpDWURO/0W1EJ6byvdhqE=;
 b=pcbJQGjfID7xXASdwzcQ2Ba2ySJTB4jwfLrfNBrSHtJhA8FeQZCp5xxBAhWWAvEbQc
 Q6AvJBlKDNwFHZteZcLNP1zF5NjV2jEZs9VZG2W/nRb6zsfytu8IlXmbTA6w4BMowVjs
 O1YVIshRI5yP5DS+cvg3tudj2eMHy5UBllBUX96CS2AxS9lgs1m0WXPNgZoDbk0kWJFK
 hfhsrhb+Px7Ri99dQJJTbTViyWmK0bgOQ2ZzeJTaeNsjprqgQoSLjnRvjgcK9ElZ98wz
 fNZio5LfaPSigu+WmtXSqJemkrNf/t9oQmk2k6qXWlbO4oVIxTgL4N+CMtp8x8I708Jw
 VlXw==
X-Gm-Message-State: AOAM532Z5aDb1WX+1AOGcGzPG8diq2+c7oQinqlJtNMDBX1GFyVJU2Px
 LMaNt6tPJXDTrwP2dUx47rdwQICF2Ov2/A==
X-Google-Smtp-Source: ABdhPJycLWzQ7dy1nlmhvg7TDELG8aFVZlwmZYpNF4L7lWSgp591SZSMCq+urKC1TyrjVB7unThsUQ==
X-Received: by 2002:a17:90b:108f:: with SMTP id
 gj15mr5213022pjb.124.1623928143531; 
 Thu, 17 Jun 2021 04:09:03 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
 by smtp.googlemail.com with ESMTPSA id n23sm5094397pff.93.2021.06.17.04.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:09:03 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH] mtd: spinand: core: Properly fill the OOB area.
Date: Thu, 17 Jun 2021 20:08:42 +0900
Message-Id: <20210617110842.2358461-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.32.0.rc0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_040905_726848_E8A5E6C0 
X-CRM114-Status: GOOD (  11.80  )
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

The comment in spinand_write_to_cache_op() says that
spinand_ondie_ecc_prepare_io_req() should 0xff fill the OOB
area but it doesn't.

This causes the OOB area to get filled with zeros
and anytime the first page in a block the bad block marker
is cleared and it becomes a bad block on the next boot.

This was observed on Longsys FORSEE branded parts and
might be specific to these parts.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/mtd/nand/spi/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 6f2d39f9bb06..f1c76fa0e220 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -281,6 +281,9 @@ static int spinand_ondie_ecc_prepare_io_req(struct nand_device *nand,
 	struct spinand_device *spinand = nand_to_spinand(nand);
 	bool enable = (req->mode != MTD_OPS_RAW);
 
+	memset(spinand->databuf + nanddev_page_size(nand),
+			0xff, nanddev_per_page_oobsize(nand));
+
 	/* Only enable or disable the engine */
 	return spinand_ecc_enable(spinand, enable);
 }
-- 
2.32.0.rc0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
