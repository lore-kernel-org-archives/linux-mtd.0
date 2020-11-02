Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D110C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:57:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A33DF206F1
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:57:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3OS59htQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BDjAOCyr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A33DF206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JoXQssI+MimmbIEIGNUvlBZ+5XwCHd3kgVY2NrANEvM=; b=3OS59htQMN7yK4aBn6ladp3p5
	MG6r3lO5fq2lTYxctzQtxusWNAM0TgGcyWGRlBrfJnXYPbi7vrwlVv8zbXWDBozEii68NnYYqaiVQ
	VmpI6qBuWK1Nk9f4zMx1dRlJQ2m36kg3vMiv1o9hASwK73ccVlloUO//HQWjIz177zPOmlrUiIvFT
	qmDnwbPDa01mVLoaIBjd+lNdf4ecZvSsC7PvwjxveMshb3uBQDjf+x/Cpa1+kp5TllLPvZH+LFJeA
	XaL9WC+cFKBL3xigmq9IRSxcIXEU7N8uod9RbDxQKIZCOxNWXP31I/MNRXXTY+H2nRBH4F9b+s1sE
	ZpB6xRbyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYRJ-0002VT-2e; Mon, 02 Nov 2020 11:55:57 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYPq-0001wf-9A
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:41 +0000
Received: by mail-wm1-x344.google.com with SMTP id 13so9117446wmf.0
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BvGUWERXaYGJjMJDGbA+xeDXFdD9XnQLhYUhgfSf5Mw=;
 b=BDjAOCyrtvyPqB0ou7ixlAjaCYYL4sJAlfYMjm8CmJVrlMy5GlykX23d1CV8+hlrQt
 jm3570TZOoBNQp/jbO9p7NcWcHA7hYD05b4IJELZ+fm3rWqlnPRK6GAEE9+8zWYQtHGm
 YbDOxW+u4uE9sqKhVXCiDAP5Z89cRFutstba5kDRGjUHd2yYpdlCjKPchJ/D+kxLNF6W
 funPxdm/wN2dR64CJb1jm+7UFmYuDZpt0RABnWvng61Eb2ksmInsZZd4UMkweWysLFk2
 jpiyVHoBMo2AvN7DjzIzQWqJc/jnOtqV62Tk7NVEnVt3hi4jh9B3nk/9P+p5yFrFemxG
 SP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BvGUWERXaYGJjMJDGbA+xeDXFdD9XnQLhYUhgfSf5Mw=;
 b=YDsR+/uz9SU88TecWnJazWpaDgu+JNw1gjn1ZBM+S3an7K9yEQFkfc9Cy7iEVkGFJd
 5ReOSi9xjuyV7p+kHxu2iQSwNv1kFCIFnye4175OnFshjfjHYPF1kOfQIRJ+pG9OH1Gh
 sZPZoxEMqTtDdQwgKrJ6xQYPWGNW3wRWQv7M7N9x4m0N/s/Ilkw+iQ8BpnvyWyJ7zjX4
 D5KUWvyLE7CcvoYooUjEcg4lXzO+uZJxoym0CD6Zc5F1MZ/QWQ0NTgzkgfbCFuZjd/35
 GvdV/NVSS+8y45zKvTMiKJtd5pXBxyoCDVQ0yeuL5JDc6Hk7a6o+cwr8UgJZJmVKk0Zf
 aVLg==
X-Gm-Message-State: AOAM531p69KJdXJm6J8lyhO6y+bVNnF4affWRKdxk0Uv/YwfepEjq4NP
 lI1+KJImEne+n2R66e69BM/OzV62BALXyQ==
X-Google-Smtp-Source: ABdhPJwQ1EjTwfCM7yhPtNvjrqOk2umJRWV/i2J3TyjOLlGeGndTu9CRfs9pbUSWOZWpmeXpt1LtHQ==
X-Received: by 2002:a1c:28d4:: with SMTP id
 o203mr17464567wmo.143.1604318065105; 
 Mon, 02 Nov 2020 03:54:25 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:24 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 09/23] mtd: nand: spi: toshiba: Demote non-conformant
 kernel-doc header
Date: Mon,  2 Nov 2020 11:53:52 +0000
Message-Id: <20201102115406.1074327-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_065426_456937_0149E2FA 
X-CRM114-Status: GOOD (  14.14  )
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
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>
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
