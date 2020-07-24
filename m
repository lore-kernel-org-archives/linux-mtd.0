Return-Path: <SRS0=mo6j=BD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DECDC433E4
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 14:55:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AE81206D8
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 14:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dgP+HGiV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tbWSdqe5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AE81206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5pm4dGIqoJ6wnp4pc2Q8OhwTel4mMSbv0gibHKdJmw=; b=dgP+HGiVnh21PySRQFeeu2vTyH
	KJSqgRC7JtAQYwPB/H3Ky5hVfHJ6mUtoopj+5XWyZJsNu4+AwvhfZF31suu/y3ExqULVtOohx+doG
	qpAbv3rXORydsbyzK1Geea0jpnUSQLGmUd4rRH5haLnEilWlX+iaK1/YRIZUR47i0Py5Z/b1iakjo
	nbqhmLkb56aA3OKVEA1NOc87S/601wbIJdiZlW/K8pSCk8A+avbCUufLWPuaQ8Yjv1fKuO3OgRfdF
	p749yFPi/Skh2nlLyfYOqPf3100rl3/nfv57e64bS7lwzNxEVpXgjxKuLU3+UwOa7FYJ7fO3quEsz
	YqgOOJ8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyz5n-0007J8-2Z; Fri, 24 Jul 2020 14:54:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyz5j-0007HS-8p
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2020 14:54:33 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B332A206F0;
 Fri, 24 Jul 2020 14:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595602470;
 bh=u+leMY/uyyK1fWRYghEZunX1y6Y8sNEwuMV+HF0X39U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tbWSdqe5Q8XzhFi2VQRwgz5Ty+mKEy4sG7IQKnfAHGw8VfplBi3UWAFDIzxUDOaMB
 hCxh4rP2UrtXV9QxJFa3heamEtMzAXoiLu9bO6sdZE2zYFRN5m9s8dxIfxmbN39n2X
 lBT0zI2y1riP7eQDVwprNVqoQFWMvDYzmUhjz9VQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v3 1/2] memory: jz4780-nemc: Limit dependency and compile
 testing to Ingenic architecture only
Date: Fri, 24 Jul 2020 16:54:00 +0200
Message-Id: <20200724145401.2566-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724145401.2566-1-krzk@kernel.org>
References: <20200724145401.2566-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_105431_429823_8CBF306A 
X-CRM114-Status: GOOD (  14.95  )
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
Cc: Arnd Bergmann <arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Enabling the JZ4780_NEMC driver makes sense only for specific hardware -
the Ingenic SoC architecture.  Set it's dependency to MACH_INGENIC so it
will not appear on unrelated architectures (easier job for
downstream/distro kernel engineers).

When compile testing, do not enable the driver on other architectures.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. MIPS -> MACH_INGENIC, as suggested by Arnd
---
 drivers/memory/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index a1493549fec3..cd4fc93b50df 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -152,8 +152,8 @@ config FSL_IFC
 
 config JZ4780_NEMC
 	bool "Ingenic JZ4780 SoC NEMC driver"
-	default y
-	depends on MIPS || COMPILE_TEST
+	default y if MACH_INGENIC
+	depends on MACH_INGENIC || COMPILE_TEST
 	depends on HAS_IOMEM && OF
 	help
 	  This driver is for the NAND/External Memory Controller (NEMC) in
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
