Return-Path: <SRS0=irXt=2B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFD1C43603
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 19:28:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E32821556
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 19:28:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JlewkiEI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="j64x/3Ce"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E32821556
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wtx8nlGoyjiSWyXyjTVnxeypN9L+NJXb2Bj1Y6yIkS8=; b=JlewkiEI5s40Bk
	lJYKlXRrg7Ypf4PmBFGMCNaTgPNePp/tZ7/un37zvq/W9w39alS4ivRufq3QvecSUxFtHF3DjFxr/
	hh+LOovREkZ7tqiemZcbLMmROI8Dq6NGmPUCzB+QG2TtIOJs1BT/PEnjZCKOnZ5NMqLgVBrazld+Y
	tQnv2mYpMhBKm+z7S/SjkWH3XoK2DTZL9pB0769P0v+JP0YRgJ5zUEzESl2GnSnzYzXExDa2u6UqO
	PWEVcTo2JE8T4a1PpZF/11jx00lstArOrIlfrJez2e42+1JShX48kfknq+SE/fIs71LxfQ+OVa/hL
	sT0tPuFrbfnQVRAavc1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1if7f1-0004iy-R8; Wed, 11 Dec 2019 19:28:35 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if7ee-0004GQ-J1
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2019 19:28:14 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id p3so9803069qvt.9
 for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2019 11:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Eog5Opk+TxZa3uVk6okHcHGhLRzwOGiRhHGWRzBGg10=;
 b=j64x/3CexPc0bd2HJLhsbO9Andd2Z16PIf/duinmMu3i6cvIhVXxO9HrJ2c076G+jM
 dTp1zL5tjkvom1UQk0D9eNOmd0i41jGamL0+rcfFWjjESCraQkA7/BNeKicHHVD78ggl
 osxTl9apihDEtuRQFt2ntrLocWfAhjWvfUSssad8SmjvIjzDIzN2l2s/Y2l5XCvckH07
 hYBi/Val0U00ZCY+G052IyQxtVM9B0Xwd2Azl9s8x2U/EXFaL1kkDg/YSi8TRSZJhfn1
 FI0Bqv1VFahlGX8fbCVfNfeIgMBqdGcT6NZVkW7bifZ527ERCmHBU6iqjKrAYH+2tv/D
 DRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Eog5Opk+TxZa3uVk6okHcHGhLRzwOGiRhHGWRzBGg10=;
 b=K5e8kzJ38R3ANRigYILuanTmtnWVYeIR66yY8FCikmtx/c5HeS8a2tjuaRqAJC3fJn
 +X3OmabAhPktvk7FGFfNoPNcH/ymoBnMxcR8VcTIlPTghd/wogLCBn45hz7pY1GwZpi6
 jzBIrjCTOIunZ1W+MG+cy5+jhk7ifEccJtPtTizG0esoeTNczDlY1jcdje+3Eexx83jy
 +XACIb1d3t33fl8V6yY3iItoG7/9ByleNC5/ktT1J4PFMpKQiBi3MX4D+Nbx8Mu/QYF5
 Qpsh7A4ZrnlTYD6bMbNn9jKVRXoMCqAV0r9YBDLAznHIVt3Vd7fhDcTb7ApSn/M2CQPU
 xmgg==
X-Gm-Message-State: APjAAAVOpFzBAcoLmSOD0k0FhALwW8yxuQfJQPfWf+EjWmobdBjImffu
 LqPWKVt3BF7e22yNbcO/lfoIA5PJak/MTjbnmHgGew==
X-Google-Smtp-Source: APXvYqztxSHmafU+N9DsXnQIDJGGZpjOfQWlL3wdRjbnip1gtquXg8S5FeJcoQm8xtxSX8bgGJi3wnFoepSd4JVdzJUusA==
X-Received: by 2002:a0c:cd8e:: with SMTP id v14mr4708063qvm.182.1576092490192; 
 Wed, 11 Dec 2019 11:28:10 -0800 (PST)
Date: Wed, 11 Dec 2019 11:27:37 -0800
In-Reply-To: <20191211192742.95699-1-brendanhiggins@google.com>
Message-Id: <20191211192742.95699-3-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20191211192742.95699-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
Subject: [PATCH v1 2/7] mtd: rawnand: add unspecified HAS_IOMEM dependency
From: Brendan Higgins <brendanhiggins@google.com>
To: jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, Piotr Sroka <piotrs@cadence.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_112812_753029_7489A660 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: Brendan Higgins <brendanhiggins@google.com>, linux-mtd@lists.infradead.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 davidgow@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Currently CONFIG_MTD_NAND_CADENCE implicitly depends on
CONFIG_HAS_IOMEM=y; consequently, on architectures without IOMEM we get
the following build error:

ld: drivers/mtd/nand/raw/cadence-nand-controller.o: in function `cadence_nand_dt_probe.cold.31':
drivers/mtd/nand/raw/cadence-nand-controller.c:2969: undefined reference to `devm_platform_ioremap_resource'
ld: drivers/mtd/nand/raw/cadence-nand-controller.c:2977: undefined reference to `devm_ioremap_resource'

Fix the build error by adding the unspecified dependency.

Reported-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/mtd/nand/raw/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 74fb91adeb469..a80a46bb5b8bc 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -452,7 +452,7 @@ config MTD_NAND_PLATFORM
 
 config MTD_NAND_CADENCE
 	tristate "Support Cadence NAND (HPNFC) controller"
-	depends on OF || COMPILE_TEST
+	depends on (OF || COMPILE_TEST) && HAS_IOMEM
 	help
 	  Enable the driver for NAND flash on platforms using a Cadence NAND
 	  controller.
-- 
2.24.0.525.g8f36a354ae-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
