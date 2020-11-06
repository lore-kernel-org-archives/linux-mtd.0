Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D2FC55179
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C97E208C7
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GyNdsaOw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JycVzerF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C97E208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lFKBzJS8X7V6eH+bmY6reCszP1og4QAmYckLE428P9Y=; b=GyNdsaOw3ROJ1YNJirHQJuTBl
	Vn5NGPgsmkkmrUusYPlCdjUy4cU2vW+kLBlDifgzt3/Gn30iepGgOJj1vgrrR5Wfif8g7jK5prOld
	l11LJdCqL7A8CfFnTzQnJax3n9FTuozTu8bOvb5ntHo2CY1+W0mkKArwCMUDlCNYLeRUu9UFYitIr
	L61TCo+MZnpom1ASgt3HEk2Ek6+bQozJr6jwgTscQnzFzuo+PkMA3U7G3CShZMRY6OzrSdkYNR8YI
	hNcYpx45WslGhvZX3zxAiSRLOW5osUhL8wS4FG5KnKpStle/XAdouKxxwxI9aASI8N1zesWz10YZa
	4+ux/pNAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9QY-0002op-2m; Fri, 06 Nov 2020 21:37:46 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9Q1-0002aV-FD
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:18 +0000
Received: by mail-wr1-x443.google.com with SMTP id y12so2771301wrp.6
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/I+nJpznOBt9dN4XJqBf8TuNQJ12DhAWcPprYkWhwFk=;
 b=JycVzerFxCDO0acY4F3sQuqh9v6MOHcwEibDy7V7bw5+6K9Wh4QNB4dhfoop8pVaYu
 baFmTxcXKO585C6cRr2pKnDcsUZ1liJ9d+YTlDUopHb0a0C5LhiiI9OZ8be4QUpil7j5
 Bh5WEZUeTbxTBz+rZUxaGbLSlqmzkddW+BQc3BsX2tiDQlYHi8aDrEGQGe83NacLI2J/
 +NT/AdhYSgdNHBJQ3rmBRGMYgPWHXnqgojurUK5yE16FjBigO70asoYdnR+LK9s1hvsp
 bYUtZ7ULWnyeS2YhGQq89w75H5ULaYbeGhcLyXQM85AS0LQUe7bWJ9VXeZwbmsHRQuIo
 3ewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/I+nJpznOBt9dN4XJqBf8TuNQJ12DhAWcPprYkWhwFk=;
 b=NqJIUDs5vrkGLsQi29qRdTgFD2K26MQtDHv2AVT7oJACZLOefwnrcB/YXBjIpI7iKf
 tHWSMI2rOKDL9wPm895KxaVoEJpAnJQJ14fsIQWuHIbW9R46ZcGIsGpOhulBgYhqCJgk
 sJ86XNhV0I2cQ/cjGOgmtl/NuAOt7i0joK9pRlxU/fiego/YJ3CXTm3gnwfXbD33xLef
 MIb81TxdbQknsLYipKA96Yh5qYNdJGlAX9v3rD9NzxNbfC6g9gFR0OxD/E0xHmhcOnd/
 f7k4GoyklAI9Xkfe1ileSMuzIC3wnIZJzrz5bl+Bab1xqvt5DJ0A/3qL1tEhNVoHkxaA
 f94w==
X-Gm-Message-State: AOAM531yvio64P0NQMxREWwbq9S202Ol1SOo7clT0qqZ92NIzYYGkFqr
 Ev41HZYldQAiwUiTwZJgRLUTjA==
X-Google-Smtp-Source: ABdhPJxnvbtFoBk4hDhio/jn09EFDKRsg5XQldgSdLNbKekR087/2H/FfLmWXSNvpLb4TVDBHBTwSQ==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr4424905wrv.299.1604698632054; 
 Fri, 06 Nov 2020 13:37:12 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:11 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 09/23] mtd: nand: spi: toshiba: Demote non-conformant
 kernel-doc header
Date: Fri,  6 Nov 2020 21:36:41 +0000
Message-Id: <20201106213655.1838861-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163713_604371_CCCB8C59 
X-CRM114-Status: GOOD (  14.01  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/spi/toshiba.c:36: warning: Function parameter or member 'write_cache_variants' not described in 'SPINAND_OP_VARIANTS'
 drivers/mtd/nand/spi/toshiba.c:36: warning: Function parameter or member '0' not described in 'SPINAND_OP_VARIANTS'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/spi/toshiba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index 21fde28756742..7380b1ebaccd5 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -28,7 +28,7 @@ static SPINAND_OP_VARIANTS(update_cache_x4_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
-/**
+/*
  * Backward compatibility for 1st generation Serial NAND devices
  * which don't support Quad Program Load operation.
  */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
