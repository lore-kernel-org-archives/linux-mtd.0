Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E020C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 10:22:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C066207C4
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 10:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RiYq184M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C066207C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8qxXE9c97LBRuIvq9uOifuktdGH2o/RQNXXXgtMQBDk=; b=RiYq184MmhmWFS
	7C5uEKHgTQ0mo1j3CW9syJAZ8OAk+ED5JQTr/YeSZBjabc/N1/sQZKpBNk1LbYxWCdrqNe6SWgC9g
	ODValIQInkohh2iM2jHE32X1J34MfLiew4dsoNqIFtUas8HH9HN6wv/u7RImNxEYXpACjSzuWGhc8
	UY0KW3M0wmm1NxlVHxfTGSxU2+WJFI8+wHY17vs/FFv1j+rzVwtdi5nV3h0U+W+r0R5xx6uC9RlJR
	f3PCh7tE/6TvFS8Yo27aYN+vnYpKLnGZpgZDFl4woqTIw0cub67oK++VUHFeXWlsWbxsFHSHH7kCE
	8AYBbH2LbxDtA3P/rwUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbLs9-0005ao-D7; Wed, 20 May 2020 10:22:50 +0000
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbLrM-0004vB-M0
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 10:22:03 +0000
Received: from belgarion.home ([86.210.245.36]) by mwinf5d33 with ME
 id gyMk220040nqnCN03yMw3A; Wed, 20 May 2020 12:21:57 +0200
X-ME-Helo: belgarion.home
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 20 May 2020 12:21:57 +0200
X-ME-IP: 86.210.245.36
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@arndb.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mike Rapoport <mike@compulab.co.il>
Subject: [PATCH v2 3/3] ASoC: pxa: remove Compulab pxa2xx boards
Date: Wed, 20 May 2020 12:21:25 +0200
Message-Id: <20200520102125.8934-3-robert.jarzmik@free.fr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520102125.8934-1-robert.jarzmik@free.fr>
References: <20200520102125.8934-1-robert.jarzmik@free.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_032200_992573_A5E36003 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

As these boards have been removed from the pxa tree, amend accordingly
the sound subsystem.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 sound/soc/pxa/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
index d4c0f580a565..fb2d5ab02b0d 100644
--- a/sound/soc/pxa/Kconfig
+++ b/sound/soc/pxa/Kconfig
@@ -128,9 +128,8 @@ config SND_PXA2XX_SOC_E800
 	  Toshiba e800 PDA
 
 config SND_PXA2XX_SOC_EM_X270
-	tristate "SoC Audio support for CompuLab EM-x270, eXeda and CM-X300"
-	depends on SND_PXA2XX_SOC && (MACH_EM_X270 || MACH_EXEDA || \
-			MACH_CM_X300)
+	tristate "SoC Audio support for CompuLab CM-X300"
+	depends on SND_PXA2XX_SOC && MACH_CM_X300
 	depends on AC97_BUS=n
 	select REGMAP
 	select AC97_BUS_NEW
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
