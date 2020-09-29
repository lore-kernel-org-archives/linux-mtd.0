Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A0EC4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 17:28:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C157B2075E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 17:28:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AKmX6ioa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLa3R+/+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C157B2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o6w1uDuou9O9hr2+QZXxAm6cp9AXatj5y3P/OjCp6Xs=; b=AKmX6ioaQpcAt51HUfn2GZnWM
	lXJuJRMJOq7uLQE1as4r5Jbi8pmFs1w23IoPFOdHnfTCT/MLQm9wlc6AH9Cp9iBJ0nxiUqOaH74Yf
	N64iV/VaexfLCL/ds5fBBClkHQHqD27eWEmib2Oqh7KQ5OyB+YhqsXlbTLOVssjsvdJbRCy3l2a8n
	6xrJa9UgzQaLavlMh6HiulQYcWKePxIyTpEvTpIOZJwUBuUjbx7BRhjnWzqTiau7RUWQL3m1lNmkN
	nnQlqbImkQ5Zo9fQkxMtmNdDHYjWu/pKHJsaZdCOJ+alp9IoniBtT/0FyrIUfObCn/cJ2q6nPjcGI
	5wqDMCNAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNJQH-0001gk-MC; Tue, 29 Sep 2020 17:28:17 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNJQF-0001g6-6c
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 17:28:15 +0000
Received: by mail-pf1-x443.google.com with SMTP id k8so5253196pfk.2
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2020 10:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1jCfCKOcdlkK7XQuavXEmMvj1/6I5JBU8+KoSiZtQZU=;
 b=LLa3R+/+HG2BNoramYdoVFD5w4S2wH+28H3USQS+Uxio7PX9jQnsOdFyMnnpGcPg/O
 rGzo0ext+Kcf1H4jV9ViYNviAZ1YMrW6g0I9Wv9TBeaRrQI1EEjZNiAoP9P3SLr6Rd6i
 Jw66KWiroK0CYdpntvu7pG2bWsch/sD7x8i+8q4RijN9vfV9ZLpo8MC21YrZ8u2prFVA
 dWAVs+sOxluhDcAWOGsT2vcwmQkDskU9rqkpszcEP6BsCe3iiol+OJnPrNd3nrrY8eYT
 IKNgNSgD3bb6Dbm5V1UKA1aTvhvMLMKSCIadLUGgw/4mIJGX4b2tzLnb7FFx4a7UiyYD
 pNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1jCfCKOcdlkK7XQuavXEmMvj1/6I5JBU8+KoSiZtQZU=;
 b=AFyH8W9C3BIjVHK2A1ARiSMcIRSyje83OsRnZbn91qpGSaWqtIzkcWG9ulOHyPg599
 l1rdVK/mbNNx9kPEfySGMs/NUwXIBYwWBXzUimM4AXk28eJ+U10VsVN2MU253AR2PZe0
 A9Tdz7LRw8Eif2a//GqZjowdzSdxF7S1C8hgX8nVU6Sqf1t9RvqarcOJjZ7ssN5aEWb0
 rUokwjffF+HOl0h8y5IrRWtapJHB94vT8dypXxYf2wwzy0HnpTXSJVCjjhNC1CBxGrOP
 f+yHZhQrSZRCk2b842WvhQ0y9q0EVboakohp/OGER/hWx54EVMmkxx6CR11gyQIm7NoS
 pi1w==
X-Gm-Message-State: AOAM530fOd1KZUNG9BJD8MBiniHKMhMrzUD0MXT+c5alsNtmpCsDc0vv
 Ym6qte5oZmrSLTKgBsdWmVk2z0fDh8fkhg==
X-Google-Smtp-Source: ABdhPJwv2MmR7XFREsHxyilT3MOLMv0dmsPAwmNjSSqks27TMMrOL40kXvbffF6dEBzCFM5vQz2uTQ==
X-Received: by 2002:a63:f84c:: with SMTP id v12mr4077213pgj.125.1601400492666; 
 Tue, 29 Sep 2020 10:28:12 -0700 (PDT)
Received: from localhost.localdomain ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id f19sm5393006pfj.25.2020.09.29.10.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 10:28:11 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: parsers: bcm63xx: Do not make it modular
Date: Tue, 29 Sep 2020 10:27:21 -0700
Message-Id: <20200929172726.30469-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928161617.2a1b2244@xps13>
References: <20200928161617.2a1b2244@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_132815_260473_2EBB21AA 
X-CRM114-Status: GOOD (  14.52  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
 Jonas Gorski <jonas.gorski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

With commit 91e81150d388 ("mtd: parsers: bcm63xx: simplify CFE
detection"), we generate a reference to fw_arg3 which is the fourth
firmware/command line argument on MIPS platforms. That symbol is not
exported and would cause a linking failure.

The parser is typically necessary to boot a BCM63xx-based system anyway
so having it be part of the kernel image makes sense, therefore make it
'bool' instead of 'tristate'.

Fixes: 91e81150d388 ("mtd: parsers: bcm63xx: simplify CFE detection")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/parsers/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index f98363c9b363..e72354322f62 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -12,7 +12,7 @@ config MTD_BCM47XX_PARTS
 	  boards.
 
 config MTD_BCM63XX_PARTS
-	tristate "BCM63XX CFE partitioning parser"
+	bool "BCM63XX CFE partitioning parser"
 	depends on BCM63XX || BMIPS_GENERIC || COMPILE_TEST
 	select CRC32
 	select MTD_PARSER_IMAGETAG
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
