Return-Path: <SRS0=W1Lg=CN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384EDC433E2
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 19:12:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D857620684
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 19:12:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bi1FmxHh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DY3Pf14f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D857620684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jsFWjL7rhQl3RltQ7U8/dEWbVQDJQ040uJtMbbakqXI=; b=bi1FmxHhJpCQbTSGT7aF/RWcco
	9xkR5P/buMLKWHENNxUKn17YkhRvE/OtYWYiQBhp7VBmK6XP11l8aK34kp2E2e6Ae+VBHzhGQP81w
	hcrB0PgWBPFFZpQVnQMCo91FHR8p9dt9+BbAtEY66dHTJypaaXWFrFusPkBkSvH0sUbJVCpln0ZZa
	hRBegbQY9xqnHQwfJS1EQizTJ+1oTW/EiOGJeu9nNr6YN2TUy5pZCLSlHa0c6kf1isNgZ+qpsoZkp
	bOKLFXR78Y0RxIorTrTtf8rcQT9/6f5o+rk6gAF6Rk31IWeUyc55szMaP3goPDd5iOtprGBikhJIJ
	OBLngAwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEFEB-0005hh-1H; Fri, 04 Sep 2020 17:10:19 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEFE9-0005hA-EG
 for linux-mtd@lists.infradead.org; Fri, 04 Sep 2020 17:10:18 +0000
Received: by mail-wm1-x343.google.com with SMTP id l9so6737613wme.3
 for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2020 10:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WxJFiAHqmCNHBnOnEhnoypPyWw0qL1gXmCoUBa+7iVU=;
 b=DY3Pf14fjD+wnOiE1RQcasnd9yVDlAO+srkP/gYoJGx8nnNC2pNplWL93ni4oVDZQP
 pwoksoK6V/aAidA1XQk+KMJtCCOdU8kU/zBM/m+IB+Ep/ew+5d36Aeo2R77JKjSjiHIg
 TidAMRoQ7Nt6LuOtROz7e1ISTp9Usmyqge2ESLDhejTesVklkFiv3EowcJwvXurGHmUf
 wDQhu3YQ21akPFgqmKbCo0dtj7TsSvC1UiStmwvp5Tcv3eZFtxZIBkLqGGbg+CaCcFdi
 AX3d4IhvQb8jmj//MZ83KwmEhSvfCa9Ee52T4jwyC+YFSmgcBCubqZQsU7JxEI+CzkbZ
 Wf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WxJFiAHqmCNHBnOnEhnoypPyWw0qL1gXmCoUBa+7iVU=;
 b=pyaWZTQWQ6MidxmG5Z5JBcfwIWsdACjfeaST9ZCAJxavwH7uO87eV3lLJKRb7TRP9N
 /V/FvPfYZEOpK29hsPN7EyQk+hScaWYU5eZ20DuZzejCV2Hu3/53IAbRHL15ajM18V+a
 yZlUPoLA5U+Mr8iQh7k4+AwOmGvqSzHvdC2EQgl0eDwjSEW4xUJvudIrroUvm8mXQ21g
 gzYsXNi+JILdIrPBKLh8J5dvsVDQNcKuPMhZRj5NS6SYayc2J8mPRlCyvgHur0Kyzn+8
 SQRgdDvp6m0zpJDIw8nKoYupE2HpGBJsVXoxHgvBd7ClSQeNU7I9cGt3ifd4EfUEB9lg
 dd7w==
X-Gm-Message-State: AOAM533f3v5DGa+THRG4wYIGy8at5axDmuQ093+FKQz4IONvXxtnRYdt
 T5DvDmTs2p6uFvlWKu88sHo=
X-Google-Smtp-Source: ABdhPJwaFucIUGW3WR849mU+T6OEQNYynmsCPe1Je8+q99d8YZxVoWvc1alr7AzFrGfI2WJSqvEgoQ==
X-Received: by 2002:a1c:1904:: with SMTP id 4mr8482034wmz.119.1599239416140;
 Fri, 04 Sep 2020 10:10:16 -0700 (PDT)
Received: from localhost.localdomain
 (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
 by smtp.gmail.com with ESMTPSA id n16sm13368215wrj.25.2020.09.04.10.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 10:10:15 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
To: 
Subject: [PATCH] mtd: onenand: omap2: Allow for compile-testing on !ARM
Date: Fri,  4 Sep 2020 18:09:55 +0100
Message-Id: <20200904170954.18321-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_131017_516671_962531E4 
X-CRM114-Status: GOOD (  13.06  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Alex Dewar <alex.dewar90@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There seems no particular reason for building on ARM only, so remove the
restriction to increase test coverage.

Build-tested on x86 with allyesconfig.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/mtd/nand/onenand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/onenand/Kconfig b/drivers/mtd/nand/onenand/Kconfig
index 1a0e65bc246e..e2272f07d500 100644
--- a/drivers/mtd/nand/onenand/Kconfig
+++ b/drivers/mtd/nand/onenand/Kconfig
@@ -24,7 +24,7 @@ config MTD_ONENAND_GENERIC
 
 config MTD_ONENAND_OMAP2
 	tristate "OneNAND on OMAP2/OMAP3 support"
-	depends on ARCH_OMAP2 || ARCH_OMAP3 || (COMPILE_TEST && ARM)
+	depends on ARCH_OMAP2 || ARCH_OMAP3 || COMPILE_TEST
 	depends on OF || COMPILE_TEST
 	help
 	  Support for a OneNAND flash device connected to an OMAP2/OMAP3 SoC
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
